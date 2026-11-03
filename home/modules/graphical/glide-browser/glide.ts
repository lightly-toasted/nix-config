// vim: set foldmethod=marker foldmarker={{{,}}}: 
/// <reference path="/home/toast/.config/glide/glide.d.ts" />

// Tabs {{{
glide.keymaps.set("normal", "t", "tab_new")
glide.keymaps.set("normal", "x", "tab_close")
glide.keymaps.set("normal", "J", "tab_next")
glide.keymaps.set("normal", "K", "tab_prev")
// }}}
// History {{{
glide.keymaps.set("normal", "H", "back")
glide.keymaps.set("normal", "L", "forward")
glide.keymaps.set("normal", "<C-[>", () => {}); // workaround, .del() won't work for this
glide.keymaps.set("hint", "<C-[>", "hints_remove");
glide.keymaps.set("command", "<C-[>", "commandline_toggle");
// }}}
// Scrolling {{{
// Manual key repeat for j/k/h/l so scrolling starts
// without waiting for OS key repeat delay.
glide.prefs.set("general.smoothScroll.lines", true);
glide.prefs.set("general.smoothScroll.lines.durationMinMS", 50);
glide.prefs.set("general.smoothScroll.lines.durationMaxMS", 50);
glide.autocmds.create("ConfigLoaded", () => {
  type Dir = "<Down>" | "<Up>" | "<Left>" | "<Right>";
  let id: number | undefined;
  let dir: Dir | undefined;

  const stop = () => { clearInterval(id); id = dir = undefined; };
  glide.autocmds.create("ModeChanged", "*", () => stop());

  const start = async (next: Dir) => {
    if (glide.ctx.mode !== "normal" || (dir === next && id !== undefined)) return;
    if (await glide.ctx.is_editing()) return void glide.keys.send(next);
    if (dir === next && id !== undefined) return;

    stop();
    dir = next;
    void glide.keys.send(next);
    id = setInterval(() => glide.ctx.mode === "normal" ? glide.keys.send(next) : stop(), 50);
  };

  for (const [lhs, next] of [["j", "<Down>"], ["k", "<Up>"], ["h", "<Left>"], ["l", "<Right>"]] as const) {
    glide.keymaps.set("normal", lhs, () => start(next));
  }

  document.addEventListener("keyup", (e) => {
    if (["j", "k", "h", "l"].includes(e.key)) stop();
  }, { capture: true, mozSystemGroup: true } as AddEventListenerOptions);
  document.addEventListener("blur", stop, true);
});
// }}}
glide.o.hint_size = "14px";
glide.prefs.set("ui.key.menuAccessKeyFocuses", false);
