param ($projType, $toDir)

$curdate = getdate
Start-Transcript $Env:EDU\Powershell\log\pslog-$curdate.txt

$path = $Env:EDU

# set path for project type
if ($projType -eq "python")
{
    $path = "$path\Python"
}
else
{
    throw "invalid projType"
}

# copy file from fromDir to toDir
copy-item -force -recurse -verbose "$path\framework" -destination $toDir

$projName = (get-item $toDir).name

# create local repository
Push-Location $Env:LOCALREPO
git init --bare "$projName.git"
Pop-Location

# go into new project folder and create a git repo for it
Push-Location $toDir
# Create a git repo
git init
git add .
git commit -m "initial Commit"
git remote add local $Env:LOCALREPO\$projName.git
git push local
Pop-Location

