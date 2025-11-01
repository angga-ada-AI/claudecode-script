# 🪟 Panduan Instalasi untuk Windows

## 📋 Daftar Script yang Tersedia

Ada beberapa cara untuk mengatur environment variables di Windows:

### 1. Copy-Paste Langsung (Paling Cepat) ⚡
- Tidak perlu file script
- Langsung copy-paste command ke PowerShell

### 2. `set-anthropic-env-windows-interactive.ps1` - Script Interaktif ⭐ RECOMMENDED
- Script dengan prompt interaktif
- Langsung masukkan API key saat dijalankan
- Bisa set permanen langsung dari script

---

## 🚀 Cara Menggunakan

### Opsi A: Copy-Paste Langsung (Paling Cepat) ⚡

**Tidak perlu file script!**

1. **Buka PowerShell** di Windows

2. **Copy command berikut**:
   ```powershell
   $env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
   $env:ANTHROPIC_AUTH_TOKEN = "API_KEY_ANDA_DISINI"
   ```

3. **Ganti** `"API_KEY_ANDA_DISINI"` dengan API key Anda yang sebenarnya

4. **Paste ke PowerShell** dan tekan Enter

5. **Selesai!** ✅

**Catatan:** Environment variables hanya berlaku untuk PowerShell session saat ini. Jika tutup PowerShell, perlu set ulang.

---

### Opsi B: Script Interaktif (Paling Mudah dengan File) ⭐

**Script interaktif dengan prompt - tidak perlu edit file!**

1. **Buka PowerShell** di Windows

2. **Navigasi ke folder** script:
   ```powershell
   cd C:\Users\Dell\Downloads\claudecode-script
   ```
   (Ganti path sesuai lokasi folder Anda)

3. **Jalankan script**:
   ```powershell
   .\set-anthropic-env-windows-interactive.ps1
   ```

4. **Ikuti instruksi**:
   - Masukkan API key Anda saat diminta
   - Pilih apakah ingin menyimpan secara permanen (y/n)

5. **Selesai!** ✅

**Contoh output:**
```
🪟 Anthropic API Environment Variables Setup untuk Windows
========================================================

🔑 Masukkan API key Z.AI Anda: sk-ant-xxxxx...

✅ Environment variables sudah di-set untuk session PowerShell saat ini!
   ANTHROPIC_BASE_URL = https://api.z.ai/api/anthropic
   ANTHROPIC_AUTH_TOKEN = [HIDDEN FOR SECURITY]

❓ Apakah Anda ingin menyimpan ini secara permanen? (y/n): y

📝 Menambahkan ke Environment Variables sistem Windows...
✅ Berhasil disimpan secara permanen!

✨ Setup selesai!
```

**Keuntungan:** 
- Tidak perlu edit file
- Bisa set permanen langsung dari script
- Lebih aman (API key tidak tersimpan di file)

**Jika mendapat error Execution Policy:**

Jika muncul error seperti:
```
.\set-anthropic-env-windows-interactive.ps1 : File tidak dapat dimuat karena skrip di sistem ini dinonaktifkan
```

**Solusi:** Jalankan ini di PowerShell (sebagai Administrator):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Kemudian coba jalankan script lagi.

---

### Opsi C: Mengatur Permanen Manual (Melalui GUI)

Untuk membuat environment variables tersedia di semua terminal baru:

1. Tekan `Win + R`, ketik `sysdm.cpl`, tekan Enter

2. Klik tab **Advanced** → **Environment Variables**

3. Di bagian **User variables** (atas), klik **New**

4. Tambahkan variable pertama:
   - Variable name: `ANTHROPIC_BASE_URL`
   - Variable value: `https://api.z.ai/api/anthropic`
   - Klik **OK**

5. Klik **New** lagi, tambahkan variable kedua:
   - Variable name: `ANTHROPIC_AUTH_TOKEN`
   - Variable value: `your_zai_api_key` (ganti dengan API key Anda)
   - Klik **OK**

