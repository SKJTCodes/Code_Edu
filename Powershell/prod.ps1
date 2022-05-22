param ($projName, $prodPath)

git clone $Env:LOCALREPO\$projName.git $prodPath

pushd $Env:LOCALREPO\$projName.git
gh repo create $projName --public
git remote add github https://github.com/SKJTCodes/$projName.git
git push github
popd



