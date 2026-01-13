#!/data/data/com.termux/files/usr/bin/bash

SHOW_FILES=true
SHOW_DIRS=true
SHOW_TREE=false

die() {
    echo "error: $1" >&2
    exit 1
}

warn() {
    echo "warning: $1" >&2
}

show_help() {
    cat <<EOF
Usage: lsl [OPTION]... [DIRECTORY]

Options:
  -f, --file        show files only
  -d, --directory   show directories only
  -t, --tree        show full recursive tree (default is current directory only)
  -h, --help        show this help message
EOF
}

# parse flags
while [[ "$1" == -* ]]; do
    case "$1" in
        -f|--file) SHOW_DIRS=false ;;
        -d|--directory) SHOW_FILES=false ;;
        -t|--tree) SHOW_TREE=true ;;
        -h|--help) show_help; exit 0 ;;
        *) die "unknown option '$1'" ;;
    esac
    shift
done

start_dir="${1:-.}"

[ -e "$start_dir" ] || die "path does not exist: $start_dir"
[ -d "$start_dir" ] || die "not a directory: $start_dir"
[ -r "$start_dir" ] || warn "no read permission: $start_dir"

# normalize start_dir to absolute canonical path
start_dir="$(cd "$start_dir" 2>/dev/null && pwd -P)" || die "cannot access directory"

# ensure LS_COLORS exists
if [ -z "$LS_COLORS" ] && command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors)"
fi

color_name() {
    local path="$1"
    local dir base

    dir="$(dirname "$path")"
    base="$(basename "$path")"

    (cd "$dir" 2>/dev/null && ls --color=always -d "$base") 2>/dev/null
}

dir_layout() {
    local dir="$1"
    local prefix="$2"
    local items=()

    [ -r "$dir" ] || { warn "cannot read directory: $dir"; return; }

    for item in "$dir"/*; do
        [ -e "$item" ] || continue

        if [ -d "$item" ] && $SHOW_DIRS; then
            items+=("$item")
        elif [ -f "$item" ] && $SHOW_FILES; then
            items+=("$item")
        fi
    done

    local count=${#items[@]}
    local i=0

    for item in "${items[@]}"; do
        i=$((i + 1))

        if [ "$i" -eq "$count" ]; then
            branch="└── "
            next_prefix="${prefix}    "
        else
            branch="├── "
            next_prefix="${prefix}│   "
        fi

        if [ -d "$item" ]; then
            echo -e "${prefix}${branch}$(color_name "$item")/"
            if $SHOW_TREE; then
                dir_layout "$item" "$next_prefix"
            fi
        else
            if [ ! -r "$item" ]; then
                echo -e "${prefix}${branch}$(color_name "$item") (no access)"
            else
                echo -e "${prefix}${branch}$(color_name "$item")"
            fi
        fi
    done
}

# print root
$SHOW_DIRS && echo -e "$(color_name "$start_dir")/"
dir_layout "$start_dir" ""
