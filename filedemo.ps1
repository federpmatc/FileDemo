$pathd = "~\Downloads\temp"
New-Item -ItemType Directory -Path $pathd 
$fileextensions = "txt", "jpg","pdf","docx", "xlsx","tiff"
1..1 | ForEach-Object{
    $ext = $fileextensions | Get-Random
    $filename =  "file$_.$ext"
    New-Item -ItemType File -Name $filename -Path $pathd -Force
}

$images = ".jpg","png","tiff"
$docs = "docx","txt"


New-Item -Path $pathd -Name "images" -type Directory -Force
New-Item -Path $pathd -Name "docs" -type Directory -Force
New-Item -Path $pathd -Name "misc" -type Directory -Force

write-host "--------------------------------"
    get-childitem -File -path $pathd -name  | ForEach-Object {
        $_
    }

