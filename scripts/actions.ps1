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
    git submodule init
    git submodule update
    Write-Host "Modules has been successfully installed!" -ForegroundColor Green
    New-Item -ItemType Directory -Path colors
    Invoke-WebRequest "https://raw.githubusercontent.com/ayu-theme/ayu-vim/master/colors/ayu.vim" -OutFile ".\colors\ayu.vim"
    Invoke-WebRequest "https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim" -OutFile ".\colors\gruvbox.vim"
    Invoke-WebRequest "https://raw.githubusercontent.com/nordtheme/vim/main/colors/nord.vim" -OutFile ".\colors\nord.vim"
    Write-Host "Colors installed!"
} ElseIf ($Action -eq 2) {
    git submodule update --remote
    Write-Host "Modules has been successfully updated to the latest release!" -ForegroundColor Green
} ElseIf ($Action -eq 3) {
    git submodule deinit --all
    Write-Host "Modules has been uninstalled." -ForegroundColor Green
}
