{ pkgs, ... }:

{
  services.ollama = {
    package = pkgs.ollama-cuda;
    host = "0.0.0.0";
    loadModels = [
      "qwen2.5-coder:3b"
      "s1gnature/gemma4-uncensored-mtp:e4b-q4_k_m"
    ];
    syncModels = true;
  };
}
