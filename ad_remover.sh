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

for f in *aac; do
    if [[ "$f" =~ .*Digitally\ Imported.* ]] \
           || [[ "$f" =~ .*Choose\ premium.* ]] \
           || [[ "$f" =~ .*Job\ Opportunity\ at\ DI.* ]] \
           || [[ "$f" =~ .*More\ of\ the\ show\ after\ these\ messages.* ]]; then
        if [ "$2" == "confirm" ]; then
            echo "removing $f"
            rm "$f"
        else
            echo "$f"
        fi
    fi
done

