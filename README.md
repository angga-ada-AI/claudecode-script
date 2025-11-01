# 📘 Panduan Lengkap - Setup Anthropic API

## 📑 Daftar Isi

- [Apa Kegunaan Script Ini?](#-apa-kegunaan-script-ini)
- [Panduan Instalasi](#-panduan-instalasi)
- [Cara Kerja Environment Variables](#-cara-kerja-environment-variables)
- [Contoh Penggunaan dengan Python](#-contoh-penggunaan-dengan-python)
- [FAQ - Pertanyaan Umum](#-faq---pertanyaan-umum)
- [Keamanan](#️-keamanan)
- [Troubleshooting](#-troubleshooting)

---

## 📖 Apa Kegunaan Script Ini?

Script ini digunakan untuk **mengatur environment variables (variabel lingkungan)** yang diperlukan untuk mengakses **Anthropic API**. 

Script ini adalah **script sederhana untuk terminal** yang hanya mengatur environment variables. Cukup:
- ✅ **Jalankan langsung di terminal** (PowerShell di Windows, Terminal di Mac)
- ✅ **Tidak perlu install aplikasi tambahan**
- ✅ **Tidak perlu download CLI khusus**
- ✅ **Hanya butuh terminal/command prompt yang sudah ada di sistem Anda**

### Bagaimana Cara Kerjanya?

Script ini hanya mengatur **environment variables** di terminal Anda. Setelah dijalankan, aplikasi Python, JavaScript, atau bahasa pemrograman lainnya yang Anda jalankan di terminal yang sama akan bisa membaca API key tersebut secara otomatis.

### Kegunaan Utama:
1. **Menyiapkan koneksi ke API Anthropic** tanpa perlu hardcode API key di dalam kode aplikasi
2. **Mengatur BASE URL** `https://api.z.ai/api/anthropic`
3. **Menyimpan API key** dengan aman melalui environment variables
4. **Memudahkan penggunaan** dengan aplikasi Python atau bahasa lainnya yang menggunakan Anthropic API

---

## 🚀 Panduan Instalasi

Kami menyediakan panduan instalasi terpisah untuk setiap sistem operasi:

### 🪟 Untuk Windows
📄 **Lihat:** [`INSTALASI_WINDOWS.md`](INSTALASI_WINDOWS.md)

**Cara Paling Cepat:**
```powershell
$env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
$env:ANTHROPIC_AUTH_TOKEN = "API_KEY_ANDA"
```

**Script Interaktif (Direkomendasikan):**
```powershell
.\set-anthropic-env-windows-interactive.ps1
```

### 🍎 Untuk Mac
📄 **Lihat:** [`INSTALASI_MAC.md`](INSTALASI_MAC.md)

**Cara Paling Cepat:**
```bash
export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
export ANTHROPIC_AUTH_TOKEN="API_KEY_ANDA"
```

**Script Interaktif (Direkomendasikan):**
```bash
chmod +x set-anthropic-env-mac-interactive.sh
./set-anthropic-env-mac-interactive.sh
```

---

## 🔄 Cara Kerja Environment Variables

### Konsep Dasar

Environment variables adalah variabel yang disimpan di sistem operasi Anda dan bisa dibaca oleh aplikasi yang berjalan di terminal/shell yang sama.

### Alur Penggunaan

```
1. Setup Environment Variables (Sekali)
   ↓
2. Aplikasi membaca dari Environment Variables
   ↓
3. Aplikasi menggunakan API key untuk autentikasi
```

### Contoh Workflow:

**Langkah 1: Setup (Sekali)**
```bash
# Windows PowerShell
$env:ANTHROPIC_AUTH_TOKEN = "sk-ant-xxxxx"

# Mac Terminal
export ANTHROPIC_AUTH_TOKEN="sk-ant-xxxxx"
```

**Langkah 2: Gunakan di Aplikasi**
```python
import os
import anthropic

# Otomatis membaca dari environment variables
client = anthropic.Anthropic(
    api_key=os.environ.get("ANTHROPIC_AUTH_TOKEN")
)
```

---

## 💻 Contoh Penggunaan dengan Python

Setelah environment variables diatur, Anda bisa menggunakannya di aplikasi Python:

### Contoh 1: Penggunaan Dasar

```python
import os
import anthropic

# Aplikasi akan otomatis membaca dari environment variables
client = anthropic.Anthropic(
    base_url=os.environ.get("ANTHROPIC_BASE_URL"),
    api_key=os.environ.get("ANTHROPIC_AUTH_TOKEN")
)

# Sekarang Anda bisa menggunakan client untuk memanggil API
response = client.messages.create(
    model="claude-3-opus-20240229",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Hello, Claude!"}
    ]
)

print(response.content[0].text)
```

### Contoh 2: Dengan Error Handling

```python
import os
import anthropic

# Cek apakah environment variables sudah di-set
base_url = os.environ.get("ANTHROPIC_BASE_URL")
api_key = os.environ.get("ANTHROPIC_AUTH_TOKEN")

if not api_key:
    raise ValueError(
        "ANTHROPIC_AUTH_TOKEN tidak ditemukan! "
        "Pastikan Anda sudah menjalankan script setup."
    )

client = anthropic.Anthropic(
    base_url=base_url or "https://api.z.ai/api/anthropic",
    api_key=api_key
)

try:
    response = client.messages.create(
        model="claude-3-opus-20240229",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": "Apa itu Python?"}
        ]
    )
    print(response.content[0].text)
except Exception as e:
    print(f"Error: {e}")
```

### Contoh 3: Menggunakan dengan .env File (Alternatif)

Jika Anda menggunakan library `python-dotenv`:

```python
from dotenv import load_dotenv
import os
import anthropic

# Load dari .env file
load_dotenv()

client = anthropic.Anthropic(
    base_url=os.getenv("ANTHROPIC_BASE_URL"),
    api_key=os.getenv("ANTHROPIC_AUTH_TOKEN")
)
```

**Catatan:** Untuk cara ini, buat file `.env` di project Anda:
```
ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
ANTHROPIC_AUTH_TOKEN=your_api_key_here
```

---

## ❓ FAQ - Pertanyaan Umum

### Apakah script itu tinggal copy-paste di terminal untuk menjalankannya?
**Ya betul!** Ada dua cara:

**Cara 1: Copy-Paste Langsung (Paling Cepat) ✅**
- **Windows PowerShell:**
  ```powershell
  $env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
  $env:ANTHROPIC_AUTH_TOKEN = "API_KEY_ANDA"
  ```
  
- **Mac/Linux Terminal:**
  ```bash
  export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
  export ANTHROPIC_AUTH_TOKEN="API_KEY_ANDA"
  ```
  
  **Penting:** Ganti `"API_KEY_ANDA"` dengan API key Anda yang sebenarnya, lalu copy-paste ke terminal dan tekan Enter. Selesai!

**Cara 2: Menggunakan File Script**
- Edit file script dulu untuk masukkan API key
- Kemudian jalankan file script tersebut

**Kesimpulan:** Tidak perlu file script kalau Anda tidak mau. Langsung copy-paste command saja juga bisa!

### Apakah saya perlu install Claude Code CLI?
**TIDAK!** Script ini hanya untuk mengatur environment variables di terminal. Anda tidak perlu install CLI atau aplikasi khusus apapun. Cukup jalankan script di terminal biasa.

### Bagaimana workflow penggunaannya?
Alur lengkapnya seperti ini:

1. **Setup sekali** (setelah dapat API key):
   - Copy-paste command atau jalankan script
   - Opsi: Set permanen agar otomatis tersedia di terminal baru

2. **Gunakan di aplikasi**:
   - Buka terminal yang sama (atau terminal baru jika sudah di-set permanen)
   - Jalankan aplikasi Python/JavaScript Anda yang menggunakan Anthropic API
   - Aplikasi akan otomatis membaca environment variables

### Contoh alur lengkap:

```powershell
# Langkah 1: Setup environment variables (sekali)
$env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
$env:ANTHROPIC_AUTH_TOKEN = "sk-ant-xxxxx"

# Langkah 2: Jalankan aplikasi Python
python my_app.py
# Aplikasi Python akan otomatis membaca ANTHROPIC_AUTH_TOKEN dari environment
```

### Apakah script ini perlu dijalankan setiap kali?
- **Jika hanya di-set untuk session saat ini:** Ya, perlu dijalankan lagi setiap kali buka terminal baru
- **Jika di-set permanen:** Tidak perlu, akan otomatis ter-load di setiap terminal baru

### Untuk apa script ini dibuat?
Script ini dibuat untuk **setup environment variables di sistem Anda** (bukan di dalam project code). Fungsinya:
- ✅ Mengatur API key secara global di terminal/komputer Anda
- ✅ Menghindari hardcode API key di setiap project
- ✅ Memudahkan pengelolaan API key secara terpusat
- ✅ Meningkatkan keamanan (tidak perlu simpan API key di file project)

### Apakah script ini harus ditambahkan ke setiap project?
**TIDAK! TIDAK PERLU!** ❌

Script ini adalah **script setup sistem**, bukan bagian dari code project Anda. Yang benar:

1. **Jalankan script ini SEKALI** untuk setup environment variables di komputer Anda
   - Bisa untuk session saat ini, atau
   - **Lebih baik:** Set permanen di sistem

2. **Setelah environment variables di-set** (terutama jika permanen):
   - ✅ **Semua project** di komputer Anda bisa langsung menggunakannya
   - ✅ **Tidak perlu** copy script ke setiap project
   - ✅ **Tidak perlu** tambahkan script ke struktur project
   - ✅ **Tidak perlu** commit script ke Git repository project Anda

3. **Di dalam project code**, cukup baca dari environment variables:
   ```python
   # Di file project Python Anda (contoh: main.py)
   import os
   import anthropic
   
   # Otomatis membaca dari environment variables yang sudah di-set
   client = anthropic.Anthropic(
       base_url=os.environ.get("ANTHROPIC_BASE_URL"),
       api_key=os.environ.get("ANTHROPIC_AUTH_TOKEN")
   )
   ```

### Struktur yang Benar:

```
📁 Komputer Anda
├── 📁 claudecode-script/  ← Script setup (simpan di sini saja)
│   ├── set-anthropic-env-windows-interactive.ps1
│   ├── set-anthropic-env-mac-interactive.sh
│   └── INSTALASI_WINDOWS.md, INSTALASI_MAC.md
│
├── 📁 project-python-1/  ← Project pertama (TIDAK perlu script di sini)
│   └── main.py  ← Cukup baca dari environment variables
│
├── 📁 project-python-2/  ← Project kedua (TIDAK perlu script di sini)
│   └── app.py  ← Cukup baca dari environment variables
│
└── 📁 project-nodejs/  ← Project ketiga (TIDAK perlu script di sini)
    └── index.js  ← Cukup baca dari environment variables
```

**Kesimpulan:**
- Script ini = **tool setup sistem** (dijalankan sekali di komputer Anda)
- **Bukan** bagian dari project code
- Setelah di-set permanen, semua project bisa langsung pakai tanpa perlu script di setiap project

### Aplikasi apa saja yang bisa menggunakan environment variables ini?
Semua aplikasi yang menggunakan Anthropic API SDK bisa membaca environment variables ini, seperti:
- Aplikasi Python (menggunakan library `anthropic`)
- Aplikasi Node.js/JavaScript
- Aplikasi Go, Rust, atau bahasa lainnya yang support Anthropic API
- Script yang menggunakan curl/wget untuk call API

---

## ⚠️ Keamanan

1. **JANGAN** commit API key Anda ke Git atau version control
2. **JANGAN** share API key dengan orang lain
3. **GUNAKAN** environment variables, jangan hardcode di kode
4. **RESTRICT** permission file yang berisi API key
6. **JANGAN** screenshot terminal yang menampilkan API key

---

## 🔍 Troubleshooting

### Environment variables tidak ter-set

**Windows:**
- Pastikan Anda menjalankan PowerShell (bukan Command Prompt)
- Untuk PowerShell, pastikan execution policy tidak memblokir: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

**Mac/Linux:**
- Pastikan Anda menjalankan script dengan `source` atau `.`
- Pastikan script sudah executable: `chmod +x script.sh`

### API key tidak bekerja
- Verifikasi bahwa API key Anda benar dan belum expired
- Pastikan tidak ada spasi atau karakter tambahan di API key
- Cek bahwa Anda sudah replace placeholder `your_zai_api_key` dengan API key yang benar
- Pastikan BASE URL benar: `https://api.z.ai/api/anthropic`

### Variables tidak tersedia di terminal baru

**Windows:**
- Gunakan opsi set permanen atau tambahkan ke PowerShell profile
- Atau set via GUI: `Win + R` → `sysdm.cpl` → Environment Variables

**Mac/Linux:**
- Pastikan Anda menambahkan ke file konfigurasi yang tepat (`.zshrc` untuk zsh atau `.bash_profile` untuk bash)
- Kemudian `source` file tersebut: `source ~/.zshrc`

### Script tidak bisa dijalankan

**Windows (Execution Policy):**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Mac/Linux (Permission):**
```bash
chmod +x script.sh
```

### Aplikasi tidak bisa membaca environment variables

1. Pastikan aplikasi dijalankan di terminal yang sama setelah setup
2. Jika set permanen, pastikan Anda membuka terminal baru
3. Cek dengan `echo $env:ANTHROPIC_AUTH_TOKEN` (Windows) atau `echo $ANTHROPIC_AUTH_TOKEN` (Mac)

---

## 📚 Referensi dan File Terkait

- 📄 [`INSTALASI_WINDOWS.md`](INSTALASI_WINDOWS.md) - Panduan lengkap untuk Windows
- 📄 [`INSTALASI_MAC.md`](INSTALASI_MAC.md) - Panduan lengkap untuk Mac

---

## 🆘 Bantuan

Jika masih mengalami masalah:
1. Cek panduan instalasi spesifik untuk sistem operasi Anda
2. Pastikan API key Anda valid dan belum expired
3. Pastikan BASE URL benar: `https://api.z.ai/api/anthropic`
4. Cek troubleshooting section di panduan instalasi

---

**Selamat menggunakan! 🎉**
