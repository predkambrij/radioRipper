
stations_dir=/home/lojze/muska_ripanje/di_postaje/
out_dir=/home/lojze/muska_ripanje/out/
cd $stations_dir
for f in *; do
    streaming_url=$(cat "$f" | grep File1|awk '{ print substr($1, 7) }')
    genere=$(cat "$f" | grep File1|awk '{ print substr($1, index($1,"di_")+3, index($1,"_aac")-index($1,"di_")-3) }')
    echo $streaming_url
    echo $genere

done




