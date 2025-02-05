# Pre-Commit Hook: Check for Whitespace in Filenames  

This **pre-commit hook** detects filenames with spaces before committing and **prevents the commit**. It helps enforce clean and consistent filenames by prompting users to rename files **without spaces**.

## 🚀 Setup Instructions  

### 1️⃣ Install Pre-Commit  

Ensure you have **pre-commit** installed:  

```sh
pip install pre-commit
```

### 2️⃣ Add the Hook to Your Pre-Commit Configuration  

Create or modify `.pre-commit-config.yaml` in your repo root:  

```yaml
repos:
  - repo: local
    hooks:
      - id: check-filename-whitespace
        name: Check for whitespace in filenames
        entry: check_filename_whitespace.sh
        language: script
        types: [file]
```

### 3️⃣ Download the Hook Script  

Create a file named `check_filename_whitespace.sh` and paste the following:  

```bash
#!/bin/bash

bad_files=()

for file in "$@"; do
    if [[ "$file" =~ \  ]]; then
        bad_files+=("$file")
    fi
done

if [[ ${#bad_files[@]} -gt 0 ]]; then
    echo -e "\n🚨 ERROR: The following files contain spaces in their names:"
    for file in "${bad_files[@]}"; do
        echo "  - $file"
    done
    echo -e "\n❗ Rename them with one of these methods:\n"
    echo "   🔹 Remove spaces: mv 'file with spaces.txt' 'filewithspaces.txt'"
    echo "   🔹 Use underscores: mv 'file with spaces.txt' 'file_with_spaces.txt'"
    echo "   🔹 Manually rename: mv 'file with spaces.txt' 'your_choice.txt'"
    echo -e "\nThen re-add and commit again.\n"
    exit 1
fi

exit 0
```

### 4️⃣ Make the Script Executable  

```sh
chmod +x check_filename_whitespace.sh
```

### 5️⃣ Install the Pre-Commit Hook  

```sh
pre-commit install
```

---

## 📌 Usage Instructions  

### ✅ Running the Hook Automatically  

This hook will **automatically check filenames** every time you commit. If a filename has spaces, the commit will be **blocked**.

### 🔄 Running the Hook Manually  

To check filenames before committing:  

```sh
pre-commit run --all-files
```

### ❌ Handling Blocked Commits  

1. Rename the files:  

   ```sh
   mv "file with spaces.txt" "filewithspaces.txt"
   ```

2. **Re-add the files**:  

   ```sh
   git add filewithspaces.txt
   ```

3. **Commit again**:  

   ```sh
   git commit -m "Renamed files to remove spaces"
   ```

---

## 🔧 Uninstalling the Hook  

To remove the hook:  

```sh
pre-commit uninstall
```

---

## ❓ Why Use This Hook?  

✔ Prevents **filename issues** in scripts and build systems.  
✔ Ensures **clean, predictable filenames** in your repository.  
✔ Encourages **consistent formatting** without enforcing a specific renaming style.  

---

Now you're all set to use this **pre-commit hook** to enforce clean filenames in your repo! 🚀  
