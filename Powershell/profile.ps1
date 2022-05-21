# Generate Coding Projects baseline folders
function gproj
{
    param ($projType, $toDir)
    . "D:\Code Edu\Powershell\generateProject.ps1" $projType $toDir
}

# Check folder size
function getsize
{
    param ($getSizeDir)
    Get-ChildItem -force $getSizeDir -ErrorAction SilentlyContinue | Where-Object { $_ -is [io.directoryinfo] } | ForEach-Object {
        $len = 0
        Get-ChildItem -recurse -force $_.fullname -ErrorAction SilentlyContinue | ForEach-Object { $len += $_.length }
        $_.fullname, '{0:N2} GB' -f ($len / 1Gb)
    }
}