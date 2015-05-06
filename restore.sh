#! /bin/sh

temp_dir=temp

if [ ! -e $temp_dir ]; then
    mkdir $temp_dir
fi

# temp
cp ~/.zshrc ./$temp_dir/
cp ~/.bashrc ./$temp_dir/
cp ~/.bash_profile ./$temp_dir/
echo "You can find original file in $PWD/$temp_dir"

# restore
cp zshrc ~/.zshrc
cp bashrc ~/.bashrc
cp bash_profile ~/.bash_profile

echo "restore done!"
