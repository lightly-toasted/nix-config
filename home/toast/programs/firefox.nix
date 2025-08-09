{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      ExtensionSettings = {
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "normal_installed";
        };
        # Vimium C
        "vimium-c@gdh1995.cn" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
          installation_mode = "normal_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "normal_installed";
        };
        # RoGold
        "{048bba8c-c62d-4967-963d-d663cae75d3f}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/rogold/latest.xpi";
          installation_mode = "normal_installed";
        };
        # RoSeal
        "{f4f4223a-ff30-4961-b9c0-6a71b7a32aaf}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/roseal/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
    };
  };
}
