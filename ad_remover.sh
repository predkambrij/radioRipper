if [ $# -eq 1 ] || [ $# -eq 2 ]; then
    true
else
    echo "ad_remover.sh path_to_files"
    echo "ad_remover.sh path_to_files confirm"
    exit 2
fi

cd "$1"
if [ $? -ne 0 ]; then
    echo "Path $1 doesn't exists"
    exit 1
fi
if [ "*aac" == "$(echo *aac)" ]; then
    echo "No files in $1"
    exit 0
fi

for f in *aac; do
    filesize=$(ls -l -- "$f" | awk '{print $5}')
    if [ "$filesize" -lt 100000 ]; then
        echo "removing $f"
        rm "$f"
    elif [[ "$f" =~ .*Digitally\ Imported.* ]] \
           || [[ "$f" =~ .*Choose\ premium.* ]] \
           || [[ "$f" =~ .*\ -\ DI.fm.* ]] \
           || [[ "$f" =~ .*\ DI\ Radio.* ]] \
           || [[ "$f" =~ .*SKY.FM\ Radio\ TSTAG.* ]] \
           || [[ "$f" =~ .*Job\ Opportunity\ at\ DI.* ]] \
           || [[ "$f" =~ .*Black\ Hole\ Recordings\ Radio.* ]] \
           || [[ "$f" =~ .*More\ of\ the\ show\ after\ these\ messages.* ]] \
           || [[ "$f" =~ .*\ -\ RadioTunes.com.* ]]; then
        if [ "$2" == "confirm" ]; then
            echo "removing $f"
            rm "$f"
        else
            echo "$f"
        fi
    fi
done

