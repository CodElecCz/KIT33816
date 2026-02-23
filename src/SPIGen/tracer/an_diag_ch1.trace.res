
// Acquisition performed
// 11/3/2015 4:34:41 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1261 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  212.67us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  212.83us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  213.00us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  213.17us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  213.33us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  213.50us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  213.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  213.83us |      048       |              35 |             wait row124;
time  219.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  219.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  220.00us |      04B       |              60 |             wait row123;                                        
time  230.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  230.17us |      048       |               1 |             wait row124;
time  230.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  230.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  230.67us |      04B       |              60 |             wait row123;                                        
time  240.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  240.83us |      048       |               1 |             wait row124;
time  241.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  241.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  241.33us |      04B       |              60 |             wait row123;                                        
time  251.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  251.50us |      048       |               1 |             wait row124;
time  251.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  251.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  252.00us |      04B       |              60 |             wait row123;                                        
time  262.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  262.17us |      048       |               1 |             wait row124;
time  262.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  262.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  262.67us |      04B       |              60 |             wait row123;                                        
time  272.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  272.83us |      048       |               1 |             wait row124;
time  273.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  273.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  273.33us |      04B       |              60 |             wait row123;                                        
time  283.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  283.50us |      048       |               1 |             wait row124;
time  283.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  283.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  284.00us |      04B       |              60 |             wait row123;                                        
time  294.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  294.17us |      048       |               7 |             wait row124;
time  295.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  295.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  295.67us |      04B       |              60 |             wait row123;                                        
time  305.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  305.83us |      048       |              79 |             wait row124;
time  319.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  319.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  319.33us |      04B       |              60 |             wait row123;                                        
time  329.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  329.50us |      048       |             131 |             wait row124;
time  351.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  351.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  351.67us |      04B       |              60 |             wait row123;                                        
time  361.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  361.83us |      048       |             119 |             wait row124;
time  381.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  381.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  382.00us |      04B       |              60 |             wait row123;                                        
time  392.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  392.17us |      048       |             110 |             wait row124;
time  410.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  410.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  410.83us |      04B       |              60 |             wait row123;                                        
time  420.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  421.00us |      048       |             117 |             wait row124;
time  440.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  440.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  440.83us |      04B       |              60 |             wait row123;                                        
time  450.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  451.00us |      048       |             112 |             wait row124;
time  469.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  469.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  470.00us |      04B       |              60 |             wait row123;                                        
time  480.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  480.17us |      048       |             103 |             wait row124;
time  497.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  497.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  497.67us |      04B       |              60 |             wait row123;                                        
time  507.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  507.83us |      048       |              92 |             wait row124;
time  523.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  523.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  523.50us |      04B       |              60 |             wait row123;                                        
time  533.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  533.67us |      048       |              95 |             wait row124;
time  549.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  549.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  549.83us |      04B       |              60 |             wait row123;                                        
time  559.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  560.00us |      048       |              93 |             wait row124;
time  575.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  575.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  575.83us |      04B       |              60 |             wait row123;                                        
time  585.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  586.00us |      048       |              81 |             wait row124;
time  599.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  599.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  599.83us |      04B       |              60 |             wait row123;                                        
time  609.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  610.00us |      048       |              85 |             wait row124;
time  624.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  624.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  624.50us |      04B       |              60 |             wait row123;                                        
time  634.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  634.67us |      048       |              79 |             wait row124;
time  647.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  648.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  648.17us |      04B       |              60 |             wait row123;                                        
time  658.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  658.33us |      048       |              78 |             wait row124;
time  671.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  671.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  671.67us |      04B       |              60 |             wait row123;                                        
time  681.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  681.83us |      048       |              79 |             wait row124;
time  695.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  695.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  695.33us |      04B       |              60 |             wait row123;                                        
time  705.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  705.50us |      048       |              45 |             wait row124;
time  713.00us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time  713.17us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time  713.33us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time  713.50us |      04F       |             119 |             wait row14;
time  733.33us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time  733.50us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time  733.67us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time  733.83us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time  734.00us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time  734.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  734.33us |      056       |              79 |             wait row124;
time  747.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  747.67us |      058       |               1 |             stos off on off;                              * ls on
time  747.83us |      059       |              60 |             wait row123;
time  757.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  758.00us |      056       |               7 |             wait row124;
time  759.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  759.33us |      058       |               1 |             stos off on off;                              * ls on
time  759.50us |      059       |              60 |             wait row123;
time  769.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  769.67us |      056       |               7 |             wait row124;
time  770.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  771.00us |      058       |               1 |             stos off on off;                              * ls on
time  771.17us |      059       |              60 |             wait row123;
time  781.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  781.33us |      056       |               1 |             wait row124;
time  781.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  781.67us |      058       |               1 |             stos off on off;                              * ls on
time  781.83us |      059       |              60 |             wait row123;
time  791.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  792.00us |      056       |               1 |             wait row124;
time  792.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  792.33us |      058       |               1 |             stos off on off;                              * ls on
time  792.50us |      059       |              60 |             wait row123;
time  802.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  802.67us |      056       |               7 |             wait row124;
time  803.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  804.00us |      058       |               1 |             stos off on off;                              * ls on
time  804.17us |      059       |              60 |             wait row123;
time  814.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  814.33us |      056       |               7 |             wait row124;
time  815.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  815.67us |      058       |               1 |             stos off on off;                              * ls on
time  815.83us |      059       |              60 |             wait row123;
time  825.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  826.00us |      056       |               7 |             wait row124;
time  827.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  827.33us |      058       |               1 |             stos off on off;                              * ls on
time  827.50us |      059       |              60 |             wait row123;
time  837.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  837.67us |      056       |               7 |             wait row124;
time  838.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  839.00us |      058       |               1 |             stos off on off;                              * ls on
time  839.17us |      059       |              60 |             wait row123;
time  849.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  849.33us |      056       |               7 |             wait row124;
time  850.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  850.67us |      058       |               1 |             stos off on off;                              * ls on
time  850.83us |      059       |              60 |             wait row123;
time  860.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  861.00us |      056       |               7 |             wait row124;
time  862.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  862.33us |      058       |               1 |             stos off on off;                              * ls on
time  862.50us |      059       |              60 |             wait row123;
time  872.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  872.67us |      056       |               7 |             wait row124;
time  873.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  874.00us |      058       |               1 |             stos off on off;                              * ls on
time  874.17us |      059       |              60 |             wait row123;
time  884.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  884.33us |      056       |               7 |             wait row124;
time  885.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  885.67us |      058       |               1 |             stos off on off;                              * ls on
time  885.83us |      059       |              60 |             wait row123;
time  895.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  896.00us |      056       |               7 |             wait row124;
time  897.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  897.33us |      058       |               1 |             stos off on off;                              * ls on
time  897.50us |      059       |              60 |             wait row123;
time  907.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  907.67us |      056       |               7 |             wait row124;
time  908.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  909.00us |      058       |               1 |             stos off on off;                              * ls on
time  909.17us |      059       |              60 |             wait row123;
time  919.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  919.33us |      056       |               7 |             wait row124;
time  920.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  920.67us |      058       |               1 |             stos off on off;                              * ls on
time  920.83us |      059       |              60 |             wait row123;
time  930.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  931.00us |      056       |               7 |             wait row124;
time  932.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  932.33us |      058       |               1 |             stos off on off;                              * ls on
time  932.50us |      059       |              60 |             wait row123;
time  942.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  942.67us |      056       |               8 |             wait row124;
time  944.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  944.17us |      058       |               1 |             stos off on off;                              * ls on
time  944.33us |      059       |              60 |             wait row123;
time  954.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  954.50us |      056       |               7 |             wait row124;
time  955.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  955.83us |      058       |               1 |             stos off on off;                              * ls on
time  956.00us |      059       |              60 |             wait row123;
time  966.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  966.17us |      056       |               7 |             wait row124;
time  967.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  967.50us |      058       |               1 |             stos off on off;                              * ls on
time  967.67us |      059       |              60 |             wait row123;
time  977.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  977.83us |      056       |               8 |             wait row124;
time  979.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  979.33us |      058       |               1 |             stos off on off;                              * ls on
time  979.50us |      059       |              60 |             wait row123;
time  989.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  989.67us |      056       |               8 |             wait row124;
time  991.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  991.17us |      058       |               1 |             stos off on off;                              * ls on
time  991.33us |      059       |              60 |             wait row123;
time 1001.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1001.50us |      056       |               8 |             wait row124;
time 1002.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1003.00us |      058       |               1 |             stos off on off;                              * ls on
time 1003.17us |      059       |              60 |             wait row123;
time 1013.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1013.33us |      056       |               8 |             wait row124;
time 1014.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1014.83us |      058       |               1 |             stos off on off;                              * ls on
time 1015.00us |      059       |              60 |             wait row123;
time 1025.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1025.17us |      056       |              36 |             wait row124;
time 1031.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1031.33us |      058       |               1 |             stos off on off;                              * ls on
time 1031.50us |      059       |              60 |             wait row123;
time 1041.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1041.67us |      056       |               7 |             wait row124;
time 1042.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1043.00us |      058       |               1 |             stos off on off;                              * ls on
time 1043.17us |      059       |              60 |             wait row123;
time 1053.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1053.33us |      056       |               8 |             wait row124;
time 1054.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1054.83us |      058       |               1 |             stos off on off;                              * ls on
time 1055.00us |      059       |              60 |             wait row123;
time 1065.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1065.17us |      056       |              31 |             wait row124;
time 1070.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1070.50us |      058       |               1 |             stos off on off;                              * ls on
time 1070.67us |      059       |              60 |             wait row123;
time 1080.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1080.83us |      056       |               7 |             wait row124;
time 1082.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1082.17us |      058       |               1 |             stos off on off;                              * ls on
time 1082.33us |      059       |              60 |             wait row123;
time 1092.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1092.50us |      056       |               8 |             wait row124;
time 1093.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1094.00us |      058       |               1 |             stos off on off;                              * ls on
time 1094.17us |      059       |              60 |             wait row123;
time 1104.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1104.33us |      056       |              34 |             wait row124;
time 1110.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1110.17us |      058       |               1 |             stos off on off;                              * ls on
time 1110.33us |      059       |              60 |             wait row123;
time 1120.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1120.50us |      056       |               7 |             wait row124;
time 1121.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1121.83us |      058       |               1 |             stos off on off;                              * ls on
time 1122.00us |      059       |              60 |             wait row123;
time 1132.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1132.17us |      056       |              29 |             wait row124;
time 1137.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1137.17us |      058       |               1 |             stos off on off;                              * ls on
time 1137.33us |      059       |              60 |             wait row123;
time 1147.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1147.50us |      056       |               8 |             wait row124;
time 1148.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1149.00us |      058       |               1 |             stos off on off;                              * ls on
time 1149.17us |      059       |              60 |             wait row123;
time 1159.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1159.33us |      056       |              31 |             wait row124;
time 1164.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1164.67us |      058       |               1 |             stos off on off;                              * ls on
time 1164.83us |      059       |              60 |             wait row123;
time 1174.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1175.00us |      056       |               8 |             wait row124;
time 1176.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1176.50us |      058       |               1 |             stos off on off;                              * ls on
time 1176.67us |      059       |              60 |             wait row123;
time 1186.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1186.83us |      056       |              28 |             wait row124;
time 1191.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1191.67us |      058       |               1 |             stos off on off;                              * ls on
time 1191.83us |      059       |              60 |             wait row123;
time 1201.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1202.00us |      056       |               8 |             wait row124;
time 1203.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1203.50us |      058       |               1 |             stos off on off;                              * ls on
time 1203.67us |      059       |              60 |             wait row123;
time 1213.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1213.83us |      056       |              30 |             wait row124;
time 1218.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1219.00us |      058       |               1 |             stos off on off;                              * ls on
time 1219.17us |      059       |              60 |             wait row123;
time 1229.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1229.33us |      056       |               8 |             wait row124;
time 1230.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1230.83us |      058       |               1 |             stos off on off;                              * ls on
time 1231.00us |      059       |              60 |             wait row123;
time 1241.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1241.17us |      056       |              31 |             wait row124;
time 1246.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1246.50us |      058       |               1 |             stos off on off;                              * ls on
time 1246.67us |      059       |              60 |             wait row123;
time 1256.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1256.83us |      056       |               8 |             wait row124;
time 1258.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1258.33us |      058       |               1 |             stos off on off;                              * ls on
time 1258.50us |      059       |              60 |             wait row123;
time 1268.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1268.67us |      056       |              31 |             wait row124;
time 1273.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1274.00us |      058       |               1 |             stos off on off;                              * ls on
time 1274.17us |      059       |              60 |             wait row123;
time 1284.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1284.33us |      056       |               8 |             wait row124;
time 1285.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1285.83us |      058       |               1 |             stos off on off;                              * ls on
time 1286.00us |      059       |              60 |             wait row123;
time 1296.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1296.17us |      056       |              31 |             wait row124;
time 1301.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1301.50us |      058       |               1 |             stos off on off;                              * ls on
time 1301.67us |      059       |              60 |             wait row123;
time 1311.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1311.83us |      056       |               8 |             wait row124;
time 1313.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1313.33us |      058       |               1 |             stos off on off;                              * ls on
time 1313.50us |      059       |              60 |             wait row123;
time 1323.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1323.67us |      056       |              30 |             wait row124;
time 1328.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1328.83us |      058       |               1 |             stos off on off;                              * ls on
time 1329.00us |      059       |              60 |             wait row123;
time 1339.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1339.17us |      056       |               8 |             wait row124;
time 1340.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1340.67us |      058       |               1 |             stos off on off;                              * ls on
time 1340.83us |      059       |              60 |             wait row123;
time 1350.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1351.00us |      056       |              32 |             wait row124;
time 1356.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1356.50us |      058       |               1 |             stos off on off;                              * ls on
time 1356.67us |      059       |              60 |             wait row123;
time 1366.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1366.83us |      056       |               8 |             wait row124;
time 1368.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1368.33us |      058       |               1 |             stos off on off;                              * ls on
time 1368.50us |      059       |              60 |             wait row123;
time 1378.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1378.67us |      056       |              34 |             wait row124;
time 1384.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1384.50us |      058       |               1 |             stos off on off;                              * ls on
time 1384.67us |      059       |              60 |             wait row123;
time 1394.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1394.83us |      056       |               8 |             wait row124;
time 1396.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1396.33us |      058       |               1 |             stos off on off;                              * ls on
time 1396.50us |      059       |              60 |             wait row123;
time 1406.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1406.67us |      056       |              35 |             wait row124;
time 1412.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1412.67us |      058       |               1 |             stos off on off;                              * ls on
time 1412.83us |      059       |              60 |             wait row123;
time 1422.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1423.00us |      056       |               8 |             wait row124;
time 1424.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1424.50us |      058       |               1 |             stos off on off;                              * ls on
time 1424.67us |      059       |              60 |             wait row123;
time 1434.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1434.83us |      056       |              30 |             wait row124;
time 1439.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1440.00us |      058       |               1 |             stos off on off;                              * ls on
time 1440.17us |      059       |              60 |             wait row123;
time 1450.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1450.33us |      056       |               8 |             wait row124;
time 1451.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1451.83us |      058       |               1 |             stos off on off;                              * ls on
time 1452.00us |      059       |              60 |             wait row123;
time 1462.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1462.17us |      056       |              33 |             wait row124;
time 1467.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1467.83us |      058       |               1 |             stos off on off;                              * ls on
time 1468.00us |      059       |              60 |             wait row123;
time 1478.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1478.17us |      056       |               8 |             wait row124;
time 1479.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1479.67us |      058       |               1 |             stos off on off;                              * ls on
time 1479.83us |      059       |              60 |             wait row123;
time 1489.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1490.00us |      056       |              34 |             wait row124;
time 1495.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1495.83us |      058       |               1 |             stos off on off;                              * ls on
time 1496.00us |      059       |              60 |             wait row123;
time 1506.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1506.17us |      056       |               8 |             wait row124;
time 1507.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1507.67us |      058       |               1 |             stos off on off;                              * ls on
time 1507.83us |      059       |              60 |             wait row123;
time 1517.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1518.00us |      056       |              33 |             wait row124;
time 1523.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1523.67us |      058       |               1 |             stos off on off;                              * ls on
time 1523.83us |      059       |              60 |             wait row123;
time 1533.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1534.00us |      056       |               8 |             wait row124;
time 1535.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1535.50us |      058       |               1 |             stos off on off;                              * ls on
time 1535.67us |      059       |              60 |             wait row123;
time 1545.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1545.83us |      056       |              33 |             wait row124;
time 1551.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1551.50us |      058       |               1 |             stos off on off;                              * ls on
time 1551.67us |      059       |              60 |             wait row123;
time 1561.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1561.83us |      056       |               8 |             wait row124;
time 1563.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1563.33us |      058       |               1 |             stos off on off;                              * ls on
time 1563.50us |      059       |              60 |             wait row123;
time 1573.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1573.67us |      056       |              35 |             wait row124;
time 1579.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1579.67us |      058       |               1 |             stos off on off;                              * ls on
time 1579.83us |      059       |              60 |             wait row123;
time 1589.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1590.00us |      056       |               8 |             wait row124;
time 1591.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1591.50us |      058       |               1 |             stos off on off;                              * ls on
time 1591.67us |      059       |              60 |             wait row123;
time 1601.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1601.83us |      056       |              33 |             wait row124;
time 1607.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1607.50us |      058       |               1 |             stos off on off;                              * ls on
time 1607.67us |      059       |              60 |             wait row123;
time 1617.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1617.83us |      056       |               8 |             wait row124;
time 1619.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1619.33us |      058       |               1 |             stos off on off;                              * ls on
time 1619.50us |      059       |              60 |             wait row123;
time 1629.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1629.67us |      056       |              34 |             wait row124;
time 1635.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1635.50us |      058       |               1 |             stos off on off;                              * ls on
time 1635.67us |      059       |              60 |             wait row123;
time 1645.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1645.83us |      056       |               8 |             wait row124;
time 1647.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1647.33us |      058       |               1 |             stos off on off;                              * ls on
time 1647.50us |      059       |              60 |             wait row123;
time 1657.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1657.67us |      056       |              33 |             wait row124;
time 1663.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1663.33us |      058       |               1 |             stos off on off;                              * ls on
time 1663.50us |      059       |              60 |             wait row123;
time 1673.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1673.67us |      056       |               8 |             wait row124;
time 1675.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1675.17us |      058       |               1 |             stos off on off;                              * ls on
time 1675.33us |      059       |              60 |             wait row123;
time 1685.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1685.50us |      056       |              34 |             wait row124;
time 1691.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1691.33us |      058       |               1 |             stos off on off;                              * ls on
time 1691.50us |      059       |              60 |             wait row123;
time 1701.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1701.67us |      056       |               8 |             wait row124;
time 1703.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1703.17us |      058       |               1 |             stos off on off;                              * ls on
time 1703.33us |      059       |              60 |             wait row123;
time 1713.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1713.50us |      056       |              33 |             wait row124;
time 1719.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1719.17us |      058       |               1 |             stos off on off;                              * ls on
time 1719.33us |      059       |              60 |             wait row123;
time 1729.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1729.50us |      056       |               8 |             wait row124;
time 1730.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1731.00us |      058       |               1 |             stos off on off;                              * ls on
time 1731.17us |      059       |              60 |             wait row123;
time 1741.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1741.33us |      056       |              36 |             wait row124;
time 1747.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1747.50us |      058       |               1 |             stos off on off;                              * ls on
time 1747.67us |      059       |              60 |             wait row123;
time 1757.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1757.83us |      056       |               8 |             wait row124;
time 1759.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1759.33us |      058       |               1 |             stos off on off;                              * ls on
time 1759.50us |      059       |              60 |             wait row123;
time 1769.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1769.67us |      056       |              34 |             wait row124;
time 1775.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1775.50us |      058       |               1 |             stos off on off;                              * ls on
time 1775.67us |      059       |              60 |             wait row123;
time 1785.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1785.83us |      056       |               8 |             wait row124;
time 1787.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1787.33us |      058       |               1 |             stos off on off;                              * ls on
time 1787.50us |      059       |              60 |             wait row123;
time 1797.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1797.67us |      056       |              34 |             wait row124;
time 1803.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1803.50us |      058       |               1 |             stos off on off;                              * ls on
time 1803.67us |      059       |              60 |             wait row123;
time 1813.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1813.83us |      056       |               8 |             wait row124;
time 1815.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1815.33us |      058       |               1 |             stos off on off;                              * ls on
time 1815.50us |      059       |              60 |             wait row123;
time 1825.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1825.67us |      056       |              35 |             wait row124;
time 1831.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1831.67us |      058       |               1 |             stos off on off;                              * ls on
time 1831.83us |      059       |              60 |             wait row123;
time 1841.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1842.00us |      056       |               8 |             wait row124;
time 1843.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1843.50us |      058       |               1 |             stos off on off;                              * ls on
time 1843.67us |      059       |              60 |             wait row123;
time 1853.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1853.83us |      056       |              34 |             wait row124;
time 1859.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1859.67us |      058       |               1 |             stos off on off;                              * ls on
time 1859.83us |      059       |              60 |             wait row123;
time 1869.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1870.00us |      056       |               8 |             wait row124;
time 1871.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1871.50us |      058       |               1 |             stos off on off;                              * ls on
time 1871.67us |      059       |              60 |             wait row123;
time 1881.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1881.83us |      056       |              35 |             wait row124;
time 1887.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1887.83us |      058       |               1 |             stos off on off;                              * ls on
time 1888.00us |      059       |              60 |             wait row123;
time 1898.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1898.17us |      056       |               8 |             wait row124;
time 1899.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1899.67us |      058       |               1 |             stos off on off;                              * ls on
time 1899.83us |      059       |              60 |             wait row123;
time 1909.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1910.00us |      056       |              35 |             wait row124;
time 1915.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1916.00us |      058       |               1 |             stos off on off;                              * ls on
time 1916.17us |      059       |              60 |             wait row123;
time 1926.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1926.33us |      056       |               8 |             wait row124;
time 1927.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1927.83us |      058       |               1 |             stos off on off;                              * ls on
time 1928.00us |      059       |              60 |             wait row123;
time 1938.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1938.17us |      056       |              36 |             wait row124;
time 1944.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1944.33us |      058       |               1 |             stos off on off;                              * ls on
time 1944.50us |      059       |              60 |             wait row123;
time 1954.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1954.67us |      056       |               8 |             wait row124;
time 1956.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1956.17us |      058       |               1 |             stos off on off;                              * ls on
time 1956.33us |      059       |              60 |             wait row123;
time 1966.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1966.50us |      056       |              36 |             wait row124;
time 1972.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1972.67us |      058       |               1 |             stos off on off;                              * ls on
time 1972.83us |      059       |              60 |             wait row123;
time 1982.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1983.00us |      056       |               8 |             wait row124;
time 1984.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1984.50us |      058       |               1 |             stos off on off;                              * ls on
time 1984.67us |      059       |              60 |             wait row123;
time 1994.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1994.83us |      056       |              33 |             wait row124;
time 2000.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 2000.50us |      058       |               1 |             stos off on off;                              * ls on
time 2000.67us |      059       |              60 |             wait row123;
time 2010.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 2010.83us |      056       |               8 |             wait row124;
time 2012.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 2012.33us |      058       |               1 |             stos off on off;                              * ls on
time 2012.50us |      059       |              60 |             wait row123;
time 2022.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 2022.67us |      056       |              35 |             wait row124;
time 2028.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 2028.67us |      058       |               1 |             stos off on off;                              * ls on
time 2028.83us |      059       |              60 |             wait row123;
time 2038.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 2039.00us |      056       |               8 |             wait row124;
time 2040.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 2040.50us |      058       |               1 |             stos off on off;                              * ls on
time 2040.67us |      059       |              60 |             wait row123;
time 2050.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 2050.83us |      056       |              38 |             wait row124;
time 2057.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 2057.33us |      058       |               1 |             stos off on off;                              * ls on
time 2057.50us |      059       |              60 |             wait row123;
time 2067.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 2067.67us |      056       |               8 |             wait row124;
time 2069.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 2069.17us |      058       |               1 |             stos off on off;                              * ls on
time 2069.33us |      059       |              60 |             wait row123;
time 2079.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 2079.50us |      056       |              24 |             wait row124;
time 2083.50us |      05B       |               1 | eoinj0:     stos off off off;
time 2083.67us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time 2083.83us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation
time 2084.00us |      05E       |               1 |             stf high bstflag;                             * turn on dcdc
time 2084.17us |      05F       |               1 |             jmpf jr2;                                     * jump to idle

