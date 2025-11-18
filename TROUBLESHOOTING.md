# 🔍 Troubleshooting - Solusi Masalah Claude Code

Panduan lengkap untuk mengatasi berbagai error yang mungkin terjadi saat install dan menggunakan Claude Code CLI.

## 📑 Daftar Isi

- [Error Instalasi](#-error-instalasi)
  - [npm is not recognized](#error-npm-is-not-recognized)
  - [npm.ps1 cannot be loaded](#error-npmps1-cannot-be-loaded-execution-policy)
  - [Error Network/Connection (ENOTFOUND)](#error-networkconnection-enotfound)
  - [Permission Denied saat Install](#permission-denied-saat-install)
- [Error Konfigurasi](#-error-konfigurasi)
  - [Konfigurasi tidak bekerja](#konfigurasi-tidak-bekerja)
  - [Script Tidak Bisa Dijalankan](#script-tidak-bisa-dijalankan-execution-policy-error)
  - [Claude Code Dialihkan ke Anthropic Console](#claude-code-dialihkan-ke-anthropic-console-login)
- [Error Runtime](#-error-runtime)
  - [Claude Code requires git-bash](#error-claude-code-on-windows-requires-git-bash)
  - [Claude Code tidak bisa akses file](#claude-code-tidak-bisa-akses-file)
  - [claude: command not found](#error-claude-command-not-found)
  - [Error Rate Limit Exceeded](#error-rate-limit-exceeded)

---

## 🚫 Error Instalasi

### Error "npm is not recognized"

**Error:**
```
npm : The term 'npm' is not recognized as the name of a cmdlet, function, script file, or operable program.
```

**Penyebab:**
Node.js belum terinstall atau npm tidak ada di PATH sistem.

**Solusi:**

1. **Install Node.js:**
   - Download Node.js dari: https://nodejs.org
   - Pilih versi **LTS (Long Term Support)** - direkomendasikan
   - Install dengan default settings
   - **Penting:** Pastikan pilih opsi **"Add to PATH"** saat install

2. **Setelah install, restart terminal:**
   - Tutup semua terminal/PowerShell yang terbuka
   - Buka terminal/PowerShell baru

3. **Verifikasi instalasi:**
   ```powershell
   node --version
   npm --version
   ```
   
   Jika muncul versi (contoh: `v20.10.0` dan `10.2.3`), berarti Node.js sudah terinstall dengan benar.

4. **Install Claude Code CLI:**
   ```powershell
   npm install -g @anthropic-ai/claude-code
   ```

**Catatan Penting:**
- ✅ Node.js versi **18 atau lebih baru** diperlukan
- ✅ Jika sudah install tapi masih error, kemungkinan Node.js tidak ada di PATH
- ✅ **Restart terminal** setelah install Node.js (penting!)
- ✅ Jika masih error setelah restart, cek PATH environment variable

**Cek PATH (Jika Masih Error):**

1. Buka System Properties → Environment Variables
2. Cek apakah ada `C:\Program Files\nodejs\` di PATH
3. Jika tidak ada, tambahkan manual

---

### Error "npm.ps1 cannot be loaded" (Execution Policy)

**Error:**
```
npm.ps1 cannot be loaded because running scripts is disabled on this system.
For more Information, see about_Execution_Policies
```

**Penyebab:**
PowerShell execution policy memblokir npm script, meskipun Node.js sudah terinstall dengan benar.

**Solusi 1: Set Execution Policy (Direkomendasikan)**

1. **Buka PowerShell sebagai Administrator:**
   - Klik kanan PowerShell → "Run as Administrator"

2. **Set Execution Policy:**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Konfirmasi dengan "Y"** jika diminta

4. **Tutup PowerShell Administrator**, buka PowerShell biasa

5. **Install Claude Code CLI:**
   ```powershell
   npm install -g @anthropic-ai/claude-code
   ```

**Solusi 2: Gunakan Command Prompt (CMD)**

CMD tidak terpengaruh execution policy, jadi bisa langsung digunakan:

1. **Buka Command Prompt (CMD)**
2. **Jalankan:**
   ```cmd
   npm install -g @anthropic-ai/claude-code
   ```

**Catatan:**
- Error ini muncul meskipun Node.js sudah terinstall dengan benar
- Execution policy hanya mempengaruhi PowerShell, bukan CMD
- Solusi 2 (CMD) lebih cepat jika tidak ingin mengubah execution policy

---

### Error Network/Connection (ENOTFOUND)

**Error:**
```
npm error code ENOTFOUND
npm error network request to https://registry.npmjs.org/@anthropic-ai/claude-code failed
npm error network This is a problem related to network connectivity.
npm error network In most cases you are behind a proxy or have bad network settings.
```

**Penyebab:**
- Masalah koneksi internet
- Terhubung ke proxy yang memblokir npm registry
- DNS tidak bisa resolve `registry.npmjs.org`
- Firewall atau antivirus memblokir koneksi

**Solusi 1: Cek Koneksi Internet**

1. **Pastikan internet terhubung:**
   - Coba buka website lain di browser
   - Coba buka https://registry.npmjs.org di browser
   - Jika tidak bisa dibuka, ada masalah koneksi

2. **Coba install lagi:**
   ```powershell
   npm install -g @anthropic-ai/claude-code
   ```
   Terkadang masalah sementara, coba lagi bisa berhasil.

**Solusi 2: Ganti DNS**

Jika DNS tidak bisa resolve `registry.npmjs.org`:

1. **Buka Network Settings:**
   - Settings → Network & Internet → Change adapter options
   - Klik kanan network adapter → Properties
   - Pilih "Internet Protocol Version 4 (TCP/IPv4)" → Properties

2. **Ganti DNS:**
   - Pilih "Use the following DNS server addresses"
   - Preferred: `8.8.8.8` (Google DNS)
   - Alternate: `8.8.4.4` (Google DNS)
   - Atau gunakan Cloudflare: `1.1.1.1` dan `1.0.0.1`

3. **Restart komputer** dan coba install lagi

**Solusi 3: Konfigurasi Proxy (Jika Menggunakan Proxy)**

Jika Anda menggunakan proxy:

```powershell
npm config set proxy http://proxy-server:port
npm config set https-proxy http://proxy-server:port
```

**Solusi 4: Gunakan Registry Mirror (Alternatif)**

Jika registry npm tidak bisa diakses, gunakan mirror:

```powershell
npm install -g @anthropic-ai/claude-code --registry https://registry.npmmirror.com
```

**Solusi 5: Cek Firewall/Antivirus**

1. **Cek Windows Firewall:**
   - Pastikan tidak memblokir npm
   - Atau coba disable sementara untuk testing

2. **Cek Antivirus:**
   - Beberapa antivirus memblokir npm
   - Coba disable sementara (untuk testing)
   - Atau tambahkan exception untuk npm

**Catatan:**
- Error ini bukan masalah instalasi Node.js atau execution policy
- Masalah murni koneksi jaringan ke npm registry
- Solusi 2 (Ganti DNS) sering membantu jika masalah DNS

---

### Permission Denied saat Install

**Windows:**
- Jalankan PowerShell sebagai Administrator
- Atau install manual: `npm install -g @anthropic-ai/claude-code`

**Mac/Linux:**
- Gunakan `sudo`: `sudo npm install -g @anthropic-ai/claude-code`

---

## ⚙️ Error Konfigurasi

### Konfigurasi tidak bekerja

**Error:** "API key tidak ditemukan" atau Claude Code tidak bisa connect

**Solusi:**
1. **Tutup semua terminal/Claude Code** dan buka terminal baru
2. **Cek environment variables:**
   - Windows: `echo $env:ANTHROPIC_AUTH_TOKEN`
   - Mac/Linux: `echo $ANTHROPIC_AUTH_TOKEN`
3. **Jika kosong**, setup ulang dengan `setx` atau script otomatis
4. **Pastikan tutup terminal dan buka terminal baru** setelah setup

---

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

---

### Claude Code Dialihkan ke Anthropic Console (Login)

**Error:** 
Setelah memilih opsi "2. Anthropic Console account · API usage billing", Claude Code membuka browser dan mengarahkan ke halaman login Anthropic Console, padahal kita ingin menggunakan API key yang sudah di setting di environment variables.

**Penyebab:**
Claude Code secara default akan mencoba login ke Anthropic Console untuk mendapatkan API key Anthropic. Karena kita menggunakan API key yang sudah di setting di environment variables login tersebut tidak diperlukan.

**Solusi: Buat/Edit File Settings.json**

Agar Claude Code langsung menggunakan environment variables tanpa login Anthropic, buat atau edit file `~/.claude/settings.json`:

**Windows:**
```powershell
# Buat folder jika belum ada
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude"

# Buat/edit file settings.json
@"
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "your_zai_api_key",
    "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic"
  }
}
"@ | Out-File -FilePath "$env:USERPROFILE\.claude\settings.json" -Encoding utf8
```

**Catatan:** Ganti `your_api_key` dengan API key Anda yang sebenarnya.

**Mac/Linux:**
```bash
# Buat folder jika belum ada
mkdir -p ~/.claude

# Buat/edit file settings.json
cat > ~/.claude/settings.json << 'EOF'
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "your_zai_api_key",
    "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic"
  }
}
EOF
```

**Catatan:** Ganti `your_api_key` dengan API key Anda yang sebenarnya.

**Setelah membuat file settings.json:**

1. **Tutup/Decline** halaman login Anthropic Console (jika masih terbuka)
2. **Tutup terminal** dan buka terminal baru
3. **Jalankan `claude` lagi** - CLI akan langsung menggunakan API key dari settings.json tanpa perlu login

**Alternatif: Gunakan Environment Variables Saja**

Jika tidak ingin membuat file settings.json, pastikan environment variables sudah di-set dengan benar:

**Windows:**
```cmd
setx ANTHROPIC_AUTH_TOKEN your_api_key
setx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
```

**Mac/Linux:**
```bash
export ANTHROPIC_AUTH_TOKEN=your_api_key
export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
```

**Catatan Penting:**
- ✅ File `settings.json` akan membuat Claude Code langsung menggunakan API key tanpa login
- ✅ Environment variables juga bisa digunakan, tapi harus di-set setiap kali buka terminal baru (kecuali menggunakan `setx` di Windows)
- ✅ Jika sudah membuat `settings.json`, tidak perlu login ke Anthropic Console lagi

---

## 🚀 Error Runtime

### Error "Claude Code on Windows requires git-bash"

**Error:**
```
Error: Claude Code on Windows requires git-bash
If installed but not in PATH, set environment variable pointing to your bash.exe
```

**Penyebab:**
Claude Code di Windows memerlukan Git Bash untuk berjalan, tapi Git Bash tidak ditemukan atau tidak ada di PATH.

**Solusi 1: Install Git Bash (Jika Belum Terinstall)**

1. **Download Git untuk Windows:**
   - Kunjungi: https://git-scm.com/downloads/win
   - Download dan install Git untuk Windows
   - **Penting:** Saat install, pastikan pilih opsi **"Add Git to PATH"**

2. **Setelah install, restart terminal** dan jalankan `claude` lagi

**Solusi 2: Set Environment Variable (Jika Git Bash Sudah Terinstall)**

Jika Git Bash sudah terinstall tapi tidak di PATH:

1. **Cari lokasi Git Bash:**
   - Biasanya ada di: `C:\Program Files\Git\bin\bash.exe`
   - Atau: `C:\Program Files (x86)\Git\bin\bash.exe`
   - Atau cek dengan: `where bash` di Command Prompt

2. **Set environment variable:**
   ```cmd
   setx CLAUDE_CODE_GIT_BASH_PATH "C:\Program Files\Git\bin\bash.exe"
   ```
   
   **Catatan:** Ganti path dengan lokasi Git Bash Anda yang sebenarnya

3. **Tutup terminal dan buka terminal baru**

4. **Jalankan `claude` lagi**

**Cek Apakah Git Bash Terinstall:**

Jalankan di Command Prompt atau PowerShell:
```cmd
where bash
```

Jika muncul path seperti `C:\Program Files\Git\bin\bash.exe`, berarti Git Bash sudah terinstall.

---

### Claude Code tidak bisa akses file

- Pastikan Anda menjalankan `claude` di dalam folder project
- Grant permission saat diminta saat pertama kali
- Cek permission folder project

---

### Error "claude: command not found"

**Error:**
```
claude : The term 'claude' is not recognized as the name of a cmdlet, function, script file, or operable program.
```

**Penyebab:**
- ❌ **BUKAN masalah PowerShell** - PowerShell bekerja dengan baik
- ✅ **Masalah:** Claude Code CLI belum terinstall, atau npm global bin tidak ada di PATH

**Solusi Step-by-Step:**

#### Step 1: Cek Apakah Claude Code Sudah Terinstall

Jalankan di PowerShell:
```powershell
npm list -g @anthropic-ai/claude-code
```

**Jika muncul error atau "empty", berarti belum terinstall.** Lanjut ke Step 2.

**Jika muncul versi (contoh: `@anthropic-ai/claude-code@2.0.14`), berarti sudah terinstall.** Lanjut ke Step 3.

#### Step 2: Install Claude Code CLI

Jika belum terinstall, install dengan:

```powershell
npm install -g @anthropic-ai/claude-code
```

**Catatan:**
- Jika muncul error `npm is not recognized`, lihat bagian [Error "npm is not recognized"](#error-npm-is-not-recognized)
- Jika muncul error `npm.ps1 cannot be loaded`, lihat bagian [Error "npm.ps1 cannot be loaded"](#error-npmps1-cannot-be-loaded-execution-policy)
- Jika muncul error network, lihat bagian [Error Network/Connection (ENOTFOUND)](#error-networkconnection-enotfound)

#### Step 3: Restart Terminal (PENTING!)

**Setelah install, WAJIB restart terminal:**

1. **Tutup semua terminal/PowerShell yang terbuka**
2. **Buka PowerShell baru**
3. **Coba jalankan `claude` lagi**

**Mengapa harus restart?**
- Terminal yang sudah terbuka tidak akan membaca PATH yang baru
- Terminal baru akan membaca PATH terbaru dari sistem

#### Step 4: Cek PATH npm Global Bin (Jika Masih Error)

Jika setelah restart masih error, cek apakah npm global bin ada di PATH:

**Windows PowerShell:**
```powershell
npm config get prefix
```

Ini akan menampilkan path seperti: `C:\Users\[USERNAME]\AppData\Roaming\npm`

**Cek apakah path tersebut ada di PATH:**
```powershell
$env:PATH -split ';' | Select-String "npm"
```

**Jika tidak muncul**, tambahkan manual ke PATH:

1. Buka System Properties → Environment Variables
2. Edit "Path" di User variables
3. Tambahkan path dari `npm config get prefix` (contoh: `C:\Users\[USERNAME]\AppData\Roaming\npm`)
4. **Restart terminal** setelah menambah PATH

#### Step 5: Verifikasi Instalasi

Setelah semua langkah di atas, verifikasi:

```powershell
claude --version
```

Jika muncul versi (contoh: `2.0.14`), berarti sudah berhasil!

**Mac/Linux:**

1. **Cek apakah npm global bin ada di PATH:**
   ```bash
   echo $PATH
   ```
   Pastikan ada path seperti `/usr/local/bin` atau `/home/[USERNAME]/.npm-global/bin`

2. **Install ulang dengan `sudo` jika perlu:**
   ```bash
   sudo npm install -g @anthropic-ai/claude-code
   ```

3. **Restart terminal** setelah install

**Catatan Penting:**
- ✅ **PowerShell tidak bermasalah** - Error ini normal jika CLI belum terinstall
- ✅ **Restart terminal** adalah langkah penting yang sering terlewat
- ✅ Jika sudah install tapi masih error, kemungkinan masalah PATH

---

### Error "Rate Limit Exceeded"

- Tunggu beberapa detik, lalu coba lagi
- Jangan spam chat (tunggu response selesai sebelum kirim berikutnya)
- Lihat [`PENJELASAN_RATE_LIMIT.md`](PENJELASAN_RATE_LIMIT.md) untuk penjelasan lengkap

---

## ℹ️ Catatan: Keluar dari API Claude

1. Di terminal Claude Code yang sedang aktif, ketik `/exit` atau tekan `Ctrl+C` untuk menutup sesi.
2. Jalankan `claude logout` agar token sebelumnya dihapus.
3. Tutup semua terminal VS Code, lalu buka PowerShell baru.
4. Pastikan environment variable aktif:
   ```powershell
   echo $env:ANTHROPIC_AUTH_TOKEN
   echo $env:ANTHROPIC_BASE_URL
   ```
   - Jika kosong, set ulang:
     ```cmd
     setx ANTHROPIC_AUTH_TOKEN your_api_key
     setx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
     ```
5. (Opsional) Hapus konfigurasi lama agar CLI membaca env vars baru:
   ```powershell
   del $env:USERPROFILE\.claude\settings.json
   ```
6. Tutup terminal, buka terminal baru, masuk ke folder project, jalankan `claude`

---

## 📚 Referensi

- [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md) - Panduan instalasi lengkap
- [`README.md`](README.md) - Panduan utama
- [`PENJELASAN_RATE_LIMIT.md`](PENJELASAN_RATE_LIMIT.md) - Penjelasan tentang rate limit


