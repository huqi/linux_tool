#! /bin/sh

dest_dir=configuration

cp ~/.zshrc ./$dest_dir/zshrc
cp ~/.bashrc ./$dest_dir/bashrc
cp ~/.bash_profile ./$dest_dir/bash_profile

echo "Backup done!"
