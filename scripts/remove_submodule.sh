#!/bin/sh

vimrc_path=$HOME/.config/nvim
echo "WARNING: Before to run this script, remember to previously remove git submodules in '$vimrc_path/.gitmodules' and '$vimrc_path/.git/config' files."
ls $vimrc_path/pack
read -p "Type the folder name of the pack: " pack_type

ls $vimrc_path/pack/$pack_type
read -p "Type the folder name of the pack's run type: " pack_runtype

ls $vimrc_path/pack/$pack_type/$pack_runtype
read -p "Type the folder name of the package: " pack_name

pack_path=pack/$pack_type/$pack_runtype/$pack_name

echo "$vimrc_path/$pack_path"

read -p "Is the package path correct? [y/n]: " confirmation
confirmation=$(echo "$confirmation" | tr 'a-z' 'A-Z')

until [ "$confirmation" = "Y" ] || [ "$confirmation" = "N" ]; do
    read -p "Is the package path correct? [y/n]: " confirmation
    confirmation=$(echo "$confirmation" | tr 'a-z' 'A-Z')
done

if [ "$confirmation" = "N" ]
then
    echo "Operation cancelled."
    exit 0
fi

# Stage the .gitmodules file
git -C $vimrc_path add $vimrc_path/.gitmodules

# Notice the change
echo "'.gitmodules' staged"

# Untrack the git submodule in git project
git -C $vimrc_path rm --cached $vimrc_path/$pack_path

echo "'$vimrc_path/$pack_path' untracked"

# Remove the git submodule in .git folder
rm -rf $vimrc_path/.git/modules/$pack_path

# Remove the git submodule folder in the project
rm -rf $vimrc_path/$pack_path

echo "Done! Commit your changes."
