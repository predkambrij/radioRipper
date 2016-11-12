declare -a rt_adds=(
".*Digitally Imported.*"
".*Choose premium.*"
".* - DI.fm.*"
".* DI Radio.*"
".*SKY.FM Radio TSTAG.*"
".*Job Opportunity at DI.*"
".*Black Hole Recordings Radio.*"
".*More of the show after these messages.*"
".* - RadioTunes.com.*"
)

# user agent
rr_agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/43.0.2357.130 Chrome/43.0.2357.130 Safari/537.36"
rr_max_ripping_duration=36000
# used variable suffix
rr_stations="
difm
rt
"
# referer
rr_ref_rt="http://www.radiotunes.com"
rr_ref_difm="http://www.di.fm"

# streaming url
rr_streaming_url_rt="http://pub1.radiotunes.com:80/radiotunes_{genre}_aacplus"
rr_streaming_url_difm="http://pub1.di.fm:80/di_{genre}_aac"

# genres
rr_gens_rt="
_hit00s
_00srnb
_60srock
_80srock
_80saltnnewwave
_80sdance
_hit90s
_90srnb
_altrock
_ambient
_americansongbook
_baroque
_bebop
_hit60s
_the80s
_bluesrock
_belero
_bossanova
_cafedeparis
_chillout
_classicrap
_classicmotown
_classicrock
_guitar
_classicalperiod
_classicalpianotrios
_clubbollywood
_christian
_country
_cubanlounge
_datempolounge
_dancehits
_davekoz
_discoparty
_downtempolounge
_dreamscapes
_edmfest
_eurodance
_flamenco
_hardrock
_hit70s
_indierock
_jazzclassics
_jpop
_latinpophits
_latinrock
_lounge
_lovemusic
_meditation
_mellowjazz
_mellowsmoothjazz
_metal
_modernblues
_modernrock
_classical
_soundtracks
_mozart
_nature
_newage
_nortena
_oldschoolfunknsoul
_oldies
_pianojazz
_poprock
_reggaeton
_relaxation
_relaxingambientpiano
_romantic
_romantica
_romanticalatina
_rootsreggae
_salsa
_sleeprelaxation
_slowjams
_smoothbeats
_smoothbossanova
_smoothjazz
_smoothjazz247
_smoothlounge
_softrock
_solopiano
_tango
_tophits
_uptemposmoothjazz
_urbanjamz
_urbanpophits
_vocalchillout
_vocallounge
_vocalnewage
_vocalsmoothjazz
_world
"

# di fm
rr_gens_difm="
_00sclubhits
_ambient
_atmosphericbreaks
_bassnjackinhouse
_bassline
_bigbeat
_bigroomhouse
_breaks
_chillntropicalhouse
_chillhop
_chillout
_chilloutdreams
_chillstep
_classiceurodance
_classiceurodisco
_classictrance
_classicvocaltrance
_clubdubstep
_club
_djmixes
_darkdnb
_darkpsytrance
_deephouse
_deepnudisco
_deeptech
_detroithousentechno
_discohouse
_downtempolounge
_drumandbass
_drumstep
_dub
_dubtechno
_dubstep
_ebm
_eclectronica
_electro
_electroswing
_electronicpioneers
_electronics
_electropop
_epictrance
_eurodance
_funkyhouse
_futurebeats
_futuregarage
_futuresynthpop
_gabber
_glitchhop
_goapsy
_handsup
_harddance
_hardtechno
_hardcore
_hardstyle
_house
_idm
_indiebeats
_indiedance
_jazzhouse
_jungle
_latinhouse
_liquiddnb
_liquiddubstep
_liquidtrap
_lounge
_mainstage
_melodicprogressive
_minimal
_nightcore
_nudisco
_oldschoolacid
_oldschoolhouse
_oldschoolrave
_classictechno
_progressive
_progressivepsy
_psychill
_psybient
_russianclubhits
_soulfulhouse
_spacemusic
_techhouse
_techno
_trance
_trap
_tribalhouse
_umfradio
_undergroundtechno
_vocalchillout
_vocallounge
_vocaltrance
"

