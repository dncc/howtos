
find . -type f -name "*.sw*" -exec rm -f {} \; #find all files inside dir (and its subdirectories) and remove (only files)

find . -name "FILE-TO-FIND"-exec rm -rf {} \;#if u want directories to remove as well then ->

Alt + f                       #  move forward one word
Alt + b                       #  move forward one word
Alt + .                       #  Paste last executed command
C + w                         #  Delete backwards
head -30 /to/file | tail -10  #  Print last 10 of first 30 lines in the file

----------------------------------------------------------------------------------------------------
# shell rename multiple files all gif -> jpg
for i in *.gif; do mv "$i" "${i/.gif}".jpg; done

# make svn clean copy
workingdir> svn ci .
workingdir> mkdir ../clean_copy
workingdir> cd ../clean_copy
clean_copy> svn co svn://localhost:3690/xcash/trunk/rails_application
# remove all but last five lines from the log file
tail -5 error.log > error.log
# svn co for particular revision
svn co -r 579 svn://localhost:3690/xcash/trunk/rails_application/app/views/home/
# xcb production
# pass: yu2g&eb
. env.sh
sudo /etc/init.d/httpd restart
# append a ssh public key to a remote machines keys file
cat ~/.ssh/id_dsa.pub | ssh alch763@xcb 'cat >> .ssh/authorized_keys'

# live view of log files
#-------------------------
tail -f /path/to/log.log

#----------------------------------------------------------------
#	XARGS
#----------------------------------------------------------------
# def: xargs is a command used to execute commands based on
# arguments from standard input.

#Recursively find all Ruby files and count the number of lines
find . -name '*.rb' | xargs wc -l

#Recursively find all Emacs backup files and remove them
find . -name '*~' | xargs rm

#Recursively find all Ruby files and search them for the word ‘require’
find . -name '*.rb' | xargs grep 'require'

# Will find all log files over 2 gigs and older than 3 days.
# Then it will gzip them split across 8 parallel gzip processes.
find ./ -name "*.log" -size +2G -ctime +3 | xargs -P 8 gzip

# compress file with gzip
gzip -c part-test.txt > part-test.gz

# list files, grep file w/ 'forth' word and open it w/ evince
# "foo" can be any string, for instance "{}", -I option means
# take result of grep and replace foo w/ it
ls ~/downloads/books | grep forth | xargs -Ifoo evince ~/downloads/books/foo &

#----------------------------------------------------------------------
# More shell less egg
#----------------------------------------------------------------------
tr -cs A-Za-z '\n' |
tr A-Z a-z |
sort |
uniq -c |
sort -rn |
sed ${1}
#----------------------------------------------------------------------
#Download with curl
#----------------------------------------------------------------------
curl -L -O <url>
#----------------------------------------------------------------------
# Bash's brace expansion (replacement for loops) http://www.gnu.org/software/bash/manual/bashref.html
#----------------------------------------------------------------------
# No good deed goes unpunished
for i in {1..19}; do
  echo "http://hackermonthly.com/xmas/hackermonthly-issue0"$i".zip";
done | xargs wget

# can be replaced by
wget http://hackermonthly.com/xmas/hackermonthly-issue0{01..19}.zip
# or with curl same
curl -O "http://hackermonthly.com/xmas/hackermonthly-issue0[01-19].zip"
# and for _auto resume_ if it disconnects in the middle
curl -C - -O "http://hackermonthly.com/xmas/hackermonthly-issue0[01-19].zip"
#--------------------------------------------------
# rsync
#--------------------------------------------------
# when /source/dir/ has a '/' at the end than it
# does not copy itself only content of it
rsync -avz --stats /from/src/dir/ /to/destination/
# for instance:
rsync -avz --stats /etc/adobe/ /media/DNC_/BACKUP/etc/adobe
# if you want to delete files in destination directory
# that does not exists anymore in source directory
# use --delete option
rsync -avz --stats --delete /from/src/dir/ /to/destination/

#-------------check md5 sha1 checksums--------------
openssl dgst [-md5|-sha1] <filename>

#-------------find all files with path pattern------
sudo find / -path "*oh-my-zsh*"

#----------------- CUT -----------------------
> cat file.txt
unix or linux os
is unix good os
is linux good os

#print 4th char of each line
cut -c4 file.txt
x
u
l
#4th and 6th
cut -c4,6 file.txt
#range 4-7
cut -c4-7 file.txt
#first six
cut -c-6 file.txt
#print whole line
cut -c- file.txt
# delimiter ' ' print second field
cut -d' ' -f2 file.txt
# 2nd and 3rd field
cut -d' ' -f2,3 file.txt
cut -d':' -f1 /etc/passwd

