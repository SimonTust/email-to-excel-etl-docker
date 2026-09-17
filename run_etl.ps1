param([switch]$DryRun)
$ErrorActionPreference = "Stop"
if (-not $env:GMAIL_USER -or -not $env:GMAIL_APP_PASSWORD -or -not $env:FROM_SENDER) {
  throw "Definí GMAIL_USER, GMAIL_APP_PASSWORD y FROM_SENDER como variables de entorno."
}
$args = @("run", "--rm", "-e", "GMAIL_USER", "-e", "GMAIL_APP_PASSWORD", "-e", "FROM_SENDER", "shell-tore-etl")
if ($DryRun) { $env:DRY_RUN = "1"; $args += @("-e", "DRY_RUN") }
docker @args
