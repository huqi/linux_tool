MY_GNU_FLAG=0

function remove-gnu-path
{
    [ $MY_GNU_FLAG = "0" ] && return 1

    MY_GNU_FLAG=0
    export PATH=$(echo $PATH | sed 's/\/usr\/local\/opt\/coreutils\/libexec\/gnubin://g')
    export MANPATH=$(echo $MANPATH | sed 's/\/usr\/local\/opt\/coreutils\/libexec\/gnuman://g')
}

function add-gnu-path
{
    [ $MY_GNU_FLAG = "1" ] && return 1

    MY_GNU_FLAG=1
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
}