// Acquisition performed
// 11/3/2015 4:51:29 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

     TIME     | Code Line(hex) |  Num CLK Cycles | Microcode
time   0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time   0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time   0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time   0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time   0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time   0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time   1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time   1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time   1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time   1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time   1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time   1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time   2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time   2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time   2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time   2.50us |      03F       |            1282 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time 216.17us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time 216.33us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time 216.50us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time 216.67us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time 216.83us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time 217.00us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time 217.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 217.33us |      048       |              35 |             wait row124;
time 223.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 223.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 223.50us |      04B       |              60 |             wait row123;                                        
time 233.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 233.67us |      048       |               1 |             wait row124;
time 233.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 234.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 234.17us |      04B       |              60 |             wait row123;                                        
time 244.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 244.33us |      048       |               1 |             wait row124;
time 244.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 244.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 244.83us |      04B       |              60 |             wait row123;                                        
time 254.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 255.00us |      048       |               1 |             wait row124;
time 255.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 255.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 255.50us |      04B       |              60 |             wait row123;                                        
time 265.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 265.67us |      048       |               1 |             wait row124;
time 265.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 266.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 266.17us |      04B       |              60 |             wait row123;                                        
time 276.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 276.33us |      048       |               1 |             wait row124;
time 276.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 276.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 276.83us |      04B       |              60 |             wait row123;                                        
time 286.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 287.00us |      048       |               1 |             wait row124;
time 287.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 287.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 287.50us |      04B       |              60 |             wait row123;                                        
time 297.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 297.67us |      048       |               7 |             wait row124;
time 298.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 299.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 299.17us |      04B       |              60 |             wait row123;                                        
time 309.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 309.33us |      048       |              70 |             wait row124;
time 321.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 321.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 321.33us |      04B       |              60 |             wait row123;                                        
time 331.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 331.50us |      048       |             112 |             wait row124;
time 350.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 350.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 350.50us |      04B       |              60 |             wait row123;                                        
time 360.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 360.67us |      048       |             109 |             wait row124;
time 378.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 379.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 379.17us |      04B       |              60 |             wait row123;                                        
time 389.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 389.33us |      048       |             113 |             wait row124;
time 408.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 408.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 408.50us |      04B       |              60 |             wait row123;                                        
time 418.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 418.67us |      048       |             119 |             wait row124;
time 438.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 438.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 438.83us |      04B       |              60 |             wait row123;                                        
time 448.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 449.00us |      048       |             110 |             wait row124;
time 467.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 467.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 467.67us |      04B       |              60 |             wait row123;                                        
time 477.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 477.83us |      048       |              98 |             wait row124;
time 494.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 494.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 494.50us |      04B       |              60 |             wait row123;                                        
time 504.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 504.67us |      048       |             102 |             wait row124;
time 521.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 521.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 522.00us |      04B       |              60 |             wait row123;                                        
time 532.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 532.17us |      048       |              94 |             wait row124;
time 547.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 548.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 548.17us |      04B       |              60 |             wait row123;                                        
time 558.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 558.33us |      048       |              89 |             wait row124;
time 573.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 573.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 573.50us |      04B       |              60 |             wait row123;                                        
time 583.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 583.67us |      048       |              92 |             wait row124;
time 599.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 599.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 599.33us |      04B       |              60 |             wait row123;                                        
time 609.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 609.50us |      048       |              82 |             wait row124;
time 623.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 623.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 623.50us |      04B       |              60 |             wait row123;                                        
time 633.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 633.67us |      048       |              84 |             wait row124;
time 647.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 647.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 648.00us |      04B       |              60 |             wait row123;                                        
time 658.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 658.17us |      048       |              80 |             wait row124;
time 671.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 671.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 671.83us |      04B       |              60 |             wait row123;                                        
time 681.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 682.00us |      048       |              80 |             wait row124;
time 695.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time 695.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time 695.67us |      04B       |              60 |             wait row123;                                        
time 705.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time 705.83us |      048       |              64 |             wait row124;
time 716.50us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time 716.67us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time 716.83us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time 717.00us |      04F       |             119 |             wait row14;
time 736.83us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time 737.00us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time 737.17us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time 737.33us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time 737.50us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time 737.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 737.83us |      056       |              72 |             wait row124;
time 749.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 750.00us |      058       |               1 |             stos off on off;                              * ls on
time 750.17us |      059       |              60 |             wait row123;
time 760.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 760.33us |      056       |               7 |             wait row124;
time 761.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 761.67us |      058       |               1 |             stos off on off;                              * ls on
time 761.83us |      059       |              60 |             wait row123;
time 771.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 772.00us |      056       |               1 |             wait row124;
time 772.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 772.33us |      058       |               1 |             stos off on off;                              * ls on
time 772.50us |      059       |              60 |             wait row123;
time 782.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 782.67us |      056       |               1 |             wait row124;
time 782.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 783.00us |      058       |               1 |             stos off on off;                              * ls on
time 783.17us |      059       |              60 |             wait row123;
time 793.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 793.33us |      056       |               1 |             wait row124;
time 793.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 793.67us |      058       |               1 |             stos off on off;                              * ls on
time 793.83us |      059       |              60 |             wait row123;
time 803.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 804.00us |      056       |               1 |             wait row124;
time 804.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 804.33us |      058       |               1 |             stos off on off;                              * ls on
time 804.50us |      059       |              60 |             wait row123;
time 814.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 814.67us |      056       |               7 |             wait row124;
time 815.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 816.00us |      058       |               1 |             stos off on off;                              * ls on
time 816.17us |      059       |              60 |             wait row123;
time 826.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 826.33us |      056       |               7 |             wait row124;
time 827.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 827.67us |      058       |               1 |             stos off on off;                              * ls on
time 827.83us |      059       |              60 |             wait row123;
time 837.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 838.00us |      056       |               7 |             wait row124;
time 839.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 839.33us |      058       |               1 |             stos off on off;                              * ls on
time 839.50us |      059       |              60 |             wait row123;
time 849.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 849.67us |      056       |               7 |             wait row124;
time 850.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 851.00us |      058       |               1 |             stos off on off;                              * ls on
time 851.17us |      059       |              60 |             wait row123;
time 861.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 861.33us |      056       |               7 |             wait row124;
time 862.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 862.67us |      058       |               1 |             stos off on off;                              * ls on
time 862.83us |      059       |              60 |             wait row123;
time 872.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 873.00us |      056       |               7 |             wait row124;
time 874.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 874.33us |      058       |               1 |             stos off on off;                              * ls on
time 874.50us |      059       |              60 |             wait row123;
time 884.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 884.67us |      056       |               7 |             wait row124;
time 885.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 886.00us |      058       |               1 |             stos off on off;                              * ls on
time 886.17us |      059       |              60 |             wait row123;
time 896.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 896.33us |      056       |               7 |             wait row124;
time 897.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 897.67us |      058       |               1 |             stos off on off;                              * ls on
time 897.83us |      059       |              60 |             wait row123;
time 907.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 908.00us |      056       |               7 |             wait row124;
time 909.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 909.33us |      058       |               1 |             stos off on off;                              * ls on
time 909.50us |      059       |              60 |             wait row123;
time 919.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 919.67us |      056       |               8 |             wait row124;
time 921.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 921.17us |      058       |               1 |             stos off on off;                              * ls on
time 921.33us |      059       |              42 |             wait row123;
time 928.33us |      05B       |               1 | eoinj0:     stos off off off;
time 928.50us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time 928.67us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation
time 928.83us |      05E       |               1 |             stf high bstflag;                             * turn on dcdc
time 929.00us |      05F       |               1 |             jmpf jr2;                                     * jump to idle

