{ config, ... }: {

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

          local prompt="Provide ONLY the executable shell one-liner command for: $query. Rules: Output raw text only. Do NOT start with 'sh', 'bash', or 'zsh'. Do NOT use markdown code blocks or backticks. No explanations."
          local cmd=$(ollama run qwen2.5-coder:3b "$prompt" 2>/dev/null | tr -d '`')

          BUFFER="$cmd"
          POSTDISPLAY=""
          CURSOR=$#BUFFER
      }
      
      if [[ "$(hostname -s)" != "nixos" ]]; then
        export OLLAMA_HOST="http://nixos:11434"
      fi
      zle -N ollama-command-gen
      bindkey '^G' ollama-command-gen
    '';
  };
}
