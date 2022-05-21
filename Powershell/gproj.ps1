param ($projType, $toDir)

$curdate = getdate
Start-Transcript $Env:EDU\pslog-$curdate.txt

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

# go into new project folder and create a git repo for it
pushd $toDir

# Create a git repo
git init
git add .
git commit -m "initial Commit"

# return back to original folder
popd