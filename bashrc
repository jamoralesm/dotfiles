export EDITOR=vim
export EDITORIDE=gvim
export GREP_COLOR="36;1;1"

export QT_STYLE_OVERRIDE=gtk



export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=setting'
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_FONTS=/usr/share/fonts/TTF



if [ -d "/opt/android-sdk/tools/" ]; then
    PATH="/opt/android-sdk/tools/:$PATH"
fi
if [ -d "/opt/android-sdk/platform-tools/" ]; then
    PATH="/opt/android-sdk/platform-tools/:$PATH"
fi

if [ -d "$HOME/.composer/vendor/bin" ]; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.gem/ruby/2.2.0/bin" ]; then
    PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
fi
if [ -d "$HOME/.gem/ruby/2.3.0/bin" ]; then
    PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
fi
if [ -d "$HOME/.composer/vendor/bin" ]; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ex - archive extractor
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Contador tiempo de tarea
function ctt() {
    wfile="$HOME/tmp/worktime";
    if [ ! -d $wfile ]; then
        mkdir -p $wfile;
    fi
    if [[ -z $1 ]]; then
        wfile="$wfile/$(date +'%Y%m%d')";
    else
        wfile="$wfile/$1";
    fi
    timer=0;

    if [ -e $wfile ]; then
        clear;
        timer=$(($(cat $wfile)*60));
        echo "$(cat $wfile) Minutos Trabajados...";
        echo "0 Segundos Trabajados...";
    fi

    while true;
    do
        sleep 1;
        clear;
        let timer++;
        echo "$(cat $wfile) Minutos Trabajados...";
        echo "$(($timer%60)) Segundos Trabajados..." && echo $(($timer/60)) > "$wfile";
    done;
}

# streaming from here
function streaming() {
    # matemos en caso de ffserver
    killall ffserver
    ffserver -f ~/.config/ffserver.conf &
    PID=$!  # Podria llegar a ocupar el PID si quiero eliminar todo
    ffmpeg -i "$1" http://localhost:8090/input.ffm
}

# reproducir desde youtube
function yplayer() {
    mplayer -cookies -cookies-file /tmp/ytcookie.txt $(youtube-dl -g --cookies=/tmp/ytcookie.txt "$1")
}

function resetper() {
    #Poner todos los subfolder de un folder a 755:
    find . -type d -exec chmod 750 {} \;
    #Todos los archivos a 644:
    find . -type f -exec chmod 640 {} \;
}

function gcommit() {
    git add .; git commit -am "$1"; git pull; git push;
}

function gns3() {
    # systemctl enable gns3-server@USER
    systemctl start gns3-server@jamoralesm
}

alias bhelp='jekyll serve -s ~/public_html/ayuda/bootstrap/ -d ~/public_html/ayuda/bootstrap3/'

alias vim='stty -ixon -ixoff && vim'
alias vi='vim'
alias tmux='tmux -2'
alias upcomposer='curl -sS https://getcomposer.org/installer | php && mv composer.phar ~/.local/bin/composer'

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
alias ifhome='sudo ifconfig vboxnet0 up'


alias startminidlna='minidlnad -f /home/$USER/.config/minidlna/minidlna.conf -P /home/$USER/.config/minidlna/minidlna.pid'
alias mcam='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 30'
alias gcam='ffmpeg -f video4linux2 -s vga -i /dev/video0 cam.mpg'
alias cgmpg2avi='mencoder out.mpg -ovc lavc -lavcopts vcodec=mpeg4 -o out2.avi'
alias screencast='ffmpeg -f x11grab -s 1366x768 -r 10 -i :0.0 -qscale 0 -r 25 screencast.mpg'

alias w7='vboxmanage startvm W7EntX64'
alias verbios='sudo dmidecode -t 0 | grep Version'
alias verprocesador='cat /proc/cpuinfo'
alias mount='sudo mount'
alias fsckforse='sudo touch /forcefsck'
alias extendscreenv='xrandr --output VGA1 --right-of LVDS1'
alias extendscreen='xrandr --output HDMI1 --right-of LVDS1'
alias clonscreenv='xrandr --output VGA1 --mode '
alias clonscreen17='xrandr --output VGA1 --mode 1024x768'
alias clonscreen18='xrandr --output VGA1 --mode 1280x800'
alias clonscreen1280x720='xrandr --output VGA1 --mode 1280x720'
# alias clonscreenv='xrandr --output VGA1 --mode 1280x1024'
alias clonscreen='xrandr --output HDMI1 --mode 1366x768'
alias shutclonev='xrandr --output VGA1 --off'
alias shutclone='xrandr --output HDMI1 --off'
alias shutscreen='xset dpms force off'
alias grep='grep --color=always'
alias ls='ls --color=always'
alias pomodoro='sh pomodoro 25 "Pomodoro" "Pomodoro iniciado, tienes que trabajar 25 minutos" "Pomodoro finalizado. Por favor para de trabajar y tomate un descanso de 5 minutos"'
alias wvdial='wvdial.sh'
alias upjdownloader='java -jar ~/.jd/jdupdate.jar -branch NIGHTLY'
alias chromium='chromium --proxy-server="socks://localhost:9050" --no-referrers'
alias ntpupdate='sudo ntpdate ntp.shoa.cl'

alias starwars="telnet towel.blinkenlights.nl"


alias scaniw='sudo iw dev wlp3s0 scan | grep "SSID\|freq\|DS\|signal"'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'


source /home/jamoralesm/.local/bin/git-prompt.sh

# prompt
PS1="[\u@\h \W] \$(__git_ps1 'GIT::(%s)') $ "

