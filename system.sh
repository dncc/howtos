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

# Change xkb layout toggle shortcut to
# ----------------------------------------------
# ctrl+alt: edit /etc/default/keyboard:
	$ XKBOPTIONS="grp:ctrl_alt_toggle"

# Install sshd server and clients
# ----------------------------------------------
	$ sudo apt-get install openssh-server openssh-clients

# Add new fonts
# ----------------------------------------------
# place font files in /usr/share/fonts/truetype
# then update your font cache.
	$ sudo fc-cache -fv

# Tools to install
# ----------------------------------------------
#	- GVim
#   - dotfiles
# 	- chruby
# 	- ruby, gems
# 	- wmii
#   - tmux
# 	- R
# 	- octave
# 	- openssh-server
#   - font: Envy Code R
#   - cmus
#   - latex
#

# Multiple screen setup w/ i3
# ----------------------------------------------
	$ xrandr --output DP2 --auto --left-of LVDS1

# Remove firefox sidebar:
# ----------------------------------------------
# create directory chrome on the following path:
	$ mkdir ~/.mozilla/firefox/<id>.<profile>/chrome
# in the chrome dir create file userChrome.css
# with the following content:
	@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"); /* only needed once */
	#content browser{margin-right:-13px!important;overflow-y:scroll;overflow-x:hidden;}
# adjust margin so scroll bar is not visible.

# in order to install matplotlib you need to install freetype so:
wget http://savannah.nongnu.org/download/freetype/freetype-2.4.0.tar.gz
tar -zxvf freetype-2.4.0.tar.gz
cd freetype-2.4.0
./configure && make && sudo make install
cd ..
rm freetype-2.4.0.tar.gz
rm -r freetype-2.4.0

# Tell firefox which user to run on start up
# -----------------------------------------------------
# user definitions are in the file # ~/.mozilla/firefox/profiles.ini
# add the line from bellow to a definition to make it default one
Default=1

# Disable annoying OpenSSH pop-up window for entering ssh-passphrase
# -----------------------------------------------------
# comment everything in /etc/X11/Xsession.d/90x11-common-ssh-agent file
# this is the file that X server uses to start ssh-agent
# remove gnome ssh-askpass-gnome program with:
sudo apt-get remove ssh-askpass-gnome

# disable annoying pinentry pop up (gpg agent)
# -----------------------------------------------------
# comment 'use-agent' line in the ~/.gnupg/gpg.conf
# use-agent
# then kill all active gpg-agent processes

