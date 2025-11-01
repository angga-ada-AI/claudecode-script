# 🍎 Panduan Instalasi untuk Mac

## 📋 Script yang Tersedia

**`set-anthropic-env-mac-interactive.sh`** - Script Interaktif ⭐

- Script dengan prompt interaktif
- Langsung masukkan API key saat dijalankan
- Bisa set permanen langsung dari script
- Deteksi shell otomatis (zsh/bash)
- Validasi input

---

## 🚀 Cara Menggunakan

### Opsi 1: Script Interaktif (Direkomendasikan) ⭐

**Cara termudah - tidak perlu edit file!**

1. **Buka Terminal** di Mac

2. **Navigasi ke folder** script:
   ```bash
   cd /path/to/claudecode-script
   ```
   (Ganti `/path/to/` dengan path folder Anda)

3. **Buat script executable**:
   ```bash
   chmod +x set-anthropic-env-mac-interactive.sh
   ```

4. **Jalankan script**:
   ```bash
   ./set-anthropic-env-mac-interactive.sh
   ```

5. **Ikuti instruksi**:
   - Masukkan API key Anda saat diminta
   - Pilih apakah ingin menyimpan secara permanen (y/n)

6. **Selesai!** ✅

**Contoh output:**
```
🍎 Anthropic API Environment Variables Setup untuk Mac
======================================================

📌 Shell yang terdeteksi: zsh

🔑 Masukkan API key Z.AI Anda: sk-ant-xxxxx...

✅ Environment variables sudah di-set untuk session terminal saat ini!
   ANTHROPIC_BASE_URL = https://api.z.ai/api/anthropic
   ANTHROPIC_AUTH_TOKEN = [HIDDEN FOR SECURITY]

❓ Apakah Anda ingin menyimpan ini secara permanen? (y/n): y

📝 Menambahkan ke /Users/nama/.zshrc...
✅ Berhasil ditambahkan ke /Users/nama/.zshrc
```

---

### Opsi 2: Copy-Paste Langsung (Tanpa File Script) ⚡

**Paling cepat - tidak perlu file script sama sekali!**

1. **Buka Terminal** di Mac

2. **Copy-paste command berikut**:
   ```bash
   export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
   export ANTHROPIC_AUTH_TOKEN="API_KEY_ANDA_DISINI"
   ```

3. **Ganti** `"API_KEY_ANDA_DISINI"` dengan API key Anda yang sebenarnya dari Z.AI

4. **Paste ke Terminal** dan tekan Enter

5. **Selesai!** ✅

**Catatan:** Environment variables hanya berlaku untuk terminal yang sedang dibuka. Jika tutup terminal, perlu copy-paste ulang.

**Untuk set permanen secara manual:**
- Edit `~/.zshrc` (untuk zsh) atau `~/.bash_profile` (untuk bash)
- Tambahkan 2 baris export di atas
- Jalankan `source ~/.zshrc` atau `source ~/.bash_profile`

---

## ✅ Verifikasi

Setelah menjalankan script, verifikasi dengan:

```bash
echo "ANTHROPIC_BASE_URL = $ANTHROPIC_BASE_URL"
echo "ANTHROPIC_AUTH_TOKEN is set: ${ANTHROPIC_AUTH_TOKEN:+yes}"
```

Jika berhasil, Anda akan melihat:
```
ANTHROPIC_BASE_URL = https://api.z.ai/api/anthropic
ANTHROPIC_AUTH_TOKEN is set: yes
```

---

## 🔧 Troubleshooting

### Script tidak bisa dijalankan (Permission denied)

```bash
chmod +x set-anthropic-env-mac-interactive.sh
```

### Environment variables tidak tersimpan

- Jika menggunakan script interaktif, pastikan menjalankan dengan `./set-anthropic-env-mac-interactive.sh` (bukan dengan `source`)
- Script interaktif otomatis akan export variables ke session saat ini
- Jika set permanen, pastikan Anda membuka terminal baru atau reload dengan `source ~/.zshrc`

### Ingin menghapus dari konfigurasi permanen

Edit file konfigurasi shell Anda:
```bash
nano ~/.zshrc  # untuk zsh
# atau
nano ~/.bash_profile  # untuk bash
```

Hapus baris yang berisi `ANTHROPIC_BASE_URL` dan `ANTHROPIC_AUTH_TOKEN`, lalu:
```bash
source ~/.zshrc  # reload konfigurasi
```

---

## 💡 Tips

1. **Gunakan script interaktif** untuk pengalaman yang lebih mudah
2. **Set permanen** agar tidak perlu setup ulang setiap buka terminal baru
3. **Jangan commit API key** ke Git repository
4. **Simpan API key dengan aman** - jangan share dengan orang lain

---

## 📚 Referensi

Lihat juga:
- `README.md` - Panduan lengkap dalam bahasa Indonesia


