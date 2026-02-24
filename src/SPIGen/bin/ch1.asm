*0001* stos off off off;  *0097 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0002* endiaga diagoff;  *0098 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0003* stirq low;  *0099 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0004* stf high b0;  *0100 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0005* stsrb high b6;  *0101 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0006* jcrr 0 b6 low;  *0103 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0007* ldjr1 27;  *0104 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0008* jmpf jr1;  *0105 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0009* stos off off off;  *0112 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0010* endiaga diagoff;  *0113 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0011* stirq low;  *0114 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0012* stf high b0;  *0115 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0013* cp irq r0;  *0118 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0014* ldirh 0Ch rst;  *0120 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0015* and r0;  *0121 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0016* jarr 10 all0;  *0122 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0017* ldirh 08h rst;  *0126 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0018* and r0;  *0127 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0019* jarr 4 all0;  *0128 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0020* stsrb high b4;  *0132 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0021* jcrr -1 b4 low;  *0133 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0022* jmpr 6;  *0134 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0023* stsrb high b7;  *0136 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0024* jcrr -1 b7 low;  *0137 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0025* jmpr 3;  *0138 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0026* stsrb high b5;  *0141 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0027* jcrr -1 b5 low;  *0142 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0028* stirq high;  *0146 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0029* rstreg all;  *0147 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0030* iret restart rst;  *0151 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0031* stirq high;  *0159 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0032* stgn gain8.68 sssc;  *0160 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0033* ldjr1 94;  *0161 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0034* ldjr2 35;  *0162 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0035* cwef jr1 _start row1;  *0163 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0036* cwer 3 start row2;  *0169 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0037* stoc on sssc;  *0170 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0038* wait row2;  *0171 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0039* joslr 3 start1;  *0172 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0040* joslr 5 start2;  *0173 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0041* jmpr -3;  *0174 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0042* dfsct hs1 ls1 hs2;  *0179 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0043* dfcsct dac1;  *0180 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0044* jmpr 4;  *0181 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0045* dfsct hs1 ls2 hs2;  *0184 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0046* dfcsct dac1;  *0185 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0047* jmpr 1;  *0186 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0048* stoc off sssc;  *0192 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0049* bias all on;  *0193 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0050* jocr 6 _sc1v;  *0194 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0051* jocr 5 _sc2v;  *0195 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0052* jocr 4 _sc3v;  *0196 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0053* jocr 3 _sc1s;  *0197 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0054* jocr 2 _sc3s;  *0198 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0055* jmpr 11;  *0199 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0056* reqi 1;  *0202 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0057* ldcd rst _ofs keep keep 8 c3;  *0212 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0058* load 0 dac_sssc _ofs;  *0213 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0059* cwer 7 cur1 row2;  *0215 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0060* cwer 5 tc3 row5;  *0216 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0061* stf low b0;  *0218 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0062* stos on on on;  *0219 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0063* endiags on on on on;  *0220 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0064* wait row125;  *0222 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0065* reqi 0;  *0225 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0066* ldcd rst _ofs keep keep 4 c1;  *0232 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0067* stos off on off;  *0233 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0068* stf high b0;  *0234 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0069* load 1 dac_sssc _ofs;  *0235 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0070* cwer 10 tc1 row2;  *0236 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0071* cwer 4 tc2 row3;  *0237 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0072* cwer 5 ocur row4;  *0238 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0073* cwer 4 _ocur row5;  *0239 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0074* wait row125;  *0240 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0075* stos on on off;  *0242 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0076* wait row124;  *0243 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0077* ldcd rst ofs keep keep 3 c2;  *0245 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0078* stos off on off;  *0246 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0079* wait row123;  *0247 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0080* ldcd rst ofs keep keep 5 c3;  *0257 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0081* stos off on off;  *0258 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0082* cwer 2 tc3 row4;  *0259 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0083* wait row14;  *0260 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0084* ldcd rst _ofs keep keep 7 c1;  *0267 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0085* load 2 dac_sssc _ofs;  *0268 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0086* cwer 8 tc1 row2;  *0269 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0087* cwer 2 tc2 row3;  *0270 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0088* cwer 3 cur1 row4;  *0271 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0089* stos on on off;  *0273 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0090* wait row124;  *0274 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0091* ldcd rst _ofs keep keep 6 c2;  *0276 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0092* stos off on off;  *0277 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0093* wait row123;  *0278 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0094* reqi 2;  *0282 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0095* stos off on off;  *0288 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0096* endiags off off off off;  *0289 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0097* bias all off;  *0290 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0098* stf high b0;  *0291 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0099* jmpf jr2;  *0292 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0100* stirq high;  *0321 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0101* stgn gain8.68 sssc;  *0322 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0102* ldjr1 163;  *0323 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0103* ldjr2 104;  *0324 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0104* cwef jr1 _start row1;  *0325 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0105* cwer 3 start row2;  *0331 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0106* stoc on sssc;  *0332 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0107* wait row2;  *0333 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0108* joslr 3 start3;  *0334 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0109* joslr 5 start4;  *0335 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0110* jmpr -3;  *0336 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0111* dfsct hs3 ls3 hs4;  *0341 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0112* dfcsct dac2;  *0342 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0113* jmpr 4;  *0343 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0114* dfsct hs3 ls4 hs4;  *0346 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0115* dfcsct dac2;  *0347 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0116* jmpr 1;  *0348 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0117* stoc off sssc;  *0354 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0118* bias all on;  *0355 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0119* jocr 6 _sc1v;  *0356 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0120* jocr 5 _sc2v;  *0357 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0121* jocr 4 _sc3v;  *0358 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0122* jocr 3 _sc1s;  *0359 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0123* jocr 2 _sc3s;  *0360 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0124* jmpr 2;  *0361 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0125* reqi 1;  *0364 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0126* ldcd rst _ofs keep keep 8 c3;  *0374 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0127* load 0 dac_sssc _ofs;  *0375 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0128* cwer 7 ocur row2;  *0377 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0129* cwer 5 tc3 row5;  *0378 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0130* stf low b0;  *0380 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0131* stos on on on;  *0381 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0132* endiags on on on on;  *0382 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0133* wait row125;  *0384 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0134* reqi 0;  *0387 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0135* ldcd rst _ofs keep keep 4 c1;  *0394 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0136* stos off on off;  *0395 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0137* stf high b0;  *0396 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0138* load 1 dac_sssc _ofs;  *0397 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0139* cwer 10 tc1 row2;  *0398 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0140* cwer 4 tc2 row3;  *0399 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0141* cwer 5 ocur row4;  *0400 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0142* cwer 4 _ocur row5;  *0401 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0143* wait row125;  *0402 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0144* stos on on off;  *0404 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0145* wait row124;  *0405 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0146* ldcd rst ofs keep keep 3 c2;  *0407 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0147* stos off on off;  *0408 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0148* wait row123;  *0409 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0149* ldcd rst ofs keep keep 5 c3;  *0419 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0150* stos off off off;  *0420 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0151* cwer 2 tc3 row4;  *0421 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0152* wait row14;  *0422 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0153* ldcd rst _ofs keep keep 7 c1;  *0429 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0154* load 2 dac_sssc _ofs;  *0430 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0155* cwer 8 tc1 row2;  *0431 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0156* cwer 2 tc2 row3;  *0432 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0157* cwer 3 ocur row4;  *0433 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0158* stos on on off;  *0435 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0159* wait row124;  *0436 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0160* ldcd rst _ofs keep keep 6 c2;  *0438 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0161* stos off on off;  *0439 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0162* wait row123;  *0440 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0163* reqi 2;  *0444 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0164* stos off off off;  *0450 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0165* endiags off off off off;  *0451 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0166* bias all off;  *0452 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0167* stf high b0;  *0453 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
*0168* jmpf jr2;  *0454 D:\Work\Development\NXP\KIT33816\src\SPIGen\MicrocodeCh1\ch1.psc
