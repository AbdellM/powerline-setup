#!/bin/bash
echo "-> Pip installing..."
eval "sudo apt install python3-pip"

echo "-> Powerline installing..."
eval "pip3 install --user powerline-status"

echo "-> Git status installing..."
eval "pip3 install powerline-gitstatus"


output1=$(eval "find /home 2> /dev/null | grep bin/powerline-daemon")
path1=(${output1//po/ }[0])

output2=$(eval "find /home 2> /dev/null | grep bash/powerline.sh")

echo '# Powerline' >> ~/.bashrc
echo 'export PATH="$PATH:'${path1}'"' >> ~/.bashrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
echo 'powerline-daemon -q' >> ~/.bashrc
echo 'POWERLINE_BASH_CONTINUATION=1' >> ~/.bashrc
echo 'POWERLINE_BASH_SELECT=1' >> ~/.bashrc
echo 'source' ${output2} >> ~/.bashrc

echo "mkdir -p ~/.config/powerline/colorschemes"
echo "mkdir -p ~/.config/powerline/themes/shell"
echo "cp colorschemes/default.json ~/.config/powerline/colorschemes/"
echo "cp themes/default.json ~/.config/powerline/themes/shell/"
