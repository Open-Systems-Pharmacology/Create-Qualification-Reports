set shell := ["pwsh.exe", "-NoProfile", "-Command"]

repo := "SRuedesh/Create-Qualification-Reports"
workflow := "create-evaluation_reports.yml"
default_message := "Regenerate evaluation reports"

_gh:
    $gh = Join-Path $env:USERPROFILE 'scoop/apps/gh/current/bin/gh.exe'; \
    if (-not (Test-Path -LiteralPath $gh)) { $gh = (Get-Command gh.exe).Source }; \
    Write-Output $gh

list:
    Import-Csv models.csv | Where-Object { $_.Execute -eq 'TRUE' } | Format-Table -AutoSize

run message=default_message:
    $gh = Join-Path $env:USERPROFILE 'scoop/apps/gh/current/bin/gh.exe'; \
    if (-not (Test-Path -LiteralPath $gh)) { $gh = (Get-Command gh.exe).Source }; \
    $branch = git branch --show-current; \
    & $gh workflow run {{workflow}} --repo {{repo}} --ref $branch -f "commit-message={{message}}"

status:
    $gh = Join-Path $env:USERPROFILE 'scoop/apps/gh/current/bin/gh.exe'; \
    if (-not (Test-Path -LiteralPath $gh)) { $gh = (Get-Command gh.exe).Source }; \
    $branch = git branch --show-current; \
    & $gh run list --repo {{repo}} --workflow {{workflow}} --branch $branch --limit 10
