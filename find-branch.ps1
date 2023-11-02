param (
   [string]$branchName = '', # choose the branch name 
   [string]$repoNames = '' # choose the text file where you have the list of repos 
)
 
# determine whether the specified path is a folder or file
if (Test-Path -Path $repoNames -PathType Container) {
   # If it's a folder, get all files within the folder
   $repoList = Get-ChildItem -Path $repoNames -File | ForEach-Object { $_.Name }
} else {
   # if it's not a folder, treat it as a single file
   $repoList = Get-Content -Path $repoNames
}
 
 
$orgName = '' # specify the name of your org here
$pat = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($env:GITHUB_TOKEN)")) # get the respective github token and convert to ascii value
 
# for looping through every repos in the given repoList(the text file)
foreach ($repoName in $repoList) {
   $params = @{
       'Uri'        = "https://api.github.com/repos/$orgName/$repoName/branches/$branchName"
       'Headers'    = @{ 'Authorization' = 'Basic ' + $pat }
       'Method'     = 'Get'
       'ContentType' = 'application/json'
   }
 
   $StatusCode = $null  # initialize the status code variable

  # using try and catch to display message for the respective status code after finding it
 
   try {
       $res = Invoke-RestMethod @params
       $StatusCode = $res.StatusCode
 
       if ($StatusCode -eq 200) {
           Write-Host "Repository: $repoName"
           Write-Host "Branch: $branchName"
           Write-Host "HTML URL: $($res._links.html)"
           Write-Host "===================="
       } else {
           Write-Host "Error fetching branch information for repository: $repoName"
           Write-Host "Status Code: $StatusCode"
       }
   } catch {
       Write-Host "Exception: $_"
       Write-Host "Error fetching branch information for repository: $repoName"
   }
}
