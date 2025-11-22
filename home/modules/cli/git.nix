{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "lightly-toasted";
        email = "tooast@duck.com";
      };
      init.defaultBranch = "main";
    };
  };
}
