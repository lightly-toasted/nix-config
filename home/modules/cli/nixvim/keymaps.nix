{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<CR>";
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<CR>";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      }
      {
        mode = "n";
        key = "<leader>?";
        action = "<cmd>WhichKey<CR>";
        options.desc = "Show WhichKey popup";
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>bnext<CR>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>bprevious<CR>";
        options.desc = "Prev buffer";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
        options.desc = "Delete buffer";
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Buffer list";
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>BufferLinePick<CR>";
        options.desc = "Pick buffer";
      }
      {
        mode = "n";
        key = "<leader>bc";
        action = "<cmd>BufferLinePickClose<CR>";
        options.desc = "Pick buffer to close";
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Telescope: Find Files";
      }
      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Telescope: Live Grep";
      }
      {
        mode = "n";
        key = "<leader>b";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Telescope: List Buffers";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options.desc = "LSP Code Action";
      }
      {
        mode = ["n" "x"];
        key = "<leader>oa";
        action.__raw = ''function() require("opencode").ask("@selection: ", { submit = true }) end'';
        options.desc = "Ask opencode";
      }
      {
        mode = ["n" "x"];
        key = "<leader>ox";
        action.__raw = ''function() require("opencode").select() end'';
        options.desc = "Execute opencode action...";
      }
      {
        mode = ["n" "x"];
        key = "<leader>og";
        action.__raw = ''function() require("opencode").prompt("@selection") end'';
        options.desc = "Add to opencode";
      }
    ];
  };
}
