#!/data/data/com.termux/files/usr/bin/bash

BLUE="\e[34m"
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

SHOW_FILES=true
SHOW_DIRS=true

die() {
    echo -e "${RED}error:${RESET} $1" >&2
    exit 1
}

warn() {
    echo -e "${RED}warning:${RESET} $1" >&2
}

show_help() {
    cat <<EOF
Usage: lsl [OPTION]... [DIRECTORY]

Options:
  -f, --file        show files only
  -d, --directory   show directories only
  -h, --help        show this help message
EOF
}

# parse flags
while [[ "$1" == -* ]]; do
    case "$1" in
        -f|--file)
            SHOW_DIRS=false
            ;;
        -d|--directory)
            SHOW_FILES=false
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            die "unknown option '$1'"
            ;;
    esac
    shift
done

start_dir="${1:-.}"

[ -e "$start_dir" ] || die "path does not exist: $start_dir"
[ -d "$start_dir" ] || die "not a directory: $start_dir"
[ -r "$start_dir" ] || warn "no read permission: $start_dir"

dir_layout() {
    local dir="$1"
    local prefix="$2"
    local visible_items=()

    if [ ! -r "$dir" ]; then
        warn "cannot read directory: $dir"
        return
    fi

    for item in "$dir"/*; do
        [ -e "$item" ] || continue

        if [ -d "$item" ] && $SHOW_DIRS; then
            visible_items+=("$item")
        elif [ -f "$item" ] && $SHOW_FILES; then
            visible_items+=("$item")
        fi
    done

    local count=${#visible_items[@]}
    local i=0

    for item in "${visible_items[@]}"; do
        i=$((i + 1))

        if [ "$i" -eq "$count" ]; then
            branch="└── "
            next_prefix="${prefix}    "
        else
            branch="├── "
            next_prefix="${prefix}│   "
        fi

        name="$(basename "$item")"

        if [ -d "$item" ]; then
            echo -e "${prefix}${branch}${BLUE}${name}/${RESET}"
            dir_layout "$item" "$next_prefix"
        else
            if [ ! -r "$item" ]; then
                echo -e "${prefix}${branch}${RED}${name} (no access)${RESET}"
            elif [ -x "$item" ]; then
                echo -e "${prefix}${branch}${GREEN}${name}${RESET}"
            else
                echo "${prefix}${branch}${name}"
            fi
        fi
    done
}

$SHOW_DIRS && echo -e "${BLUE}$(basename "$(realpath "$start_dir")")/${RESET}"
dir_layout "$start_dir" ""
