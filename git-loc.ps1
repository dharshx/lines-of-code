
$fileExtensions = @('.py', '.js', '.ts', '.cs') # specify the file extenstions you desire to find the LOC for
$orgName = '' # enter your org name
$initialDir = Get-Location # store the initial directory path
$repos = Get-Content -Path "" # read the list of repos from the text file, mention the txt file within the ""
 
$csvPath = 'loc.csv' # give the path/name of the csv file
"Repo,File,LinesOfCode" | Out-File $csvPath # choose your desired data you want to upload to your csv file
 

foreach ($repo in $repos) { # iterate through each repo
  
   git clone https://github.com/$orgName/$repo.git  # clone the repo
   $repoDir = Join-Path $initialDir $repo
   $repoLinesOfCode = 0
   # iterate over each file type and count lines
   foreach ($extension in $fileExtensions) {
       $files = Get-ChildItem -Path $repoDir -Recurse -Filter $extension # recursing through the files in the given path and filtering it by using the specified extension
       foreach ($file in $files) {
           $fileContent = (Get-Content $file.FullName | Where-Object {-not [System.String]::IsNullOrWhiteSpace($_)}) # checking for null opr white spaces and ignoring it
           $lines = $fileContent.Length # finding the length of filecontent and assigning it to 'lines'
           $repoLinesOfCode += $lines # 'repoLinesOfCode' is sum of all the values in 'lines'
           Write-Host "$repo  $($file) : $lines"
 
           "$repo,$($file),$lines" | Add-Content $csvPath
       }
   }
   # display the results for the repo
   Write-Host "Repo: $repo"
   if ($repoLinesOfCode -eq 0) {
       Write-Host "This repo doesn't have files with the extensions $($fileExtensions -join ', ') so the total lines of code would be 0" # command to display if the given file/repo doesn't actually have any with the extensions specified
   } else {
       Write-Host "Total lines of code: $repoLinesOfCode"
   
   }
   # remove the cloned repo if needed
   Remove-Item -Path $repoDir -Recurse -Force
}
# command to run in terminal: powershell.exe -ExecutionPolicy Bypass -File git-loc.ps1
