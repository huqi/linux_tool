#!/bin/sh

filelist=(.zshrc .bashrc .bash_profile .gitconfig)

tool_dir=Bin
temp_dir=~/$tool_dir/temp
config_dir=~/$tool_dir/profiles

if [ -L ~/.zshrc ]; then
    echo "ERROR: It may be already installed"
    exit 1
fi

if [ -f $temp_dir ]; then
    echo "ERROR: temp dir \"$temp_dir\" is a file"
    exit 2
elif [ ! -d $temp_dir ]; then
    mkdir -p $temp_dir
fi

function move_to_temp
{
    mv ~/$1 $temp_dir/
}

function ln_s_to_home
{
    ln -s $config_dir/$1 ~/$1
}

for file in ${filelist[@]} ; do
    move_to_temp $file
    ln_s_to_home $file
done

echo "Original profiles has been backup to $temp_dir"
echo "Install success"
