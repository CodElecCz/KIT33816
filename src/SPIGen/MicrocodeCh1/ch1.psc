#include "dram1.def";
*********************************************************************************
*                                               Copyright (c) Freescale 2014    *
*                                                                               *
* Current Revision: 2.0                                                         *
* Purpose: MC33816 example - 1 Bank diagnostic                                  *
* Description:  MC33816 Channel 1 main function provide peak and hold current   *
*               profile for Uc0Ch1 and use idle and automatic diagnostics       *
*               Uc1CH1 provide peak and hold without diagnostics                *
*                                                                               *
* REV  AUTHOR    DATE        DESCRIPTION OF CHANGE                              *
* ---  ------    --------    ---------------------                              *
* 1.0  b16868    2014/03/25     - initial coding                                *
* 2.0  b16868    2015/11/03    -update with IDE features                        *
*                                                                               *
*********************************************************************************

*********************************************************************************
* Freescale reserves  the right to make  changes without  further notice to any *
* product herein to improve  reliability, function,  or design.  Freescale does *
* not  assume  any  liability  arising  out of  the application  or use  of any *
* product, circuit,  or software described herein;  neither does  it convey any *
* license under its patent rights nor the rights of others.  Freescale products *
* are not designed, intended,  or authorized for use as  components  in systems *
* intended for  surgical implant into the body,  or other applications intended *
* to support life,  or for any other  application  in which the failure  of the *
* Freescale product could create a situation where  personal injury or death may*
* occur.  Should Buyer purchase or use Freescale products for any such intended *
* or unauthorized  application,  Buyer shall indemnify and  hold  Freescale and *
* its officers, employees, subsidiaries, affiliates,  and distributors harmless *
* against all claims costs, damages, and expenses, and reasonable attorney  fees*
* arising  out of,  directly or indirectly,  any claim  of personal  injury  or *
* death  associated  with  such unintended  or unauthorized use,  even if  such *
* claim  alleges  that  Freescale   was  negligent   regarding   the  design  or*
* manufacture  of the part.  Freescale and the  Freescale logo  are registered  *
* trademarks of Freescale Ltd.                                                  *
*********************************************************************************


* ### Channel 1 - uCore0 controls the injectors 1 ###



* Constant definition
#define HSBoost_B1 hs2;
#define HSBAT_B1 hs1;
#define LS1_B1 ls1;
#define LS2_B1 ls2;
* Constant definition
#define HSBoost_B2 hs4;
#define HSBAT_B2 hs3;
#define LS1_B2 ls3;
#define LS2_B2 ls4;


*################## STATUS REGISTER ##############
* This bit must be set to 1 if the Iboost current is never reached during the boost phase
#define BoostErrorBit b5;
* This bit must be set to 1 the sequencer is currently executing the Automatic interrupt routine
#define AutoIrqBit b6;
* This bit must be set to 1 the sequencer is currently executing the Idle Diag interrupt routine
#define IdleIrqBit b7;
* This bit must be set to 1 if start pin stays high longer than 10ms
#define HoldErrorBit b4;


*################## FLAGS ##############
* This flag is sent to the DCDC sequencer. It must be active for the whole period the boost voltage is used
* When the boost voltage is used, the DCDC must be deactivated
* flag = 0 => boost voltage is used, DCDC must be deactivated
* flag = 1 => boost voltage not used, DCDC can be active
#define BstFlag b0;


*################## CONTROL REGISTER ##############
* During the interrupt routine, the sequencer wait for this bit to be set to '1' before resuming execution of application code
#define AutoDiagResetBit b6;
* During the interrupt routine, the sequencer wait for this bit to be set to '1' before resuming execution of application code
#define IdleDiagResetBit b7;
* During the interrupt routine, the sequencer wait for this bit to be set to '1' before resuming execution of application code
#define BoostResetBit b5;
* During the interrupt routine, the sequencer wait for this bit to be set to '1' before resuming execution of application code
#define HoldResetBit b4;



*################## ALU registers  ################
#define IRQ_stat_Reg r0;




  
*********************************************************************************************************            
*                                        AUTOMATIC INTERUPT                                             *            
********************************************************************************************************* 
irq_auto:       stos off off off;                       * Disable drivers
                endiaga diagoff;                        * Disable automatic diagnostic
                stirq low;                              * Set the low IRQB pin
                stf high BstFlag;                       * Set flag0 high DCDC active
                stsrb high AutoIrqBit;                  * Set status register bit 6 when automatic diagnosis interrupt trig

