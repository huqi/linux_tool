#!/bin/sh

filelist=(.zshrc .bashrc .bash_profile .gitconfig)

tool_dir=Bin
temp_dir=~/$tool_dir/temp
config_dir=~/$tool_dir/profiles

if [ ! -L ~/.zshrc ]; then
    echo "ERROR: It has not been installed"
    # exit 1
fi

if [ ! -d $temp_dir ]; then
    echo "ERROR: temp dir is missing"
    exit 2
fi

function del_link
{
    rm ~/$1
}

function move_to_home
{
    cp $temp_dir/$1 ~/
}

for file in ${filelist[@]}; do
    del_link $file
    move_to_home $file
done

echo "Original profiles has been restore to home"
echo "Uninstall success"
