#!/bin/sh

tool_dir=Bin
temp_dir=~/$tool_dir/temp
config_dir=~/$tool_dir/profiles

if [ -L ~/.zshrc ]; then
    echo "Init error: It could be inited"
    exit 1
fi

if [ -e $temp_dir ]; then
    echo "Init error: temp dir \"$temp_dir\" is a file"
    exit 2
elif [ ! -d $temp_dir ]; then
    mkdir -p $temp_dir
fi

echo "Moving original profiles to $temp..."
mv ~/.zshrc $temp_dir/
mv ~/.bashrc $temp_dir/
mv ~/.bash_profile $temp_dir/

ln -s $config_dir/.zshrc ~/.zshrc
ln -s $config_dir/.bashrc ~/.bashrc
ln -s $config_dir/.bash_profile ~/.bash_profile

echo "Init Success"
