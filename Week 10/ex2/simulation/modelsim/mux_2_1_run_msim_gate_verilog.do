transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {mux_2_1.vo}

vlog -vlog01compat -work work +incdir+C:/Users/manue/Desktop/ComputerArchitectureLab-master/Week5/ex2 {C:/Users/manue/Desktop/ComputerArchitectureLab-master/Week5/ex2/testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Desktop/ComputerArchitectureLab-master/Week5/ex2 {C:/Users/manue/Desktop/ComputerArchitectureLab-master/Week5/ex2/mux_2_1.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench

do C:/Users/manue/Desktop/ComputerArchitectureLab-master/Week5/ex2/Tcl_script1.tcl
