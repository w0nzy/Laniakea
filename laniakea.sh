terminal=""

optional_lib_path=$(pwd)/lib

if [[ -e "qc-pass.txt" ]]; then
	rm qc-pass.txt
fi
if [[ ! -e ${optional_lib_path} ]]; then
	echo "Kütüphane eksik"
	exit 1
fi
if [[ ! -e "qc-pass.txt" ]]; then
	optional_terminal_list=( "xfce4-terminal" "gnome-terminal" )
	for term in ${optional_terminal_list[@]}; do
		which $term > /dev/null 2>&1
		if [[ $? == 0 ]]; then
			terminal=$term
			break
		fi
	done
fi

if [[ ! ${terminal} == "" ]]; then
	echo "qc-pass.txt" > qc-pass.txt
fi

source ${optional_lib_path}/print_utils.sh
print_status "Re-Launching" & 
${terminal} --maximize -e "bash lib/dependicies.sh"
