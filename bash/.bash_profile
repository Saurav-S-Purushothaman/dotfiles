# sudo apt install xmodmapping
# sudo apt install xcape

# run the above to make the below work.

xmodmap -e 'keycode 36 = 0x1234'
xmodmap -e 'add Control = 0x1234'
xmodmap -e 'keycode any
