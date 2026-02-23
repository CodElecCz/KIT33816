*0001* stgn gain5.8 ossc;  *0043 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0002* load 2 dac_ossc _ofs;  *0044 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0003* load 3 dac4h4n _ofs;  *0045 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0004* stdm null;  *0046 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0005* cwer 9 _f0 row1;  *0047 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0006* cwer 2 _vb row2;  *0048 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0007* cwer 4 vb row3;  *0049 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0008* load 1 dac4h4n _ofs;  *0052 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0009* stdcctl async;  *0053 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0010* wait row13;  *0054 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0011* load 0 dac4h4n _ofs;  *0056 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0012* stdcctl sync;  *0057 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0013* wait row12;  *0058 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0014* stdcctl sync;  *0060 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0015* jocr -1 _f0;  *0061 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0016* jmpr -5;  *0062 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0017* stgn gain19.4 ossc;  *0082 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0018* ldjr1 40;  *0083 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0019* ldjr2 20;  *0084 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0020* cwef jr1 _start row1;  *0085 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0021* joslr 3 start5;  *0089 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0022* joslr 4 start6;  *0090 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0023* jmpf jr2;  *0091 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0024* dfsct hs5 ls5 undef;  *0095 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0025* jmpr 3;  *0096 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0026* dfsct hs5 ls6 undef;  *0097 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0027* jmpr 1;  *0098 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0028* load 5 dac_ossc _ofs;  *0101 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0029* cwer 3 cur3 row2;  *0102 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0030* stos on on keep;  *0103 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0031* wait row12;  *0104 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0032* ldcd rst _ofs keep keep 8 c1;  *0107 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0033* load 6 dac_ossc _ofs;  *0108 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0034* cwer 7 tc1 row2;  *0109 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0035* cwer 2 tc2 row3;  *0110 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0036* cwer 3 cur3 row4;  *0111 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0037* stos on on keep;  *0113 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0038* wait row124;  *0114 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0039* ldcd rst _ofs off on 7 c2;  *0116 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0040* wait row123;  *0117 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0041* stos off off keep;  *0121 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
*0042* jmpf jr2;  *0122 D:\Work\Hoerbiger\Documents\SDM\dev\sw\AN_4954_Diag_Rev4_0\MicrocodeCh2\ch2.psc
