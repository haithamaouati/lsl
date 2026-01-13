# lsl

`lsl` is a lightweight Bash script that displays directory structures in a tree-like format.  
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

1. Copy the `lsl` script to your Termux environment.
2. Make it executable:

```bash
chmod +x lsl.sh
```
3. Run it:
```
./lsl
```
4. Usage:
```
./lsl [OPTION]... [DIRECTORY]
```
###### Examples:
- Show full tree of current directory:
```
./lsl
```
- Show only files:
```
./lsl -f
```
- Show only directories:
```
./lsl -d
```
- Specify a directory:
```
./lsl /sdcard
```
> [!NOTE]  
> - Executable files are highlighted in green.
> - Directories are highlighted in blue.
> - Items without read permissions are indicated in red.

## Environment
- Tested on [Termux](https://termux.dev/en/)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=haithamaouati/lsl&type=date&legend=top-left)](https://www.star-history.com/#haithamaouati/lsl&type=date&legend=top-left)

### Find this repository useful? ❤️
Support it by joining the [stargazers](https://github.com/haithamaouati/lsl/stargazers). ⭐

If you want to help even more, please spread the word — share the project on X, Reddit, or with your community so more people discover it.

And [follow me](https://github.com/haithamaouati) to keep up with future updates and projects. 🤩
