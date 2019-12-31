database -shm  shm
database -show shm 
#probe -shm -create top -depth all -database shm -name probe1 
#probe -show probe1 
proc test_probe {hier depth} {

    if {$depth == "0"}  {set depth all}
    set probe_cmd "probe -shm -create $hier -depth $depth -database shm"
    puts $probe_cmd;
    eval $probe_cmd;
}

test_probe top 0
run 200s
exit 
#database -shm -incfiles 30 -incsize 800M tb_name
