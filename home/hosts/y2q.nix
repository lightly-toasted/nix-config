{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ../modules/cli/git.nix
    ../modules/cli/ripgrep.nix
    ../modules/cli/btop.nix
    ../modules/cli/yazi.nix
    ../modules/cli/nixvim
    ../modules/cli/zsh.nix
    ../modules/cli/direnv.nix
    ../modules/cli/zoxide.nix
  ];

  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };

  programs.zsh.initContent = ''
    PROMPT='%n@%m:%~/ > '
    export EDITOR="nvim"
    export VISUAL="nvim"
    export LANG=en_US.UTF-8

    # ssh-agent
    SSH_ENV="$HOME/.ssh/environment"

    function start_agent {
        ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
        chmod 600 "$SSH_ENV"
        . "$SSH_ENV" > /dev/null
    }

    # check for running ssh-agent with proper $SSH_AGENT_PID
    if [ -n "$SSH_AGENT_PID" ]; then
        ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
        if [ $? -ne 0 ]; then
            start_agent
        fi
    else
        if [ -f "$SSH_ENV" ]; then
            . "$SSH_ENV" > /dev/null
        fi
        ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null || start_agent
    fi
  '';

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