auto_waitEnable:jcrr auto_waitEnable AutoDiagResetBit low;  * the sequencer is stuck here until the bit of the control register is set to '1' b6
                ldjr1 restore;                          * Load restore to jr1 to do a jump far               
                jmpf jr1;                               * Jump to restore
                
                

*********************************************************************************************************            
*                                         SOFTWARE INTERUPT                                             *            
********************************************************************************************************* 
irq1_sw:        stos off off off;                       * Disable drivers
                endiaga diagoff;                        * Disable automatic diagnostic
                stirq low;                              * Set low the IRQB pin
                stf high BstFlag;                       * Set flag0 high to release the DC-DC converter idle mode
                
                * Check which Sw interrupt occured BoostErr 0 or Idle Diag Fail 1
                cp irq IRQ_stat_Reg;                    * copy the irq status registers to a temp ALU reg
                                                        * This register contains also the sw irq ID
                ldirh 0Ch rst;                          * load MSB in ir reg: 0x0C00 in immediate register, to use as mask for irq status                                        
                and IRQ_stat_Reg;                       * extract the sw id from irq status register (bits 11-10)
                jarr Boost_waitEN all0;                 * if the sw id is 0 => Iboost never reached => go to Boost_waitEN
                                                        * Else => error detected in idle diag=> go to next line => seq stuck until micro write 1 in control register b8                                                        

                                                        
                ldirh 08h rst;                          * load MSB in ir reg: 0x0800 in immediate register, to use as mask for irq status  
                and IRQ_stat_Reg;                       * extract the sw id from irq status register (bits 11-10)
                jarr sw_waitEnable all0;                  * if the sw id is 0 => Means IRQ = b01 => Idle diagnostics fails
                                                        * Else => Hold error => go to next line => idle diag fail                                                      

                                                        
Hold_waitEN:    stsrb high HoldErrorBit;                * Start pin stays higher longer than 10ms
                jcrr Hold_waitEN HoldResetBit low;      * Wait here until control bit register b4 is write to 1   
                jmpr restore;
                
sw_waitEnable:  stsrb high IdleIrqBit;                  * IDle diag fail we set status b7 high to let user know which error occured
                jcrr sw_waitEnable IdleDiagResetBit low;* Wait here until control bit register b7 is write to 1 
                jmpr restore;
                
                
Boost_waitEN:   stsrb high BoostErrorBit;               * Iboost never reached, let user know by setting status register bit b5               
                jcrr Boost_waitEN BoostResetBit low;    * Wait here until control bit register b5 is write to 1

                   
                
restore:        stirq high;                             * Set high IRQB pin
                rstreg all;                             * Reset a) control registers
                                                        *       b) status regsiter
                                                        *       c) err_seq register (status of automatic diagnosis  
                                                        *       d) re-enables irq generation from automatic diagnosis
                iret restart rst;                       * Clear interrupt queue and restart from init phase


                
                
*********************************************************************************************************            
*                                         INIT PHASE
********************************************************************************************************* 
init0:      stirq high;                                 * Set high IRQB pin
            stgn gain8.68 sssc;                         * Set gain amplifier for current feedback 1
            ldjr1 eoinj0;                               * Load end of injector in jr1 to use jump far
            ldjr2 idle0;                                * Load idle0 in jr1 to use jump far
            cwef jr1 _start row1;                       * If any start goes low go to eoi
   
            
*********************************************************************************************************            
*                                         IDLE PHASE                                                    *            
********************************************************************************************************* 
idle0:      cwer CheckStart start row2;             * Define entry table for high start pin
            stoc on sssc;                                * Turn ON off comp
WaitLoop:   wait row2;                              * uPC is stuck here for almost the whole idle time
CheckStart: joslr inj1_start start1;                * Jump to inj1 if start 1 is high
            joslr inj2_start start2;                * Jump to inj2 if start 2 is high
            jmpr WaitLoop;        
            
*********************************************************************************************************            
*                                         SHORTCUT DEFINITION                                           *            
********************************************************************************************************* 
inj1_start:      dfsct HSBAT_B1 LS1_B1 HSBoost_B1;           * Shortcut1 = HSVBAT, Shortcut2= LS2_B1, Shortcut3= HSBOOST
            dfcsct dac1;                                * use current feedback1
            jmpr idle_diag0;                            * Jump to idle_diag0 


