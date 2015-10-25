
stations_dir=/home/lojze/muska_ripanje/di_postaje/
stations_dir=/home/lojze/muska_ripanje/sky_stations/
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
# skyfm
wanted_gen="60srock
80sdance
80srock
hit90s
90srnb
beatles
altrock
americansongbook
bebop
hit60s
the80s
bossanova
cafedeparis
guitar
classicalpianotrios
classicmotown
classicrap
classicrock
clubbollywood
compactdiscoveries
christian
country
dancehits
"
#radiotunes
wanted_gen="softrock
"

cd $stations_dir
for f in *; do
    if [ $(cat "$f" | grep File1| grep sky.fm | wc -l) -eq 1 ]; then
        streaming_url=$(cat "$f" | grep File1|awk '{ print substr($1, 7) }')
        genre=$(cat "$f" | grep File1|awk '{ print substr($1, index($1,"sky_")+4, index($1,"_aac")-index($1,"sky_")-4) }')
    elif [ $(cat "$f" | grep File1| grep radiotunes | wc -l) -eq 1 ]; then
        streaming_url=$(cat "$f" | grep File1|awk '{ print substr($1, 7) }')
        genre=$(cat "$f" | grep File1|awk '{ print substr($1, index($1,"nes_")+4, index($1,"_aac")-index($1,"nes_")-4) }')
    else
        streaming_url=$(cat "$f" | grep File1|awk '{ print substr($1, 7) }')
        genre=$(cat "$f" | grep File1|awk '{ print substr($1, index($1,"sky_")+4, index($1,"_aac")-index($1,"sky_")-4) }')
    fi
    #echo "$genre $streaming_url"
    if [ $(echo $"$wanted_gen" | egrep "^$genre\$" | wc -l) -eq 1 ]; then
        echo $genre
        mkdir -p "$out_dir/$genre"
        sleep 1 # some delay
        screen -d -m -S streamripper_$genre streamripper $streaming_url -s -d "$out_dir/$genre" -l 36000 # for 10 hours
        true
    fi
done




