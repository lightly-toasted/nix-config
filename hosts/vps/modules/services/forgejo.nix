{
  services.forgejo = {
    enable = true;
    settings = {
      server = {
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3001;
        DOMAIN = "git.toast.name";
        ROOT_URL = "https://git.toast.name/";
        LANDING_PAGE = "explore";
      };
      service.DISABLE_REGISTRATION = true;
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
    };
  };
}