inj2_start:      dfsct HSBAT_B1 LS2_B1 HSBoost_B1;           * Shortcut1 = HSVBAT, Shortcut2= LS2_B1, Shortcut3= HSBOOST
            dfcsct dac1;                                * use current feedback1
            jmpr idle_diag0;                            * Jump to idle_diag0 (useless here) 
            

*********************************************************************************************************            
*                                    PRE-ACTUATION DIAG PHASE                                           *            
********************************************************************************************************* 
idle_diag0:     stoc off sssc;                               * Turn OFF off comp
                bias all on;                            * Enable all biasing structures, kept ON even during actuation
                jocr idle_diag_fail0 _sc1v;             * Error detected if Vds of shortcut1 (HS) is low
                jocr idle_diag_fail0 _sc2v;             * Error detected if Vds of shortcut2 (LS) is low
                jocr idle_diag_fail0 _sc3v;             * Error detected if Vds of shortcut3 (Boost) is low
                jocr idle_diag_fail0 _sc1s;             * Error detected if Vsrc of shortcut1 (HS) is low
                jocr idle_diag_fail0 _sc3s;             * Error detected if Vsrc of shortcut3 (Boost) is low
                jmpr peak0;                            * Jump to actuation phase if no failure detected in idle phase
               
                
idle_diag_fail0:reqi 1;                                 * Go to software subroutine is fault detected in idle phase HSBat error
                



*********************************************************************************************************            
*                                                 BOOST PHASE                                           *            
********************************************************************************************************* 
            

boost0:     ldcd rst _ofs keep keep injMaxTBoost c3;       * Start Boost Counter in case Iboost never reached
            load Iboost dac_sssc _ofs;                     * Load Boost current threshold

            cwer peak0 cur1 row2;                          * Define Wait Table Iboost is reached and jump to peak phase
            cwer boost_err0 tc3 row5;                      * Define Wait Table if actuation longer than injMaxGuard go to eoinj (added from AN4849)
            
            stf low BstFlag;                               * Turn OFF the boost during this phase
            stos on on on;                                 * Vbat high side On, Vboost HS On et LS1/2 ON, need to turn ON HS1 also to avoid diag failure    
            endiags on on on on;                           * Enable auto diag
    
            wait row125;                                   * Wait start goes low or Iboost reached or InjMaxTBoost reached
            
            
boost_err0: reqi 0;                                        * Go to software subroutine is fault detected in Boost phase, did not reach Iboost on time (added from AN4849)

*********************************************************************************************************            
*                                                 PEAK PHASE                                            *            
********************************************************************************************************* 


peak0:      ldcd rst _ofs keep keep Tpeak_tot c1;           * Start Tpeak tot counter
            stos off on off;                                * turn OFF HSvbat keep LS ON
            stf high BstFlag;                               * Turn Boost back on
            load Ipeak dac_sssc _ofs;                       * Load the peak current threshold in the current DAC            
            cwer bypass0 tc1 row2;                          * Define Wait: Jump to bypass phase when tc1 reaches end of count            
            cwer peak_on0 tc2 row3;                         * Define Wait: Jump to peak_on when tc2 reaches end of count         
            cwer peak_off0 ocur row4;                       * Define Wait: Jump to peak_off when current is over threshold
peak_init:  cwer peak_off0 _ocur row5;                      * Define Wait: Jump to peak_off when current is under threshold only for first pulse
            wait row125;                                     * Wait here until current is discharge
            
peak_on0:   stos on on off;                                 * Vbat On LS On, if needed Boost HS can stay ON during this phase
            wait row124;
            
peak_off0:  ldcd rst ofs keep keep Tpeak_off c2;            * Load in the counter 2 the length of the peak_off phase
            stos off on off;                                * turn OFF HSvbat keep LS ON
            wait row123;                                        
            
            
            


*********************************************************************************************************            
*                                                 BYPASS PHASE                                          *            
********************************************************************************************************* 

bypass0:    ldcd rst ofs keep keep Tbypass c3;              * Load in the counter 3 the length of the off_phase phase
            stos off on off;                               * turn OFF all HS LS1/2
            cwer hold0 tc3 row4;                            * Define Wait: Jump to hold when tc3 reaches end of count
            wait row14;
            
            
*********************************************************************************************************            
*                                                 HOLD PHASE                                            *            
********************************************************************************************************* 

