# setup-claude-code-windows.ps1
# Script untuk setup konfigurasi Claude Code di Windows
# Berdasarkan dokumentasi resmi Z.AI: https://docs.z.ai/scenario-example/develop-tools/claude

Write-Host "Claude Code Configuration Setup untuk Windows" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

# Cek apakah Node.js terinstall
Write-Host "Checking prerequisites..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js tidak ditemukan!" -ForegroundColor Red
    Write-Host "Silakan install Node.js 18+ dari https://nodejs.org" -ForegroundColor Yellow
    exit 1
}

# Cek apakah Claude Code sudah terinstall
Write-Host ""
Write-Host "Checking Claude Code installation..." -ForegroundColor Yellow
try {
    $claudeVersion = claude --version 2>$null
    Write-Host "Claude Code version: $claudeVersion" -ForegroundColor Green
} catch {
    Write-Host "WARNING: Claude Code belum terinstall!" -ForegroundColor Yellow
    Write-Host ""
    $install = Read-Host "Apakah Anda ingin install Claude Code sekarang? (y/n)"
    
    if ($install -match '^[Yy]$') {
        Write-Host ""
        Write-Host "Installing Claude Code..." -ForegroundColor Yellow
        try {
            npm install -g @anthropic-ai/claude-code
            Write-Host "Claude Code berhasil di-install!" -ForegroundColor Green
        } catch {
            Write-Host "ERROR: Gagal install Claude Code!" -ForegroundColor Red
            Write-Host "Coba jalankan PowerShell sebagai Administrator" -ForegroundColor Yellow
            Write-Host "Atau install manual: npm install -g @anthropic-ai/claude-code" -ForegroundColor Yellow
            exit 1
        }
    } else {
        Write-Host "Silakan install Claude Code terlebih dahulu:" -ForegroundColor Yellow
        Write-Host "  npm install -g @anthropic-ai/claude-code" -ForegroundColor Gray
        exit 0
    }
}

# Buat folder .claude jika belum ada
$claudeDir = "$env:USERPROFILE\.claude"
if (-not (Test-Path $claudeDir)) {
    Write-Host ""
    Write-Host "Creating .claude directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $claudeDir | Out-Null
    Write-Host "Directory created: $claudeDir" -ForegroundColor Green
}

# Prompt untuk API key
Write-Host ""
Write-Host "Configuration Setup" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan
$apiKey = Read-Host "Masukkan API key Z.AI Anda"

if ([string]::IsNullOrWhiteSpace($apiKey)) {
    Write-Host "ERROR: API key tidak boleh kosong!" -ForegroundColor Red
    exit 1
}

# Buat konfigurasi
$settingsPath = "$claudeDir\settings.json"
$settings = @{
    env = @{
        ANTHROPIC_AUTH_TOKEN = $apiKey
        ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
        API_TIMEOUT_MS = "3000000"
    }
}

# Convert ke JSON dan simpan
$json = $settings | ConvertTo-Json -Depth 10

# Jika file sudah ada, backup dulu
if (Test-Path $settingsPath) {
    $backupPath = "$settingsPath.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Copy-Item $settingsPath $backupPath
    Write-Host ""
    Write-Host "Backup dibuat: $backupPath" -ForegroundColor Yellow
}

# Simpan file
$json | Out-File -FilePath $settingsPath -Encoding utf8 -NoNewline
Write-Host ""
Write-Host "Configuration saved to: $settingsPath" -ForegroundColor Green

# Verifikasi file
Write-Host ""
Write-Host "Verifying configuration..." -ForegroundColor Yellow
try {
    $verify = Get-Content $settingsPath | ConvertFrom-Json
    if ($verify.env.ANTHROPIC_AUTH_TOKEN -eq $apiKey) {
        Write-Host "Configuration verified successfully!" -ForegroundColor Green
    } else {
        Write-Host "WARNING: Configuration mungkin tidak sesuai" -ForegroundColor Yellow
    }
} catch {
    Write-Host "WARNING: Tidak bisa verifikasi konfigurasi. Silakan cek file manual." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "Setup selesai!" -ForegroundColor Green
Write-Host ""
Write-Host "Cara menggunakan:" -ForegroundColor Cyan
Write-Host "  1. Buka terminal baru atau PowerShell baru" -ForegroundColor White
Write-Host "  2. Navigasi ke folder project:" -ForegroundColor White
Write-Host "     cd path\to\your\project" -ForegroundColor Gray
Write-Host "  3. Jalankan Claude Code:" -ForegroundColor White
Write-Host "     claude" -ForegroundColor Gray
Write-Host ""
Write-Host "Jika diminta 'Do you want to use this API key?', pilih Yes" -ForegroundColor Yellow
Write-Host ""
Write-Host "Untuk cek status model yang digunakan:" -ForegroundColor Cyan
Write-Host "  claude" -ForegroundColor Gray
Write-Host "  /status" -ForegroundColor Gray
Write-Host ""

