# Xfce
# Remap left control -> caps lock and caps lock -> left control

setxkbmap -option ctrl:swapcaps

# Remap enter to control when pressedn with other keys and enter alone when pressed alone

# we are going to use xremap which is a tool written in rust.

cargo install xremap

# Now give it enough permission to grab the input
sudo setcap cap_sys_nice=eip $(which xremap)

xremap ~/.config/xremap/config.yml



