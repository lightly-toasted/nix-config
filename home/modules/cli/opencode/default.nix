{ config, ... }:

{
  sops.secrets = {
    "openrouter_api_key" = {};
    "github_token" = {};
    "context7_api_key" = {};
  };

  programs.opencode = {
    enable = true;
    tui = {
      theme = "opencode";
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
        unityMCP = {
          enabled = true;
          type = "remote";
          url = "http://127.0.0.1:8080/mcp";
        };
      };
    };
    skills = {
      # https://github.com/JuliusBrussee/caveman
      caveman = builtins.readFile ./skills/caveman.md;
      caveman-commit = builtins.readFile ./skills/caveman-commit.md;
    };
  };
}
