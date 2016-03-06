Scripts for automate ripping from internet radio and you can remove ADs before you play the songs

Special requirements:
awk screen streamripper


What to do before first usage:
==============

* You need to use special streamripper which can fake http referer https://github.com/predkambrij/streamripper
* Specify which generes would you like to rip in riping_script.sh by modifying variable wanted_gen. Prefix with "_" if would you like to skip, but keep in the list

Example:

    wanted_gen="
    russianclubhits
    _sankeys
    scousehouse
    "



Usage examples
==============

    bash ripping_script.sh
 
to see progress of ripping:

    $ screen -list
    There are screens on:
    	17439.streamripper_vocaltrance	(22/03/14 10:58:27)	(Detached)
    	17422.streamripper_vocallounge	(22/03/14 10:58:27)	(Detached)
    	17405.streamripper_vocalchillout	(22/03/14 10:58:27)	(Detached)
        ...
        ...

Inspect of one of streaming genere:

    $ screen -r streamripper_vocaltrance # to detach: ctrl + a <release for part of second> d

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


Removing advertisement songs:
==============

    $ bash remove_all.sh <same path as you specified in variable out_dir in ripping_script.sh> <one of actions>

Examples of actions:

    $ bash remove_all.sh /home/lojze/muska_ripanje/out3 list_files # will list files which should be deleted in defined filters
    $ bash remove_all.sh /home/lojze/muska_ripanje/out3 confirm # will remove files same as listed in list_files
    $ bash remove_all.sh /home/lojze/muska_ripanje/out3 list_incomplete # will list in which generes is present incomplete directory
    $ bash remove_all.sh /home/lojze/muska_ripanje/out3 remove_incomplete # will remove incomplete directory as listed in list_incomplete

Correct filters / regex for matching advertisement songs:
==============
In ad_remover.sh you can add definition similar like these and rerun remove_all.sh:

    if [[ "$f" =~ .*Digitally\ Imported.* ]] \
           || [[ "$f" =~ .*Choose\ premium.* ]] \
           || [[ "$f" =~ .*Job\ Opportunity\ at\ DI.* ]] \
           || [[ "$f" =~ .*Black\ Hole\ Recordings\ Radio.* ]] \
           || [[ "$f" =~ .*More\ of\ the\ show\ after\ these\ messages.* ]]; then
 