// Acquisition performed
// 11/3/2015 4:51:52 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1292 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  217.83us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  218.00us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  218.17us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  218.33us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  218.50us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  218.67us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  218.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  219.00us |      048       |              35 |             wait row124;
time  224.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  225.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  225.17us |      04B       |              60 |             wait row123;                                        
time  235.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  235.33us |      048       |               1 |             wait row124;
time  235.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  235.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  235.83us |      04B       |              60 |             wait row123;                                        
time  245.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  246.00us |      048       |               1 |             wait row124;
time  246.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  246.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  246.50us |      04B       |              60 |             wait row123;                                        
time  256.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  256.67us |      048       |               1 |             wait row124;
time  256.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  257.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  257.17us |      04B       |              60 |             wait row123;                                        
time  267.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  267.33us |      048       |               1 |             wait row124;
time  267.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  267.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  267.83us |      04B       |              60 |             wait row123;                                        
time  277.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  278.00us |      048       |               1 |             wait row124;
time  278.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  278.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  278.50us |      04B       |              60 |             wait row123;                                        
time  288.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  288.67us |      048       |               1 |             wait row124;
time  288.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  289.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  289.17us |      04B       |              60 |             wait row123;                                        
time  299.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  299.33us |      048       |               7 |             wait row124;
time  300.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  300.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  300.83us |      04B       |              60 |             wait row123;                                        
time  310.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  311.00us |      048       |              61 |             wait row124;
time  321.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  321.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  321.50us |      04B       |              60 |             wait row123;                                        
time  331.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  331.67us |      048       |             110 |             wait row124;
time  350.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  350.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  350.33us |      04B       |              60 |             wait row123;                                        
time  360.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  360.50us |      048       |             106 |             wait row124;
time  378.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  378.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  378.50us |      04B       |              60 |             wait row123;                                        
time  388.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  388.67us |      048       |             114 |             wait row124;
time  407.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  407.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  408.00us |      04B       |              60 |             wait row123;                                        
time  418.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  418.17us |      048       |             118 |             wait row124;
time  437.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  438.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  438.17us |      04B       |              60 |             wait row123;                                        
time  448.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  448.33us |      048       |             106 |             wait row124;
time  466.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  466.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  466.33us |      04B       |              60 |             wait row123;                                        
time  476.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  476.50us |      048       |              98 |             wait row124;
time  492.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  493.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  493.17us |      04B       |              60 |             wait row123;                                        
time  503.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  503.33us |      048       |              99 |             wait row124;
time  519.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  520.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  520.17us |      04B       |              60 |             wait row123;                                        
time  530.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  530.33us |      048       |              93 |             wait row124;
time  545.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  546.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  546.17us |      04B       |              60 |             wait row123;                                        
time  556.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  556.33us |      048       |              87 |             wait row124;
time  570.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  571.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  571.17us |      04B       |              60 |             wait row123;                                        
time  581.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  581.33us |      048       |              89 |             wait row124;
time  596.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  596.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  596.50us |      04B       |              60 |             wait row123;                                        
time  606.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  606.67us |      048       |              85 |             wait row124;
time  620.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  621.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  621.17us |      04B       |              60 |             wait row123;                                        
time  631.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  631.33us |      048       |              84 |             wait row124;
time  645.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  645.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  645.67us |      04B       |              60 |             wait row123;                                        
time  655.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  655.83us |      048       |              83 |             wait row124;
time  669.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  669.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  670.00us |      04B       |              60 |             wait row123;                                        
time  680.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  680.17us |      048       |              77 |             wait row124;
time  693.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  693.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  693.33us |      04B       |              60 |             wait row123;                                        
time  703.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  703.50us |      048       |              81 |             wait row124;
time  717.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  717.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  717.33us |      04B       |               5 |             wait row123;                                        
time  718.17us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time  718.33us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time  718.50us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time  718.67us |      04F       |             119 |             wait row14;
time  738.50us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time  738.67us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time  738.83us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time  739.00us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time  739.17us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time  739.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  739.50us |      056       |              71 |             wait row124;
time  751.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  751.50us |      058       |               1 |             stos off on off;                              * ls on
time  751.67us |      059       |              60 |             wait row123;
time  761.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  761.83us |      056       |               7 |             wait row124;
time  763.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  763.17us |      058       |               1 |             stos off on off;                              * ls on
time  763.33us |      059       |              60 |             wait row123;
time  773.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  773.50us |      056       |               1 |             wait row124;
time  773.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  773.83us |      058       |               1 |             stos off on off;                              * ls on
time  774.00us |      059       |              60 |             wait row123;
time  784.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  784.17us |      056       |               1 |             wait row124;
time  784.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  784.50us |      058       |               1 |             stos off on off;                              * ls on
time  784.67us |      059       |              60 |             wait row123;
time  794.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  794.83us |      056       |               1 |             wait row124;
time  795.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  795.17us |      058       |               1 |             stos off on off;                              * ls on
time  795.33us |      059       |              48 |             wait row123;
time  803.33us |      05B       |               1 | eoinj0:     stos off off off;
time  803.50us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time  803.67us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation

