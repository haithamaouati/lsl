#!/data/data/com.termux/files/usr/bin/bash

SHOW_FILES=true
SHOW_DIRS=true

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

color_name() {
    ls --color=always -d "$1" 2>/dev/null | sed 's|.*/||'
}

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

        if [ -d "$item" ]; then
            echo -e "${prefix}${branch}$(color_name "$item")/"
            dir_layout "$item" "$next_prefix"
        else
            if [ ! -r "$item" ]; then
                echo -e "${prefix}${branch}$(color_name "$item") (no access)"
            else
                echo -e "${prefix}${branch}$(color_name "$item")"
            fi
        fi
    done
}

$SHOW_DIRS && echo -e "$(color_name "$start_dir")/"
dir_layout "$start_dir" ""
