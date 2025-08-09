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
        # C2 Password
        "c2password@synology.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/c2-password/latest.xpi";
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