// Acquisition performed
// 11/3/2015 4:52:17 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1276 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  215.17us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  215.33us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  215.50us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  215.67us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  215.83us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  216.00us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  216.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  216.33us |      048       |              35 |             wait row124;
time  222.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  222.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  222.50us |      04B       |              60 |             wait row123;                                        
time  232.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  232.67us |      048       |               1 |             wait row124;
time  232.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  233.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  233.17us |      04B       |              60 |             wait row123;                                        
time  243.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  243.33us |      048       |               1 |             wait row124;
time  243.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  243.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  243.83us |      04B       |              60 |             wait row123;                                        
time  253.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  254.00us |      048       |               1 |             wait row124;
time  254.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  254.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  254.50us |      04B       |              60 |             wait row123;                                        
time  264.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  264.67us |      048       |               1 |             wait row124;
time  264.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  265.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  265.17us |      04B       |              60 |             wait row123;                                        
time  275.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  275.33us |      048       |               1 |             wait row124;
time  275.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  275.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  275.83us |      04B       |              60 |             wait row123;                                        
time  285.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  286.00us |      048       |               1 |             wait row124;
time  286.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  286.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  286.50us |      04B       |              60 |             wait row123;                                        
time  296.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  296.67us |      048       |               8 |             wait row124;
time  298.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  298.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  298.33us |      04B       |              60 |             wait row123;                                        
time  308.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  308.50us |      048       |              78 |             wait row124;
time  321.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  321.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  321.83us |      04B       |              60 |             wait row123;                                        
time  331.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  332.00us |      048       |             123 |             wait row124;
time  352.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  352.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  352.83us |      04B       |              60 |             wait row123;                                        
time  362.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  363.00us |      048       |             120 |             wait row124;
time  383.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  383.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  383.33us |      04B       |              60 |             wait row123;                                        
time  393.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  393.50us |      048       |             113 |             wait row124;
time  412.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  412.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  412.67us |      04B       |              60 |             wait row123;                                        
time  422.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  422.83us |      048       |             115 |             wait row124;
time  442.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  442.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  442.33us |      04B       |              60 |             wait row123;                                        
time  452.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  452.50us |      048       |             111 |             wait row124;
time  471.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  471.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  471.33us |      04B       |              60 |             wait row123;                                        
time  481.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  481.50us |      048       |             103 |             wait row124;
time  498.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  498.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  499.00us |      04B       |              60 |             wait row123;                                        
time  509.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  509.17us |      048       |              97 |             wait row124;
time  525.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  525.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  525.67us |      04B       |              60 |             wait row123;                                        
time  535.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  535.83us |      048       |              96 |             wait row124;
time  551.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  552.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  552.17us |      04B       |              60 |             wait row123;                                        
time  562.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  562.33us |      048       |              93 |             wait row124;
time  577.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  578.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  578.17us |      04B       |              60 |             wait row123;                                        
time  588.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  588.33us |      048       |              87 |             wait row124;
time  602.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  603.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  603.17us |      04B       |              60 |             wait row123;                                        
time  613.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  613.33us |      048       |              86 |             wait row124;
time  627.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  627.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  628.00us |      04B       |              60 |             wait row123;                                        
time  638.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  638.17us |      048       |              85 |             wait row124;
time  652.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  652.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  652.67us |      04B       |              60 |             wait row123;                                        
time  662.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  662.83us |      048       |              80 |             wait row124;
time  676.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  676.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  676.50us |      04B       |              60 |             wait row123;                                        
time  686.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  686.67us |      048       |              83 |             wait row124;
time  700.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  700.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  700.83us |      04B       |              60 |             wait row123;                                        
time  710.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  711.00us |      048       |              27 |             wait row124;
time  715.50us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time  715.67us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time  715.83us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time  716.00us |      04F       |             119 |             wait row14;
time  735.83us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time  736.00us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time  736.17us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time  736.33us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time  736.50us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time  736.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  736.83us |      056       |              78 |             wait row124;
time  749.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  750.00us |      058       |               1 |             stos off on off;                              * ls on
time  750.17us |      059       |              53 |             wait row123;
time  759.00us |      05B       |               1 | eoinj0:     stos off off off;
time  759.17us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time  759.33us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation
time  759.50us |      05E       |               1 |             stf high bstflag;                             * turn on dcdc

