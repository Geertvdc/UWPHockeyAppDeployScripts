Param(
    [string]$dir 
)


function ZipFiles( $zipfilename, $sourcedir )
{
   Add-Type -Assembly System.IO.Compression.FileSystem
   $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
   [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir,
        $zipfilename, $compressionLevel, $false)
}

$folderName = Get-ChildItem $dir | Select-Object -first 1
ZipFiles "$($foldername.FullName).zip" $dir;
Write-Host "created zip file with name" $folderName.FullName