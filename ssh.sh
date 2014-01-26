SSH tricks
-----------------------------------------------
# Transfer /home directory from remote host to local server using ssh and tar
ssh user@remotehost "tar cvzf - /home" | tar xvzf - /home

# Similar as above but using scp to recursively copy /home from remote host to
# local server
scp -r user@remotehost:/home /home
---
# Transfer a local file to remote server OR
cat /home/mynitor/testfile | ssh user@remotehost "cat > /home/mynitor/testfile"
ssh user@remotehost 'cat > ~/testfile ' < cat ~/testfile
---
# Try this:
ssh user@remotehost "cat /home/proj_xcb/xcb.dump" | cat > ~/Downloads/testfile
# Compare a file on remote server with local host
ssh user@remotehost.com "cat /tmp/remotefile" | diff - /tmp/localfile
---
ssh -N -f ab1
# textual file copy to the local server
ssh ab1 "cat /home/proj_xcb/xcb.sqlite3.dump" | cat > ~/xcb.sqlite3.dump
scp draganc@ab1:/home/proj_xcb/rails_application/db/xcb.db .
---
# append your public key to remote server
ssh user@remote.com 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
# same as above
ssh-copy-id user@remote.com
---
# send files at ~/src/ to remote.com:~/src/
cd && tar czv ./src | ssh user@remote.com 'tar xz'
---
mkdir -p ~/backup/remote.com
cd !$
# copy site remote.com to local backup
ssh user@remote.com 'cd public_html && tar cz remote.com' | tar xzv
---
# see if httpd is running on remote.com
ssh remote.com 'ps ax | grep [h]ttpd'
---
# -L listen on local port 9000, to any process listenning
ssh -NT -L 9000:localhost:8000 remote.com
# on remote.com:8000 it will look like it talks to local process.
# localhost is the remote machine we will connect to from the perspective
# of remote.com (so remote.com in this case). So for instance perhaps you
# have a work computer to which you have SSH access, and you have company intranet site
# at 192.168.10.10. You can't reach this from outside, but using an SSH tunnel you can!
ssh -NT -L 8080:192.168.10.10:80 user@work-machine.com
# so I connect to work-machine.com (with browser http://localhost:8080) and tunnel
# everithing to 192.168.10.10:80
---
# append a ssh public key to a remote machines keys file
cat ~/.ssh/id_dsa.pub | ssh alch763@xcb 'cat >> .ssh/authorized_keys'
---
# start sshd server with test config file
sudo /usr/sbin/sshd -f /etc/ssh/sshd_config.test -p 2022 -d
---
# download file from a remote server
scp user@host:/path/to/the/file.txt /local/directory
# upload file to a remote server
scp SourceFile user@host:directory/TargetFile




