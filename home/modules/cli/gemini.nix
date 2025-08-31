{ pkgs, config, ... }:

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
          "command": "npx",
          "args": [
            "@modelcontextprotocol/server-github"
          ],
          "timeout": 10000,
          "trust": false
        }
      },
      "preferredEditor": "neovim"
    }
  '';
  home.file.".gemini/.env".text = ''
    GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path})
  '';
}
