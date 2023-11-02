
## Lines of Code (LOC) Generator

## Introduction
The Lines of Code (LOC) Generator is a utility for calculating the number of lines of code in repositories within an organization. 
It helps you gain insights into the codebase's size and complexity, which can be useful for various purposes, including code quality assessment and project management.

## How It Works
The LOC Generator uses a Parcel script that loops through a list of repositories provided in a text file. You can create this text file locally and specify the repositories you're interested in. The script then clones each repository and calculates the lines of code within it.

Please note that the LOC Generator assumes you have some knowledge of working with Parcel scripts and Git repositories.

## Getting Started
1. **Clone this Repository:**
      First, clone this repository to your local machine:
        git clone https://github.com/your-username/lines-of-code-generator.git
        cd lines-of-code-generator

2. **Create a Text File:**

  Create a text file, e.g., repositories.txt, and list the repositories you want to analyze, one per line. 
## Open the PowerShell script (get-loc.ps1) and make the following updates:
    Specify the input text file's name (e.g., repositories.txt) as well as the output text file's name for the results.
    Add your GitHub token and organization name (if available).
    
## Run the LOC Generator:
    To execute the script, use the following command from the project directory: powershell.exe -ExecutionPolicy Bypass -File git-loc.ps1

## Generate LOC Report in CSV:
Once the script finishes running through all the repositories, it will automatically generate a CSV file with the LOC results. You can find this file in the project directory. You can rename this CSV file as needed.

## Make the Script Executable:
To ensure the script is executable, run the following command:
chmod +x get-loc.ps1
chmod +x find-branch.ps1

## Customization
This tool provides a basic framework for calculating lines of code. 
You can customize it to fit your organization's specific requirements, including repository naming conventions, tokens, and organization names.

## Feedback
I hope you find this tool useful. 
If you encounter any issues or have questions, please feel free to leave a comment or submit an issue. 
I'll be happy to help :)

## *Thank you for using the Lines of Code (LOC) Generator!*
