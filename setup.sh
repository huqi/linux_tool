#!/bin/sh

test_file=.bashrc
gitconfig_sample=".gitconfig-sample-local"
ignore_files=(. .. .DS_Store $gitconfig_sample)
TEMP_DIR=$PWD/temp
CONFIG_DIR=$PWD/profiles

####################################
# Option
####################################
while getopts "rh" opts; do
    case $opts in
        r)
            remove=1
            ;;
        h)
            echo "Use $0 [-r]"
            echo "    -r remove all dot files installed"
            exit 0
            ;;
    esac
done

####################################
# Check
####################################
if [ ! "$remove" ] ; then
    action="Install"

    if [ -L $HOME/$test_file ] ; then
        echo "ERROR: May be already installed"
        exit 1
    fi

    # gitconfig local
    if [ -f $CONFIG_DIR/$gitconfig_sample ] ; then
        cp $CONFIG_DIR/$gitconfig_sample $CONFIG_DIR/.gitconfig-local
    fi
else
    action="Uninstall"

    if [ ! -L $HOME/$test_file ] ; then
        echo "ERROR: Has not been installed "
        exit 2
    fi
fi

echo "$action Start..."
echo "----------------------"

####################################
# TEMP DIR
####################################
if [ ! -d $TEMP_DIR ]; then
    mkdir $TEMP_DIR
fi

####################################
# Copy file
####################################
for file_path in $CONFIG_DIR/.* ; do

    ignored=0
    file_name=$(basename $file_path)

    for ignore_file in ${ignore_files[@]} ; do
        if [ $file_name = $ignore_file ]; then
            ignored=1
        fi
    done

    if [ $ignored = "1" ] ; then
        continue
    fi

    echo "\n***$file_name***"

    if [ "$remove" = "1" ] ; then
        rm $HOME/$file_name && echo "remove $HOME/$file_name"
        cp $TEMP_DIR/$file_name $HOME && echo "restore $TEMP_DIR/$file_name to $HOME/$file_name"
    else
        mv $HOME/$file_name $TEMP_DIR/ && echo "move $HOME/$file_name to $TEMP_DIR/$file_name"
        ln -s $CONFIG_DIR/$file_name $HOME/$file_name && echo "create symlink $file_name to $CONFIG_DIR/$file_name"
    fi
done

echo "$action done"
