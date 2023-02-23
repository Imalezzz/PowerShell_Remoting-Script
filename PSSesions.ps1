#Script to connect to remote host via Powershell

#Check if there exist connections


function ConfigurePSSesion(){
    $Computername = Read-Host -Prompt "Input IP address which to connect:"
    New-PSSession -ComputerName $Computername -Credential (Get-Credential) # Creating New PSSesion
    Start-Sleep(1)
    Menu}
    
    #Show PSSesions and connect to them
    
    
    
    
    function EnterSession(){
    $Question1 = Read-Host "Show Opened PSSessions? [y/n]"
    if ($Question1 -eq "y") {
        Get-PSSession}
        else {Write-Host "Moving on...`r`n"}
    
    $Question2 = Read-Host "Do you want to Enter an PSSession? [y/n] "
    if ($Question2 -eq "y"){
        [int]$AskIdOfSession = Read-Host "Which Session you want to connect? [Enter ID] "
        Enter-PSSession $AskIdOfSession} # Connecting to PSSession
    else {Menu}
                }
    
    
    function ChechConnections(){
        $Connections = Get-PSSession | Where-Object {$_.State -eq 'Opened'}
        if ($Connections -eq $null){
            Write-Host "There is no Opened Connections"
            }
    
            else{Write-Host "There is already opened PSSesions!`r`n"
                Get-PSSession}
            }
    
    
    function Menu {
        Clear-Host
        Write-Host "
            +===============================================+
            |  POWERSHELL CONSOLE - USER MENU               | 
            +===============================================+
            |                                               |
            |    1) Show Connections                        |
            |    2) Enter Connections                       |
            |    3) Configure Connection                    |
            |    4) Delete All Sessions                     |
            |    5) Exit                                    |
            +===============================================+
            
            "
        $Menu = Read-Host "Choose Options"
        switch ($Menu) {
            1 {ChechConnections
            Start-Sleep -Seconds 5
            Menu}
            2 {EnterSession}
            3 {ConfigurePSSesion
                Menu}
            4 {Get-PSSession | Remove-PSSession | Write-Host "Done!"
            Menu}
            5 {Write-Host "Goodbye!" | Stop-Process}
            Default {
                Write-Host "You enter Unavailable option"
                Start-Sleep -Seconds 2
                Menu
            }
        }
    
    
    
    } 
    Menu