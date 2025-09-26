$pathd = "~\Downloads\temp"
New-Item -ItemType Directory -Path $pathd -Force
$fileextensions = "txt", "jpg","pdf","docx", "xlsx","tiff"
1..10 | ForEach-Object{
    $ext = $fileextensions | Get-Random
    $filename =  "file$_.$ext"
    New-Item -ItemType File -Name $filename -Path $pathd -Force
}

$images = ".jpg",".png",".tiff"
$docs = ".txt",".pdf"
$office = ".docx",".xlsx"


New-Item -Path $pathd -Name "images" -type Directory -Force
New-Item -Path $pathd -Name "docs" -type Directory -Force
New-Item -Path $pathd -Name "office" -type Directory -Force
New-Item -Path $pathd -Name "misc" -type Directory -Force

write-host "--------------------------------"
    
get-childitem -File -path $pathd -name  | ForEach-Object {
    foreach ($fileType in $images)  {
        if ($_.contains($fileType)) {
            Move-Item -path "$pathd\$_" -Destination "$pathd\images" -Force
        }
    }
    foreach ($fileType in $docs)  {
        if ($_.contains($fileType)) {
            Move-Item -path "$pathd\$_" -Destination "$pathd\docs" -Force
        }           
    }
    foreach ($fileType in $office)  {
        if ($_.contains($fileType)) {
            Move-Item -path "$pathd\$_" -Destination "$pathd\office" -Force
        }           
    }
}


