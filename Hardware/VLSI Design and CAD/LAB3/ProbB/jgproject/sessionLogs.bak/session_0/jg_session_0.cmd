#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2018.03
# platform  : Linux 3.10.0-957.21.3.el7.x86_64
# version   : 2018.03p001 64 bits
# build date: 2018.04.24 18:13:05 PDT
#----------------------------------------
# started Wed Mar 09 18:05:27 CST 2022
# hostname  : vlsicad9
# pid       : 15897
# arguments : '-label' 'session_0' '-console' 'vlsicad9:36769' '-style' 'windows' '-data' 'AQAAADx/////AAAAAAAAA3oBAAAAEABMAE0AUgBFAE0ATwBWAEU=' '-proj' '/home/user2/vlsi22/vlsi22114/Lab3/ProbB/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/user2/vlsi22/vlsi22114/Lab3/ProbB/jgproject/.tmp/.initCmds.tcl' 'superlint.tcl'
check_superlint -init
##------------------Dont touch----------------------##
clear -all

# Config rules
config_rtlds -rule -enable -domain { LINT }
config_rtlds -rule -disable -domain { DFT AUTO_FORMAL }

# ivcad2021_constrain //
config_rtlds -rule  -disable -category { NAMING }
config_rtlds -rule  -disable -tag { IDN_NR_AMKY IDN_NR_CKYW IDN_NR_SVKY \
NAM_NR_REPU EXP_NR_OVFB IFC_NR_DGEL  INS_NR_PODL MOD_NR_PGAT MOD_NO_IPRG \
FLP_NR_MXCS FLP_NO_ASRT REG_NR_RWRC INS_NR_INPR MOD_NS_GLGC OTP_NR_ASYA} 
# ivcad2021_constrain //

##------------------Dont touch----------------------##

# import and elaborate design //
analyze -v2k ./ALU.v; ## modify your file name ##
elaborate -bbox true -top ALU; ## modify your top module ##

# Setup clock and reset
#clock clk; ## modify your clock name ##
#reset rst; ## modify your reset name ##

# Extract checks
check_superlint -extract

