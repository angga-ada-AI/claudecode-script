# 📘 Panduan Git Push ke GitHub

## 🚀 Langkah-langkah Push Project ke GitHub

### Langkah 1: Inisialisasi Git Repository (Jika belum)

```powershell
# Inisialisasi repository
git init

# Cek status
git status
```

### Langkah 2: Buat Repository di GitHub

1. **Buka browser** dan login ke [GitHub.com](https://github.com)
2. **Klik tombol "+"** (kanan atas) → **"New repository"**
3. **Isi informasi repository:**
   - Repository name: `claudecode-script` (atau nama lain yang Anda inginkan)
   - Description: (opsional) "Script setup Anthropic API environment variables"
   - Pilih **Public** atau **Private**
   - **JANGAN centang** "Initialize with README" (karena kita sudah punya file)
4. **Klik "Create repository"**

### Langkah 3: Add Files ke Git

```powershell
# Add semua file ke staging
git add .

# Atau add file satu per satu:
# git add INSTALASI_MAC.md
# git add INSTALASI_WINDOWS.md
# git add PANDUAN.md
# git add *.ps1
# git add *.sh
# git add .gitignore
```

### Langkah 4: Commit Changes

```powershell
# Commit dengan pesan
git commit -m "Initial commit: Setup script untuk Anthropic API environment variables"
```

**Catatan:** Jika ini pertama kali menggunakan Git, Anda perlu set konfigurasi:
```powershell
git config --global user.name "Nama Anda"
git config --global user.email "email@anda.com"
```

### Langkah 5: Hubungkan ke GitHub Repository

**Setelah membuat repository di GitHub**, Anda akan melihat URL seperti:
- HTTPS: `https://github.com/username/claudecode-script.git`
- SSH: `git@github.com:username/claudecode-script.git`

**Tambahkan remote repository:**
```powershell
# Ganti URL dengan URL repository Anda di GitHub
git remote add origin https://github.com/USERNAME/claudecode-script.git
```

**Verifikasi remote:**
```powershell
git remote -v
```

### Langkah 6: Push ke GitHub

```powershell
# Push ke branch main (atau master tergantung default GitHub Anda)
git push -u origin main
```

**Jika branch Anda adalah `master` (bukan `main`):**
```powershell
git push -u origin master
```

**Jika muncul error karena branch belum ada:**
```powershell
# Rename branch ke main (jika perlu)
git branch -M main

# Push lagi
git push -u origin main
```

### Langkah 7: Verifikasi

Buka browser dan cek repository GitHub Anda. Semua file seharusnya sudah ter-upload.

---

## 🔐 Autentikasi GitHub

### Opsi 1: Personal Access Token (PAT) - Recommended

Jika diminta username dan password:

1. **Buat Personal Access Token:**
   - GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate new token (classic)
   - Beri nama: `claudecode-script`
   - Pilih scopes: **repo** (full control)
   - Generate token
   - **COPY TOKEN** (hanya muncul sekali!)

2. **Saat push, gunakan token sebagai password:**
   - Username: `USERNAME_GITHUB_ANDA`
   - Password: `TOKEN_YANG_BARU_DIBUAT`

### Opsi 2: GitHub CLI

Install GitHub CLI:
```powershell
# Via winget (Windows)
winget install --id GitHub.cli

# Login
gh auth login
```

Kemudian push seperti biasa.

---

## 📝 Command Lengkap (Copy-Paste)

```powershell
# 1. Inisialisasi
git init

# 2. Add files
git add .

# 3. Commit
git commit -m "Initial commit: Setup script untuk Anthropic API"

# 4. Set remote (GANTI URL dengan URL repository Anda!)
git remote add origin https://github.com/USERNAME/claudecode-script.git

# 5. Push
git push -u origin main
```

---

## 🔄 Update Repository di Masa Depan

Setelah push pertama, untuk update berikutnya:

```powershell
# 1. Cek perubahan
git status

# 2. Add perubahan
git add .

# 3. Commit
git commit -m "Deskripsi perubahan"

# 4. Push
git push
```

---

## ❓ Troubleshooting

### Error: "remote origin already exists"

```powershell
# Hapus remote yang lama
git remote remove origin

# Tambahkan lagi dengan URL yang benar
git remote add origin https://github.com/USERNAME/claudecode-script.git
```

### Error: "Permission denied"

- Pastikan Personal Access Token sudah dibuat dan digunakan sebagai password
- Atau gunakan GitHub CLI: `gh auth login`

### Error: "branch 'main' does not exist"

```powershell
# Buat branch main
git branch -M main

# Push lagi
git push -u origin main
```

### Error: "fatal: not a git repository"

Pastikan Anda sudah menjalankan `git init` di folder project.

---

## ⚠️ Keamanan

✅ **File `.gitignore` sudah dibuat** untuk mencegah commit file sensitif seperti:
- API keys
- File `.env`
- File backup

❌ **JANGAN commit file yang berisi API key langsung!**
- Script interaktif sudah aman (API key diinput saat runtime)
- Jangan edit script untuk hardcode API key

---

**Selamat! Project Anda sudah di GitHub! 🎉**

