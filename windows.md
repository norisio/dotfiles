
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

scoop bucket add main
scoop install neovim
scoop bucket add extras
scoop install goneovim
scoop install ripgrep

$wd = $(pwd)
$nvim_config_dir = "$env:LOCALAPPDATA\nvim"
New-Item "$nvim_config_dir" -ItemType Directory -Force
New-Item -Value "$wd\init.lua" -Path "$nvim_config_dir" -Name "init.lua" -ItemType SymbolicLink
New-Item -Value "$wd\lua" -Path "$nvim_config_dir" -Name "lua" -ItemType SymbolicLink

$goneovim_config_dir = "$env:USERPROFILE\.goneovim"
New-Item "$goneovim_config_dir" -ItemType Directory -Force
New-Item -Value "$wd\goneovim_settings.toml" -Path "$goneovim_config_dir" -Name "settings.toml" -ItemType SymbolicLink
```
