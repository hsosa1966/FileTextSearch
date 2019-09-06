$FileArrayA = Get-Content -Path C:\Scripts\LicenseKeys.csv
$FileArrayB = Get-Content -Path C:\Scripts\LicenseKeys_Details_Avaya.csv
$FileHeader = Get-Content -Path C:\Scripts\LicenseKeys_Details_Avaya.csv | Select -Index 0
$FileHeader | Set-Content "simile.csv"
$FileOutput | Set-Content "output.csv"
ForEach ($LineA in $FileArrayA)
{
ForEach ($LineB in $FileArrayB | Where-Object {$_ -match $LineA})
{
Write-Host $LineB
$LineB | Add-Content "simile.csv"
}
Write-Host $LineA
$LineA | Add-Content "output.csv"
} 
