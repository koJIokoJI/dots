show_main_menu() {
	choices=("apps" "themes")
	choice=$(printf '%s\n' "${choices[@]}" | wofi --show dmenu --prompt "...")
	case "$choice" in
		"apps")
			show_apps
			;;
		"themes")
			show_themes
			;;
		"")
			exit
			;;
	esac
}

show_apps() {
		wofi --show drun
		exit
}

show_themes() {
	WALLPAPERS_DIR=$HOME/Pictures/Wallpapers
	WALLPAPERS=$(find ${WALLPAPERS_DIR} -type f \( \
	    -iname "*.jpg"  -o \
	    -iname "*.jpeg" -o \
	    -iname "*.png" \))
	for wallpaper in "${!WALLPAPERS[@]}"; do
		WALLPAPERS[i]=${WALLPAPERS[i]//"$WALLPAPERS_DIR/"/}
	done
	
	back="back"
	choices=("${back}" "${WALLPAPERS[@]}")
	choice=$(printf '%s\n' "${choices[@]}" | wofi --show dmenu --prompt "select theme:")
	echo $choice

	case "$choice" in
		"${back}")
			show_main_menu
			;;
		"")
			exit
			;;
	esac

	choice="${WALLPAPERS_DIR}/${choice}"
	echo $choice

	awww img -t outer --transition-duration 0 --resize fit $choice

	wal -i $choice

	pywalfox update

	pywal-discord

	walogram -s

	pkill waybar
	waybar & disown

	hyprctl reload
}

show_main_menu
