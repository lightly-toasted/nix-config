{ pkgs, ... }: {

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
  };
}
