# Caminhos
$zipUrl = "https://github.com/Herna4ndes/Gansodocaos/raw/main/DesktopGoose%20v0.31.zip"
$zipPath = "$env:APPDATA\goose.zip"
$extractPath = "$env:APPDATA\Goose"
$exePath = "$extractPath\DesktopGoose v0.31\GooseDesktop.exe"

# 🧹 Limpa a pasta Goose antiga, se existir
if (Test-Path $extractPath) {
    Remove-Item $extractPath -Recurse -Force
    Write-Host "Pasta antiga '$extractPath' removida."
}

# Baixa o arquivo zip
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Cria a nova pasta de extração
New-Item -ItemType Directory -Force -Path $extractPath

# Extrai o conteúdo do ZIP para a pasta
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

# Executa o Goose
Start-Process $exePath
