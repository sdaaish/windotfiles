# My various aliases

# Set own aliases
Set-Alias -Name src -Value reload-powershell-profile
Set-Alias -Name alias -Value Search-Alias

Set-Alias -Name em -Value emacs-client
Set-Alias -Name emx -Value emacs-client

Set-Alias -Name gs -Value Get-CommandSyntax

# Listing files
Set-Alias -Name lll -Value Find-Links

# Git
Set-alias -Name gts -Value Get-MyGitStatus
Set-Alias -Name gtl -Value Get-MyGitLog
Set-Alias -Name dotgit -Value Invoke-DotGit

# Docker
Set-Alias -Name dk -Value 'docker'
Set-Alias -Name dco -Value 'docker-compose'

# Ubuntu multipass virtual servers
Set-Alias -Name mps -Value multipass

# Defender
Set-Alias -Name mdatp -Value  'C:\Program Files\Windows Defender\MpCmdRun.exe'

# Firefox
Set-Alias -Name ff -Value Start-Firefox

Set-Alias -Name myexplorer -Value Set-MyExplorer

# Ubuntu multipass virtual servers
Set-Alias -Name mps -Value multipass

Set-Alias -Name top -Value Get-TopProcess

# Some functions
function .. {
    cd ..
}
function ... {
    cd ..\..
}
function cdh {
    Set-Location ~
}
function cdm {
    Set-Location ~\Videos
}
function cdr {
    Set-Location ~\repos
}
function cdrw {
    Set-Location ~\Work
}
function cdw {
    Set-Location ~\Downloads
}
function cdv {
    Set-Location ~\Vagrantdir
}
function ls {
    Get-ChildItem $args -Attributes H,!H,A,!A,S,!S
}
function ll {
    [cmdletbinding()]
    Param (
        $Path
    )

    Get-ChildItem $Path -Attributes H,!H,A,!A,S,!S
}

function lla {
    [cmdletbinding()]
    Param (
        $Path
    )
    Get-ChildItem $Path -Attributes H,!H,A,!A,S,!S,C,!C,E,!E
}

function lls {
    [cmdletbinding()]
    Param (
        $Path
    )
    Get-ChildItem $Path -Attributes H,!H,A,!A,S,!S|Sort-Object Length
}

function llt {
    [cmdletbinding()]
    Param (
        $Path
    )
    Get-ChildItem $Path -Attributes H,!H,A,!A,S,!S| Sort-Object lastwritetime
}
# Alias for help-command
function gh([string]$help) {
    $ErrorActionPreference = "Ignore"
    Get-Help -Name $help -Online
}
# Debug emacs
Function emdi {
    emacs.exe --debug-init
}
# Alias for git status
Function Get-MyGitStatus {
    git status -sb
}

# Kill explorer and restart it
function pse {
    Get-Process -Name explorer|Stop-Process -force
    Write-Host "Explorer restarted"
}

# Find links in the filesystem
function Find-Links {
    [cmdletbinding()]
    Param (
        $Path
    )
    Get-ChildItem $Path -ErrorAction SilentlyContinue|
      Where-Object {$_.Linktype}|
      Select-Object FullName, Target,LastWriteTime,LinkType
}
Function Get-CommandSyntax {
    [cmdletbinding()]
    Param (
        $command
    )
    Get-Command $command -Syntax
}
