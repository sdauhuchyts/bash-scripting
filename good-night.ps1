param(
    [Parameter(Mandatory=$true, Position=0)]
    [int]$SleepInSeconds
)

$ErrorActionPreference = 'Stop'

$E_BAD_ARGS = 65

# Validate that the argument is a non-negative integer
try {
    $sleep_in_seconds = [int]$SleepInSeconds
} catch {
    Write-Host "Error: sleep_in_seconds must be a positive integer."
    exit $E_BAD_ARGS
}

if ($sleep_in_seconds -lt 0) {
    Write-Host "Error: sleep_in_seconds must be a positive integer."
    exit $E_BAD_ARGS
}

Clear-Host
Write-Host "Sleeping in $sleep_in_seconds seconds"
Write-Host "Press Ctrl+C to cancel the sleep"

while ($sleep_in_seconds -ne 0) {
    Start-Sleep -Seconds 1
    $sleep_in_seconds--
    $hours_remaining = [math]::Floor($sleep_in_seconds / 3600)
    $minutes_remaining = [math]::Floor($sleep_in_seconds / 60) - $hours_remaining * 60
    $seconds_remaining = $sleep_in_seconds - $hours_remaining * 3600 - $minutes_remaining * 60
    Write-Host "`rSuspending in $hours_remaining hours $minutes_remaining minutes $seconds_remaining seconds" -NoNewline
}

Write-Host "`nSuspending the system"
Start-Sleep -Seconds 5
Suspend-Computer -Force
