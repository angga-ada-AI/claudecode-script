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

### Step 2: Konfigurasi Environment Variables

#### Cara Sederhana (Manual Configuration) ⭐

**Windows CMD atau PowerShell:**

Ganti `your_api_key` dengan API key Anda yang sebenarnya (tanpa tanda kutip), lalu jalankan 2 command berikut:

```cmd
setx ANTHROPIC_AUTH_TOKEN your_api_key
setx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
```

**Contoh:**
```cmd
setx ANTHROPIC_AUTH_TOKEN sk-ant-xxxxx-your-actual-api-key-here
setx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
```

**Catatan Penting:**
- `setx` akan set environment variables secara **permanen** di sistem Windows
- Setelah menjalankan `setx`, Anda **harus tutup terminal dan buka terminal baru** agar environment variables aktif
- Ganti `your_zai_api_key` dengan API key Anda yang sebenarnya (tanpa tanda kutip)
- Command `setx` tidak akan menampilkan output - itu normal, asalkan tidak ada error

#### Atau Gunakan Script Otomatis (Opsional)

Jika ingin cara yang lebih interaktif, gunakan script:

```powershell
.\setup-claude-code-windows-simple.ps1
```

**Catatan:** 
- Di PowerShell, gunakan `.\` di depan nama script untuk menjalankan script lokal
- Script akan:
  - Cek apakah Node.js dan Claude Code sudah terinstall
  - Install otomatis jika belum ada
  - Meminta input API key Anda
  - Menjalankan `setx` secara otomatis

### Step 3: Mulai Menggunakan Claude Code

1. **Tutup terminal saat ini dan buka terminal baru** (penting! agar environment variables aktif)

2. **Navigasi ke folder project** Anda:
   ```powershell
   cd your-project-directory
   ```

3. **Jalankan Claude Code**:
   ```powershell
   claude
   ```

4. **Jika diminta** "Do you want to use this API key," pilih **"Yes"**.

5. **Grant permission** untuk akses file di folder project saat diminta.

6. **Selesai!** Anda sekarang bisa chat dengan Claude Code di terminal! 🎉

**Tips:** Gunakan command `/status` di dalam Claude Code untuk mengecek apakah konfigurasi sudah benar.

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

Jalankan script otomatis:
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

### Script Tidak Bisa Dijalankan (Execution Policy Error)

**Error:** 
```
File cannot be loaded. The file is not digitally signed. 
You cannot run this script on the current system.
```

**Penyebab:**
- **Bukan masalah folder location** - Script bisa di folder manapun
- **Bukan masalah administrator** - Tapi administrator diperlukan untuk mengubah execution policy
- **Masalah:** PowerShell execution policy memblokir script yang tidak ditandatangani

**Solusi 1: Set Execution Policy (Direkomendasikan)**

1. **Buka PowerShell sebagai Administrator:**
   - Klik kanan PowerShell → "Run as Administrator"

2. **Jalankan command:**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Konfirmasi dengan "Y"** jika diminta

4. **Tutup PowerShell Administrator**, buka PowerShell biasa

5. **Jalankan script lagi:**
   ```powershell
   .\setup-claude-code-windows-simple.ps1
   ```

**Penjelasan:**
- `RemoteSigned` = Izinkan script lokal yang tidak ditandatangani, tapi script dari internet harus ditandatangani
- `CurrentUser` = Hanya berlaku untuk user saat ini (aman, tidak mempengaruhi user lain di komputer yang sama)

**Solusi 2: Bypass untuk Session Saat Ini**

Jika tidak ingin mengubah execution policy permanen:

```powershell
powershell -ExecutionPolicy Bypass -File .\setup-claude-code-windows-simple.ps1
```

**Solusi 3: Gunakan Cara Manual (Paling Aman)**

Jika tidak ingin mengubah execution policy, gunakan cara manual tanpa script:

```cmd
setx ANTHROPIC_AUTH_TOKEN your_api_key
setx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
```

**Catatan Penting:**
- ✅ **Folder location tidak masalah** - Script bisa di `C:\`, `D:\`, atau folder manapun
- ⚠️ **Administrator diperlukan** untuk mengubah execution policy (Solusi 1)
- ✅ **Cara manual (`setx`)** tidak memerlukan execution policy atau administrator

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

