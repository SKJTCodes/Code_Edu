## Tips for Powershell scripts
Required if you want to run powershell scripts locally:
```powershell
# make sure powerhsll is started in Administrator Mode
set-executionpolicy RemoteSigned

Get-Executionpolicy
# there are 4 levels of security
# - Restricted: No Powershell scripts can be run. This is the default setting.
# - AllSigned: Scripts can be run, but all must have a digital signature. Even if you wrote the script yourself on the local computer.
# - RemoteSigned: Locally-written scripts can be run. But scripts from outside (email, IM, Internet) must be signed by a trusted publisher.
# - Unrestricted: Any script will run. Regardless of who created them or whether they are signed.
```

Helpful to generate Log file for any debugging usage:
```powershell
Start-Transscript -Path "status.txt"
```

Prints values
```powershell
write-host $param
```

Write env variables by:
```powershell
$env:VARIABLENAME = VALUE
```