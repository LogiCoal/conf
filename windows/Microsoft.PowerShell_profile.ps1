# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

function Get-GitSStatus { & git status }
New-Alias -Name gs -Value Get-GitSStatus -Force -Option AllScope
function Get-GitGraph { & git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim white)%aD%C(reset) %C(dim white)(%ar) %C(dim white)- %an%C(reset) %C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset)' --all }
New-Alias -Name gg -Value  Get-GitGraph -Force -Option AllScope
function Get-GitGraphC { & git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim white)%aD%C(reset) %C(dim white)(%ar) %C(dim white)- %an%C(reset) %C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset)' --all -c }
New-Alias -Name ggc -Value  Get-GitGraphC -Force -Option AllScope
function Get-GitGraphS { & git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim white)%aD%C(reset) %C(dim white)(%ar) %C(dim white)- %an%C(reset) %C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset)' --all --stat }
New-Alias -Name ggs -Value  Get-GitGraphS -Force -Option AllScope

function Run-gitCheck { & git checkout }
New-Alias -Name gitck -Value  Run-gitCheck -Force -Option AllScope
function Run-gitBranch { & git branch }
New-Alias -Name gitbr -Value  Run-gitBranch -Force -Option AllScope

function Start-HibernationS
{
  rundll32.exe PowrProf.dll, SetSuspendState 0,1,0
}

New-Alias -Name ph -Value  Start-HibernationS -Force -Option AllScope