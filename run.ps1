param (
    [string]$script,
    [switch]$help = $false
)

if ($help) {
    Write-Output "Options:"
    Write-Output "-script: A script listed inside Pipfile"
    Write-Output "-help: display this help"
    Exit
}

if (-not $script) {
    Write-Output "No script provided. Use -help for more info"
    Exit 1
}

# Add the root of the project to the python path
$Env:PYTHONPATH += "$([IO.Path]::PathSeparator)${PSScriptRoot}"

pipenv run $script
