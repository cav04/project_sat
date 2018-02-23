verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1920" "943"
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1920" "943"
debImport "/home/cav04/project/12_22/bcp_unit/conflict_analyzer.sv" "-sv" -path \
          {/home/cav04/project/12_22/bcp_unit}
schCreateWindow -delim "." -win $_nSchema1 -scope "conflict_analyzer"
verdiDockWidgetMaximize -dock windowDock_nSchema_2
schSelect -win $_nSchema2 -inst \
          "conflict_analyzer\(@1\):Always4:15:29:LatchCombo"
schSelect -win $_nSchema2 -inst \
          "conflict_analyzer\(@1\):Always4:15:29:LatchCombo"
schPushViewIn -win $_nSchema2
srcSelect -win $_nTrace1 -range {15 29 1 3 1 1}
schSelect -win $_nSchema2 -inst "conflict_analyzer\(@1\):Init2:7:7:Init"
schSelect -win $_nSchema2 -inst "conflict_analyzer\(@1\):Init0:42:46:Init"
schDeselectAll -win $_nSchema2
schSelect -win $_nSchema2 -inst "conflict_analyzer\(@1\):Init1:48:61:Init"
schSelect -win $_nSchema2 -inst "conflict_analyzer\(@1\):Init2:7:7:Init"
schSelect -win $_nSchema2 -inst "conflict_analyzer\(@1\):Always0:35:37:Combo"
schSelect -win $_nSchema2 -signal "mask\[3\]"
schDeselectAll -win $_nSchema2
schSelect -win $_nSchema2 -signal "counter1"
debExit
