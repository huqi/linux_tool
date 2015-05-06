#! /bin/sh

temp_dir=temp
src_dir=configuration

if [ ! -e $temp_dir ]; then
    mkdir $temp_dir
fi

# temp
cp ~/.zshrc ./$temp_dir/
cp ~/.bashrc ./$temp_dir/
cp ~/.bash_profile ./$temp_dir/
echo "You can find original file in $PWD/$temp_dir"

# restore
cp $src_dir/zshrc ~/.zshrc
cp $src_dir/bashrc ~/.bashrc
cp $src_dir/bash_profile ~/.bash_profile

echo "restore done!"
