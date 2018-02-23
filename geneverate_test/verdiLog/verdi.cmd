verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetHide -dock widgetDock_WelcomePage
debImport "/home/cav04/11_13/geneverate_test/gen_reg.sv" "-sv" -path \
          {/home/cav04/11_13/geneverate_test}
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_2
schSelect -win $_nSchema2 -signal "a\[1:0\]"
schDeselectAll -win $_nSchema2
schSelect -win $_nSchema2 -signal "w_en"
schSelect -win $_nSchema2 -signal "clk"
schSelect -win $_nSchema2 -signal "w_en"
schDeselectAll -win $_nSchema2
schSelect -win $_nSchema2 -signal "a\[1:0\]"
schSelect -win $_nSchema2 -instpin "reg_instance\[0\].r1" "wd\[31:0\]"
schSelect -win $_nSchema2 -instpin "reg_instance\[1\].r1" "wd\[31:0\]"
schSelect -win $_nSchema2 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema2 -inst "reg_instance\[1\].r1"
schSelect -win $_nSchema2 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema2 -inst "reg_instance\[1\].r1"
debReload
schSelect -win $_nSchema2 -instpin "gen_register\(@1\):Always0:31:36:Combo" "O0"
schSelect -win $_nSchema2 -inst "gen_register\(@1\):Always0:31:36:Combo"
schDeselectAll -win $_nSchema2
verdiDockWidgetMaximize -dock windowDock_nSchema_2
schSelect -win $_nSchema2 -signal "r\[31:0\]"
schSelect -win $_nSchema2 -instpin "gen_register\(@1\):Always0:31:36:Combo" "I0"
schSelect -win $_nSchema2 -instpin "gen_register\(@1\):Always0:31:36:Combo" "O0"
schSelect -win $_nSchema2 -instpin "gen_register\(@1\):Always0:31:36:Combo" "O0"
verdiDockWidgetHide -dock windowDock_nSchema_2
debReload
nsMsgAction -tab cmpl -index {0 0}
debReload
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_3
schSelect -win $_nSchema3 -instpin "gen_register\(@1\):Always0:32:37:Combo" "I0"
schSelect -win $_nSchema3 -signal "reg_out\[31:0\]"
schSelect -win $_nSchema3 -instpin "gen_register\(@1\):Always0:32:37:Combo" "O0"
schSelect -win $_nSchema3 -inst "gen_register\(@1\):Always0:32:37:Combo"
schSelect -win $_nSchema3 -signal "r\[31:0\]"
schSelect -win $_nSchema3 -inst "reg_instance\[1\].r1"
schSelect -win $_nSchema3 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema3 -inst "reg_instance\[1\].r1"
verdiDockWidgetHide -dock windowDock_nSchema_3
debImport "/home/cav04/11_13/geneverate_test/register3.sv" "-sv" -path \
          {/home/cav04/11_13/geneverate_test}
schCreateWindow -delim "." -win $_nSchema1 -scope "register"
schCloseWindow -win $_nSchema4
debImport "/home/cav04/11_13/geneverate_test/gen_reg3.sv" "-sv" -path \
          {/home/cav04/11_13/geneverate_test}
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_5
schCloseWindow -win $_nSchema5
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_6
schSelect -win $_nSchema6 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema6 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema6 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema6 -instpin "gen_register\(@1\):Always0:83:104:Combo" "I0"
schSelect -win $_nSchema6 -inst "reg_instance\[7\].r1"
schSelect -win $_nSchema6 -inst "reg_instance\[7\].r1"
schSelect -win $_nSchema6 -inst "reg_instance\[6\].r1"
schSelect -win $_nSchema6 -inst "reg_instance\[6\].r1"
schSelect -win $_nSchema6 -inst "reg_instance\[5\].r1"
schDeselectAll -win $_nSchema6
debReload
verdiDockWidgetMaximize -dock windowDock_nSchema_6
schSelect -win $_nSchema6 -instpin "gen_register\(@1\):Always0:84:103:Combo" "I0"
schSelect -win $_nSchema6 -inst "reg_instance\[0\].r1"
schPushViewIn -win $_nSchema6
schCloseWindow -win $_nSchema6
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_7
debReload
schCloseWindow -win $_nSchema7
debImport "/home/cav04/11_13/geneverate_test/gen_reg3.sv" "-sv" -path \
          {/home/cav04/11_13/geneverate_test}
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_8
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema8 -instpin "m1" "sel"
schSelect -win $_nSchema8 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema8 -instport "reg_instance\[0\].r1" "rd"
schDeselectAll -win $_nSchema8
schSelect -win $_nSchema8 -inst "reg_instance\[1\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[1\].r1"
schDeselectAll -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schSelect -win $_nSchema8 -inst "reg_instance\[2\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[2\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[2\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[2\].r1"
schSelect -win $_nSchema8 -instport "reg_instance\[2\].r1" "rd"
schSelect -win $_nSchema8 -instport "reg_instance\[3\].r1" "rd"
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schDeselectAll -win $_nSchema8
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -signal "rd"
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schZoomIn -win $_nSchema8
schZoomIn -win $_nSchema8
schSelect -win $_nSchema8 -signal "rd"
schDeselectAll -win $_nSchema8
schSelect -win $_nSchema8 -signal "rd"
schDeselectAll -win $_nSchema8
schSelect -win $_nSchema8 -signal "rd"
schDeselectAll -win $_nSchema8
schSelect -win $_nSchema8 -signal "rd"
schSelect -win $_nSchema8 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[0\].r1"
schSelect -win $_nSchema8 -inst "reg_instance\[0\].r1"
schZoomOut -win $_nSchema8
schZoomOut -win $_nSchema8
schCloseWindow -win $_nSchema8
debReload
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_9
schSelect -win $_nSchema9 -inst "gen_register\(@1\):Init0:19:78:Init"
schSelect -win $_nSchema9 -inst "gen_register\(@1\):Init1:140:190:Init"
schSelect -win $_nSchema9 -signal "w_en"
schSelect -win $_nSchema9 -signal "a\[7:0\]"
schSelect -win $_nSchema9 -signal "sel\[2:0\]"
schSelect -win $_nSchema9 -signal "clk"
schSelect -win $_nSchema9 -inst "gen_register\(@1\):Init0:19:78:Init"
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomIn -win $_nSchema9
schDeselectAll -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[0\]"
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[1\]"
schDeselectAll -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[2\]"
schSelect -win $_nSchema9 -signal "b\[2\]"
schSelect -win $_nSchema9 -signal "b\[3\]"
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomOut -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[0\]"
schSelect -win $_nSchema9 -signal "b\[1\]"
schSelect -win $_nSchema9 -signal "b\[2\]"
schSelect -win $_nSchema9 -signal "b\[3\]"
schSelect -win $_nSchema9 -signal "b\[4\]"
schSelect -win $_nSchema9 -signal "b\[5\]"
schSelect -win $_nSchema9 -signal "b\[6\]"
schSelect -win $_nSchema9 -signal "b\[7\]"
schDeselectAll -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[6\]"
schSelect -win $_nSchema9 -signal "b\[7\]"
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomOut -win $_nSchema9
debReload
verdiDockWidgetMaximize -dock windowDock_nSchema_9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomIn -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schZoomOut -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[7:0\]"
schSelect -win $_nSchema9 -signal "b\[7:0\]"
schSelect -win $_nSchema9 -signal "b\[1\]"
schDeselectAll -win $_nSchema9
schSelect -win $_nSchema9 -signal "b\[1\]"
schSelect -win $_nSchema9 -signal "b\[2\]"
schSelect -win $_nSchema9 -signal "b\[7\]"
schSelect -win $_nSchema9 -signal "b\[7\]"
schCloseWindow -win $_nSchema9
debReload
debReload
srcDeselectAll -win $_nTrace1
debImport "/home/cav04/11_13/geneverate_test/gen_reg3.sv" "-sv" -path \
          {/home/cav04/11_13/geneverate_test}