// Acquisition performed
// 11/3/2015 4:52:36 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

       TIME       | Code Line(hex) |  Num CLK Cycles | Microcode
time       0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time       0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time       0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time       0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time       0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time       0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time       1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time       1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time       1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time       1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time       1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time       1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time       2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time       2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time       2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time       2.50us |      03F       |            1280 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time     215.83us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time     216.00us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time     216.17us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time     216.33us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time     216.50us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time     216.67us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time     216.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     217.00us |      048       |              35 |             wait row124;
time     222.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     223.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     223.17us |      04B       |              60 |             wait row123;                                        
time     233.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     233.33us |      048       |               1 |             wait row124;
time     233.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     233.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     233.83us |      04B       |              60 |             wait row123;                                        
time     243.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     244.00us |      048       |               1 |             wait row124;
time     244.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     244.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     244.50us |      04B       |              60 |             wait row123;                                        
time     254.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     254.67us |      048       |               1 |             wait row124;
time     254.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     255.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     255.17us |      04B       |              60 |             wait row123;                                        
time     265.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     265.33us |      048       |               1 |             wait row124;
time     265.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     265.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     265.83us |      04B       |              60 |             wait row123;                                        
time     275.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     276.00us |      048       |               1 |             wait row124;
time     276.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     276.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     276.50us |      04B       |              60 |             wait row123;                                        
time     286.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     286.67us |      048       |               1 |             wait row124;
time     286.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     287.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     287.17us |      04B       |              60 |             wait row123;                                        
time     297.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     297.33us |      048       |               7 |             wait row124;
time     298.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     298.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     298.83us |      04B       |              60 |             wait row123;                                        
time     308.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     309.00us |      048       |              74 |             wait row124;
time     321.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     321.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     321.67us |      04B       |              60 |             wait row123;                                        
time     331.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     331.83us |      048       |             121 |             wait row124;
time     352.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     352.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     352.33us |      04B       |              60 |             wait row123;                                        
time     362.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     362.50us |      048       |             113 |             wait row124;
time     381.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     381.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     381.67us |      04B       |              60 |             wait row123;                                        
time     391.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     391.83us |      048       |             113 |             wait row124;
time     410.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     410.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     411.00us |      04B       |              60 |             wait row123;                                        
time     421.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     421.17us |      048       |             119 |             wait row124;
time     441.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     441.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     441.33us |      04B       |              60 |             wait row123;                                        
time     451.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     451.50us |      048       |             108 |             wait row124;
time     469.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     469.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     469.83us |      04B       |              60 |             wait row123;                                        
time     479.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     480.00us |      048       |             103 |             wait row124;
time     497.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     497.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     497.50us |      04B       |              60 |             wait row123;                                        
time     507.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     507.67us |      048       |              98 |             wait row124;
time     524.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     524.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     524.33us |      04B       |              60 |             wait row123;                                        
time     534.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     534.50us |      048       |              95 |             wait row124;
time     550.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     550.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     550.67us |      04B       |              60 |             wait row123;                                        
time     560.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     560.83us |      048       |              90 |             wait row124;
time     575.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     576.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     576.17us |      04B       |              60 |             wait row123;                                        
time     586.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     586.33us |      048       |              88 |             wait row124;
time     601.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     601.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     601.33us |      04B       |              60 |             wait row123;                                        
time     611.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     611.50us |      048       |              87 |             wait row124;
time     626.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     626.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     626.33us |      04B       |              60 |             wait row123;                                        
time     636.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     636.50us |      048       |              80 |             wait row124;
time     649.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     650.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     650.17us |      04B       |              60 |             wait row123;                                        
time     660.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     660.33us |      048       |              85 |             wait row124;
time     674.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     674.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     674.83us |      04B       |              60 |             wait row123;                                        
time     684.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     685.00us |      048       |              78 |             wait row124;
time     698.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time     698.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time     698.33us |      04B       |              60 |             wait row123;                                        
time     708.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time     708.50us |      048       |              46 |             wait row124;
time     716.17us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time     716.33us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time     716.50us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time     716.67us |      04F       |             119 |             wait row14;
time     736.50us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time     736.67us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time     736.83us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time     737.00us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time     737.17us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time     737.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     737.50us |      056       |              77 |             wait row124;
time     750.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     750.50us |      058       |               1 |             stos off on off;                              * ls on
time     750.67us |      059       |              60 |             wait row123;
time     760.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     760.83us |      056       |               7 |             wait row124;
time     762.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     762.17us |      058       |               1 |             stos off on off;                              * ls on
time     762.33us |      059       |              60 |             wait row123;
time     772.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     772.50us |      056       |               1 |             wait row124;
time     772.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     772.83us |      058       |               1 |             stos off on off;                              * ls on
time     773.00us |      059       |              60 |             wait row123;
time     783.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     783.17us |      056       |               1 |             wait row124;
time     783.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     783.50us |      058       |               1 |             stos off on off;                              * ls on
time     783.67us |      059       |              60 |             wait row123;
time     793.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     793.83us |      056       |               1 |             wait row124;
time     794.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     794.17us |      058       |               1 |             stos off on off;                              * ls on
time     794.33us |      059       |              60 |             wait row123;
time     804.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     804.50us |      056       |               1 |             wait row124;
time     804.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     804.83us |      058       |               1 |             stos off on off;                              * ls on
time     805.00us |      059       |              60 |             wait row123;
time     815.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     815.17us |      056       |               7 |             wait row124;
time     816.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     816.50us |      058       |               1 |             stos off on off;                              * ls on
time     816.67us |      059       |              60 |             wait row123;
time     826.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     826.83us |      056       |               7 |             wait row124;
time     828.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     828.17us |      058       |               1 |             stos off on off;                              * ls on
time     828.33us |      059       |              60 |             wait row123;
time     838.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     838.50us |      056       |               7 |             wait row124;
time     839.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     839.83us |      058       |               1 |             stos off on off;                              * ls on
time     840.00us |      059       |              60 |             wait row123;
time     850.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     850.17us |      056       |               7 |             wait row124;
time     851.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     851.50us |      058       |               1 |             stos off on off;                              * ls on
time     851.67us |      059       |              60 |             wait row123;
time     861.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     861.83us |      056       |               7 |             wait row124;
time     863.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     863.17us |      058       |               1 |             stos off on off;                              * ls on
time     863.33us |      059       |              60 |             wait row123;
time     873.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     873.50us |      056       |               7 |             wait row124;
time     874.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     874.83us |      058       |               1 |             stos off on off;                              * ls on
time     875.00us |      059       |              60 |             wait row123;
time     885.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     885.17us |      056       |               7 |             wait row124;
time     886.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     886.50us |      058       |               1 |             stos off on off;                              * ls on
time     886.67us |      059       |              60 |             wait row123;
time     896.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     896.83us |      056       |               7 |             wait row124;
time     898.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     898.17us |      058       |               1 |             stos off on off;                              * ls on
time     898.33us |      059       |              60 |             wait row123;
time     908.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     908.50us |      056       |               8 |             wait row124;
time     909.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     910.00us |      058       |               1 |             stos off on off;                              * ls on
time     910.17us |      059       |              60 |             wait row123;
time     920.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     920.33us |      056       |               8 |             wait row124;
time     921.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     921.83us |      058       |               1 |             stos off on off;                              * ls on
time     922.00us |      059       |              60 |             wait row123;
time     932.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     932.17us |      056       |               8 |             wait row124;
time     933.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     933.67us |      058       |               1 |             stos off on off;                              * ls on
time     933.83us |      059       |              60 |             wait row123;
time     943.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     944.00us |      056       |              17 |             wait row124;
time     946.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     947.00us |      058       |               1 |             stos off on off;                              * ls on
time     947.17us |      059       |              60 |             wait row123;
time     957.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     957.33us |      056       |               8 |             wait row124;
time     958.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     958.83us |      058       |               1 |             stos off on off;                              * ls on
time     959.00us |      059       |              60 |             wait row123;
time     969.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     969.17us |      056       |              19 |             wait row124;
time     972.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     972.50us |      058       |               1 |             stos off on off;                              * ls on
time     972.67us |      059       |              60 |             wait row123;
time     982.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     982.83us |      056       |              17 |             wait row124;
time     985.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     985.83us |      058       |               1 |             stos off on off;                              * ls on
time     986.00us |      059       |              60 |             wait row123;
time     996.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time     996.17us |      056       |              16 |             wait row124;
time     998.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time     999.00us |      058       |               1 |             stos off on off;                              * ls on
time     999.17us |      059       |              60 |             wait row123;
time    1009.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1009.33us |      056       |              16 |             wait row124;
time    1012.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1012.17us |      058       |               1 |             stos off on off;                              * ls on
time    1012.33us |      059       |              60 |             wait row123;
time    1022.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1022.50us |      056       |              18 |             wait row124;
time    1025.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1025.67us |      058       |               1 |             stos off on off;                              * ls on
time    1025.83us |      059       |              60 |             wait row123;
time    1035.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1036.00us |      056       |              17 |             wait row124;
time    1038.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1039.00us |      058       |               1 |             stos off on off;                              * ls on
time    1039.17us |      059       |              60 |             wait row123;
time    1049.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1049.33us |      056       |              18 |             wait row124;
time    1052.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1052.50us |      058       |               1 |             stos off on off;                              * ls on
time    1052.67us |      059       |              60 |             wait row123;
time    1062.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1062.83us |      056       |              19 |             wait row124;
time    1066.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1066.17us |      058       |               1 |             stos off on off;                              * ls on
time    1066.33us |      059       |              60 |             wait row123;
time    1076.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1076.50us |      056       |              18 |             wait row124;
time    1079.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1079.67us |      058       |               1 |             stos off on off;                              * ls on
time    1079.83us |      059       |              60 |             wait row123;
time    1089.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1090.00us |      056       |              19 |             wait row124;
time    1093.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1093.33us |      058       |               1 |             stos off on off;                              * ls on
time    1093.50us |      059       |              60 |             wait row123;
time    1103.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1103.67us |      056       |              18 |             wait row124;
time    1106.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1106.83us |      058       |               1 |             stos off on off;                              * ls on
time    1107.00us |      059       |              60 |             wait row123;
time    1117.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1117.17us |      056       |              19 |             wait row124;
time    1120.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1120.50us |      058       |               1 |             stos off on off;                              * ls on
time    1120.67us |      059       |              60 |             wait row123;
time    1130.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1130.83us |      056       |              19 |             wait row124;
time    1134.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1134.17us |      058       |               1 |             stos off on off;                              * ls on
time    1134.33us |      059       |              60 |             wait row123;
time    1144.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1144.50us |      056       |              19 |             wait row124;
time    1147.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1147.83us |      058       |               1 |             stos off on off;                              * ls on
time    1148.00us |      059       |              60 |             wait row123;
time    1158.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time    1158.17us |      056       |              19 |             wait row124;
time    1161.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time    1161.50us |      058       |               1 |             stos off on off;                              * ls on
time    1161.67us |      059       |              31 |             wait row123;
time    1166.83us |      05B       |               1 | eoinj0:     stos off off off;
time    1167.00us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time    1167.17us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation
time    1167.33us |      05E       |               1 |             stf high bstflag;                             * turn on dcdc
time    1167.50us |      05F       |               1 |             jmpf jr2;                                     * jump to idle
time    1167.67us |      023       |               1 | idle0:      cwer checkstart start row2;             * define entry table for high start pin
time    1167.83us |      024       |               1 |             stoc on sssc;                                * turn on off comp
time    1168.00us |      025       |        12799601 | waitloop:   wait row2;                              * upc is stuck here for almost the whole idle time

