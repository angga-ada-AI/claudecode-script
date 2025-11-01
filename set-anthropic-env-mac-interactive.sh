#!/bin/bash

# set-anthropic-env-mac-interactive.sh
# Script interaktif untuk Mac: Mengatur Anthropic API environment variables
# Versi dengan prompt untuk input API key

echo "🍎 Anthropic API Environment Variables Setup untuk Mac"
echo "======================================================"
echo ""

# Deteksi shell yang digunakan
CURRENT_SHELL=$(echo $SHELL)
if [[ "$CURRENT_SHELL" == *"zsh"* ]]; then
    SHELL_TYPE="zsh"
    SHELL_CONFIG="$HOME/.zshrc"
elif [[ "$CURRENT_SHELL" == *"bash"* ]]; then
    SHELL_TYPE="bash"
    if [ -f "$HOME/.bash_profile" ]; then
        SHELL_CONFIG="$HOME/.bash_profile"
    else
        SHELL_CONFIG="$HOME/.bashrc"
    fi
else
    SHELL_TYPE="unknown"
    SHELL_CONFIG=""
fi

echo "📌 Shell yang terdeteksi: $SHELL_TYPE"
echo ""

# Prompt untuk API key
read -p "🔑 Masukkan API key Anda: " API_KEY

if [ -z "$API_KEY" ]; then
    echo "❌ Error: API key tidak boleh kosong!"
    exit 1
fi

# Set environment variables untuk session saat ini
export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"

echo ""
echo "✅ Environment variables sudah di-set untuk session terminal saat ini!"
echo "   ANTHROPIC_BASE_URL = $ANTHROPIC_BASE_URL"
echo "   ANTHROPIC_AUTH_TOKEN = [HIDDEN FOR SECURITY]"
echo ""

# Tanya apakah ingin set permanen
read -p "❓ Apakah Anda ingin menyimpan ini secara permanen? (y/n): " SAVE_PERMANENT

if [[ "$SAVE_PERMANENT" =~ ^[Yy]$ ]]; then
    if [ -z "$SHELL_CONFIG" ]; then
        echo "❌ Tidak bisa menentukan file konfigurasi shell Anda."
        exit 1
    fi
    
    echo ""
    echo "📝 Menambahkan ke $SHELL_CONFIG..."
    
    # Cek apakah sudah ada konfigurasi yang sama
    if grep -q "ANTHROPIC_BASE_URL" "$SHELL_CONFIG" 2>/dev/null; then
        echo "⚠️  Environment variables sudah ada di $SHELL_CONFIG"
        echo "   Edit file tersebut secara manual untuk mengupdate API key."
    else
        # Tambahkan ke file konfigurasi
        echo "" >> "$SHELL_CONFIG"
        echo "# Anthropic API Configuration (via Z.AI)" >> "$SHELL_CONFIG"
        echo "export ANTHROPIC_BASE_URL=\"https://api.z.ai/api/anthropic\"" >> "$SHELL_CONFIG"
        echo "export ANTHROPIC_AUTH_TOKEN=\"$API_KEY\"" >> "$SHELL_CONFIG"
        
        echo "✅ Berhasil ditambahkan ke $SHELL_CONFIG"
        echo ""
        echo "💡 Untuk menggunakan di terminal baru, jalankan:"
        if [ "$SHELL_TYPE" == "zsh" ]; then
            echo "   source ~/.zshrc"
        elif [ "$SHELL_TYPE" == "bash" ]; then
            if [ -f "$HOME/.bash_profile" ]; then
                echo "   source ~/.bash_profile"
            else
                echo "   source ~/.bashrc"
            fi
        fi
    fi
else
    echo ""
    echo "ℹ️  Environment variables hanya berlaku untuk terminal saat ini."
    echo "   Untuk set permanen, jalankan script ini lagi dan pilih 'y'."
fi

echo ""
echo "✨ Setup selesai!"

