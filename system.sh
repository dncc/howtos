# Track point Sensitivity & Speed
# --------------------------------------------------------------
# (http://www.thinkwiki.org/wiki/How_to_configure_the_TrackPoint#Configuring_other_options_.28e.g._Press_to_select.2C_Sensitivity_and_Speed.29)

# Adjusting the speed and sensitivity of the TrackPoint requires echoing a value between 0 and 255 into the appropriate file.
# For example, for a speed of 120 and a sensitivity of 250, type the following into a terminal:
    $ echo -n 120 > /sys/devices/platform/i8042/serio1/serio2/speed
    $ echo -n 250 > /sys/devices/platform/i8042/serio1/serio2/sensitivity

# Map caps lock to ctrl
# --------------------------------------------------------------
#  System Tools => System Settings => Search for
# * Gnome: keyboard/regional settings => Edit keyboard/regional settings 
# => Edit Layout options => caps lock as control (also there is startup 
# script in workspace/scripts that does the same thing.
# * WMII: in .zshrc 'source /usr/local/share/keymappings/caps_to_ctrl.sh'

# Edit corrupted /etc/sudoers file
# --------------------------------------------------------------
# (i.e. parse error in /etc/sudoers) just type:
	$ pkexec visudo
# and then login as root and fix your /etc/sudoers file
# http://askubuntu.com/questions/73864/how-to-modify-a-invalid-etc-sudoers-file-it-throws-out-an-error-and-not-allowi

# See keyboard layout in wmii
# --------------------------------------------------------------
# install xkb-switch: it is small c++ github project (look at ~/workspace/github),
# it needs to be install manually. It is dependent on libx11-dev:
	$ sudo apt-get install libx11-dev

# Move default dirs (Downloads, Public, Music etc.) from $HOME
# --------------------------------------------------------------
# Edit $HOME/.config/user-dirs.dirs
