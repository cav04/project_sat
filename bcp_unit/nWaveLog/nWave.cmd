wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/cav04/project/0206/bcp_unit/t_sat_top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 29.732354 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 594.517797 -snap {("G1" 4)}
wvSetRadix -win $_nWave1 -format Bin {("G1" 4)}
wvResizeWindow -win $_nWave1 2 25 1920 943
wvSetCursor -win $_nWave1 610.277793 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 587.663397 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 610.277793 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 586.371145 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 610.923919 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 588.955648 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 610.923919 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 587.663397 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 608.339417 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 585.725020 -snap {("G1" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 17 18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 613.508422 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 583.140517 -snap {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetCursor -win $_nWave1 614.154547 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 589.601774 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 607.047165 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 575.387010 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 606.401040 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 588.955648 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 607.693291 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 585.725020 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 605.754914 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 584.432769 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 610.923919 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 588.309522 -snap {("G1" 11)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_write} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetCursor -win $_nWave1 609.942588 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalClose -win $_nWave1
wvSetRadix -win $_nWave1 -format Bin {("G1" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_finish_flag} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetRadix -win $_nWave1 -format Bin {("G1" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/cur_state\[4:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 567.359673 -snap {("G1" 6)}
wvSetRadix -win $_nWave1 -format Bin {("G1" 7)}
wvSetRadix -win $_nWave1 -format UDec {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/cur_state\[4:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/w_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetCursor -win $_nWave1 549.821649 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 459.388659 -snap {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/w_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/sel_next} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/cur_state\[4:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/w_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/sel_next} \
{/t_sat_top/sat_top1/bcp_top1/bc1/conflict_analysis_en} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/cur_state\[4:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 399.100000 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetCursor -win $_nWave1 580.667010 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 403.306185 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 584.172165 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/w_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/sel_next} \
{/t_sat_top/sat_top1/bcp_top1/bc1/conflict_analysis_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/implication_stack_not_empty} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/cur_state\[4:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/central_controller1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/vst1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/gb1"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/t_sat_top/sat_top1/vst1/vst_write} \
{/t_sat_top/sat_top1/bcp_top1/gb1/bcp_lock\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_done} \
{/t_sat_top/sat_top1/bcp_top1/gb1/force_assign_reg\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/next_var\[2:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/w_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/sel_next} \
{/t_sat_top/sat_top1/bcp_top1/bc1/conflict_analysis_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/implication_stack_not_empty} \
{/t_sat_top/sat_top1/bcp_top1/gb1/unit_clause\[6:0\]} \
{/t_sat_top/sat_top1/bcp_top1/gb1/rw_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/cur_state\[4:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bc1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/vst1/vst_bcp_write} \
{/t_sat_top/sat_top1/vst1/vst_en} \
{/t_sat_top/sat_top1/vst1/vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/central_controller1/bcp_engine_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_address\[2:0\]} \
{/t_sat_top/sat_top1/central_controller1/central_vst_bcp_write} \
{/t_sat_top/sat_top1/central_controller1/central_vst_en} \
{/t_sat_top/sat_top1/central_controller1/central_vst_in\[7:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_address\[1:0\]} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_bcp_write} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_en} \
{/t_sat_top/sat_top1/bcp_top1/bcp_engine_vst_in\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/t_sat_top/sat_top1/bcp_top1/bc1"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
