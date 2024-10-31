#!/bin/bash

# Membuat direktori backup jika belum ada
mkdir -p backup

# Mendapatkan timestamp
timestamp=$(date +%Y%m%d_%H%M%S)

# Membuat direktori untuk backup source code
mkdir -p backup/source_$timestamp

# Backup database
cp SecureWeb.db backup/SecureWeb_$timestamp.db

# Backup source code (kecuali folder bin, obj, dan backup)
rsync -av --exclude 'bin' --exclude 'obj' --exclude 'backup' --exclude '.git' ./ backup/source_$timestamp/

echo "Backup selesai. Files tersimpan di folder backup/"