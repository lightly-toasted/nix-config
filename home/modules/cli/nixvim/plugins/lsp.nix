{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      lua_ls.enable = true;
      ts_ls.enable = true;
      pyright.enable = true;
      tailwindcss.enable = true;
      nil_ls.enable = true;
      gopls.enable = true;
    };
  };
}
