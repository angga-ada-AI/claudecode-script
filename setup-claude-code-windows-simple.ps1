# setup-claude-code-windows-simple.ps1
# Script sederhana untuk setup Claude Code di Windows
# Berdasarkan dokumentasi resmi Z.AI: https://docs.z.ai/scenario-example/develop-tools/claude

Write-Host "Claude Code Setup untuk Windows (Cara Sederhana)" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

# Cek apakah Node.js terinstall
Write-Host "Checking Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js tidak ditemukan!" -ForegroundColor Red
    Write-Host "Silakan install Node.js 18+ dari https://nodejs.org" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Setelah install Node.js, jalankan script ini lagi." -ForegroundColor Yellow
    exit 1
}

# Cek apakah Claude Code sudah terinstall
Write-Host ""
Write-Host "Checking Claude Code..." -ForegroundColor Yellow
try {
    $claudeVersion = claude --version 2>$null
    Write-Host "Claude Code version: $claudeVersion" -ForegroundColor Green
} catch {
    Write-Host "Claude Code belum terinstall." -ForegroundColor Yellow
    Write-Host ""
    $install = Read-Host "Install Claude Code sekarang? (y/n)"
    
    if ($install -match '^[Yy]$') {
        Write-Host ""
        Write-Host "Installing Claude Code..." -ForegroundColor Yellow
        npm install -g @anthropic-ai/claude-code
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Claude Code berhasil di-install!" -ForegroundColor Green
        } else {
            Write-Host "ERROR: Gagal install Claude Code!" -ForegroundColor Red
            Write-Host "Coba jalankan PowerShell sebagai Administrator" -ForegroundColor Yellow
            exit 1
        }
    } else {
        Write-Host ""
        Write-Host "Silakan install Claude Code terlebih dahulu:" -ForegroundColor Yellow
        Write-Host "  npm install -g @anthropic-ai/claude-code" -ForegroundColor Gray
        exit 0
    }
}

# Setup Environment Variables
Write-Host ""
Write-Host "Setup Environment Variables" -ForegroundColor Cyan
Write-Host "==========================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Masukkan API key Z.AI Anda:" -ForegroundColor Yellow
$apiKey = Read-Host "API Key"

if ([string]::IsNullOrWhiteSpace($apiKey)) {
    Write-Host "ERROR: API key tidak boleh kosong!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Setting environment variables..." -ForegroundColor Yellow

# Gunakan setx untuk set environment variables secara permanen
try {
    setx ANTHROPIC_AUTH_TOKEN $apiKey
    setx ANTHROPIC_BASE_URL "https://api.z.ai/api/anthropic"
    
    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Green
    Write-Host "Setup berhasil!" -ForegroundColor Green
    Write-Host "===============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Cara menggunakan:" -ForegroundColor Cyan
    Write-Host "1. Tutup terminal ini dan buka terminal baru (penting!)" -ForegroundColor White
    Write-Host "2. Navigasi ke folder project:" -ForegroundColor White
    Write-Host "   cd path\to\your\project" -ForegroundColor Gray
    Write-Host "3. Jalankan Claude Code:" -ForegroundColor White
    Write-Host "   claude" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Catatan: Environment variables baru aktif setelah buka terminal baru!" -ForegroundColor Yellow
    Write-Host ""
} catch {
    Write-Host "ERROR: Gagal set environment variables!" -ForegroundColor Red
    Write-Host "Coba jalankan PowerShell sebagai Administrator" -ForegroundColor Yellow
    exit 1
}