6. Klik **OK** untuk menutup semua dialog

7. **Buka PowerShell baru** untuk menggunakan environment variables

**Catatan:** 
- Environment variables yang di-set permanen akan tersedia di semua terminal baru
- Terminal yang sudah terbuka perlu ditutup dan dibuka lagi

---

## ✅ Verifikasi

Setelah menjalankan script, verifikasi dengan:

```powershell
echo "ANTHROPIC_BASE_URL = $env:ANTHROPIC_BASE_URL"
echo "ANTHROPIC_AUTH_TOKEN is set: $([bool]$env:ANTHROPIC_AUTH_TOKEN)"
```

Jika berhasil, Anda akan melihat:
```
ANTHROPIC_BASE_URL = https://api.z.ai/api/anthropic
ANTHROPIC_AUTH_TOKEN is set: True
```

Atau untuk melihat semua environment variables yang terkait:
```powershell
Get-ChildItem Env: | Where-Object {$_.Name -like "ANTHROPIC*"}
```

---

## 🔧 Troubleshooting

### Script tidak bisa dijalankan (Execution Policy)

**Error:**
```
.\set-anthropic-env-windows-interactive.ps1 : File tidak dapat dimuat karena skrip di sistem ini dinonaktifkan
```

**Solusi 1: Set Execution Policy untuk Current User (Direkomendasikan)**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Solusi 2: Bypass untuk session saat ini**
```powershell
powershell -ExecutionPolicy Bypass -File .\set-anthropic-env-windows-interactive.ps1
```

**Solusi 3: Unblock file (jika didownload dari internet)**
```powershell
Unblock-File .\set-anthropic-env-windows-interactive.ps1
```

### Environment variables tidak tersimpan

- Pastikan Anda menjalankan PowerShell (bukan Command Prompt)
- Untuk set permanen, pastikan Anda menjalankan sebagai Administrator atau set via GUI

### Variables tidak muncul di terminal baru

- Jika set permanen, pastikan Anda membuka PowerShell baru (tutup dan buka lagi)
- Untuk set permanen via script, pastikan tidak ada error saat menjalankan

### Ingin menghapus environment variables permanen

**Via PowerShell:**
```powershell
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", $null, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", $null, [System.EnvironmentVariableTarget]::User)
```

**Via GUI:**
1. `Win + R` → `sysdm.cpl` → Enter
2. Advanced → Environment Variables
3. Pilih variable → Delete

---

## 💡 Tips

1. **Gunakan script interaktif** untuk pengalaman yang lebih mudah
2. **Set permanen** agar tidak perlu setup ulang setiap buka terminal baru
3. **Jangan commit API key** ke Git repository
4. **Simpan API key dengan aman** - jangan share dengan orang lain
5. **Untuk development**, bisa pakai session saja (tidak perlu permanen)
6. **Untuk production**, lebih baik set permanen atau gunakan sistem manajemen secret

---

## 🔐 Keamanan

- ✅ **JANGAN** commit API key ke Git atau version control
- ✅ **JANGAN** share API key dengan orang lain
- ✅ **GUNAKAN** environment variables, jangan hardcode di kode
- ✅ **RESTRICT** permission file yang berisi API key
- ✅ **REVIEW** file `.gitignore` untuk memastikan file sensitif tidak ter-commit

---

## 📚 Referensi

Lihat juga:
- `README.md` - Panduan lengkap dalam bahasa Indonesia
- `INSTALASI_MAC.md` - Panduan untuk Mac (jika perlu)

---

## 🆘 Bantuan Tambahan

Jika masih mengalami masalah:
1. Pastikan PowerShell versi 5.1 atau lebih baru (cek dengan `$PSVersionTable`)
2. Pastikan Anda memiliki izin untuk mengatur environment variables
3. Coba jalankan PowerShell sebagai Administrator
4. Periksa firewall atau antivirus yang mungkin memblokir script

---

**Selamat menggunakan! 🎉**

