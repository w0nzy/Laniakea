#!/usr/bin/env bash
source $(pwd)/lib/print_utils.sh
function check_dependicies() {
	sleep 1
	print_center "Gerekli olan gereksininimler kontrol ediliyor.."
	dots="..................................."
	dots_lenght=${#dots}
	optional_tools=(
		"aireplay-ng"
		"cowpatty"
		"lsusb"
		"lspci"
		"iwconfig"
		"ifconfig"
		"airmon-ng"
		"aircrack-ng"
		"lsgj"
		)
	for tool_ in ${optional_tools[@]}; do
		which $tool_ > /dev/null 2>&1
		if [[ $? == 0 ]]; then
			tool_len=${#tool_}
			ok_msg="${color[3]}[${color[5]}OK${color[3]}]${color[0]}"
			edited_dots=${dots:${tool_len}}
			full_text=${color[3]}${tool_}${color[5]}${edited_dots}${ok_msg}
			print_center ${full_text}
		else
			fail_msg="${color[3]}[${color[1]}FAIL${color[3]}]${color[0]}"
			tool_len=${#tool_}
			ok_msg="${color[3]}[${color[5]}OK${color[3]}]${color[0]}"
			dots_aritchmetic=$(($dots_lenght-${#fail_msg}))
			edited_dots=${dots:${tool_len}:${dots_aritchmetic}}
			full_text=${color[3]}${tool_}${color[5]}${edited_dots}${fail_msg}
			print_center ${full_text}
		fi
		sleep 0.1
	done
read
}
check_dependicies