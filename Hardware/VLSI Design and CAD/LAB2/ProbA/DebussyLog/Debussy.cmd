verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "518" "221" "900" "700"
debImport "/home/user2/vlsi22/vlsi22114/Lab2/ProbA/kmap.v" -path \
          {/home/user2/vlsi22/vlsi22114/Lab2/ProbA}
schCreateWindow -delim "." -win $_nSchema1 -scope "kmap"
verdiSetActWin -win $_nSchema_2
schSetOptions -win $_nSchema2 -pinName on
verdiWindowResize -win $_Verdi_1 "0" "23" "1920" "1017"
schCreateWindow -win $_nSchema2
verdiSetActWin -win $_nSchema_3
verdiDockWidgetSetCurTab -dock windowDock_nSchema_2
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
verdiDockWidgetSetCurTab -dock windowDock_nSchema_2
verdiSetActWin -win $_nSchema_2
debExit
