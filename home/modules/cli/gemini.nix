{ pkgs, config, ... }:

let
  # HACK: Gemini CLI did not read settings.json or .env, so export vars in a wrapper script
  wrapped-github-mcp-server = pkgs.writeShellScriptBin "github-mcp-server" ''
    export GITHUB_PERSONAL_ACCESS_TOKEN=$(cat ${config.sops.secrets.github_token.path})
    exec ${pkgs.github-mcp-server}/bin/github-mcp-server "$@"
  '';
in
{
  sops.secrets.github_token = { };
  home.packages = with pkgs; [
    gemini-cli
  ];
  home.file.".gemini/settings.json".text = ''
    {
      "selectedAuthType": "oauth-personal",
      "mcpServers": {
        "context7": {
          "httpUrl": "https://mcp.context7.com/mcp"
        },
        "github": {
          "command": "${wrapped-github-mcp-server}/bin/github-mcp-server",
          "args": [
            "stdio"
          ],
          "timeout": 10000,
          "trust": false
        }
      },
      "preferredEditor": "neovim"
    }
  '';
}
