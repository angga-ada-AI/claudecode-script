# 🚀 Panduan Instalasi Claude Code CLI

> [!NOTE]
> **File ini khusus untuk setup Claude Code CLI (Terminal).**
> 
> Jika Anda ingin menggunakan **VS Code Extension** (panel UI di sidebar), lihat:
> - 📄 [`README.md` - Setup VS Code Extension](README.md#step-3-setup-konfigurasi)
> - 📄 [`TROUBLESHOOTING.md` - Setup Claude Code Extension untuk VS Code](TROUBLESHOOTING.md#setup-claude-code-extension-untuk-vs-code)

## 📋 Prerequisites

1. **Node.js 18 atau lebih baru** terinstall
2. **Git Bash** terinstall (untuk Windows) - Download: https://git-scm.com/downloads/win

**Catatan:** Saat install Git, pastikan pilih opsi "Add Git to PATH" agar Git Bash bisa ditemukan otomatis.

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
setx ANTHROPIC_AUTH_TOKEN 9042c751be4148fdbce1b0b4e1a60df5.dMtEZN
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

Untuk solusi lengkap berbagai error yang mungkin terjadi, lihat:

📄 **[`TROUBLESHOOTING.md`](TROUBLESHOOTING.md)** - Panduan troubleshooting lengkap

File tersebut mencakup:
- ✅ Error instalasi (npm not recognized, execution policy, network error)
- ✅ Error konfigurasi (script tidak bisa dijalankan, konfigurasi tidak bekerja)
- ✅ Error runtime (git-bash required, akses file, command not found)
- ✅ Solusi lengkap untuk setiap error dengan penjelasan detail

---


## 💡 Perbedaan CLI vs VS Code Extension

**Claude Code CLI (File ini):**
- Interface chat di **terminal** (PowerShell, CMD, Bash)
- Konfigurasi menggunakan **environment variables** (`setx` di Windows) atau file `~/.claude/settings.json`
- Jalankan dengan command `claude` di terminal
- Cocok untuk developer yang suka bekerja di terminal

**VS Code Extension:**
- Interface chat di **panel sidebar VS Code**
- Konfigurasi menggunakan **VS Code settings.json**
- Akses melalui ikon Claude di sidebar VS Code
- Cocok untuk developer yang suka UI visual

📄 **Untuk setup VS Code Extension**, lihat: [`README.md` - Setup VS Code Extension](README.md#step-3-setup-konfigurasi)

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
- Jika ingin **chat interface** di VS Code UI → Install **VS Code Extension**
- Jika ingin **programmatically** menggunakan API → Gunakan **script setup environment variables** + library Python/JS

---

**Selamat menggunakan Claude Code! 🎉**

