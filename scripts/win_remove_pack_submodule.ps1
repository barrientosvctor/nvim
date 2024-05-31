cls

Write-Host "WARNING: Make sure to stay in the root directory of vimrc folder."
Write-Host "WARNING: Before to run this script, remember to previously remove the git submodule (plugin) in `/.gitmodules/` and `/.git/config/` files."

[string]$packFolderName = "pack"
[string]$absolutePackPath = "$PWD\$packFolderName"

$(dir "$absolutePackPath")
[string]$packType = Read-Host "Write the type of module (the folder name inside pack/ folder)"

$(dir "$absolutePackPath\$packType\start")
[string]$modName = Read-Host "Type the plugin's name"

$absoluteModPath = "$absolutePackPath\$packType\start\$modName"

# The relative module path only will be used to remove the module inside .git\module\ directory
$relativeModPath = "$packFolderName\$packType\start\$modName"

# This step is important, without this, it will not be possible to remove the plugin directory from git and vim.
git add "$PWD\.gitmodules"
Write-Host "-> '.gitmodules' has been staged from git."

git rm --cached "$absoluteModPath"
Write-Host "-> '$absoluteModPath' untracked from git."

rm -Force -Recurse "$PWD\.git\modules\$relativeModPath"
rm -Force -Recurse "$absoluteModPath"

Write-Host "-> '$modName' has been successfully removed! Commit the changes."
