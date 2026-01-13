# lsl

`lsl` — a simple, Termux-colored directory lister that displays files and directories in a tree-like format, with optional recursive view.

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
- Show the directories and files of current directory:
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
- Show full recursive tree (default is current directory only)
```
./lsl -t
```

## Environment
- Tested on [Termux](https://termux.dev/en/)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=haithamaouati/lsl&type=date&legend=top-left)](https://www.star-history.com/#haithamaouati/lsl&type=date&legend=top-left)

### Find this repository useful? ♥️
Support it by joining the [stargazers](https://github.com/haithamaouati/lsl/stargazers). ⭐

If you want to help even more, please spread the word — share the project on X, Reddit, or with your community so more people discover it.

And [follow me](https://github.com/haithamaouati) to keep up with future updates and projects. 🤩
