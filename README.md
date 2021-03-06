Scripts for automate ripping from internet radio and you can remove ADs before you play the songs.  
There's also (customized) web browser based aac player which can be used to play ripped music (see [docker-compose.yml](https://github.com/predkambrij/radioRipper/blob/master/docker-compose.yml))

Setup
=====
* ```git clone git@github.com:predkambrij/radioRipper.git```
* ```cd radioRipper/```
* ```git clone git@github.com:predkambrij/mp3-player.git serverplaylist/player/```

Before the first usage:
==============
* cp radioRipper/radioRipper_conf.sample.sh radioRipper/radioRipper_conf.sh
* Specify which genres would you like to rip by removing prefix "_"

Build
=====
```docker-compose build ripper```

Usage examples
==============

    # Go to the container
    docker-compose run ripper
    # cd to the code
    cd /radioRipper
    # source the file
    . radioRipper.sh
    # start ripping
    rr_ripping
    # list ads to remove
    rr_remove_all /radioRipper/music/ list_files
    # remove the adds
    rr_remove_all /radioRipper/music/ confirm
    # list incomplete genre directories
    rr_remove_all /radioRipper/music/ list_incomplete
    # remove incomplete directories
    rr_remove_all /radioRipper/music/ remove_incomplete
 
to see progress of ripping:

    $ screen -list
    There are screens on:
        264.rr_rt_80sdance  (11/12/16 02:39:32) (Detached)
        256.rr_rt_00srnb    (11/12/16 02:39:31) (Detached)
        ...
        ...

Inspect of one of streaming genere:

    $ screen -r rr_rt_80sdance # to detach: ctrl + a <release for part of second> d

You will se something like that:
    
    Connecting...
    stream: Vocal Trance - DIGITALLY IMPORTED - a fusion of trance, dance, and chilling vocals together!
    server name: SHOUTcast/Linux v1.9.8
    declared bitrate: 64
    meta interval: 8192
    
    [skipping...   ] Dennis Sheperd - Left Of The World [  1.99M]
    [ripping...    ] Tenishia & Jan Johnston - As It Should (Original M [  3.35M]
    ...
    ...

Side notes: 
See radioRipper_conf.sh There you can add regex definitions which will be used to remove advertisement songs, add new radio stations and genres.

Web browser based aac player
============================
run ```docker-compose build player && docker-compose up  player``` and aac player should be accesible at [http://127.2.2.2:2080/mp3/](http://127.2.2.2:2080/mp3/). Click "Import From Server" to get playlist (the music you ripped).

Note:  
Currently (as far as I know) only Chromium browser can play aac format.
