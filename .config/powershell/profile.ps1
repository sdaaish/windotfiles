# Local version of Powershell profile

Import-Module $PSScriptRoot\MyFunctions.psm1

# Use a local path for modules
$env:PSModulePath = Set-LocalModulePath

# Settings for PSReadLine
$PSReadLineOptions = @{
    EditMode = "Emacs"
    BellStyle = "None"
    PredictionSource = "History"
}
Set-PSReadlineOption @PSReadLineOptions

# Add output of all commands to $__, set as default value
$PSDefaultParameterValues["Out-Default:OutVariable"] = "__"

# Oh-my-PoSH https://ohmyposh.dev/docs
$Theme = Join-Path ${env:USERPROFILE} ".config\oh-my-posh\my-posh-theme.omp.json"
oh-my-posh.exe --init --shell pwsh --config $Theme | Invoke-Expression
Enable-PoshTransientPrompt

$ColorTheme = Join-Path ${env:UserProfile} ".config\ColorThemes\MyColorTheme.psd1"
Add-TerminalIconsColorTheme -Path $ColorTheme -Force
Set-TerminalIconsTheme -ColorTheme MyColorTheme
