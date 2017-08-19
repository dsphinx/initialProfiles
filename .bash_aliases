#!/bin/bash
#
#  Universal  aliasses   for Unix-like
#  (c)  dsphinx 

# My admins  aliases command
alias admin.shutdown='kodi-send  --action="Quit" ; sleep 5; sudo shutdown -h now'


#
# SECTION:  ls aliases
# 
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
# show directories only
alias lsd='ls -FlA  | grep :*/'
# show executables only
alias lsx='ls -FlA | grep \*'
# show non-executables
alias lsnx='ls -FlA | grep -v \*'
# order by date
alias  lsdt='ls -FlAtr '
# dsd plus sum of file sizes
alias  lsdz="ls -Fla $1 $2 $3 $4 $5  | awk '{ print; x=x+\$5 } END { print \"total bytes = \",x }'"

alias logs='colortail -f /var/log/lighttpd/error*'
alias logs.messages='sudo multitail -f /var/log/messages'
alias logs.firewall='sudo colortail -f /var/log/messages | grep Shorewall'
alias apachetop='apachetop -f /var/log/lighttpd/access.log'
alias virtualbox='sudo /etc/init.d/vboxdrv start && /usr/bin/virtualbox'

alias get_sft_="sftp -r darwin:/Volumes/Data/apache-sites/diff/* . "
alias df="df -h $*"

# git projects - automation
#alias project1_update_diagnosis="cd /www/project1/diagnosis && git push diagnosis  && ssh project1 sed -i '16s/sandbox/live/' /www/diagnosis/App/cfg/config.php && ssh project1 /www/diagnosis/update.sh"
#alias project1_backup="/data/backup/project1_db/mysql_get.sh"

# Git
#alias save="git commit -a  -m \" last : $* \"  "    # -a
#git add xx
#git commit -a -m " initial "
#git status
#git log
#git config -l

function save {
	MES="$*"
		if [ $# -ne 0  ];then
			echoc " saving git log :  $MES " red ok
				git commit -a  -m  " $MES "
		else
			git commit -a  -m " last : auto saved "
				fi

}


#GPG
alias crypt="gpg -e -r user@gmail.com $*"
alias keys='gpg --list-keys'


# Linux
alias fuser.dsphinx="fuser -v -m /"
alias disk.volume="tune2fs -l $1"


# Java Jade Adents 			     σε περίπτωη που δεν ειναι compiled
alias jade="echoc Compiling Agents red ok ; java $* > /dev/null 2>&1 ; echoc onomaagents:Agents bold ok ; java jade.Boot -gui $*"
alias jade.cli="echoc Dose_onoma_agents:Defaultname red ok;  java jade.Boot $*"   # den bgazei ta apotelesma apo ton controler container


alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'


function say { mp3 "http://translate.google.com/translate_tts?tl=en&q=$*"; }

