# 📘 Panduan Instalasi Claude Code CLI

Panduan lengkap untuk menginstall dan menggunakan Claude Code CLI untuk chat interface langsung di terminal VS Code.

## 📑 Daftar Isi

- [Apa itu Claude Code CLI?](#-apa-itu-claude-code-cli)
- [Panduan Instalasi](#-panduan-instalasi)
- [Cara Menggunakan](#-cara-menggunakan)
- [FAQ - Pertanyaan Umum](#-faq---pertanyaan-umum)
- [Troubleshooting](#-troubleshooting)
- [Keamanan](#️-keamanan)
- [Referensi](#-referensi-dan-file-terkait)

---

## 🎯 Apa itu Claude Code CLI?

**Claude Code CLI** adalah tool command-line dari Anthropic yang memungkinkan Anda untuk:
- ✅ Chat dengan Claude langsung di terminal VS Code
- ✅ Interaksi real-time sambil coding
- ✅ Context-aware terhadap file di project Anda
- ✅ Tidak perlu aplikasi tambahan, cukup terminal

---

## 🚀 Panduan Instalasi

📄 **Lihat:** [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md) - Panduan lengkap instalasi Claude Code CLI

### Prerequisites

- **Node.js 18 atau lebih baru** terinstall di sistem Anda
  - Download: [nodejs.org](https://nodejs.org)

### 🪟 Windows

#### Step 1: Install Claude Code CLI

```powershell
npm install -g @anthropic-ai/claude-code
```

**Catatan:** Jika muncul error permission, jalankan PowerShell sebagai Administrator.

#### Step 2: Install Extension Claude Code for VS Code

**Jika belum terinstall**, install extension **Claude Code** di VS Code:

1. **Buka VS Code Extensions:**
   - Tekan `Ctrl+Shift+X` (Windows/Linux) atau `Cmd+Shift+X` (Mac)
   - Atau klik ikon **Extensions** di sidebar kiri

2. **Cari "Claude Code":**
   - Di search box, ketik: `Claude Code`
   - Pilih extension **"Claude Code"** oleh Anthropic
   - Klik **Install**

3. **Tunggu hingga instalasi selesai**

#### Step 3: Setup Konfigurasi VS Code Extension

Setelah extension terinstall, konfigurasi environment variables di VS Code settings:

**Cara 1: Melalui VS Code Settings UI**

1. **Buka VS Code Settings:**
   - Tekan `Ctrl+,` (Windows/Linux) atau `Cmd+,` (Mac)
   - Atau klik **File** → **Preferences** → **Settings**

2. **Cari "Claude Code: Environment Variables":**
   - Di search box, ketik: `claudeCode.environmentVariables`
   - Klik **"Edit in settings.json"** di bagian bawah deskripsi

3. **Tambahkan konfigurasi berikut:**

Buka file `settings.json` dan tambahkan:

```json
{
  "claudeCode.disableLoginPrompt": false,
  "claudeCode.environmentVariables": [
    {
      "name": "ANTHROPIC_BASE_URL",
      "value": "https://api.z.ai/api/anthropic"
    },
    {
      "name": "ANTHROPIC_AUTH_TOKEN",
      "value": "your_api_key"
    },
    {
      "name": "CLAUDE_CODE_SKIP_AUTH_LOGIN",
      "value": "true"
    }
  ]
}
```

**Catatan:** 
- Ganti `your_api_key` dengan API key Anda yang sebenarnya
- `CLAUDE_CODE_SKIP_AUTH_LOGIN: "true"` akan melewati prompt login dan langsung menggunakan API key dari environment variables

**Cara 2: Edit Langsung File settings.json**

1. **Buka Command Palette:**
   - Tekan `Ctrl+Shift+P` (Windows/Linux) atau `Cmd+Shift+P` (Mac)
   - Ketik: `Preferences: Open User Settings (JSON)`
   - Atau untuk workspace: `Preferences: Open Workspace Settings (JSON)`

2. **Tambahkan konfigurasi** seperti di atas

3. **Simpan file** (`Ctrl+S` atau `Cmd+S`)

4. **Reload VS Code:**
   - Tekan `Ctrl+Shift+P` (Windows/Linux) atau `Cmd+Shift+P` (Mac)
   - Ketik: `Developer: Reload Window`
   - Atau tutup dan buka VS Code lagi

**Setelah konfigurasi:**
- ✅ Claude Code extension akan langsung menggunakan API
- ✅ Tidak akan muncul prompt login
- ✅ Extension akan tampil di sidebar (panel Claude)
- ✅ Bisa langsung chat dengan Claude di VS Code

📄 **Untuk troubleshooting lengkap**, lihat: [`TROUBLESHOOTING.md` - Setup Claude Code Extension untuk VS Code](TROUBLESHOOTING.md#setup-claude-code-extension-untuk-vs-code)

#### Step 4: Mulai Menggunakan

**Opsi 1: Menggunakan VS Code Extension (Direkomendasikan)**

**⚠️ PENTING:** Setelah konfigurasi, **jangan** menjalankan `claude` di terminal. Gunakan VS Code Extension panel di sidebar.

**Cara membuka VS Code Extension panel:**

1. **Pastikan VS Code sudah di-reload** setelah konfigurasi settings.json
   - Tekan `Ctrl+Shift+P` (Windows/Linux) atau `Cmd+Shift+P` (Mac)
   - Ketik: `Developer: Reload Window`
   - Atau tutup dan buka VS Code lagi

2. **Buka Claude Code Extension panel:**
   - **Cara 1:** Klik ikon **Claude Code** (ikon orange dengan starburst) di **sidebar kiri** VS Code
   - **Cara 2:** Tekan `Ctrl+Shift+P` (Windows/Linux) atau `Cmd+Shift+P` (Mac), ketik `Claude Code: Open` atau `Claude Code: Focus`
   - **Cara 3:** Klik menu **View** → **Open View...** → cari "Claude Code"

3. **Panel Claude Code akan muncul di sidebar** (bukan di terminal!)
   - Panel akan menampilkan chat interface dengan Claude
   - Bisa langsung mulai chat tanpa perlu menjalankan command di terminal

4. **Mulai chat** dengan Claude langsung di panel VS Code! 🎉

**Catatan:**
- ✅ VS Code Extension panel = Interface chat di sidebar VS Code (seperti screenshot extension)
- ❌ CLI di terminal = Interface chat di terminal (yang muncul saat menjalankan `claude` command)
- Jika Anda melihat interface di terminal, berarti Anda menggunakan CLI, bukan Extension panel

**Opsi 2: Menggunakan CLI di Terminal**

1. **Tutup terminal saat ini dan buka terminal baru** (penting! agar environment variables aktif)

2. **Navigasi ke folder project:**
   ```powershell
   cd your-project-directory
   ```

3. **Jalankan Claude Code:**
   ```powershell
   claude
   ```

4. **Jika diminta** "Do you want to use this API key," pilih **"Yes"**.

5. **Grant permission** untuk akses file di folder project saat diminta.

6. **Selesai!** Anda sekarang bisa chat dengan Claude Code di terminal! 🎉

---

### 🍎 Mac/Linux

#### Step 1: Install Claude Code CLI

```bash
npm install -g @anthropic-ai/claude-code
```

**Catatan:** Jika muncul permission error, gunakan `sudo`:
```bash
sudo npm install -g @anthropic-ai/claude-code
```

#### Step 2: Install Extension Claude Code for VS Code

**Jika belum terinstall**, install extension **Claude Code** di VS Code:

1. **Buka VS Code Extensions:**
   - Tekan `Ctrl+Shift+X` (Linux) atau `Cmd+Shift+X` (Mac)
   - Atau klik ikon **Extensions** di sidebar kiri

2. **Cari "Claude Code":**
   - Di search box, ketik: `Claude Code`
   - Pilih extension **"Claude Code"** oleh Anthropic
   - Klik **Install**

3. **Tunggu hingga instalasi selesai**

#### Step 3: Setup Konfigurasi VS Code Extension

Setelah extension terinstall, konfigurasi environment variables di VS Code settings:

**Cara 1: Melalui VS Code Settings UI**

1. **Buka VS Code Settings:**
   - Tekan `Ctrl+,` (Linux) atau `Cmd+,` (Mac)
   - Atau klik **File** → **Preferences** → **Settings**

2. **Cari "Claude Code: Environment Variables":**
   - Di search box, ketik: `claudeCode.environmentVariables`
   - Klik **"Edit in settings.json"** di bagian bawah deskripsi

3. **Tambahkan konfigurasi berikut:**

Buka file `settings.json` dan tambahkan:

```json
{
  "claudeCode.disableLoginPrompt": false,
  "claudeCode.environmentVariables": [
    {
      "name": "ANTHROPIC_BASE_URL",
      "value": "https://api.z.ai/api/anthropic"
    },
    {
      "name": "ANTHROPIC_AUTH_TOKEN",
      "value": "your_api_key"
    },
    {
      "name": "CLAUDE_CODE_SKIP_AUTH_LOGIN",
      "value": "true"
    }
  ]
}
```

**Catatan:** 
- Ganti `your_api_key` dengan API key Anda yang sebenarnya
- `CLAUDE_CODE_SKIP_AUTH_LOGIN: "true"` akan melewati prompt login dan langsung menggunakan API key dari environment variables

**Cara 2: Edit Langsung File settings.json**

1. **Buka Command Palette:**
   - Tekan `Ctrl+Shift+P` (Linux) atau `Cmd+Shift+P` (Mac)
   - Ketik: `Preferences: Open User Settings (JSON)`
   - Atau untuk workspace: `Preferences: Open Workspace Settings (JSON)`

2. **Tambahkan konfigurasi** seperti di atas

3. **Simpan file** (`Ctrl+S` atau `Cmd+S`)

4. **Reload VS Code:**
   - Tekan `Ctrl+Shift+P` (Linux) atau `Cmd+Shift+P` (Mac)
   - Ketik: `Developer: Reload Window`
   - Atau tutup dan buka VS Code lagi

**Setelah konfigurasi:**
- ✅ Claude Code extension akan langsung menggunakan API
- ✅ Tidak akan muncul prompt login
- ✅ Extension akan tampil di sidebar (panel Claude)
- ✅ Bisa langsung chat dengan Claude di VS Code

📄 **Untuk troubleshooting lengkap**, lihat: [`TROUBLESHOOTING.md` - Setup Claude Code Extension untuk VS Code](TROUBLESHOOTING.md#setup-claude-code-extension-untuk-vs-code)

#### Step 4: Mulai Menggunakan

**Opsi 1: Menggunakan VS Code Extension (Direkomendasikan)**

**⚠️ PENTING:** Setelah konfigurasi, **jangan** menjalankan `claude` di terminal. Gunakan VS Code Extension panel di sidebar.

**Cara membuka VS Code Extension panel:**

1. **Pastikan VS Code sudah di-reload** setelah konfigurasi settings.json
   - Tekan `Ctrl+Shift+P` (Linux) atau `Cmd+Shift+P` (Mac)
   - Ketik: `Developer: Reload Window`
   - Atau tutup dan buka VS Code lagi

2. **Buka Claude Code Extension panel:**
   - **Cara 1:** Klik ikon **Claude Code** (ikon orange dengan starburst) di **sidebar kiri** VS Code
   - **Cara 2:** Tekan `Ctrl+Shift+P` (Linux) atau `Cmd+Shift+P` (Mac), ketik `Claude Code: Open` atau `Claude Code: Focus`
   - **Cara 3:** Klik menu **View** → **Open View...** → cari "Claude Code"

3. **Panel Claude Code akan muncul di sidebar** (bukan di terminal!)
   - Panel akan menampilkan chat interface dengan Claude
   - Bisa langsung mulai chat tanpa perlu menjalankan command di terminal

4. **Mulai chat** dengan Claude langsung di panel VS Code! 🎉

**Catatan:**
- ✅ VS Code Extension panel = Interface chat di sidebar VS Code (seperti screenshot extension)
- ❌ CLI di terminal = Interface chat di terminal (yang muncul saat menjalankan `claude` command)
- Jika Anda melihat interface di terminal, berarti Anda menggunakan CLI, bukan Extension panel

**Opsi 2: Menggunakan CLI di Terminal**

```bash
cd your-project-directory
claude
```

---

## 💡 Cara Menggunakan

### Dasar-dasar

Setelah Claude Code berjalan di terminal:

1. **Kirim chat** langsung dengan mengetik pesan Anda
2. **Tekan Enter** untuk mengirim
3. **Tunggu response** dari Claude
4. **Lanjutkan percakapan** dengan chat berikutnya

### Command Khusus

**Command yang tersedia di Claude Code CLI:**

- `/status` - Cek status model yang sedang digunakan
- `/cost` - Cek penggunaan token dan biaya untuk sesi saat ini
- `/help` - Lihat daftar command yang tersedia
- `/exit` - Keluar dari Claude Code
- `/model` - Ganti atau cek model yang digunakan

### 📊 Cara Cek Penggunaan Limit

📄 **Lihat:** [`PENJELASAN_RATE_LIMIT.md`](PENJELASAN_RATE_LIMIT.md) - Penjelasan lengkap tentang limit dan cara cek penggunaan

**Ringkasan:**
- **Paket Lite:** Hingga ~120 perintah setiap 5 jam — sekitar 3× kuota penggunaan paket Claude Pro
- Command `/cost` hanya menampilkan token usage, bukan jumlah prompt
- Tidak ada metode langsung untuk cek jumlah prompt yang digunakan
- Gunakan tracking manual atau monitor error 429 untuk mengetahui limit

**Command untuk cek usage:**
- `/cost` - Cek token usage (input + output tokens)
- `/status` - Cek status model dan konfigurasi

### Tips

- Claude Code akan otomatis membaca konteks dari file di folder project Anda
- Gunakan untuk bertanya tentang kode, minta bantuan coding, atau diskusi tentang project

---

## ❓ FAQ - Pertanyaan Umum

### Apakah saya perlu install Claude Code CLI?

**Ya**, jika Anda ingin:
- Chat interface langsung di terminal VS Code
- Interaksi real-time dengan Claude sambil coding
- Context-aware terhadap file di project

Lihat [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md) untuk panduan lengkap.

### Bagaimana workflow penggunaannya?

1. **Setup sekali** (setelah dapat API key):
   - Install Claude Code CLI: `npm install -g @anthropic-ai/claude-code`
   - Setup konfigurasi dengan `setx` atau script otomatis

2. **Gunakan di terminal:**
   - Buka terminal baru (setelah setup)
   - Navigasi ke folder project: `cd your-project`
   - Jalankan: `claude`
   - Mulai chat!

### Apakah setup perlu diulang setiap kali?

**Tidak!** Setelah setup sekali:
- Environment variables sudah tersimpan permanen
- Cukup buka terminal baru dan jalankan `claude`
- Tidak perlu setup ulang

### Apakah bisa ganti model yang digunakan?

Ya, lihat bagian "Switch Model" di [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md).

---

## 🔍 Troubleshooting

Untuk solusi lengkap berbagai error yang mungkin terjadi, lihat:

📄 **[`TROUBLESHOOTING.md`](TROUBLESHOOTING.md)** - Panduan troubleshooting lengkap

File tersebut mencakup:
- ✅ Error instalasi (npm not recognized, execution policy, network error)
- ✅ Error konfigurasi (script tidak bisa dijalankan, konfigurasi tidak bekerja)
- ✅ Error runtime (git-bash required, akses file, command not found)
- ✅ Solusi lengkap untuk setiap error dengan penjelasan detail


---

## ⚠️ Keamanan

1. **JANGAN** commit API key ke Git atau version control
2. **JANGAN** share API key dengan orang lain
3. **JANGAN** screenshot terminal yang menampilkan API key
4. **GUNAKAN** environment variables (sudah di-setup otomatis)
5. **REVIEW** permission yang diberikan saat Claude Code meminta akses folder

---

## 📚 Referensi dan File Terkait

### 📄 File di Repository Ini:
- [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md) - Panduan instalasi lengkap Claude Code CLI
- [`TROUBLESHOOTING.md`](TROUBLESHOOTING.md) - Panduan troubleshooting lengkap untuk semua error
- [`setup-claude-code-windows-simple.ps1`](setup-claude-code-windows-simple.ps1) - Script setup otomatis untuk Windows
- [`PENJELASAN_RATE_LIMIT.md`](PENJELASAN_RATE_LIMIT.md) - Penjelasan tentang rate limit

---

## 🆘 Bantuan

Jika masih mengalami masalah:

1. Cek panduan di [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md)
2. Pastikan API key Anda valid dan belum expired
3. Pastikan BASE URL benar: `https://api.z.ai/api/anthropic`
4. Cek [`TROUBLESHOOTING.md`](TROUBLESHOOTING.md) untuk solusi lengkap
5. Pastikan Node.js versi 18+ sudah terinstall

---

**Selamat menggunakan Claude Code! 🎉**
