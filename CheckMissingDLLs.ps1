$SolutionDir = $PSScriptRoot
$TargetDir = Join-Path $PSScriptRoot "bin\Debug"

if (-not (Test-Path $TargetDir))
{
	New-Item $TargetDir -ItemType Directory -Force
}

if (-not (Test-Path "$($TargetDir)\System.IO.dll" -PathType Leaf)) {
	Copy-Item "$($SolutionDir)\packages\System.IO.4.3.*\lib\net462\System.IO.dll" "$($TargetDir)\System.IO.dll"
}

if (-not (Test-Path "$($TargetDir)\System.Net.Http.dll" -PathType Leaf)) {
	Copy-Item "$($SolutionDir)\packages\System.Net.Http.4.3.4\lib\net46\System.Net.Http.dll" "$($TargetDir)\System.Net.Http.dll"
}

if (-not (Test-Path "$($TargetDir)\System.Runtime.dll" -PathType Leaf)) {
	Copy-Item "$($SolutionDir)\packages\System.Runtime.4.3.*\lib\net462\System.Runtime.dll" "$($TargetDir)\System.Runtime.dll"
}

if ((-not (Test-Path "$($TargetDir)\System.Security*.dll" -PathType Leaf)) -or ((Get-ChildItem "$($TargetDir)\System.Security*.dll").Count -lt 4)) {
	Copy-Item "$($SolutionDir)\packages\System.Security.Cryptography.Algorithms.4.3.*\lib\net463\System.Security.Cryptography.Algorithms.dll" "$($TargetDir)\System.Security.Cryptography.Algorithms.dll"
	Copy-Item "$($SolutionDir)\packages\System.Security.Cryptography.Encoding.4.3.*\lib\net46\System.Security.Cryptography.Encoding.dll" "$($TargetDir)\System.Security.Cryptography.Encoding.dll"
	Copy-Item "$($SolutionDir)\packages\System.Security.Cryptography.Primitives.4.3.*\lib\net46\System.Security.Cryptography.Primitives.dll" "$($TargetDir)\System.Security.Cryptography.Primitives.dll"
	Copy-Item "$($SolutionDir)\packages\System.Security.Cryptography.X509Certificates.4.3.*\lib\net461\System.Security.Cryptography.X509Certificates.dll" "$($TargetDir)\System.Security.Cryptography.X509Certificates.dll"
}

