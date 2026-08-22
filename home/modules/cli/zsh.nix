{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      gs = "git status";
      gl = "git log --oneline --graph --decorate --all";
      ga = "git add --all";
    };
    dotDir = "${config.xdg.configHome}/zsh";
    initContent = ''
      # generate command using Ollama on Ctrl + G
      ollama-command-gen() {
          local query="$BUFFER"
          [[ -z "$query" ]] && return

          POSTDISPLAY=" [Generating command...]"
          zle redisplay

          payload=$(${pkgs.jq}/bin/jq -n --arg q "$query" '{
            model: "qwen2.5-coder:3b",
            prompt: ("shell command for: " + $q),
            stream: false,
            format: {
              type: "object",
              properties: {command: {type: "string"}},
              required: ["command"]
            }
          }')

          local cmd=$(curl -s http://100.75.229.9:11434/api/generate -d "$payload" | ${pkgs.jq}/bin/jq -r '.response | fromjson | .command')

          BUFFER="$cmd"
          POSTDISPLAY=""
          CURSOR=$#BUFFER
      }

      zle -N ollama-command-gen
      bindkey '^G' ollama-command-gen
    '';
  };
}
