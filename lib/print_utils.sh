color[0]="\e[1;0m"
color[1]="\e[1;31m"
color[2]="\e[1;32m"
color[3]="\e[1;33m"
color[4]="\e[1;34m"
color[5]="\e[1;96m"
print_status() {
	echo -e "${color[4]}[*]${color[0]} ${@}${color[0]}"
}

print_failure() {
	echo -e "${color[4]}[-]${color[1]} ${@}${color[0]}"
}

print_succes() {
	echo -e "${color[4]}[+]${color[5]} ${@}${color[0]}"
}

print_warning() {
	echo -e "${color[4]}[!]${color[1]} ${@}${color[0]}"
}
print_center() {
	col_size=$(tput cols)
	col_size_arithmetic=$(($col_size/2-13))
	pad=$(printf "%*s" ${col_size_arithmetic})
	echo -e "${pad}${@}"
}
