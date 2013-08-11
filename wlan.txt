# list all ip interfaces
ip link
# set up wlan0 interface
sudo ip link set wlan0 up
# scan networks within reach
sudo iwlist wlan0 scan

# set the wireless card to connect to "dlink" network
sudo iwconfig wlan0 essid "dlink"

# request ip address from the router
sudo dhclient wlan0

# connect to dlink w/ access key
sudo iwconfig wlan0 key s:ascii-password
# or
sudo iwconfig wlan0 key hex-password

# start up
sudo ifconfig wlan0 up
