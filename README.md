# 📘 Panduan Instalasi Claude Code CLI

Panduan lengkap untuk menginstall dan menggunakan Claude Code CLI untuk chat interface langsung di terminal VS Code.

## 📑 Daftar Isi

- [Apa itu Claude Code CLI?](#-apa-itu-claude-code-cli)
- [Panduan Instalasi](#-panduan-instalasi)
- [Cara Menggunakan](#-cara-menggunakan)
- [FAQ - Pertanyaan Umum](#-faq---pertanyaan-umum)
- [Troubleshooting](#-troubleshooting)
- [Keamanan](#️-keamanan)

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

#### Step 2: Setup Konfigurasi

**Cara Sederhana (Manual):**

Ganti `your_api_key` dengan API key Z.AI Anda yang sebenarnya (tanpa tanda kutip), lalu jalankan:

```cmd
setx ANTHROPIC_AUTH_TOKEN your_api_key
setx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
```

**Catatan Penting:**
- Setelah `setx`, tutup terminal dan buka terminal baru agar environment variables aktif
- `setx` tidak menampilkan output - itu normal, asalkan tidak ada error

**Atau gunakan Script Otomatis (Opsional):**

```powershell
.\setup-claude-code-windows-simple.ps1
```

Script ini akan:
- Cek apakah Node.js dan Claude Code sudah terinstall
- Install otomatis jika belum ada
- Meminta input API key Anda
- Menjalankan `setx` secara otomatis

#### Step 3: Mulai Menggunakan

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

#### Step 2: Setup Konfigurasi Otomatis

Jalankan script otomatis dari Z.AI:

```bash
curl -O "https://cdn.bigmodel.cn/install/claude_code_zai_env.sh" && bash ./claude_code_zai_env.sh
```

Script ini akan:
- Membuat folder `~/.claude` jika belum ada
- Membuat/update file `~/.claude/settings.json`
- Meminta input API key Anda

#### Step 3: Mulai Menggunakan

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

- `/status` - Cek status model yang sedang digunakan
- `/help` - Lihat daftar command yang tersedia

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

### Bagaimana cara mendapatkan API Key?

1. Login atau daftar di [Z.AI](https://z.ai)
2. Buka halaman **API Keys**
3. Buat API Key baru
4. Copy API key Anda untuk digunakan di setup

### Apakah bisa ganti model yang digunakan?

Ya, lihat bagian "Switch Model" di [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md).

---

## 🔍 Troubleshooting

### Claude Code tidak terinstall

**Error:** `claude: command not found`

**Solusi:**
- Pastikan Node.js sudah terinstall: `node --version`
- Install ulang: `npm install -g @anthropic-ai/claude-code`
- Pastikan npm global bin ada di PATH
- Restart terminal setelah install

### Konfigurasi tidak bekerja

**Error:** "API key tidak ditemukan" atau Claude Code tidak bisa connect

**Solusi:**
1. **Tutup semua terminal/Claude Code** dan buka terminal baru
2. **Cek environment variables:**
   - Windows: `echo $env:ANTHROPIC_AUTH_TOKEN`
   - Mac/Linux: `echo $ANTHROPIC_AUTH_TOKEN`
3. **Jika kosong**, setup ulang dengan `setx` atau script otomatis
4. **Pastikan tutup terminal dan buka terminal baru** setelah setup

### Permission Denied saat Install

**Windows:**
- Jalankan PowerShell sebagai Administrator
- Atau install manual: `npm install -g @anthropic-ai/claude-code`

**Mac/Linux:**
- Gunakan `sudo`: `sudo npm install -g @anthropic-ai/claude-code`

### Claude Code tidak bisa akses file

- Pastikan Anda menjalankan `claude` di dalam folder project
- Grant permission saat diminta saat pertama kali
- Cek permission folder project

### Error "Rate Limit Exceeded"

- Tunggu beberapa detik, lalu coba lagi
- Jangan spam chat (tunggu response selesai sebelum kirim berikutnya)
- Lihat [`PENJELASAN_RATE_LIMIT.md`](PENJELASAN_RATE_LIMIT.md) untuk penjelasan lengkap

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
- [`setup-claude-code-windows-simple.ps1`](setup-claude-code-windows-simple.ps1) - Script setup otomatis untuk Windows
- [`PENJELASAN_RATE_LIMIT.md`](PENJELASAN_RATE_LIMIT.md) - Penjelasan tentang rate limit

### 📖 Dokumentasi Eksternal:
- [Dokumentasi Resmi Z.AI - Claude Code](https://docs.z.ai/scenario-example/develop-tools/claude)
- [Z.AI Open Platform](https://z.ai) - Untuk mendapatkan API Key
- [Node.js Download](https://nodejs.org) - Download Node.js

---

## 🆘 Bantuan

Jika masih mengalami masalah:

1. Cek panduan di [`INSTALASI_CLAUDE_CODE.md`](INSTALASI_CLAUDE_CODE.md)
2. Pastikan API key Anda valid dan belum expired
3. Pastikan BASE URL benar: `https://api.z.ai/api/anthropic`
4. Cek troubleshooting section di atas
5. Pastikan Node.js versi 18+ sudah terinstall

---

**Selamat menggunakan Claude Code! 🎉**
