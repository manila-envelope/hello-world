$retryCount = 0
$stopLoop = $false

do {

    try {

        ### Command you want to execute, error action must = stop
        Get-ChildItem c:\missingFolder -ErrorAction Stop
        Write-Host "Connection was successful."
        $stopLoop = $true
        
    } catch {

        if ($retryCount -gt 10) {

        ### End do/while
        throw "Could not connect."
        $stopLoop = $true
            
        } else {
            
            ### Wait 30 seconds, try again
            Write-Host "Could not connect, retrying in 30 seconds."
            Start-Sleep 30
            $retryCount++

        }

    }
        
} while ($stopLoop -eq $false)