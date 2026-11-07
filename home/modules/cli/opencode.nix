{ config, pkgs, ... }:

{
  sops.secrets = {
    "openrouter_api_key" = {};
    "github_token" = {};
    "context7_api_key" = {};
  };

  programs.opencode = {
    enable = true;

    # workaround for https://github.com/NixOS/nixpkgs/issues/582673
    package =
      if pkgs.opencode.version == "2.2.5" then
        pkgs.opencode.overrideAttrs (old: {
          node_modules = old.node_modules.overrideAttrs (_: {
            outputHash = "sha256-prx9dX7kUvs/E3zopkaPk5LXh3xJAy5sZeum/W8L7cA=";
          });
        })
      else
        pkgs.opencode;

    settings = {
      provider = {
        openrouter = {
          options = {
            apiKey = "{file:${config.sops.secrets."openrouter_api_key".path}}";
          };
        };
      };
      mcp = {
        github = {
          enabled = true;
          type = "remote";
          url = "https://api.githubcopilot.com/mcp/";
          headers = {
            Authorization = "Bearer {file:${config.sops.secrets."github_token".path}}";
          };
        };
        context7 = {
          enabled = true;
          type = "remote";
          url = "https://mcp.context7.com/mcp";
          headers = {
            "CONTEXT7_API_KEY" = "{file:${config.sops.secrets."context7_api_key".path}}";
          };
        };
      };
      plugins = [
        "@dietrichgebert/ponytail"
        "@miguelmartens/opencode-caveman"
      ];
    };
  };
}
