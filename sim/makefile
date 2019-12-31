#! /bin/csh -f 
FILE = ./run.f
CDSLIB_TB = ./cds.lib 
HDL_VAR = ./hdl.var
PROBE = ../tcl/probe.tcl
SHM = shm.shm
TCL = ../tcl/do_tcl
seed = 2
seed =`date +%m%d%H%M%S`

	#-hdlvar $(hdl.var) 
	#-work lab1_add32 
	#ncvlog -sv -f $(FILE) 
	#ncelab top -access wrc 
	#ncsim top
	#irun +arress+wrc -f $(FILE) -input $(PROBE)
test:
	@echo "hello $(seed)"

all: ncvlog ncelab

run: irun

ncvlog:
	ncvlog  -cdslib $(CDSLIB_TB) \
		-hdlvar $(HDL_VAR) \
		-work lab1_add32 \
		-sv \
		-f $(FILE) \
		-logfile ncvlog.log 
ncelab:
	ncelab   lab1_add32.top \
		-cdslib $(CDSLIB_TB) \
		-hdlvar $(HDL_VAR) \
		-access +rwc \
		-covfile cov_work/covfile.cf \
		-coverage  block:expr:fsm:functional \
		-logfile elab.log 
sim:
	ncsim    lab1_add32.top \
		-svseed  random  \
		-input $(TCL)	\
		-cdslib $(CDSLIB_TB) \
		-hdlvar $(HDL_VAR) \
		-logfile ./SimDir/$(seed).log  \
		-covworkdir cov_work/rpt

irun:	
	ncverilog +access+wrc  -cdslib $(CDSLIB_TB) -hdlvar $(HDL_VAR) -work lab1_add32  -f $(FILE) -input $(TCL) -logfile ncverilog.log

wave:	
	simvision $(SHM) &

clean:
	rm -rf *.log 
	rm -rf INCA_*
	rm -rf *.shm ncsim.key

