#$1 is a direcotory of generes (directory which contains directories)
#$2 can be "list_files" to list which files has been found
     # or "confirm" if you want do delete files which has been found
     # or "list_incomplete" to list which incomplete directories has been found
     # or "remove_incomplete" to remove incomplete directory

AD_REMOVER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/ad_remover.sh"

cd $1
if [ $? -ne 0 ]; then
    echo "path $1 doesn't exists"
    exit 1
fi

if [ "$2" == "list_files" ] || [ "$2" == "confirm" ] || [ "$2" == "list_incomplete" ] || [ "$2" == "remove_incomplete" ]; then
    true
else
    echo "second parameter missing"
    exit 2
fi 

for genere in *; do
    if [ "$2" == "list_files" ]; then
        bash $AD_REMOVER "$genere" 
    elif [ "$2" == "confirm" ]; then
        bash $AD_REMOVER "$genere" $2
    elif [ "$2" == "list_incomplete" ]; then
        ls -ld "$genere"/incomplete 2>/dev/null >&2
        if [ $? -eq 0 ]; then
            echo $genere yes
        else
            echo $genere no
        fi 
    elif [ "$2" == "remove_incomplete" ]; then
        rm -rf "$genere"/incomplete
    fi
done


