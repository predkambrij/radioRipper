function _ad_remover() {
    config="/radioRipper/radioRipper_conf.sh"
    if ! [ -f $config ]; then
        echo "config $config doesn't exit"
        return 1
    fi
    source $config
    if [ -z "$rt_adds" ]; then
        echo "all variables (rt_adds) must be set"
        return 1
    fi

    if ! ([ $# -eq 1 ] || [ $# -eq 2 ]); then
        echo "ad_remover path_to_files"
        echo "ad_remover path_to_files confirm"
        return 1
    fi
    cd "$1"
    if [ $? -ne 0 ]; then
        echo "Path $1 doesn't exist"
        return 2
    fi
    if [ "*aac" == "$(echo *aac)" ]; then
        echo "No files in $1"
        cd ~-
        return 0
    fi

    for f in *aac; do
        filesize=$(ls -l -- "$f" | awk '{print $5}')
        if [ "$filesize" -lt 100000 ]; then
            echo "removing $f"
            rm "$f"
        fi
        for add_str in "${rt_adds[@]}"; do
            if [[ "$f" =~ "$add_str" ]]; then
                echo "removing $f"
                rm "$f"
                break
            fi
        done
    done
    cd ~-
}
#$1 is a direcotory of genres (directory which contains directories)
#$2 "list_files"        - to list which files has been found
#   "confirm"           - if you want do delete files which has been found
#   "list_incomplete"   - to list which incomplete directories has been found
#   "remove_incomplete" - to remove incomplete directory
function rr_remove_all() {
    old_dir=$(pwd)
    cd $1
    if [ $? -ne 0 ]; then
        echo "path $1 doesn't exist"
        return 1
    fi

    if ! ([ "$2" == "list_files" ] || [ "$2" == "confirm" ] || [ "$2" == "list_incomplete" ] || [ "$2" == "remove_incomplete" ]); then
        echo "second parameter missing"
        return 2
    fi 

    for genre in *; do
        if [ "$2" == "list_files" ]; then
            _ad_remover "$genre" 
        elif [ "$2" == "confirm" ]; then
            _ad_remover "$genre" $2
        elif [ "$2" == "list_incomplete" ]; then
            ls -ld "$genre"/incomplete 2>/dev/null >&2
            if [ $? -eq 0 ]; then
                echo $genre yes
            else
                echo $genre no
            fi 
        elif [ "$2" == "remove_incomplete" ]; then
            ls -ld "$genre"/incomplete 2>/dev/null >&2
            if [ $? -eq 0 ]; then
                echo $genre
                rm -r "$genre"/incomplete
            fi 
        fi
    done
    cd $old_dir
}
function rr_ripping() {
    out_dir="/radioRipper/music/"
    srbin="/streamripper/streamripper"
    config="/radioRipper/radioRipper_conf.sh"
    if ! [ -f $config ]; then
        echo "config $config doesn't exit"
        return 1
    fi
    source $config
    if [ -z "$rr_stations" ] || [ -z "$rr_agent" ] || [ -z "$rr_max_ripping_duration" ]; then
        echo "all variables (rr_stations, rr_agent, rr_max_ripping_duration) must be set"
        return 1
    fi
    for station in $rr_stations; do
        echo "station $station"
        if ([ -z "$rr_ref_$station" ] || [ -z "$rr_streaming_url_$station" ] || [ -z "$rr_streaming_gens_$station" ]); then
            vars="rr_ref_$station, rr_streaming_url_$station, rr_gens_$station"
            echo "all variables ($vars) must be set"
            return 1
        fi

        rr_gens_station=rr_gens_$station
        for genre in ${!rr_gens_station}; do
            if [ "${genre:0:1}" == "_" ]; then
                # the user opted out that genre
                continue;
            fi
            ref_station=rr_ref_$station
            genre_dir=$out_dir$station"_"$genre
            rr_streaming_url_station=rr_streaming_url_$station
            streaming_url=$(sed "s/{genre}/$genre/g" <<< "${!rr_streaming_url_station}")
            echo "genre $genre"
            mkdir -p $genre_dir
            sleep 1
            screen -d -m -S "rr_"$station"_"$genre "$srbin" "$streaming_url" -s -d "$genre_dir" \
                -f "${!ref_station}" -u "$rr_agent" -l "$rr_max_ripping_duration"
        done
    done
    return 0
}