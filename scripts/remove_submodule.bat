@ECHO off
SET vimrc_path=%LOCALAPPDATA%\nvim
ECHO WARNING!
ECHO Before continue, make sure you already removed the plugin spec in "%vimrc_path%\.gitmodules" and "%vimrc_path%\.git\config".
ECHO If you did it, then you can continue. Otherwise, press Ctrl + C.
PAUSE
DIR %vimrc_path%\pack
SET /P pack_type=Type the folder name of the pack:
DIR %vimrc_path%\pack\%pack_type%
SET /P pack_runtype=Type the folder name of the "%pack_type%" pack:
DIR %vimrc_path%\pack\%pack_type%\%pack_runtype%
SET /P pack_name=Type the folder name of the package:
SET target_package_dir=pack\%pack_type%\%pack_runtype%\%pack_name%
ECHO Package path: %vimrc_path%\%target_package_dir%
ECHO If the path is correct, continue. Otherwise, press Ctrl + C.
PAUSE

git -C %vimrc_path% add %vimrc_path%\.gitmodules
ECHO git: "%vimrc_path%\.gitmodules" staged.
git -C %vimrc_path% rm --cached %vimrc_path%\%target_package_dir%
ECHO git: removed cached "%vimrc_path%\%target_package_dir%"
RMDIR /S /Q %vimrc_path%\.git\modules\%target_package_dir%
ECHO Removed directory: %vimrc_path%\.git\modules\%target_package_dir%
RMDIR /S /Q %vimrc_path%\%target_package_dir%
ECHO Removed directory: %vimrc_path%\%target_package_dir%
ECHO Done. Commit your changes.
