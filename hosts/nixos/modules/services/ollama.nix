{ pkgs, ... }:

{
  services.ollama = {
    package = pkgs.ollama-cuda;
    host = "0.0.0.0";
    loadModels = ["qwen2.5-coder:3b"];
    syncModels = true;
  };
}
