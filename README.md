# Banunu's dotfiles

This repository contains scripts for managing and linking configuration files in `~/.config` using symbolic links.  

## 📌 Features
- **Easily create symlinks** for configuration directories.  
- **Backup existing configs** before replacing them.  
- **Manage the list of directories** to link via `manage_dirs.sh`.  
- **User-friendly prompts** for choosing directories.  

---

## 🚀 Setup & Usage

### 1️⃣ Clone the Repository  
```sh
git clone https://github.com/kvnbanunu/dotfiles
cd dotfiles
```

### 2️⃣ Manage Your Coonfig List (`dirs.txt`)  
The script reads directories from `dirs.txt`.  
Use `manage_dirs.sh` to **add or remove** directories.

#### **List current directories:**  
```sh
bash manage_dirs.sh
```
#### **Add a new directory:**  
```sh
bash manage_dirs.sh
# Choose option 2 and enter the directory name
```
#### **Remove a directory:**  
```sh
bash manage_dirs.sh
# Choose option 3 and select a directory to remove
```

---

### 3️⃣ Link Configurations (`link.sh`)  
Once your `dirs.txt` is set up, run `link.sh` to create symlinks.

#### **Create symlinks for a single or all directories:**  
```sh
bash link.sh
```
- Choose **option 1** to create a symlink for a single directory.  
- Choose **option 2** to create symlinks for all directories in `dirs.txt`.  
- Choose **option 3** to exit.

🔄 **If a config already exists**, the script **prompts for backup** before replacing it.  

---

## 🔧 Customization
- Edit `dirs.txt` manually if needed.  
- Ensure your config directories are in the same folder as this repo.  

---

## 📝 Example `dirs.txt`
```
hypr
kitty
nvim
waybar
```
- These directories will be linked to `~/.config/`.

---