#prints file extensions, reverse names
#so extension is first, delimit and print
rev filenames.txt | cut -d'.' -f1
#----------------- GREP -----------------------
#grep w/ surrounding lines
grep -B 2 -A 3 foo README.txt
#----------------- PATCH -----------------------
# apply patch from .diff file
patch < foo.diff
# reverse patch previously applied from .diff file
patch -R < foo.diff
#----------------- SCREEN ----------------------
# list all screen sessions
screen -ls
# start screen session with name ruby
screen -S ruby
# kill screen session with name ruby
screen -S ruby -X quit
# detach and reconnect to a screen w/ name ruby
^A d            #detach
screen -r ruby  #reconnect
# create and destroy new window in current session
^A c
exit OR ^D
# list all windows for current session
^A \"
# select 0 window
^A 0
#----------------- VIM SLIME -------------------
# send selected txt to screen session
C-c, C-c
# reconfigure/reconect to other screen
C-c, v
#------------------ UTILITY -------------------
# list all dotfiles, remove dots, rename .file to file
ls .* | sed s/\.// | xargs -Ifile mv .file file

# split PATH into its components
tmp > echo $PATH | tr ":" "\n" | sort

#extract audio from a bunch of mp4 files
for i in *.mp4; do ffmpeg -i "$i" "${i/.mp4}.mp3"; done

#------------------ ZIP ------------------------
# add some files to a file called abc.zip:
zip abc file1 file2 file3
# copy a whole directory tmp into abc.zip:
zip -r abc tmp
# creating a password protected archives
zip -e important.zip file1 file2
# list the files inside an archive
unzip -l a.zip

#------------- ruby, python, perl ---------------
# => bla bla
echo "puts 'bla bla'" | ruby --
# => 1, 2, 3, ..., 10
ruby -- <<EOL
  (1..10).each{ |i| puts i }
EOL
# => bla bla
ruby -e "puts 'bla bla'"

#---------- list open files for a proces -------
lsof -nPp <pid>
#-------- trace system calls and signals -------
# -c count time, calls and errors for each sys call
# -p attach to the process and begin tracing
strace -cp <pid>
# output for rails s (ruby process)
# % time     seconds  usecs/call     calls    errors syscall
# ------ ----------- ----------- --------- --------- ----------------
#  99.05    0.240001        2526        95           select
#   0.95    0.002304         100        23         1 futex
#   0.00    0.000000           0         2           write
#   0.00    0.000000           0        18           fstat
#   0.00    0.000000           0         3           mmap
#   0.00    0.000000           0         2           mprotect
#   0.00    0.000000           0         1           brk
#   0.00    0.000000           0         6           accept
#   0.00    0.000000           0         6           clone
#   0.00    0.000000           0        18           fcntl
#   0.00    0.000000           0         5           ppoll
# ------ ----------- ----------- --------- --------- ----------------
# 100.00    0.242305                   179         1 total

# -t prefix each line w/ the time of day
# -tt include microseconds
# -T show the time spent in sys calls
# -o filename write trace output to the filename rather than to stderr
strace --ttTp <pid> -o <file>

#------- gdb ----------------------------
gdb <program>
gdb <program> <pid>

# start breakpoint on function "average"
b average
# run program
run
# show backtrace/function stack
bt
# single step
s
# print variables
p avg
p sum
#----------------- untar bz2, bz files --------------------
# extract bz files
	$ tar -xjvf <filename>.tar.bz2
	$ tar -zxvf <filename>.tar.bz2
# For example, you have directory called /home/jerry/prog and you would
# like to compress this directory then you can type tar command as follows:
	$ tar -zcvf prog-1-jan-2005.tar.gz /home/jerry/prog
# to restore use:
	$ tar -zxvf prog-1-jan-2005.tar.gz
#----------------- screen ---------------------------------
# list all available (active screens)
screen -ls
# reconnect to the active (detached) screen
screen -dr <screen-name>
# end screen from within the session
exit
# kill the detached screen session by
# pid (get it with 'session -ls')
screen -S <session-pid> -X quit

#----------------- xclip ---------------------------------
# save ls to the _primary_ (middle-click) clipboard
# (you can paste w/ middle mouse button)
# (same holds if you select text region, you can paste it w/ m.m. button)
ls | xclip

# print content of _primary_ clipboard to the stdout
xclip -o
#or to test.txt
xlicp -o > test.txt

# paste it to the file
<click middle-mouse-button>

# put all contents of a file into the _primary_ clipboard
xclip ~/test.txt

# save ls to the _secondary_ (right-click) clipboard
# (you can use ctrl+v or "+p to paste it)
ls | xclip -selection c
# or
ls | xclip -sel c

# print content of _secondary_ clipboard to the stdout
xclip -o -sel c
# or
xclip -out -selection c

# ------------------ split file ---------------------------
# split large_file into 10k chunks with the given prefix
# and numbered suffixes (-d option)
split -l 10000 -d <large_file> <prefix-for-10k-chunks>