hold0:      ldcd rst _ofs keep keep Thold_tot c1;         * load thold tot inside c1
            load Ihold dac_sssc _ofs;                     * load hold current inside DAC
            cwer hold_error0 tc1 row2;                    * Define Wait: Jump to hold error if start still high after thold tot
            cwer hold_on0 tc2 row3;                       * Define Wait: Jump to hold on after thold off 
            cwer hold_off0 cur1 row4;                     * Define Wait: Jump to hold off when current Ihold reached 
            
hold_on0:   stos on on off;                               * HSvbat ON, LS ON
            wait row124;
            
hold_off0:  ldcd rst _ofs keep keep Thold_off c2;         * load thold off inside c2 
            stos off on off;                              * LS ON
            wait row123;
            
            
 
hold_error0: reqi 2;                                      * If Start high is longer than Thold_tot go to sw interrupt
     
*********************************************************************************************************            
*                                     END OF INJECTION PHASE                                            *            
********************************************************************************************************* 

eoinj0:     stos off on off;
            endiags off off off off;                      * disable auto diag
            bias all off;                                   * Enable all biasing structures, kept ON even during actuation
            stf high BstFlag;                             * turn ON DCDC
            jmpf jr2;                                     * jump to idle
            
   


         
*********************************************************************************************************              
*********************************************************************************************************            
*                       This microcore uc1 will control BANK2                                           *
*                       High SIde Vbat = hs3                                                            *
*                       High SIde Vboost = hs4                                                          *
*                       Low side = ls3 and ls4                                                          *
*                       current sense = cur2                                                            *
*********************************************************************************************************            
*********************************************************************************************************


* This microcore Channel 1 ucore 1 will control BANK3 (INJ and INJ4) and will check all diagnostics
* INJ3 is controlled by start3
* INJ4 is controlled by start4
* No fake error created on stimulus windows by default but can be added by user for testing
* This code correspond to the code described in application note AN5186

* Several parameters in the DRAM should be adjusted depending on current profile needed and load used
* By default those values work with Actuator defined in the Actuator Windows

*********************************************************************************************************            
*                                         INIT PHASE
********************************************************************************************************* 
init1:      stirq high;                                 * Set high IRQB pin
            stgn gain8.68 sssc;                         * Set gain amplifier for current feedback 1
            ldjr1 eoinj1;                               * Load end of injector in jr1 to use jump far
            ldjr2 idle1;                                * Load idle0 in jr1 to use jump far
            cwef jr1 _start row1;                       * If any start goes low go to eoi
   
            
*********************************************************************************************************            
*                                         IDLE PHASE                                                    *            
********************************************************************************************************* 
idle1:      cwer CheckStart1 start row2;             * Define entry table for high start pin
            stoc on sssc;                                * Turn ON off comp
WaitLoop1:   wait row2;                              * uPC is stuck here for almost the whole idle time
CheckStart1: joslr inj3_start start3;                * Jump to inj1 if start 1 is high
            joslr inj4_start start4;                * Jump to inj2 if start 2 is high
            jmpr WaitLoop1;        
            
*********************************************************************************************************            
*                                         SHORTCUT DEFINITION                                           *            
********************************************************************************************************* 
inj3_start: dfsct HSBAT_B2 LS1_B2 HSBoost_B2;           * Shortcut1 = HSVBAT, Shortcut2= LS2_B1, Shortcut3= HSBOOST
            dfcsct dac2;                                * use current feedback1
            jmpr idle_diag1;                            * Jump to idle_diag0 


inj4_start: dfsct HSBAT_B2 LS2_B2 HSBoost_B2;           * Shortcut1 = HSVBAT, Shortcut2= LS2_B1, Shortcut3= HSBOOST
            dfcsct dac2;                                * use current feedback1
            jmpr idle_diag1;                            * Jump to idle_diag0 (useless here) 
            

*********************************************************************************************************            
*                                    PRE-ACTUATION DIAG PHASE                                           *            
********************************************************************************************************* 
idle_diag1:     stoc off sssc;                               * Turn OFF off comp
                bias all on;                            * Enable all biasing structures, kept ON even during actuation
                jocr idle_diag_fail1 _sc1v;             * Error detected if Vds of shortcut1 (HS) is low
                jocr idle_diag_fail1 _sc2v;             * Error detected if Vds of shortcut2 (LS) is low
                jocr idle_diag_fail1 _sc3v;             * Error detected if Vds of shortcut3 (Boost) is low
                jocr idle_diag_fail1 _sc1s;             * Error detected if Vsrc of shortcut1 (HS) is low
                jocr idle_diag_fail1 _sc3s;             * Error detected if Vsrc of shortcut3 (Boost) is low
                jmpr boost1;                            * Jump to actuation phase if no failure detected in idle phase
               
                
