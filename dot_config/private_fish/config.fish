if test -n "$DESKTOP_SESSION"
	starship init fish | source

	set -gx (gnome-keyring-daemon --start | string split "=")
	set -gx EDITOR vim
end
fish_add_path /home/freopen/.cargo/bin
