
stations_dir=/home/lojze/muska_ripanje/di_postaje/
out_dir=/home/lojze/muska_ripanje/out3
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
wanted_gen="deephouse
deepnudisco
deeptech
discohouse
djmixes
downtempolounge
drumandbass
dubstep
eclectronica
electrohouse
electronicpioneers
electropop
epictrance
eurodance
funkyhouse
futuresynthpop
gabber
glitchhop
goapsy
handsup
"
wanted_gen="hardcore
harddance
hardstyle
hardtechno
house
latinhouse
liquiddnb
liquiddubstep
lounge
mainstage
minimal
moombahton
oldschoolacid
oldschoolelectronica
progressive
progressivepsy
psybient
psychill
"
wanted_gen="russianclubhits
sankeys
scousehouse
soulfulhouse
spacemusic
techhouse
techno
trance
trap
tribalhouse
ukgarage
umfradio
undergroundtechno
vocalchillout
vocallounge
vocaltrance
"

cd $stations_dir
for f in *; do
    streaming_url=$(cat "$f" | grep File1|awk '{ print substr($1, 7) }')
    genere=$(cat "$f" | grep File1|awk '{ print substr($1, index($1,"di_")+3, index($1,"_aac")-index($1,"di_")-3) }')
    #echo $streaming_url
    if [ $(echo $"$wanted_gen" | egrep "^$genere\$" | wc -l) -eq 1 ]; then
        echo $genere
        mkdir -p "$out_dir/$genere"
        sleep 1 # some delay
        screen -d -m -S streamripper_$genere streamripper $streaming_url -s -d "$out_dir/$genere" -l 36000 # for 10 hours
        true
    fi
done




