{pkgs, config, ...}:

  pkgs.runCommand "test" {} "" 

# pkgs.runCommand "my-example" {} ''
#   echo My example command is running
#
#   mkdir $out
#
#   echo I can write data to the Nix store > $out/message
#
#   echo I can also run basic commands like:
#
#   echo ls
#   ls
#
#   echo whoami
#   whoami
#
#   echo date
#   date
# ''
#
  # ''
  # ssh-add ~/.ssh/id_ed25519 
  # '' 

