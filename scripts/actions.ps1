Param(
	[Parameter(Mandatory, HelpMessage={
		'Type a number:'
		'1) Install modules'
		'2) Update modules'
		'3) Uninstall modules'
		}
	)]
	[int]$Action
)

If (($Action -lt 1) -or ($Action -gt 3)) {
    Write-Host "Invalid option." -ForegroundColor Red
} ElseIf ($Action -eq 1) {
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/d863d0783236e1a46291f7791347740891186154/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

    Write-Host "Vim Plug has been successfully installed!" -ForegroundColor Green
    nvim --headless +PlugInstall +qa
    Write-Host "Plugins has been successfully installed!" -ForegroundColor Green
} ElseIf ($Action -eq 2) {
    git submodule update --remote
    Write-Host "Modules has been successfully updated to the latest release!" -ForegroundColor Green
} ElseIf ($Action -eq 3) {
    git submodule deinit --all
    Write-Host "Modules has been uninstalled." -ForegroundColor Green
}
