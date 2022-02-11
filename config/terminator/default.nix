{pkgs, config, ...}:
let
  terminatorConfig = builtins.readFile ./config;
in
{
  home.file.".config/terminator/config".text = terminatorConfig;

}
