#Define the path
$Path = 'C:\inetpub\logs\LogFiles'
#Get the Current Date
$CurrentDate = (Get-Date).AddDays(-7)
#Get the list of log files
$LogFiles = Get-ChildItem -Path $Path -Recurse -Filter "*.log"
#Loop through the list of log files
foreach($LogFile in $LogFiles){
    #Check if the LastWriteTime of the file is older than a week
    if($LogFile.LastWriteTime -lt $CurrentDate)
    {
        #Delete the log file if it is older than a week
        Remove-Item $LogFile.FullName
    }
}