// Acquisition performed
// 11/3/2015 4:53:00 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1297 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  218.67us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  218.83us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  219.00us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  219.17us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  219.33us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  219.50us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  219.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  219.83us |      048       |              35 |             wait row124;
time  225.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  225.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  226.00us |      04B       |              60 |             wait row123;                                        
time  236.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  236.17us |      048       |               1 |             wait row124;
time  236.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  236.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  236.67us |      04B       |              60 |             wait row123;                                        
time  246.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  246.83us |      048       |               1 |             wait row124;
time  247.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  247.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  247.33us |      04B       |              60 |             wait row123;                                        
time  257.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  257.50us |      048       |               1 |             wait row124;
time  257.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  257.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  258.00us |      04B       |              60 |             wait row123;                                        
time  268.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  268.17us |      048       |               1 |             wait row124;
time  268.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  268.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  268.67us |      04B       |              60 |             wait row123;                                        
time  278.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  278.83us |      048       |               1 |             wait row124;
time  279.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  279.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  279.33us |      04B       |              60 |             wait row123;                                        
time  289.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  289.50us |      048       |               1 |             wait row124;
time  289.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  289.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  290.00us |      04B       |              60 |             wait row123;                                        
time  300.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  300.17us |      048       |               7 |             wait row124;
time  301.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  301.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  301.67us |      04B       |              60 |             wait row123;                                        
time  311.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  311.83us |      048       |              61 |             wait row124;
time  322.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  322.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  322.33us |      04B       |              60 |             wait row123;                                        
time  332.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  332.50us |      048       |             110 |             wait row124;
time  350.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  351.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  351.17us |      04B       |              60 |             wait row123;                                        
time  361.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  361.33us |      048       |             105 |             wait row124;
time  378.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  379.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  379.17us |      04B       |              60 |             wait row123;                                        
time  389.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  389.33us |      048       |             109 |             wait row124;
time  407.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  407.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  407.83us |      04B       |              60 |             wait row123;                                        
time  417.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  418.00us |      048       |             115 |             wait row124;
time  437.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  437.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  437.50us |      04B       |              60 |             wait row123;                                        
time  447.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  447.67us |      048       |             109 |             wait row124;
time  465.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  466.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  466.17us |      04B       |              60 |             wait row123;                                        
time  476.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  476.33us |      048       |              99 |             wait row124;
time  492.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  493.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  493.17us |      04B       |              60 |             wait row123;                                        
time  503.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  503.33us |      048       |              98 |             wait row124;
time  519.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  519.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  520.00us |      04B       |              60 |             wait row123;                                        
time  530.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  530.17us |      048       |              96 |             wait row124;
time  546.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  546.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  546.50us |      04B       |              60 |             wait row123;                                        
time  556.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  556.67us |      048       |              88 |             wait row124;
time  571.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  571.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  571.67us |      04B       |              60 |             wait row123;                                        
time  581.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  581.83us |      048       |              88 |             wait row124;
time  596.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  596.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  596.83us |      04B       |              60 |             wait row123;                                        
time  606.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  607.00us |      048       |              84 |             wait row124;
time  621.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  621.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  621.33us |      04B       |              60 |             wait row123;                                        
time  631.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  631.50us |      048       |              84 |             wait row124;
time  645.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  645.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  645.83us |      04B       |              60 |             wait row123;                                        
time  655.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  656.00us |      048       |              84 |             wait row124;
time  670.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  670.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  670.33us |      04B       |              60 |             wait row123;                                        
time  680.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  680.50us |      048       |              78 |             wait row124;
time  693.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  693.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  693.83us |      04B       |              60 |             wait row123;                                        
time  703.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  704.00us |      048       |              80 |             wait row124;
time  717.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  717.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  717.67us |      04B       |               8 |             wait row123;                                        
time  719.00us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time  719.17us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time  719.33us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time  719.50us |      04F       |             119 |             wait row14;
time  739.33us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time  739.50us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time  739.67us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time  739.83us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time  740.00us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time  740.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  740.33us |      056       |              71 |             wait row124;
time  752.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  752.33us |      058       |               1 |             stos off on off;                              * ls on
time  752.50us |      059       |              60 |             wait row123;
time  762.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  762.67us |      056       |               7 |             wait row124;
time  763.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  764.00us |      058       |               1 |             stos off on off;                              * ls on
time  764.17us |      059       |              60 |             wait row123;
time  774.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  774.33us |      056       |               1 |             wait row124;
time  774.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  774.67us |      058       |               1 |             stos off on off;                              * ls on
time  774.83us |      059       |              60 |             wait row123;
time  784.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  785.00us |      056       |               1 |             wait row124;
time  785.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  785.33us |      058       |               1 |             stos off on off;                              * ls on
time  785.50us |      059       |              60 |             wait row123;
time  795.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  795.67us |      056       |               1 |             wait row124;
time  795.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  796.00us |      058       |               1 |             stos off on off;                              * ls on
time  796.17us |      059       |              60 |             wait row123;
time  806.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  806.33us |      056       |               1 |             wait row124;
time  806.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  806.67us |      058       |               1 |             stos off on off;                              * ls on
time  806.83us |      059       |              60 |             wait row123;
time  816.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  817.00us |      056       |               1 |             wait row124;
time  817.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  817.33us |      058       |               1 |             stos off on off;                              * ls on
time  817.50us |      059       |              60 |             wait row123;
time  827.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  827.67us |      056       |               7 |             wait row124;
time  828.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  829.00us |      058       |               1 |             stos off on off;                              * ls on
time  829.17us |      059       |              60 |             wait row123;
time  839.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  839.33us |      056       |               7 |             wait row124;
time  840.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  840.67us |      058       |               1 |             stos off on off;                              * ls on
time  840.83us |      059       |              60 |             wait row123;
time  850.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  851.00us |      056       |               7 |             wait row124;
time  852.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  852.33us |      058       |               1 |             stos off on off;                              * ls on
time  852.50us |      059       |              60 |             wait row123;
time  862.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  862.67us |      056       |               7 |             wait row124;
time  863.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  864.00us |      058       |               1 |             stos off on off;                              * ls on
time  864.17us |      059       |              60 |             wait row123;
time  874.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  874.33us |      056       |               7 |             wait row124;
time  875.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  875.67us |      058       |               1 |             stos off on off;                              * ls on
time  875.83us |      059       |              60 |             wait row123;
time  885.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  886.00us |      056       |               7 |             wait row124;
time  887.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  887.33us |      058       |               1 |             stos off on off;                              * ls on
time  887.50us |      059       |              60 |             wait row123;
time  897.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  897.67us |      056       |               7 |             wait row124;
time  898.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  899.00us |      058       |               1 |             stos off on off;                              * ls on
time  899.17us |      059       |              60 |             wait row123;
time  909.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  909.33us |      056       |               8 |             wait row124;
time  910.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  910.83us |      058       |               1 |             stos off on off;                              * ls on
time  911.00us |      059       |              60 |             wait row123;
time  921.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  921.17us |      056       |               7 |             wait row124;
time  922.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  922.50us |      058       |               1 |             stos off on off;                              * ls on
time  922.67us |      059       |              60 |             wait row123;
time  932.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  932.83us |      056       |               8 |             wait row124;
time  934.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  934.33us |      058       |               1 |             stos off on off;                              * ls on
time  934.50us |      059       |              60 |             wait row123;
time  944.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  944.67us |      056       |               8 |             wait row124;
time  946.00us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  946.17us |      058       |               1 |             stos off on off;                              * ls on
time  946.33us |      059       |              60 |             wait row123;
time  956.33us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  956.50us |      056       |              19 |             wait row124;
time  959.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  959.83us |      058       |               1 |             stos off on off;                              * ls on
time  960.00us |      059       |              60 |             wait row123;
time  970.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  970.17us |      056       |              16 |             wait row124;
time  972.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  973.00us |      058       |               1 |             stos off on off;                              * ls on
time  973.17us |      059       |              60 |             wait row123;
time  983.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  983.33us |      056       |               8 |             wait row124;
time  984.67us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  984.83us |      058       |               1 |             stos off on off;                              * ls on
time  985.00us |      059       |              60 |             wait row123;
time  995.00us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  995.17us |      056       |              20 |             wait row124;
time  998.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  998.67us |      058       |               1 |             stos off on off;                              * ls on
time  998.83us |      059       |              60 |             wait row123;
time 1008.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1009.00us |      056       |              17 |             wait row124;
time 1011.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1012.00us |      058       |               1 |             stos off on off;                              * ls on
time 1012.17us |      059       |              60 |             wait row123;
time 1022.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1022.33us |      056       |              19 |             wait row124;
time 1025.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1025.67us |      058       |               1 |             stos off on off;                              * ls on
time 1025.83us |      059       |              60 |             wait row123;
time 1035.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1036.00us |      056       |              17 |             wait row124;
time 1038.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1039.00us |      058       |               1 |             stos off on off;                              * ls on
time 1039.17us |      059       |              60 |             wait row123;
time 1049.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1049.33us |      056       |              18 |             wait row124;
time 1052.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1052.50us |      058       |               1 |             stos off on off;                              * ls on
time 1052.67us |      059       |              60 |             wait row123;
time 1062.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1062.83us |      056       |              18 |             wait row124;
time 1065.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1066.00us |      058       |               1 |             stos off on off;                              * ls on
time 1066.17us |      059       |              60 |             wait row123;
time 1076.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1076.33us |      056       |              18 |             wait row124;
time 1079.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1079.50us |      058       |               1 |             stos off on off;                              * ls on
time 1079.67us |      059       |              60 |             wait row123;
time 1089.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1089.83us |      056       |              18 |             wait row124;
time 1092.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1093.00us |      058       |               1 |             stos off on off;                              * ls on
time 1093.17us |      059       |              60 |             wait row123;
time 1103.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1103.33us |      056       |              19 |             wait row124;
time 1106.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1106.67us |      058       |               1 |             stos off on off;                              * ls on
time 1106.83us |      059       |              60 |             wait row123;
time 1116.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1117.00us |      056       |              19 |             wait row124;
time 1120.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1120.33us |      058       |               1 |             stos off on off;                              * ls on
time 1120.50us |      059       |              60 |             wait row123;
time 1130.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1130.67us |      056       |              19 |             wait row124;
time 1133.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1134.00us |      058       |               1 |             stos off on off;                              * ls on
time 1134.17us |      059       |              60 |             wait row123;
time 1144.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1144.33us |      056       |              19 |             wait row124;
time 1147.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1147.67us |      058       |               1 |             stos off on off;                              * ls on
time 1147.83us |      059       |              60 |             wait row123;
time 1157.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1158.00us |      056       |              20 |             wait row124;
time 1161.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1161.50us |      058       |               1 |             stos off on off;                              * ls on
time 1161.67us |      059       |              60 |             wait row123;
time 1171.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1171.83us |      056       |              20 |             wait row124;
time 1175.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1175.33us |      058       |               1 |             stos off on off;                              * ls on
time 1175.50us |      059       |              60 |             wait row123;
time 1185.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1185.67us |      056       |              22 |             wait row124;
time 1189.33us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1189.50us |      058       |               1 |             stos off on off;                              * ls on
time 1189.67us |      059       |              60 |             wait row123;
time 1199.67us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time 1199.83us |      056       |              20 |             wait row124;
time 1203.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time 1203.33us |      058       |               1 |             stos off on off;                              * ls on
time 1203.50us |      059       |              27 |             wait row123;
time 1208.00us |      05B       |               1 | eoinj0:     stos off off off;
time 1208.17us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time 1208.33us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation
time 1208.50us |      05E       |               1 |             stf high bstflag;                             * turn on dcdc
time 1208.67us |      05F       |               1 |             jmpf jr2;                                     * jump to idle
time 1208.83us |      023       |               1 | idle0:      cwer checkstart start row2;             * define entry table for high start pin
time 1209.00us |      024       |               1 |             stoc on sssc;                                * turn on off comp
time 1209.17us |      025       |             121 | waitloop:   wait row2;                              * upc is stuck here for almost the whole idle time

