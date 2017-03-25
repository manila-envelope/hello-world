# Ensure non-terminating errors are stopped
$currentErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = "Stop"

$retryCount = 0
$stopLoop = $false

do {

    try {

        ### Command you want to execute, error action must = stop
        Copy-Item c:\missingFolder c:\missingFolder2
        Write-Host "Connection was successful."
        $stopLoop = $true
        
    } catch {

        if ($retryCount -gt 5) {

        ### End do/while
        throw "Could not connect."
        $stopLoop = $true
            
        } else {
            
            ### Wait 30 seconds, try again
            Write-Host "Could not connect, retrying in 5 seconds."
            Start-Sleep 5
            $retryCount++

        }

    }
        
} while ($stopLoop -eq $false)

# Reset $ErrorActionPreference to prior value
$ErrorActionPreference = $currentErrorActionPreference