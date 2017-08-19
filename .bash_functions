#!/bin/bash
#
#   OS X  - all time -epended  
#   Linux - after ssh remote  
#   FreeBSD  - all time 
#            
# (c) dsphinx 2004-2016 

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
        PATH="$HOME/bin:$PATH"
fi



# load script in current session
#      if exists
function loadInShell()  { 
    SCRIPT=$1
    [ -f $SCRIPT ] && echoc "loading $SCRIPT" blue ok
    [ -f $SCRIPT ] && . $SCRIPT
}

# for backup use
BACKUPSYSTEMFILE="/tmp/dsphinx-login-system.tar.bz2"

### add alias as per os using $_myos ###
case $RUNOS in
	linux)
		alias compress="tar -jcf "
		alias uncompress="tar -xvfj "
		alias statinfo='stat -c'
		;;
	freebsd|OpenBSD)
		alias foo='/path/to/bsd/bin/foo'
		alias RSYNC="/usr/bin/rsync -E -av"

		;;
	sunos)
		alias foo='/path/to/sunos/bin/foo'
		;;
	darwin)
		alias compress="tar cvfj "
		alias statinfo='stat '
		;;
	*) ;;
esac

compressOPTIONS=" -exclude .AppleDouble --exclude .DS_Store "




# clean vim temp files
function cleanTemporaryFiles(){
    PATTERN=".*.swp"
    rm -fR $PATTERN
}


# show all aliasses
function show.aliasses(){ 
    echoc "loaded aliasses" red ok
    alias | cut -f1 -d= | awk '{ print $2}' | sort
}


# file permissions
function show.permission() { 
    statinfo   "Αρχείο: %n   Δικαιώματα: %A  Δεκαδικό: %a" $*
    statinfo   "inode: %ish  " $*
    statinfo   "size bytes: %s  " $*
    statinfo   "Last Modification: %y  " $*
    statinfo   "Last access: %x  " $*
    statinfo   "Last change: %z  " $*
    lsattr $*
}


# Κλήση: echoc " message " "color" "{-ne}"
function show.echoc() {
    colors[0]='Δοκιμή' || (echo 'Failure: arrays not supported in this version of bash.' && exit 2)
    local colors=('black' 	'\E[30;47m'
    'red' 		'\E[31;47m'
    'green' 	'\E[32;47m'
    'yellow' 	'\E[33;47m'
    'blue'		'\E[34;47m'
    'magenta'	'\E[35;47m'
    'cyan'		'\E[36;47m'
    'white' 	'\E[37;47m'
    )
    local msgdef=" echoc τιμή ?? "
    local newline="-e"

    local msg=${1:-$msgdef}
    local newline=${3:-$newline}
    local count=0
    local flag=0
    local col=$2

    while [ "x${colors[count]}" != "x" ]
    do
        if [ ${colors[count]} == "$col" ];then
            flag=$(( $count + 1 ))
            color=${colors[flag]}
        fi
        count=$(( $count + 1 ))
    done

    echo $newline "$color"
    echo "$msg"
    tput sgr0 || echo -ne '\E[0m'
    return
}





# make backup all login system
function admin.backup.mysystem() {
    rm -f  $BACKUPSYSTEMFILE
    compress $BACKUPSYSTEMFILE -T  ~/.bash_requiredfiles
    [ -f $BACKUPSYSTEMFILE ] && echoc "Backup created  ... "$BACKUPSYSTEMFILE red ok
}


# kodi player
function kodi.restart() {
    # Kodi
    kodi-send  --action="Quit"
    sleep 2
    sudo /etc/init.d/lirc restart
    sleep 4
    sudo /etc/init.d/lightdm restart

}

function admin.reboot {
   kodi.stop
sleep1
sudo reboot
}

function kodi.stop {
    # Kodi
        kodi-send  --action="Quit"
            sleep 2

}

function admin.readeflie(){
exec 3<&0


exec  < ~/.bash_requiredfiles
while read line
do
	echo $line
done

}