// Acquisition performed
// 11/3/2015 4:53:43 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// B16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1289 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  217.33us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  217.50us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  217.67us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  217.83us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  218.00us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  218.17us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  218.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  218.50us |      048       |              35 |             wait row124;
time  224.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  224.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  224.67us |      04B       |              60 |             wait row123;                                        
time  234.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  234.83us |      048       |               1 |             wait row124;
time  235.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  235.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  235.33us |      04B       |              60 |             wait row123;                                        
time  245.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  245.50us |      048       |               1 |             wait row124;
time  245.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  245.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  246.00us |      04B       |              60 |             wait row123;                                        
time  256.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  256.17us |      048       |               1 |             wait row124;
time  256.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  256.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  256.67us |      04B       |              60 |             wait row123;                                        
time  266.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  266.83us |      048       |               1 |             wait row124;
time  267.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  267.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  267.33us |      04B       |              60 |             wait row123;                                        
time  277.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  277.50us |      048       |               1 |             wait row124;
time  277.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  277.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  278.00us |      04B       |              60 |             wait row123;                                        
time  288.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  288.17us |      048       |               1 |             wait row124;
time  288.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  288.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  288.67us |      04B       |              60 |             wait row123;                                        
time  298.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  298.83us |      048       |               7 |             wait row124;
time  300.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  300.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  300.33us |      04B       |              60 |             wait row123;                                        
time  310.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  310.50us |      048       |              62 |             wait row124;
time  320.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  321.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  321.17us |      04B       |              60 |             wait row123;                                        
time  331.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  331.33us |      048       |             115 |             wait row124;
time  350.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  350.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  350.83us |      04B       |              60 |             wait row123;                                        
time  360.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  361.00us |      048       |             112 |             wait row124;
time  379.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  379.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  380.00us |      04B       |              60 |             wait row123;                                        
time  390.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  390.17us |      048       |             111 |             wait row124;
time  408.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  408.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  409.00us |      04B       |              60 |             wait row123;                                        
time  419.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  419.17us |      048       |             117 |             wait row124;
time  438.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  438.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  439.00us |      04B       |              60 |             wait row123;                                        
time  449.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  449.17us |      048       |             111 |             wait row124;
time  467.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  467.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  468.00us |      04B       |              60 |             wait row123;                                        
time  478.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  478.17us |      048       |              99 |             wait row124;
time  494.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  494.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  495.00us |      04B       |              60 |             wait row123;                                        
time  505.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  505.17us |      048       |              95 |             wait row124;
time  521.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  521.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  521.33us |      04B       |              60 |             wait row123;                                        
time  531.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  531.50us |      048       |              99 |             wait row124;
time  548.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  548.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  548.33us |      04B       |              60 |             wait row123;                                        
time  558.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  558.50us |      048       |              90 |             wait row124;
time  573.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  573.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  573.83us |      04B       |              60 |             wait row123;                                        
time  583.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  584.00us |      048       |              85 |             wait row124;
time  598.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  598.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  598.50us |      04B       |              60 |             wait row123;                                        
time  608.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  608.67us |      048       |              86 |             wait row124;
time  623.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  623.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  623.33us |      04B       |              60 |             wait row123;                                        
time  633.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  633.50us |      048       |              83 |             wait row124;
time  647.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  647.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  647.67us |      04B       |              60 |             wait row123;                                        
time  657.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  657.83us |      048       |              79 |             wait row124;
time  671.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  671.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  671.33us |      04B       |              60 |             wait row123;                                        
time  681.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  681.50us |      048       |              81 |             wait row124;
time  695.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  695.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  695.33us |      04B       |              60 |             wait row123;                                        
time  705.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  705.50us |      048       |              73 |             wait row124;
time  717.67us |      04C       |               1 | bypass0:    ldcd rst ofs keep keep tbypass c3;              * load in the counter 3 the length of the off_phase phase
time  717.83us |      04D       |               1 |             stos off off off;                               * turn off all hs ls1/2
time  718.00us |      04E       |               1 |             cwer hold0 tc3 row4;                            * define wait: jump to hold when tc3 reaches end of count
time  718.17us |      04F       |             119 |             wait row14;
time  738.00us |      050       |               1 | hold0:      ldcd rst _ofs keep keep thold_tot c1;         * load thold tot inside c1
time  738.17us |      051       |               1 |             load ihold dac_sssc _ofs;                     * load hold current inside dac
time  738.33us |      052       |               1 |             cwer hold_error0 tc1 row2;                    * define wait: jump to hold error if start still high after thold tot
time  738.50us |      053       |               1 |             cwer hold_on0 tc2 row3;                       * define wait: jump to hold on after thold off 
time  738.67us |      054       |               1 |             cwer hold_off0 cur1 row4;                     * define wait: jump to hold off when current ihold reached 
time  738.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  739.00us |      056       |              69 |             wait row124;
time  750.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  750.67us |      058       |               1 |             stos off on off;                              * ls on
time  750.83us |      059       |              60 |             wait row123;
time  760.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  761.00us |      056       |               7 |             wait row124;
time  762.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  762.33us |      058       |               1 |             stos off on off;                              * ls on
time  762.50us |      059       |              60 |             wait row123;
time  772.50us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  772.67us |      056       |               1 |             wait row124;
time  772.83us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  773.00us |      058       |               1 |             stos off on off;                              * ls on
time  773.17us |      059       |              60 |             wait row123;
time  783.17us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  783.33us |      056       |               1 |             wait row124;
time  783.50us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  783.67us |      058       |               1 |             stos off on off;                              * ls on
time  783.83us |      059       |              60 |             wait row123;
time  793.83us |      055       |               1 | hold_on0:   stos on on off;                               * hsvbat on, ls on
time  794.00us |      056       |               1 |             wait row124;
time  794.17us |      057       |               1 | hold_off0:  ldcd rst _ofs keep keep thold_off c2;         * load thold off inside c2 
time  794.33us |      058       |               1 |             stos off on off;                              * ls on
time  794.50us |      059       |              48 |             wait row123;
time  802.50us |      05B       |               1 | eoinj0:     stos off off off;
time  802.67us |      05C       |               1 |             endiags off off off off;                      * disable auto diag
time  802.83us |      05D       |               1 |             bias all off;                            * enable all biasing structures, kept on even during actuation

