
stations_dir=/home/lojze/muska_ripanje/di_postaje/
out_dir=/home/lojze/muska_ripanje/out
wanted_gen="ambient
bigroomhouse
breaks
chillhop
chilloutdreams
chillout
chillstep
classiceurodance
classiceurodisco
classictrance
classicvocaltrance
clubdubstep
clubsounds
cosmicdowntempo
darkdnb"

cd $stations_dir
for f in *; do
    streaming_url=$(cat "$f" | grep File1|awk '{ print substr($1, 7) }')
    genere=$(cat "$f" | grep File1|awk '{ print substr($1, index($1,"di_")+3, index($1,"_aac")-index($1,"di_")-3) }')
    #echo $streaming_url
    if [ $(echo $"$wanted_gen" | egrep "^$genere\$" | wc -l) -eq 1 ]; then
        echo $genere
        mkdir -p "$out_dir/$genere"
        screen -d -m -S streamripper_$genere streamripper $streaming_url -s -d "$out_dir/$genere" -l 36000 # for 10 hours
    fi
done




