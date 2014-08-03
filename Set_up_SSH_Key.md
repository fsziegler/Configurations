**This text is adapted from https://help.github.com/articles/generating-ssh-keys**

# Generating SSH Keys
 * `ls -al ~/.ssh`
 * `ssh-keygen -t rsa -C "your_email@example.com"`
 * `eval "$(ssh-agent -s)"`
 * `ssh-add ~/.ssh/id_rsa`
 * `sudo apt-get install xclip`
 * `xclip -sel clip < ~/.ssh/id_rsa.pub`