idle_diag_fail1:reqi 1;                                 * Go to software subroutine is fault detected in idle phase HSBat error
                



*********************************************************************************************************            
*                                                 BOOST PHASE                                           *            
********************************************************************************************************* 
            

boost1:     ldcd rst _ofs keep keep injMaxTBoost c3;       * Start Boost Counter in case Iboost never reached
            load Iboost dac_sssc _ofs;                     * Load Boost current threshold

            cwer peak1 ocur row2;                          * Define Wait Table Iboost is reached and jump to peak phase
            cwer boost_err1 tc3 row5;                      * Define Wait Table if actuation longer than injMaxGuard go to eoinj (added from AN4849)
            
            stf low BstFlag;                               * Turn OFF the boost during this phase
            stos on on on;                                 * Vbat high side On, Vboost HS On et LS1/2 ON, need to turn ON HS1 also to avoid diag failure    
            endiags on on on on;                           * Enable auto diag
    
            wait row125;                                   * Wait start goes low or Iboost reached or InjMaxTBoost reached
            
            
boost_err1: reqi 0;                                        * Go to software subroutine is fault detected in Boost phase, did not reach Iboost on time (added from AN4849)

*********************************************************************************************************            
*                                                 PEAK PHASE                                            *            
********************************************************************************************************* 


peak1:      ldcd rst _ofs keep keep Tpeak_tot c1;           * Start Tpeak tot counter
            stos off on off;                                * turn OFF HSvbat keep LS ON
            stf high BstFlag;                               * Turn Boost back on
            load Ipeak dac_sssc _ofs;                       * Load the peak current threshold in the current DAC            
            cwer bypass1 tc1 row2;                          * Define Wait: Jump to bypass phase when tc1 reaches end of count            
            cwer peak_on1 tc2 row3;                         * Define Wait: Jump to peak_on when tc2 reaches end of count         
            cwer peak_off1 ocur row4;                       * Define Wait: Jump to peak_off when current is over threshold
peak_init1: cwer peak_off1 _ocur row5;                      * Define Wait: Jump to peak_off when current is under threshold only for first pulse
            wait row125;                                     * Wait here until current is discharge
            
peak_on1:   stos on on off;                                 * Vbat On LS On, if needed Boost HS can stay ON during this phase
            wait row124;
            
peak_off1:  ldcd rst ofs keep keep Tpeak_off c2;            * Load in the counter 2 the length of the peak_off phase
            stos off on off;                                * turn OFF HSvbat keep LS ON
            wait row123;                                        
            
            
            


*********************************************************************************************************            
*                                                 BYPASS PHASE                                          *            
********************************************************************************************************* 

bypass1:    ldcd rst ofs keep keep Tbypass c3;              * Load in the counter 3 the length of the off_phase phase
            stos off off off;                               * turn OFF all HS LS1/2
            cwer hold1 tc3 row4;                            * Define Wait: Jump to hold when tc3 reaches end of count
            wait row14;
            
            
*********************************************************************************************************            
*                                                 HOLD PHASE                                            *            
********************************************************************************************************* 

hold1:      ldcd rst _ofs keep keep Thold_tot c1;         * load thold tot inside c1
            load Ihold dac_sssc _ofs;                     * load hold current inside DAC
            cwer hold_error1 tc1 row2;                    * Define Wait: Jump to hold error if start still high after thold tot
            cwer hold_on1 tc2 row3;                       * Define Wait: Jump to hold on after thold off 
            cwer hold_off1 ocur row4;                     * Define Wait: Jump to hold off when current Ihold reached 
            
hold_on1:   stos on on off;                               * HSvbat ON, LS ON
            wait row124;
            
hold_off1:  ldcd rst _ofs keep keep Thold_off c2;         * load thold off inside c2 
            stos off on off;                              * LS ON
            wait row123;
            
            
 
hold_error1: reqi 2;                                      * If Start high is longer than Thold_tot go to sw interrupt
     
*********************************************************************************************************            
*                                     END OF INJECTION PHASE                                            *            
********************************************************************************************************* 

eoinj1:     stos off off off;
            endiags off off off off;                      * disable auto diag
            bias all off;                                   * Enable all biasing structures, kept ON even during actuation
            stf high BstFlag;                             * turn ON DCDC
            jmpf jr2;                                     * jump to idle
            