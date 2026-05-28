# 🛠️ CaggyTools v1.0

**All-in-One Windows Tools** untuk mempermudah maintenance Windows Anda.

![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11-blue)
![License](https://img.shields.io/badge/license-MIT-green)

---

## ✨ Fitur Utama

| Fitur | Deskripsi |
|-------|-----------|
| 🔑 **Aktivasi Windows** | Menggunakan Microsoft Activation Scripts (MAS) |
| ⏸️ **Stop Update** | Nonaktifkan Windows Update secara permanen hingga tahun 2077 |
| 📦 **Aktivasi Office** | Aktivasi Microsoft Office via KeyMS |
| 🌐 **Install Browser** | Download & install otomatis 6 browser populer |

### 🌐 Browser yang Didukung
- ✅ Google Chrome
- ✅ Brave Browser
- ✅ Mozilla Firefox
- ✅ Opera
- ✅ Vivaldi
- ✅ Microsoft Edge

---

## 🚀 Cara Menggunakan (Copy-Paste Sekali Jalan)

### ⚡ Metode 1: Command Prompt (CMD) - PALING SIMPEL
Buka **CMD sebagai Administrator**, lalu copy-paste perintah ini:
```cmd
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/caggystudios/caggytools/main/CaggyTools.bat' -OutFile '%TEMP%\CaggyTools.bat'; Start-Process '%TEMP%\CaggyTools.bat' -Verb RunAs"
```

### ⚡ Metode 2: PowerShell - PALING CEPAT
Buka **PowerShell sebagai Administrator**, lalu copy-paste perintah ini:
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/caggystudios/caggytools/main/CaggyTools.bat" -OutFile "$env:TEMP\CaggyTools.bat"; Start-Process "$env:TEMP\CaggyTools.bat" -Verb RunAs
```

### 📥 Metode 3: Download Manual (Alternatif)
1. Download file [CaggyTools.bat](https://raw.githubusercontent.com/caggystudios/caggytools/main/CaggyTools.bat)
2. **Klik kanan** → **Run as Administrator**
3. Pilih menu yang diinginkan

---

## 📸 Tutorial Singkat

### Cara Buka CMD/PowerShell sebagai Administrator:
1. Tekan tombol **Windows** di keyboard
2. Ketik `cmd` atau `powershell`
3. **Klik kanan** pada hasil pencarian
4. Pilih **Run as Administrator**
5. Copy-paste perintah di atas → Enter

### Preview Menu CaggyTools:
```
╔═════════════════════════════════════╗
║         MENU UTAMA CAGGYTOOLS       ║
╠═════════════════════════════════════╣
║  [1] Aktivasi Windows               ║
║  [2] Stop Update Windows (s/d 2077) ║
║  [3] Aktivasi Microsoft Office      ║
║  [4] Download & Install Browser     ║
║  [5] Keluar                         ║
╚═════════════════════════════════════╝
```