debReload
schCreateWindow -delim "." -win $_nSchema1 -scope "gen_register"
verdiDockWidgetMaximize -dock windowDock_nSchema_10
schSelect -win $_nSchema10 -signal "b\[15:0\]"
schDeselectAll -win $_nSchema10
schSelect -win $_nSchema10 -signal "b\[0\]"
schSelect -win $_nSchema10 -signal "b\[1\]"
schSelect -win $_nSchema10 -signal "b\[2\]"
schSelect -win $_nSchema10 -signal "b\[3\]"
schSelect -win $_nSchema10 -signal "b\[4\]"
schSelect -win $_nSchema10 -signal "b\[5\]"
schSelect -win $_nSchema10 -signal "b\[6\]"
schSelect -win $_nSchema10 -signal "b\[7\]"
schSelect -win $_nSchema10 -signal "b\[0\]"
schSelect -win $_nSchema10 -signal "b\[1\]"
schSelect -win $_nSchema10 -signal "b\[7\]"
schSelect -win $_nSchema10 -signal "sel\[2:0\]"
schSelect -win $_nSchema10 -signal "b\[0\]"
schSelect -win $_nSchema10 -signal "b\[1\]"
schDeselectAll -win $_nSchema10
schSelect -win $_nSchema10 -signal "b\[2\]"
schSelect -win $_nSchema10 -signal "b\[3\]"
schSelect -win $_nSchema10 -signal "b\[4\]"
schSelect -win $_nSchema10 -signal "b\[5\]"
schSelect -win $_nSchema10 -signal "b\[6\]"
schSelect -win $_nSchema10 -signal "b\[7\]"
schDeselectAll -win $_nSchema10
debReload
verdiDockWidgetMaximize -dock windowDock_nSchema_10
schSelect -win $_nSchema10 -signal "b\[1:0\]"
schSelect -win $_nSchema10 -signal "b\[3:2\]"
schSelect -win $_nSchema10 -signal "b\[5:4\]"
schSelect -win $_nSchema10 -signal "b\[7:6\]"
schSelect -win $_nSchema10 -signal "b\[9:8\]"
schSelect -win $_nSchema10 -signal "b\[11:10\]"
schDeselectAll -win $_nSchema10
schSelect -win $_nSchema10 -signal "b\[13:12\]"
schSelect -win $_nSchema10 -signal "b\[15:14\]"
schSelect -win $_nSchema10 -signal "sel\[2:0\]"
schSelect -win $_nSchema10 -signal "b\[15:14\]"
schDeselectAll -win $_nSchema10
schSelect -win $_nSchema10 -signal "b\[13:12\]"
schSelect -win $_nSchema10 -signal "b\[13:12\]"
schSelect -win $_nSchema10 -signal "b\[11:10\]"
schSelect -win $_nSchema10 -signal "b\[9:8\]"
schSelect -win $_nSchema10 -signal "b\[7:6\]"
schSelect -win $_nSchema10 -signal "b\[5:4\]"
schDeselectAll -win $_nSchema10
schSelect -win $_nSchema10 -signal "b\[3:2\]"
schSelect -win $_nSchema10 -signal "b\[1:0\]"
schDeselectAll -win $_nSchema10
schSelect -win $_nSchema10 -signal "b\[5:4\]"
debExit
