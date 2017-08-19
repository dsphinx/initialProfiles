#
#   OS X  - all time -epended  
#   Linux - after ssh remote  
#   FreeBSD  - all time 
#            
# (c) dsphinx 2004-2016 
#
# loaded files by order:
#
#
# 1)     .bash_profile 
# 2)     .bashrc       	 	{ only linux on xterm etc }	
# 3)     .bash_aliases		{ universal for all uniches }
# 4)     .bash_aliases-OS
# 5)     .bash_environment_variables-OS
#

# debug only . /  instead of ~
#HOME=.  # debug only 
# alias r=". .bash_profile"
#echoc $RUNOS red ok
# debug END
#######################################

# various unix like os
# RUNOS=$( uname | tr '[:upper:]' ':[lower:]')
RUNOS=$( uname | tr 'A-Z' 'a-z')

# load functions
[ -f ~/.bash_functions ] && . ~/.bash_functions

# linux already session , xterm , ssh
loadInShell ~/.bashrc


# default aliases
loadInShell ~/.bash_aliases

#  load aliases base on systemecho RU	
#
# .bash_aliases-linux
# .bash_aliases-darwin
#
loadInShell ~/.bash_aliases-${RUNOS}
loadInShell ~/.bash_environment_variables-${RUNOS}

# bottom line
# --------------- 20:15:18
loadInShell ~/.bash_profile_line

# External progs
# z.sh rupa   https://github.com/rupa/z
loadInShell ~/.bash_extra-z

# greetings info
loadInShell ~/.bash_extra-greeting


