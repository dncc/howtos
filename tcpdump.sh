# listen on localhost, -i 5 (ifconfig gives lo as fifth interface)
# port 8080 in verbose mode
sudo tcpdump -i 5 port 8080 -v
