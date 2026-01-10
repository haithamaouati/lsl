# Layout

`layout` is a lightweight Bash script that displays directory structures in a tree-like format.  
It supports ANSI colors for directories and executable files, and provides options to filter output.

---

## Features

- Show directories in **blue**.
- Show executable files in **green**.
- Handle inaccessible files and directories gracefully.
- Supports simple flags:
  - `-f`, `--file` — show files only
  - `-d`, `--directory` — show directories only
  - `-h`, `--help` — display help message

---

## Installation

1. Copy the `layout` script to your Termux environment.
2. Make it executable:

```bash
chmod +x layout.sh
```
3. Run it:
```
./layout
```
4. Usage:
```
./layout [OPTION]... [DIRECTORY]
```
###### Examples:
- Show full tree of current directory:
```
./layout
```
- Show only files:
```
./layout -f
```
- Show only directories:
```
./layout -d
```
- Specify a directory:
```
./layout /sdcard
```
> [!NOTE]  
> - Executable files are highlighted in green.
> - Directories are highlighted in blue.
> - Items without read permissions are indicated in red.

## Environment
- Tested on [Termux](https://termux.dev/en/)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=haithamaouati/layout&type=date&legend=top-left)](https://www.star-history.com/#haithamaouati/layout&type=date&legend=top-left)

### Find this repository useful? ❤️
Support it by joining the [stargazers](https://github.com/haithamaouati/layout/stargazers). ⭐

If you want to help even more, please spread the word — share the project on X, Reddit, or with your community so more people discover it.

And [follow me](https://github.com/haithamaouati) to keep up with future updates and projects. 🤩
