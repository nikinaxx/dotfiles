# -----------------------------------------------------
# INIT
# -----------------------------------------------------

# -----------------------------------------------------
# Path
# -----------------------------------------------------
# Keep entries unique, so nested shells don't keep appending
typeset -U path PATH
path=(/usr/lib/ccache/bin ${path%/} ~/.cargo/bin ~/.local/bin)
