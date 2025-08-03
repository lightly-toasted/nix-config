{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    settings = {
      filetypes = [ "*" ];
      user_default_options = {
        css = true;
	tailwind = "both";
	tailwind_opts = {
          update_names = true;
	};
      };
    };
  };
}
