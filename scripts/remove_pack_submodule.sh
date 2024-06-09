#!/bin/bash

clear

echo "WARNING: Make sure to stay in the root directory of vimrc folder."
echo "WARNING: Before to run this script, remember to previously remove git submodules in \`/.gitmodules/\` and \`/.git/config/\` files."
echo ""

pack_path="$(pwd)/pack"

echo "-- Available module types:
$(ls $pack_path)"
read -p "- Write the type of module (the folder name inside pack/ folder): " mod_type

echo ""
echo "-- Available modules:
$(ls $pack_path/$mod_type/start)"
read -p "- Type the module's name: " mod_name

mod_path="$pack_path/$mod_type/start/$mod_name"
relative_mod_path="pack/$mod_type/start/$mod_name"

echo $mod_path

git add .gitmodules
echo "-> '.gitmodules' has been staged."

# Untrack the git submodule in git project
git rm --cached $mod_path

echo "-> '$mod_path' untracked."

# Remove the git submodule in .git folder
rm -rf .git/modules/$relative_mod_path

# Remove the git submodule folder in the project
rm -rf $mod_path

echo "-> '$mod_name' has been removed! Commit the changes."
