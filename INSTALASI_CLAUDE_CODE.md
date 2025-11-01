# 🚀 Panduan Instalasi Claude Code CLI

## 📋 Prerequisites

1. **Node.js 18 atau lebih baru** terinstall

---

## 🪟 Instalasi untuk Windows

### Step 1: Install Claude Code CLI

Buka PowerShell **sebagai Administrator** (untuk menghindari permission issues), lalu jalankan:

```powershell
npm install -g @anthropic-ai/claude-code
```

**Catatan:** Jika muncul error permission, jalankan PowerShell sebagai Administrator.

### Step 2: Konfigurasi Rencana Pengkodean Claude

#### Manual Configuration

1. **Buat folder konfigurasi Claude Code** (jika belum ada):
   ```powershell
   # Folder konfigurasi ada di:
   $env:USERPROFILE\.claude
   ```

2. **Buat atau edit file** `C:\Users\[USERNAME]\.claude\settings.json`:
   
   Buka PowerShell dan jalankan:
   ```powershell
   # Pastikan folder .claude ada
   if (-not (Test-Path "$env:USERPROFILE\.claude")) {
       New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude"
   }
   
   # Buat/edit file settings.json
   $settings = @{
       env = @{
           ANTHROPIC_AUTH_TOKEN = "YOUR_ZAI_API_KEY_HERE"
           ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
           API_TIMEOUT_MS = "3000000"
       }
   } | ConvertTo-Json -Depth 10
   
   $settings | Out-File -FilePath "$env:USERPROFILE\.claude\settings.json" -Encoding utf8
   ```

3. **Ganti `YOUR_ZAI_API_KEY_HERE`** dengan API key Z.AI Anda yang sebenarnya.

**Atau edit manual dengan notepad:**
```powershell
notepad "$env:USERPROFILE\.claude\settings.json"
```

Masukkan isi berikut (ganti dengan API key Anda):
```json
{
    "env": {
        "ANTHROPIC_AUTH_TOKEN": "sk-ant-xxxxx-your-api-key-here",
        "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic",
        "API_TIMEOUT_MS": "3000000"
    }
}
```

### Step 3: Mulai Menggunakan Claude Code

1. **Navigasi ke folder project** Anda:
   ```powershell
   cd your-project-directory
   ```

2. **Jalankan Claude Code**:
   ```powershell
   claude
   ```

3. **Jika diminta** "Do you want to use this API key," pilih **"Yes"**.

4. **Grant permission** untuk akses file di folder project.

5. **Selesai!** Anda sekarang bisa chat dengan Claude Code di terminal! 🎉

---

## 🍎 Instalasi untuk Mac/Linux

### Step 1: Install Claude Code CLI

```bash
npm install -g @anthropic-ai/claude-code
```

**Catatan:** Jika muncul permission error, gunakan `sudo`:
```bash
sudo npm install -g @anthropic-ai/claude-code
```

### Step 2: Konfigurasi Otomatis (Paling Mudah)

Jalankan script otomatis dari Z.AI:
```bash
curl -O "https://cdn.bigmodel.cn/install/claude_code_zai_env.sh" && bash ./claude_code_zai_env.sh
```

Script ini akan otomatis:
- Membuat folder `~/.claude` jika belum ada
- Membuat/update file `~/.claude/settings.json`
- Meminta input API key Anda

### Step 3: Mulai Menggunakan

```bash
cd your-project-directory
claude
```

---

## ⚙️ Konfigurasi Lanjutan

### Switch Model yang Digunakan

Edit file `~/.claude/settings.json` (Windows: `C:\Users\[USERNAME]\.claude\settings.json`) dan tambahkan mapping model:

```json
{
    "env": {
        "ANTHROPIC_AUTH_TOKEN": "your_api_key",
        "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic",
        "API_TIMEOUT_MS": "3000000",
        "ANTHROPIC_DEFAULT_HAIKU_MODEL": "glm-4.5-air",
        "ANTHROPIC_DEFAULT_SONNET_MODEL": "glm-4.6",
        "ANTHROPIC_DEFAULT_OPUS_MODEL": "glm-4.6"
    }
}
```

**Model yang tersedia:**
- `GLM-4.6` (default untuk Opus dan Sonnet)
- `GLM-4.5-Air` (default untuk Haiku)

### Cek Versi Claude Code

```powershell
claude --version
```

### Update Claude Code

```powershell
claude update
```

**Catatan:** Direkomendasikan menggunakan versi terbaru. Versi 2.0.14+ sudah terverifikasi kompatibel.

---

## 🔍 Troubleshooting

### Error: "claude: command not found"

**Windows:**
- Pastikan npm global bin sudah ada di PATH
- Restart PowerShell setelah install

**Mac/Linux:**
- Cek apakah npm global bin ada di PATH: `echo $PATH`
- Install ulang dengan `sudo` jika perlu

### Konfigurasi Tidak Berfungsi

1. **Tutup semua terminal/Claude Code** dan buka terminal baru
2. **Cek file settings.json** ada di lokasi yang benar
3. **Validasi JSON format** - pastikan tidak ada comma berlebih atau syntax error
4. **Hapus dan buat ulang** `~/.claude/settings.json` jika perlu

### Permission Denied saat Install

**Windows:**
- Jalankan PowerShell sebagai Administrator

**Mac/Linux:**
- Gunakan `sudo npm install -g @anthropic-ai/claude-code`

### Claude Code Tidak Bisa Akses File

- Pastikan Anda menjalankan `claude` di dalam folder project
- Grant permission saat diminta
- Cek permission folder project

---


## 💡 Perbedaan dengan Script Setup Environment Variables

**Script `set-anthropic-env-windows-interactive.ps1`:**
- Untuk environment variables sistem umum
- Digunakan oleh aplikasi Python/JavaScript yang menggunakan Anthropic SDK
- Set di level sistem/user

**Claude Code CLI:**
- CLI tool khusus untuk chat interface di terminal
- Menggunakan konfigurasi khusus di `~/.claude/settings.json`
- Perlu di-install terlebih dahulu via npm

**Kesimpulan:** 
- Jika ingin **chat interface** di terminal → Install **Claude Code CLI**
- Jika ingin **programmatically** menggunakan API → Gunakan **script setup environment variables** + library Python/JS

---

**Selamat menggunakan Claude Code! 🎉**