// Acquisition performed
// 11/10/2015 5:17:36 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// b16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1819 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  305.67us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  305.83us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  306.00us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  306.17us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  306.33us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  306.50us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  306.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  306.83us |      048       |              35 |             wait row124;
time  312.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  312.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  313.00us |      04B       |              60 |             wait row123;                                        
time  323.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  323.17us |      048       |               1 |             wait row124;
time  323.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  323.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  323.67us |      04B       |              60 |             wait row123;                                        
time  333.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  333.83us |      048       |               1 |             wait row124;
time  334.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  334.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  334.33us |      04B       |              60 |             wait row123;                                        
time  344.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  344.50us |      048       |               1 |             wait row124;
time  344.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  344.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  345.00us |      04B       |              60 |             wait row123;                                        
time  355.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  355.17us |      048       |               1 |             wait row124;
time  355.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  355.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  355.67us |      04B       |              60 |             wait row123;                                        
time  365.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  365.83us |      048       |               1 |             wait row124;
time  366.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  366.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  366.33us |      04B       |              60 |             wait row123;                                        
time  376.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  376.50us |      048       |               1 |             wait row124;
time  376.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  376.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  377.00us |      04B       |              60 |             wait row123;                                        
time  387.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  387.17us |      048       |               1 |             wait row124;
time  387.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  387.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  387.67us |      04B       |              60 |             wait row123;                                        
time  397.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  397.83us |      048       |               1 |             wait row124;
time  398.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  398.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  398.33us |      04B       |              47 |             wait row123;                                        
time  406.17us |      05B       |               1 | eoinj0:     stos off off off;

// Acquisition performed
// 11/10/2015 5:23:59 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// b16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1823 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  306.33us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  306.50us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  306.67us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  306.83us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  307.00us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  307.17us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  307.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  307.50us |      048       |              35 |             wait row124;
time  313.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  313.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  313.67us |      04B       |              60 |             wait row123;                                        
time  323.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  323.83us |      048       |               1 |             wait row124;
time  324.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  324.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  324.33us |      04B       |              60 |             wait row123;                                        
time  334.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  334.50us |      048       |               1 |             wait row124;
time  334.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  334.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  335.00us |      04B       |              60 |             wait row123;                                        
time  345.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  345.17us |      048       |               1 |             wait row124;
time  345.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  345.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  345.67us |      04B       |              60 |             wait row123;                                        
time  355.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  355.83us |      048       |               1 |             wait row124;
time  356.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  356.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  356.33us |      04B       |              60 |             wait row123;                                        
time  366.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  366.50us |      048       |               1 |             wait row124;
time  366.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  366.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  367.00us |      04B       |              60 |             wait row123;                                        
time  377.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  377.17us |      048       |               1 |             wait row124;
time  377.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  377.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  377.67us |      04B       |              60 |             wait row123;                                        
time  387.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  387.83us |      048       |               1 |             wait row124;
time  388.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  388.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  388.33us |      04B       |              60 |             wait row123;                                        
time  398.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  398.50us |      048       |               1 |             wait row124;
time  398.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  398.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  399.00us |      04B       |              60 |             wait row123;                                        
time  409.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  409.17us |      048       |               1 |             wait row124;
time  409.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  409.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  409.67us |      04B       |              60 |             wait row123;                                        
time  419.67us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  419.83us |      048       |               1 |             wait row124;
time  420.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  420.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  420.33us |      04B       |              60 |             wait row123;                                        
time  430.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  430.50us |      048       |               1 |             wait row124;
time  430.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  430.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  431.00us |      04B       |              49 |             wait row123;                                        
time  439.17us |      05B       |               1 | eoinj0:     stos off off off;

// Acquisition performed
// 11/10/2015 5:24:15 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// b16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1809 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  304.00us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  304.17us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  304.33us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  304.50us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  304.67us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  304.83us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  305.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  305.17us |      048       |              35 |             wait row124;
time  311.00us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  311.17us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  311.33us |      04B       |              60 |             wait row123;                                        
time  321.33us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  321.50us |      048       |               1 |             wait row124;
time  321.67us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  321.83us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  322.00us |      04B       |              60 |             wait row123;                                        
time  332.00us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  332.17us |      048       |               1 |             wait row124;
time  332.33us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  332.50us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  332.67us |      04B       |              50 |             wait row123;                                        
time  341.00us |      05B       |               1 | eoinj0:     stos off off off;

// Acquisition performed
// 11/10/2015 5:24:35 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// b16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1824 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  306.50us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  306.67us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  306.83us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  307.00us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  307.17us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  307.33us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  307.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  307.67us |      048       |              35 |             wait row124;
time  313.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  313.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  313.83us |      04B       |              60 |             wait row123;                                        
time  323.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  324.00us |      048       |               1 |             wait row124;
time  324.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  324.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  324.50us |      04B       |              60 |             wait row123;                                        
time  334.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  334.67us |      048       |               1 |             wait row124;
time  334.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  335.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  335.17us |      04B       |              60 |             wait row123;                                        
time  345.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  345.33us |      048       |               1 |             wait row124;
time  345.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  345.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  345.83us |      04B       |              60 |             wait row123;                                        
time  355.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  356.00us |      048       |               1 |             wait row124;
time  356.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  356.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  356.50us |      04B       |              60 |             wait row123;                                        
time  366.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  366.67us |      048       |               1 |             wait row124;
time  366.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  367.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  367.17us |      04B       |              60 |             wait row123;                                        
time  377.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  377.33us |      048       |               1 |             wait row124;
time  377.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  377.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  377.83us |      04B       |              60 |             wait row123;                                        
time  387.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  388.00us |      048       |               1 |             wait row124;
time  388.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  388.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  388.50us |      04B       |              60 |             wait row123;                                        
time  398.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  398.67us |      048       |               1 |             wait row124;
time  398.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  399.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  399.17us |      04B       |              60 |             wait row123;                                        
time  409.17us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  409.33us |      048       |               1 |             wait row124;
time  409.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  409.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  409.83us |      04B       |              60 |             wait row123;                                        
time  419.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  420.00us |      048       |               1 |             wait row124;
time  420.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  420.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  420.50us |      04B       |              60 |             wait row123;                                        
time  430.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  430.67us |      048       |               1 |             wait row124;
time  430.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  431.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  431.17us |      04B       |              48 |             wait row123;                                        
time  439.17us |      05B       |               1 | eoinj0:     stos off off off;

// Acquisition performed
// 11/10/2015 5:24:53 PM
// Command line
// AsicTracer.exe C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\source\AN_Diag_ch1.dfi /s syntax_MC33816.xml /dev MC33816 /rd C:\Users\b16868\Desktop\Home_Driver\PSC\1-MC33816\Microcodes\IDE Microcode\On the WEB\AN4954SW\AN_4954_Diag_Rev1_0\tracer /xo /nodate /t 47 /st 91 /e 30 /sw 0 /a 0 /d 0 /f 6.00 /jr1 91 /jr2 35 /w1 91
// User
// b16868

     TIME      | Code Line(hex) |  Num CLK Cycles | Microcode
time    0.00us |      02F       |               1 | idle_diag0:     stoc off sssc;                               * turn off off comp
time    0.17us |      030       |               1 |                 bias all on;                            * enable all biasing structures, kept on even during actuation
time    0.33us |      031       |               1 |                 jocr idle_diag_fail0 _sc1v;             * error detected if vds of shortcut1 (hs) is low
time    0.50us |      032       |               1 |                 jocr idle_diag_fail0 _sc2v;             * error detected if vds of shortcut2 (ls) is low
time    0.67us |      033       |               1 |                 jocr idle_diag_fail0 _sc3v;             * error detected if vds of shortcut3 (boost) is low
time    0.83us |      034       |               1 |                 jocr idle_diag_fail0 _sc1s;             * error detected if vsrc of shortcut1 (hs) is low
time    1.00us |      035       |               1 |                 jocr idle_diag_fail0 _sc3s;             * error detected if vsrc of shortcut3 (boost) is low
time    1.17us |      036       |               1 |                 jmpr boost0;                            * jump to actuation phase if no failure detected in idle phase
time    1.33us |      038       |               1 | boost0:     ldcd rst _ofs keep keep injmaxtboost c3;       * start boost counter in case iboost never reached
time    1.50us |      039       |               1 |             load iboost dac_sssc _ofs;                     * load boost current threshold
time    1.67us |      03A       |               1 |             cwer peak0 cur1 row2;                          * define wait table iboost is reached and jump to peak phase
time    1.83us |      03B       |               1 |             cwer boost_err0 tc3 row5;                      * define wait table if actuation longer than injmaxguard go to eoinj (added from an4849)
time    2.00us |      03C       |               1 |             stf low bstflag;                               * turn off the boost during this phase
time    2.17us |      03D       |               1 |             stos on on on;                                 * vbat high side on, vboost hs on et ls1/2 on, need to turn on hs1 also to avoid diag failure    
time    2.33us |      03E       |               1 |             endiags on on on on;                           * enable auto diag
time    2.50us |      03F       |            1812 |             wait row125;                                   * wait start goes low or iboost reached or injmaxtboost reached
time  304.50us |      041       |               1 | peak0:      ldcd rst _ofs keep keep tpeak_tot c1;           * start tpeak tot counter
time  304.67us |      042       |               1 |             stf high bstflag;                               * turn boost back on
time  304.83us |      043       |               1 |             load ipeak dac_sssc _ofs;                       * load the peak current threshold in the current dac            
time  305.00us |      044       |               1 |             cwer bypass0 tc1 row2;                          * define wait: jump to bypass phase when tc1 reaches end of count            
time  305.17us |      045       |               1 |             cwer peak_on0 tc2 row3;                         * define wait: jump to peak_on when tc2 reaches end of count         
time  305.33us |      046       |               1 |             cwer peak_off0 ocur row4;                       * define wait: jump to peak_off when current is over threshold
time  305.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  305.67us |      048       |              35 |             wait row124;
time  311.50us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  311.67us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  311.83us |      04B       |              60 |             wait row123;                                        
time  321.83us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  322.00us |      048       |               1 |             wait row124;
time  322.17us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  322.33us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  322.50us |      04B       |              60 |             wait row123;                                        
time  332.50us |      047       |               1 | peak_on0:   stos on on off;                                 * vbat on ls on, if needed boost hs can stay on during this phase
time  332.67us |      048       |               1 |             wait row124;
time  332.83us |      049       |               1 | peak_off0:  ldcd rst ofs keep keep tpeak_off c2;            * load in the counter 2 the length of the peak_off phase
time  333.00us |      04A       |               1 |             stos off on off;                                * turn off hsvbat keep ls on
time  333.17us |      04B       |              50 |             wait row123;                                        
time  341.50us |      05B       |               1 | eoinj0:     stos off off off;
