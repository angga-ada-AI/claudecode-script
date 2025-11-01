# set-anthropic-env-windows-interactive.ps1
# Script interaktif untuk Windows: Mengatur Anthropic API environment variables
# Versi dengan prompt untuk input API key

Write-Host "Anthropic API Environment Variables Setup untuk Windows" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

# Prompt untuk API key
$apiKey = Read-Host "Masukkan API key Z.AI Anda"

if ([string]::IsNullOrWhiteSpace($apiKey)) {
    Write-Host "Error: API key tidak boleh kosong!" -ForegroundColor Red
    exit 1
}

# Set environment variables untuk session saat ini
$env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
$env:ANTHROPIC_AUTH_TOKEN = $apiKey

Write-Host ""
Write-Host "Environment variables sudah di-set untuk session PowerShell saat ini!" -ForegroundColor Green
Write-Host "   ANTHROPIC_BASE_URL = $env:ANTHROPIC_BASE_URL"
Write-Host "   ANTHROPIC_AUTH_TOKEN = [HIDDEN FOR SECURITY]"
Write-Host ""

# Tanya apakah ingin set permanen
$savePermanent = Read-Host "Apakah Anda ingin menyimpan ini secara permanen? (y/n)"

if ($savePermanent -match '^[Yy]$') {
    Write-Host ""
    Write-Host "Menambahkan ke Environment Variables sistem Windows..." -ForegroundColor Yellow
    
    try {
        # Set environment variable untuk user (permanen)
        [System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", "https://api.z.ai/api/anthropic", [System.EnvironmentVariableTarget]::User)
        [System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", $apiKey, [System.EnvironmentVariableTarget]::User)
        
        Write-Host "Berhasil disimpan secara permanen!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Environment variables akan tersedia di semua terminal PowerShell baru." -ForegroundColor Cyan
        Write-Host "   Jika ingin langsung digunakan di terminal ini, jalankan:" -ForegroundColor Cyan
        Write-Host '   $env:ANTHROPIC_BASE_URL = [System.Environment]::GetEnvironmentVariable("ANTHROPIC_BASE_URL", "User")' -ForegroundColor Gray
        Write-Host '   $env:ANTHROPIC_AUTH_TOKEN = [System.Environment]::GetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", "User")' -ForegroundColor Gray
    }
    catch {
        Write-Host "Error saat menyimpan: $_" -ForegroundColor Red
        Write-Host ""
        Write-Host "Alternatif: Gunakan cara manual:" -ForegroundColor Yellow
        Write-Host "   1. Tekan Win + R, ketik 'sysdm.cpl', tekan Enter" -ForegroundColor Gray
        Write-Host "   2. Klik tab Advanced -> Environment Variables" -ForegroundColor Gray
        Write-Host "   3. Tambahkan variable di User variables" -ForegroundColor Gray
    }
}
else {
    Write-Host ""
    Write-Host "Environment variables hanya berlaku untuk terminal PowerShell saat ini." -ForegroundColor Yellow
    Write-Host "   Untuk set permanen, jalankan script ini lagi dan pilih 'y'." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Setup selesai!" -ForegroundColor Green
