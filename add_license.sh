#!/bin/bash
count=0
license="./license"
autor="undefined"
while [[ $# -gt 0 ]] && [[ "$1" == "-"* ]]; do
    opt="$1"; shift;
    case "$opt" in
        "-h") echo "Example use script: ./add_license.sh [-h help] [-f ./license ] [-autor 'Oleg Neoleg'] ./my_project"; exit 0;;
        "-f") license="$1"; shift;;
        "-autor") autor="$1"; shift;;
    esac
done
if [[ "$1" != "" ]]; then 
    for i in $(find $1 2> tmpf -exec file {} + | awk -F: '{print $1}'); do
        case $(echo $i | grep -oE "\.[a-zA-Z0-9]*$") in
            ".py" | ".sh" )
            filename=$(echo $i | grep -oE '[a-zA-Z0-9\_\-]*\.?[a-zA-Z0-9]*$')
            project_path=$(echo $1 | grep -oE '[a-zA-Z0-9\_\-]*\/?$' | sed 's/\///')
            python3 ./helper.py --license_path "$license" --root_folder "$project_path" --file_owner "$autor" --filename "$filename"
            if !( grep -E "([Cc]opyright|[Ll]icense)" $i > /dev/null ); then
                if [ -e ./license_tmp ]; then
                    if $(grep -E "\#\!\/" $i > /dev/null); then
                        sed -i -e "2 s/^/\n/" -e "2e cat ./license_tmp"  $i
                    else
                        sed -i -e "1 s/^/\n/" -e "1e cat ./license_tmp"  $i
                        if (file $i | grep "empty" > /dev/null); then
                            cat ./license_tmp > $i
                        fi 
                    fi
                    echo $(date) $i >> ./log
                else
                    echo "No file license in directory with script!"
                    exit 1
                fi
            (( count++ ))
            fi;;
        esac
    done
    if [ -s ./tmpf ]; then echo "Failed find path project";rm ./tmpf 2> /dev/null; exit 1; fi
    echo "Added license in $count files, and edit files save in log file"; rm ./tmp ./tmpa ./tmpb ./tmpf ./license_tmp 2> /dev/null;
else
    echo "No set path in arg for license project"
fi