#!/bin/sh
 
# The key might be fettched using "${SSH_KEY%x}"
echo "$(lpass show 6016256112274127848 --notes)" >> ~/.ssh/id_ed25519

ssh-add ~/.ssh/id_ed25519

chmod 600 ~/.ssh/id_ed25519

