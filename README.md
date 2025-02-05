# Pre-Commit Hooks Repository  

Welcome to my **pre-commit-hooks** repository! This repository contains a collection of **custom pre-commit hooks** designed to enforce coding standards, prevent common mistakes, and streamline development workflows.

## 🚀 About  

Pre-commit hooks are Git hooks that run **automatically before each commit** to catch issues early. By integrating these hooks into your workflow, you can improve code quality and enforce best practices **before changes reach your repository**.

## 📂 Hooks Included  

### ✅ Check Filename Whitespace  

- **Folder:** `check_filename_whitespace/`
- **Purpose:** Prevents filenames with spaces from being committed, ensuring consistency and avoiding potential issues in scripts and tooling.

More hooks will be added over time!

## 🔧 Installation & Usage  

To use any of the hooks in this repository, add them to your **.pre-commit-config.yaml** and install pre-commit:

```sh
pip install pre-commit
pre-commit install
```

Each hook has its own folder with specific setup and usage instructions. Refer to the **README** inside each hook's directory for details.

## 💡 Contributing  

Want to contribute a new pre-commit hook? Open a pull request with a new folder and include a **README.md** explaining the hook’s purpose and usage.
