$ErrorActionPreference = "Stop"

$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$CursorDir = Join-Path $HOME ".cursor"

$AgentsDest = Join-Path $CursorDir "agents"
$CommandsDest = Join-Path $CursorDir "commands"
$FactoryDir = Join-Path $CursorDir "ui-ux-factory"
$ScriptsDest = Join-Path $FactoryDir "scripts"

New-Item -ItemType Directory -Force -Path $AgentsDest, $CommandsDest, $FactoryDir | Out-Null

function Install-File {
    param([string]$Source, [string]$Destination)

    if (Test-Path $Destination) {
        Remove-Item $Destination -Force
    }

    try {
        New-Item -ItemType SymbolicLink -Path $Destination -Target $Source -ErrorAction Stop | Out-Null
    } catch {
        Copy-Item -Path $Source -Destination $Destination -Force
    }
}

# Instala os subagentes
Get-ChildItem -Path (Join-Path $RepoDir ".cursor\agents") -Filter "*.md" | ForEach-Object {
    Install-File -Source $_.FullName -Destination (Join-Path $AgentsDest $_.Name)
}

# Instala os commands (/uiux, etc.)
Get-ChildItem -Path (Join-Path $RepoDir "commands") -Filter "*.md" | ForEach-Object {
    Install-File -Source $_.FullName -Destination (Join-Path $CommandsDest $_.Name)
}

# Linka a pasta de scripts via Junction (não exige admin no Windows)
if (Test-Path $ScriptsDest) {
    Remove-Item $ScriptsDest -Recurse -Force
}
New-Item -ItemType Junction -Path $ScriptsDest -Target (Join-Path $RepoDir "scripts") | Out-Null

Write-Host "UI/UX-Factory instalada globalmente em $CursorDir!" -ForegroundColor Green
Write-Host "Reinicie o Cursor (ou recarregue a janela) e digite /uiux no chat de qualquer projeto."