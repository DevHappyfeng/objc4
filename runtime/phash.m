/* table for the mapping for the perfect hash */
#ifndef STANDARD
#include "standard.h"
#endif /* STANDARD */
#ifndef PHASH
#include "phash.h"
#endif /* PHASH */
#ifndef LOOKUPA
#include "lookupa.h"
#endif /* LOOKUPA */

/* A way to make the 1-byte values in tab bigger */
__private_extern__ const ub2 scramble[] = {
0x0000, 0x6b0f, 0x4c7d, 0x01b0, 0x1c38, 0x6c2c, 0x3596, 0x43b7,
0x754c, 0x0ad4, 0x18a7, 0x5131, 0x0a50, 0x291c, 0x6366, 0x7e81,
0x32bf, 0x19b3, 0x033b, 0x6346, 0x0df6, 0x58bd, 0x6c8d, 0x5de5,
0x26d1, 0x74a5, 0x35f8, 0x1bd7, 0x42e4, 0x0196, 0x4d64, 0x6e42,
0x1809, 0x007f, 0x2f2d, 0x0615, 0x73ac, 0x4dcd, 0x4cd9, 0x5767,
0x551b, 0x6aa5, 0x3587, 0x42c5, 0x329b, 0x3373, 0x5a4d, 0x5e6b,
0x0250, 0x40bf, 0x61fb, 0x5577, 0x344a, 0x54cc, 0x0533, 0x7055,
0x0be0, 0x65e9, 0x1963, 0x2549, 0x51a2, 0x77e2, 0x0498, 0x03f4,
0x2a77, 0x4d08, 0x2c45, 0x2978, 0x27a3, 0x73b0, 0x0ec5, 0x02e9,
0x4df7, 0x0858, 0x3124, 0x38dc, 0x3556, 0x34c5, 0x3fc5, 0x5b57,
0x1c13, 0x50d8, 0x3162, 0x5797, 0x16da, 0x5492, 0x7515, 0x3c25,
0x7d74, 0x2bbb, 0x490e, 0x068f, 0x751b, 0x4ccb, 0x7e7e, 0x6857,
0x6cdd, 0x2093, 0x726b, 0x0150, 0x472b, 0x5e5b, 0x5b20, 0x1b01,
0x5c2e, 0x63f5, 0x3cd6, 0x0ed0, 0x6a41, 0x16fe, 0x0069, 0x13fa,
0x1dcb, 0x44f0, 0x6f3a, 0x0cec, 0x0c4d, 0x7b40, 0x24f7, 0x5dff,
0x7929, 0x762f, 0x73bf, 0x396a, 0x155c, 0x2614, 0x7165, 0x5906,
0x7bcb, 0x51ba, 0x60e0, 0x2f88, 0x328d, 0x042b, 0x1175, 0x634b,
0x4cd1, 0x0893, 0x5e07, 0x708c, 0x5bb2, 0x00a5, 0x5ee3, 0x6f47,
0x34b9, 0x12a4, 0x0558, 0x0e61, 0x6744, 0x2f9f, 0x6b85, 0x36f9,
0x1a1e, 0x562d, 0x742e, 0x1655, 0x686d, 0x0bb6, 0x16fb, 0x2b8f,
0x5b7a, 0x0699, 0x5f40, 0x0130, 0x46d8, 0x0e8b, 0x7383, 0x0186,
0x7dc9, 0x05c4, 0x18f9, 0x6e8d, 0x7537, 0x05dc, 0x2076, 0x2b1e,
0x1a74, 0x6fcb, 0x6163, 0x645c, 0x14b9, 0x5995, 0x1387, 0x5bff,
0x1ad6, 0x3538, 0x6ad1, 0x3f04, 0x2ad8, 0x073c, 0x44d4, 0x3cee,
0x4d79, 0x0f50, 0x64a2, 0x52d7, 0x6930, 0x75a6, 0x24da, 0x58fe,
0x01ed, 0x7d35, 0x7afa, 0x662e, 0x3a3d, 0x4156, 0x1ba2, 0x6b0c,
0x0ca0, 0x4269, 0x2d22, 0x0a6e, 0x683e, 0x68aa, 0x5cb2, 0x18c3,
0x72c6, 0x6d37, 0x134d, 0x4801, 0x6a3a, 0x4904, 0x1cdd, 0x4565,
0x2e0f, 0x7534, 0x6c44, 0x537e, 0x6b70, 0x38eb, 0x16c4, 0x2e9c,
0x759d, 0x48ae, 0x6244, 0x12b2, 0x357d, 0x7a73, 0x6bd7, 0x604e,
0x6ca1, 0x3677, 0x7157, 0x3e55, 0x7d6e, 0x53d6, 0x36b3, 0x523b,
0x2991, 0x597e, 0x49c6, 0x5d92, 0x5076, 0x5857, 0x3c8c, 0x3e59,
};

/* small adjustments to _a_ to make values distinct */
__private_extern__ const ub1 tab[] = {
4,2,0,52,1,7,1,15,7,15,0,9,1,44,0,39,
34,4,1,3,13,8,37,3,5,2,56,0,0,1,6,3,
31,7,105,4,3,8,6,10,2,11,1,19,10,39,24,5,
7,11,7,38,0,4,3,0,0,38,12,2,7,12,19,0,
36,78,5,67,9,4,15,0,0,57,1,1,2,6,7,0,
6,0,1,2,8,5,3,17,3,23,8,35,0,0,29,13,
50,0,23,4,0,28,5,20,36,2,12,10,23,55,9,2,
2,3,1,1,27,63,12,4,6,9,18,5,9,9,35,0,
16,71,0,0,2,1,0,6,4,6,0,20,4,1,6,14,
1,18,14,0,16,88,1,5,14,3,0,0,4,49,65,7,
0,6,0,1,1,1,11,234,5,17,5,0,0,5,0,9,
0,15,7,21,5,4,11,8,1,2,2,17,0,5,32,6,
1,0,5,29,5,18,7,0,19,97,0,1,6,3,50,0,
0,0,6,0,0,2,4,0,8,10,1,5,3,1,18,2,
3,0,0,14,1,2,4,29,0,0,0,6,16,34,2,10,
8,11,11,1,17,43,12,12,7,22,1,0,25,205,1,4,
20,31,6,70,0,0,16,9,0,13,1,11,1,4,57,5,
12,0,2,0,1,2,4,2,0,7,20,89,3,0,0,0,
2,37,1,33,6,14,11,6,2,2,2,11,4,24,5,0,
30,10,6,6,1,49,0,6,4,5,14,2,10,17,12,0,
0,2,13,66,76,11,0,17,1,3,26,0,0,5,19,5,
0,129,1,1,36,6,5,0,7,0,9,44,0,0,72,30,
0,9,0,1,18,4,27,63,1,1,10,15,10,35,0,25,
9,21,1,6,28,0,12,15,4,50,0,12,3,25,3,12,
35,77,6,22,14,6,0,0,31,0,2,0,0,61,9,0,
0,0,13,8,6,6,41,14,18,1,8,8,20,3,0,6,
11,2,141,31,1,6,17,10,16,3,30,20,2,14,3,4,
16,15,18,6,72,5,1,12,41,16,11,0,33,6,8,26,
3,6,2,26,8,27,0,4,2,37,0,98,3,14,1,5,
0,20,2,2,3,1,65,1,0,5,6,0,0,4,3,26,
5,45,4,1,0,3,0,6,0,4,4,3,10,26,5,68,
11,7,0,3,17,44,1,37,4,15,9,1,4,9,40,0,
0,1,0,43,3,1,3,20,1,3,2,6,8,13,34,0,
16,2,13,25,7,1,5,16,0,9,6,26,1,46,76,2,
15,19,0,3,3,1,6,40,2,0,6,1,62,18,14,2,
9,19,6,8,5,0,60,41,22,216,16,46,26,6,1,46,
30,0,0,24,3,0,2,3,21,23,48,27,5,0,1,17,
6,8,3,0,5,0,6,12,0,0,0,3,2,2,0,13,
5,3,2,23,18,33,1,27,1,0,0,18,39,26,0,19,
13,0,2,0,23,6,68,0,16,1,0,1,36,16,15,28,
1,10,0,10,4,6,5,4,0,26,0,5,6,14,5,2,
1,4,0,14,12,46,5,0,8,64,51,36,36,33,1,0,
29,8,0,4,4,0,0,11,13,50,1,22,2,4,1,24,
1,4,0,20,43,76,0,0,16,36,50,14,1,2,0,13,
3,0,1,27,1,87,11,0,6,26,8,2,6,2,4,33,
0,0,4,4,72,3,0,6,0,42,11,1,8,4,0,0,
0,11,0,28,2,15,2,2,33,13,1,5,3,3,19,2,
0,12,46,0,6,9,0,0,3,1,4,226,1,17,6,8,
1,1,37,4,5,2,12,38,12,0,9,4,1,20,1,0,
22,18,0,11,3,6,16,37,3,5,18,4,0,44,5,6,
32,3,1,57,3,7,2,3,4,29,10,2,17,6,0,1,
25,44,1,2,7,29,83,9,15,6,1,10,0,8,1,5,
32,4,0,4,68,0,3,0,7,11,3,0,0,1,2,9,
4,6,4,53,20,6,0,5,2,3,0,24,9,2,0,0,
22,13,8,8,16,16,15,22,0,51,80,6,0,3,12,0,
1,3,14,1,4,2,0,6,2,4,28,3,1,16,26,20,
3,76,3,3,109,12,53,40,8,19,1,35,4,3,14,21,
5,103,2,8,5,0,3,7,4,8,20,1,31,69,0,0,
39,68,3,9,15,12,4,7,16,12,23,1,13,9,7,1,
29,80,10,8,3,0,24,0,15,29,8,0,4,30,30,0,
38,3,0,9,12,2,2,0,7,11,18,5,3,25,3,0,
2,1,0,9,3,0,35,0,17,1,15,4,0,0,52,24,
0,2,0,63,7,46,3,1,7,9,29,3,1,2,7,16,
0,9,6,101,6,1,21,18,0,6,21,9,11,0,4,0,
3,0,19,1,0,0,38,3,4,66,0,9,2,32,5,4,
11,3,9,8,24,23,1,2,3,2,2,6,3,4,1,4,
26,0,0,0,12,0,2,8,0,1,49,25,0,0,0,0,
10,5,0,0,44,54,11,5,53,8,26,0,54,1,8,14,
68,6,7,13,2,7,0,9,2,38,0,31,1,2,0,2,
48,38,5,0,11,16,0,13,0,61,0,8,12,0,1,11,
2,20,1,3,42,3,0,3,9,0,2,1,4,14,32,0,
3,0,5,25,7,26,2,117,15,18,2,6,33,9,3,0,
29,5,9,9,12,5,4,8,3,4,0,0,41,4,1,2,
38,2,5,15,12,1,2,0,0,2,15,2,3,39,11,3,
89,22,0,36,24,4,50,5,8,5,20,3,50,14,0,0,
0,17,11,41,16,5,3,48,7,27,47,1,2,1,3,1,
4,0,18,2,2,8,0,0,7,60,2,62,21,0,1,8,
55,55,23,2,13,3,3,29,10,4,19,16,4,5,0,3,
35,15,1,4,3,3,0,8,0,15,4,0,4,69,16,3,
10,1,18,4,18,9,6,48,2,2,31,15,80,21,47,1,
0,2,59,15,3,14,2,30,7,1,3,5,0,24,1,0,
5,23,14,0,30,4,0,1,0,1,18,5,8,19,13,78,
3,5,0,26,34,5,5,12,0,1,7,5,10,2,1,14,
7,0,10,2,10,0,2,0,7,1,1,46,4,3,23,0,
21,4,59,0,0,27,56,11,9,27,1,3,0,13,3,11,
10,13,4,1,7,8,6,1,78,0,31,10,3,9,40,80,
69,14,3,77,21,0,0,3,1,2,0,3,2,5,7,5,
21,50,96,3,3,0,20,9,0,6,1,1,2,4,0,14,
0,0,0,5,0,32,12,45,6,32,3,20,12,0,0,28,
24,3,1,4,0,41,2,0,12,2,4,10,4,10,11,0,
30,11,44,10,68,20,2,121,0,5,1,10,21,14,22,35,
2,6,2,1,45,10,12,4,1,26,3,9,8,10,1,0,
26,23,11,1,19,39,0,0,0,84,13,4,7,38,30,9,
8,12,5,12,18,10,60,2,8,41,1,1,174,10,1,63,
0,37,0,50,73,13,0,4,2,0,6,1,42,55,13,4,
1,1,3,0,4,4,21,3,2,24,30,12,40,0,11,8,
4,6,45,2,6,1,15,18,31,8,0,57,1,73,34,19,
14,27,3,20,19,0,9,15,8,3,5,3,1,0,7,38,
10,20,40,62,25,12,1,1,0,5,4,4,22,1,18,6,
74,3,2,72,6,8,6,25,2,14,13,2,94,63,39,50,
0,26,41,0,55,2,22,89,8,1,0,3,7,1,1,0,
7,2,19,2,17,3,7,5,2,34,1,20,2,7,3,17,
2,7,24,2,54,3,1,0,7,0,0,0,4,3,7,2,
10,1,0,22,6,0,7,1,14,53,84,11,7,19,1,6,
31,3,10,20,121,1,1,1,5,6,0,21,2,0,10,0,
35,23,72,8,64,5,1,46,8,29,4,13,0,33,75,7,
2,48,55,17,0,23,84,0,1,5,0,2,3,15,11,5,
41,16,21,0,5,1,14,12,16,8,34,36,13,1,0,0,
8,19,0,0,14,6,14,0,7,10,2,23,0,31,4,0,
55,6,15,13,13,3,7,1,0,3,1,16,0,16,4,0,
41,0,5,1,0,1,0,1,4,16,2,1,0,0,3,7,
29,14,10,31,5,1,7,13,0,0,20,0,5,122,1,4,
20,1,25,14,0,0,7,45,6,0,8,3,24,0,0,3,
50,80,74,3,4,41,57,38,25,4,0,0,3,0,3,0,
2,8,31,72,11,9,7,15,12,0,0,5,2,15,2,3,
25,4,1,0,16,40,4,76,80,0,0,79,28,19,10,14,
0,2,106,8,27,1,3,21,2,49,27,0,2,27,0,21,
39,81,30,31,2,20,13,11,0,1,3,8,195,39,18,82,
7,47,0,5,88,1,126,1,1,0,0,6,4,77,6,1,
61,33,0,19,7,2,3,70,35,18,17,23,5,0,5,15,
0,11,0,19,22,0,45,0,0,45,13,5,2,55,11,8,
41,3,15,9,11,51,26,3,2,0,3,2,3,15,12,11,
2,4,79,1,6,26,151,1,5,11,4,6,1,15,7,3,
2,3,0,1,29,5,9,20,0,45,0,2,23,0,0,102,
14,19,0,1,6,14,14,1,1,0,18,0,8,36,0,0,
103,0,54,10,13,19,19,9,30,7,0,0,6,18,32,0,
40,4,5,24,0,10,5,10,54,6,13,0,11,21,28,7,
25,34,0,0,1,6,2,0,6,27,22,10,23,15,29,0,
16,0,2,48,18,95,16,3,1,22,21,12,6,12,0,50,
8,2,3,18,16,0,60,1,2,6,28,9,3,1,3,31,
77,42,8,24,36,13,21,7,10,27,18,1,14,9,29,22,
107,13,0,0,50,23,19,10,1,0,13,63,1,0,0,14,
13,7,0,19,0,27,14,1,3,4,5,1,7,9,35,10,
2,26,50,22,19,6,53,1,1,4,3,34,4,97,18,12,
30,1,4,29,14,22,27,0,0,3,6,0,33,1,20,3,
21,14,59,2,3,25,0,0,2,70,16,8,10,8,0,1,
0,4,9,16,4,20,3,5,1,61,10,22,86,7,0,0,
3,35,56,147,6,0,4,52,0,28,4,32,1,9,22,33,
3,33,0,29,0,3,11,0,7,2,2,20,2,3,57,49,
3,11,14,16,13,4,19,6,0,32,33,0,0,8,8,19,
6,9,69,45,15,4,2,3,74,11,8,3,3,28,27,9,
6,43,51,22,1,7,1,4,0,9,24,32,1,0,7,23,
22,53,25,0,57,0,56,0,10,1,65,0,0,6,53,21,
0,6,1,0,20,7,132,7,31,0,10,19,41,41,6,3,
1,7,22,2,0,12,10,19,65,0,5,40,7,5,171,9,
5,1,10,12,36,5,15,7,18,41,10,1,19,8,2,0,
62,23,1,11,7,4,54,3,7,11,179,56,0,21,18,2,
0,4,4,43,0,2,5,30,1,2,20,81,66,16,7,4,
6,10,3,0,26,0,20,0,7,11,0,18,5,0,2,9,
0,52,0,47,0,10,20,31,49,57,0,9,6,17,37,65,
13,1,26,2,100,1,7,1,16,33,29,5,8,51,15,0,
24,0,13,2,17,5,10,29,0,21,1,0,0,6,33,0,
2,20,0,0,3,0,10,12,0,3,16,9,14,2,0,0,
32,4,1,12,24,0,5,28,8,41,16,11,2,23,0,91,
0,18,5,15,16,0,3,88,3,11,0,2,38,0,15,55,
11,0,12,2,12,25,29,0,4,4,22,51,15,53,18,0,
0,2,10,29,0,37,5,14,3,0,7,13,0,34,71,7,
1,47,13,10,14,10,6,0,13,0,3,2,2,7,7,0,
8,22,39,0,35,29,17,15,54,18,33,2,14,24,102,4,
0,1,0,37,33,2,3,0,3,8,6,22,20,30,0,8,
12,2,27,7,4,1,2,17,2,1,79,19,1,5,36,26,
77,96,18,51,8,15,0,64,16,15,1,4,0,3,8,2,
6,4,12,1,5,33,1,5,0,13,2,83,71,41,1,7,
2,17,2,184,0,26,5,25,102,4,0,3,17,10,17,0,
5,1,16,47,4,2,105,0,4,5,3,12,14,0,4,37,
0,0,1,20,8,26,1,3,20,75,4,0,18,0,0,11,
2,0,0,0,1,0,50,4,31,3,0,0,32,1,0,22,
5,22,3,23,38,2,0,0,0,0,68,14,4,0,32,21,
7,91,8,7,0,40,13,8,19,14,1,47,6,62,3,36,
23,7,16,8,2,26,49,14,18,13,0,2,9,24,92,14,
37,18,28,30,1,1,0,36,2,7,3,15,11,55,0,6,
2,32,2,28,7,3,10,4,9,0,0,12,16,19,51,21,
1,1,7,10,8,3,11,2,8,21,2,3,33,23,10,97,
13,57,19,0,6,0,13,3,0,15,0,14,58,15,17,2,
5,2,0,38,11,0,0,15,5,0,2,21,6,0,3,0,
29,5,1,4,37,3,87,26,38,2,0,6,3,11,0,9,
0,10,6,6,4,20,7,27,18,23,25,9,19,6,5,5,
9,4,7,19,6,9,11,0,0,8,52,42,13,15,0,45,
2,105,13,7,18,17,46,0,1,7,14,10,44,23,17,28,
0,4,19,5,3,11,32,0,136,0,28,10,2,29,4,2,
41,4,9,19,0,11,3,3,0,40,13,4,0,3,3,49,
74,54,12,4,0,39,3,53,0,5,10,43,5,8,120,4,
4,13,2,5,83,13,28,2,25,5,6,66,3,1,4,52,
2,21,1,0,24,17,37,22,0,8,11,0,15,3,21,9,
0,29,5,69,22,87,4,12,3,27,5,30,3,7,3,25,
4,45,8,61,29,43,28,5,3,12,5,0,28,0,84,19,
0,100,28,53,8,56,8,4,2,62,0,30,16,8,5,8,
9,50,8,27,7,0,0,0,0,80,0,13,7,94,34,0,
42,6,79,0,0,11,11,25,2,3,10,2,23,30,1,12,
10,10,7,110,0,1,0,1,7,8,0,0,10,4,36,37,
1,32,9,34,2,26,5,11,32,7,0,8,4,0,37,1,
24,8,17,54,25,11,3,0,4,18,1,12,2,35,14,1,
11,28,3,5,0,13,32,5,0,14,2,11,7,5,51,4,
7,10,5,0,17,38,4,0,0,59,3,12,8,17,0,29,
24,148,0,34,39,15,48,25,29,16,33,0,22,4,8,38,
1,14,8,181,7,14,24,12,7,5,9,25,23,12,0,3,
0,9,0,2,2,25,0,37,52,61,5,6,44,15,4,4,
5,4,0,43,22,0,2,5,8,9,7,3,7,21,39,0,
109,4,22,88,17,29,92,70,5,25,10,38,28,21,52,14,
14,5,0,1,0,1,7,28,11,11,45,176,19,9,6,15,
65,1,65,5,97,109,1,19,0,1,52,157,4,39,16,0,
29,6,2,3,6,7,14,0,41,119,20,25,3,1,5,0,
41,36,6,47,0,81,5,3,42,79,7,6,0,7,16,3,
8,49,3,3,52,7,1,59,102,0,125,0,33,0,6,58,
20,22,12,30,99,19,63,2,2,42,3,26,0,4,3,36,
0,1,57,37,22,0,87,9,58,9,7,5,16,0,4,2,
61,4,4,3,9,0,3,21,2,93,88,0,0,2,1,7,
10,5,14,16,42,5,2,8,9,5,11,5,5,0,0,86,
0,0,14,0,2,3,44,70,2,60,80,1,32,61,13,5,
11,128,25,12,32,44,31,6,0,3,5,0,17,3,121,15,
45,20,2,4,62,27,18,4,8,58,98,14,0,28,60,43,
46,27,20,69,119,24,4,5,4,111,12,140,8,10,29,11,
0,50,23,18,53,1,13,0,1,0,1,2,30,10,17,3,
74,0,57,28,1,17,41,20,0,10,4,0,0,7,0,0,
25,86,18,12,80,62,27,0,72,4,74,0,2,5,42,0,
7,0,11,2,42,32,0,1,6,31,19,0,0,2,7,1,
6,16,17,29,15,4,53,0,12,30,12,14,7,4,59,16,
0,49,54,0,43,11,19,9,127,3,5,0,134,7,19,3,
3,0,0,25,5,6,3,38,10,2,97,0,11,4,1,24,
6,23,93,29,3,36,9,0,0,4,1,12,0,0,18,18,
0,1,89,3,2,3,2,37,0,5,28,5,1,21,9,22,
5,155,4,36,39,12,10,12,16,16,182,13,4,4,40,9,
3,0,28,44,5,2,58,15,13,7,26,12,48,0,30,8,
2,39,11,30,11,5,15,22,30,0,15,0,85,4,130,0,
14,25,15,3,3,10,2,2,17,0,19,0,4,0,156,51,
0,19,9,140,102,4,50,11,5,3,4,2,24,24,10,5,
33,4,0,29,0,37,6,5,22,0,25,31,102,22,11,6,
38,17,36,8,2,1,99,8,56,71,68,23,3,12,3,0,
0,0,22,123,83,5,28,25,3,20,0,8,16,4,1,18,
0,1,2,0,9,39,25,61,198,13,58,3,11,1,3,11,
7,5,6,7,19,102,1,14,16,24,68,35,13,6,7,97,
65,9,17,8,0,29,0,11,14,29,0,2,2,27,55,28,
9,15,8,1,10,15,4,3,17,1,0,6,67,0,14,4,
90,0,8,88,26,6,55,32,8,4,1,17,3,9,5,3,
17,211,59,13,20,60,37,0,0,5,10,39,44,6,12,47,
32,14,1,105,1,3,13,27,8,3,10,98,152,3,4,9,
45,17,9,4,3,18,65,0,82,73,1,10,4,8,9,0,
3,1,20,14,0,93,9,3,0,15,2,13,0,33,11,13,
2,30,39,47,8,1,32,100,39,17,3,10,61,19,0,2,
7,0,101,5,3,2,0,4,0,6,8,52,9,2,2,38,
17,0,0,97,108,32,0,1,28,38,18,10,18,10,26,178,
29,173,16,0,9,15,84,69,17,21,7,21,20,28,77,16,
3,0,1,14,77,49,1,1,2,9,9,7,16,39,7,1,
2,4,10,16,6,0,1,12,19,0,0,60,74,32,9,6,
56,6,1,6,10,1,10,1,1,27,52,0,28,46,25,164,
3,3,0,5,1,11,3,29,11,15,16,27,7,28,0,4,
4,27,7,3,19,2,2,2,3,1,51,11,14,5,20,125,
2,8,2,8,47,0,56,54,21,154,10,4,7,3,21,0,
65,1,6,35,1,16,12,45,32,60,7,3,16,109,1,0,
8,0,8,0,1,5,12,20,0,82,3,81,48,8,30,0,
8,3,1,12,0,45,3,22,2,1,4,0,85,2,11,7,
94,0,32,14,12,18,5,0,121,2,5,2,3,199,20,30,
51,42,23,8,35,13,1,15,0,6,2,5,17,9,1,49,
0,1,49,40,26,45,5,21,45,19,8,9,0,146,3,14,
1,4,2,52,6,10,0,0,0,16,0,0,12,6,2,3,
13,97,25,1,1,58,86,22,12,0,7,2,20,0,18,1,
3,1,22,6,45,3,72,77,44,4,1,6,2,24,2,1,
30,43,3,5,5,8,11,1,8,48,6,36,15,18,105,96,
59,12,2,2,5,1,12,1,19,0,70,0,17,0,24,1,
2,6,117,13,29,1,23,7,61,26,6,0,109,0,5,47,
13,92,61,22,0,30,4,9,2,4,172,41,0,3,50,5,
23,38,22,2,85,15,6,4,2,25,0,8,8,10,10,1,
26,0,1,21,18,86,21,15,9,46,84,4,43,29,24,16,
156,6,3,1,2,13,1,8,2,10,61,5,6,10,0,92,
12,25,48,27,13,51,30,54,57,0,10,11,7,51,2,119,
0,2,47,8,29,29,21,3,29,0,25,2,101,4,21,4,
30,14,14,36,2,6,1,1,0,29,0,31,0,12,4,26,
2,3,41,0,15,1,44,3,2,7,115,24,12,5,2,51,
7,1,4,2,7,104,29,21,6,5,14,5,0,42,0,37,
3,101,11,2,30,5,8,34,6,69,0,5,16,16,13,3,
34,0,1,55,2,46,10,18,32,3,2,3,0,5,7,1,
6,41,0,6,81,36,1,7,4,3,11,5,47,2,43,0,
0,1,9,4,14,34,16,12,27,2,107,0,4,60,154,14,
55,0,1,0,4,55,3,56,40,41,0,47,26,121,3,0,
67,33,5,2,1,44,91,29,5,69,5,4,61,2,10,3,
6,2,2,13,9,24,0,15,1,4,0,36,61,3,19,35,
34,4,0,1,91,0,80,6,3,0,7,3,6,4,16,1,
27,83,1,0,4,22,12,0,0,0,4,4,15,5,73,0,
6,8,5,1,3,25,71,97,37,9,13,110,13,70,10,8,
4,34,3,1,3,55,23,140,0,3,0,3,1,0,10,5,
17,3,42,15,9,0,27,8,59,13,11,15,75,13,2,25,
19,26,46,0,23,4,1,0,109,9,2,21,19,37,1,0,
58,28,75,12,32,15,0,97,0,1,17,3,1,28,12,7,
39,28,34,25,33,22,3,44,32,13,7,0,15,2,178,4,
6,13,0,44,1,0,22,0,0,52,15,3,94,12,12,34,
34,24,105,7,0,1,5,11,88,48,65,21,46,105,5,28,
0,34,22,36,2,82,0,7,117,1,29,27,17,24,2,0,
153,33,16,9,2,0,11,5,5,3,76,33,20,2,12,16,
2,30,109,6,6,11,84,49,5,2,23,0,18,174,18,22,
80,3,44,9,26,6,124,38,50,68,17,9,23,50,5,114,
1,0,0,0,19,14,41,26,13,2,2,1,44,2,9,76,
10,13,36,1,5,0,1,34,20,5,5,5,2,34,1,76,
7,48,3,4,6,1,197,0,33,12,0,1,10,61,92,13,
4,1,24,25,4,10,3,4,4,26,1,9,7,24,5,24,
1,46,7,10,65,16,31,1,6,66,6,9,9,14,0,28,
62,7,33,2,18,25,3,0,7,14,52,110,18,116,7,145,
4,15,17,69,1,5,0,22,131,6,57,20,39,3,5,0,
2,58,8,114,1,8,16,19,2,7,3,12,1,28,9,33,
5,29,1,30,8,2,19,21,78,103,17,2,99,71,36,16,
9,18,16,62,0,16,9,7,68,1,22,0,2,12,24,0,
19,15,110,0,20,12,16,110,60,4,147,1,5,56,17,7,
0,3,19,15,7,0,0,41,0,0,6,5,21,26,16,0,
5,11,44,38,0,1,6,40,23,93,4,63,2,9,56,5,
6,32,9,6,7,23,8,9,9,73,0,5,37,27,120,1,
57,41,176,0,1,6,57,36,9,93,89,0,1,5,6,78,
124,34,12,0,5,7,8,15,1,46,0,15,18,103,0,41,
5,24,4,29,4,55,1,155,8,38,53,17,2,52,0,236,
2,7,13,17,13,0,28,6,40,33,200,3,22,13,5,0,
0,15,13,1,71,82,1,111,24,34,28,0,25,15,6,33,
0,16,29,141,1,2,6,0,1,99,6,3,1,38,0,37,
0,31,66,42,0,0,47,0,3,1,115,26,8,22,19,2,
2,13,27,11,35,14,31,7,18,15,6,12,0,38,5,18,
195,15,12,0,7,42,26,10,38,30,33,13,63,48,10,8,
3,4,9,3,2,40,17,0,7,4,38,7,7,46,9,37,
41,2,4,5,6,0,5,5,17,2,78,7,4,36,36,0,
42,23,5,12,21,0,8,229,34,52,29,0,11,0,1,6,
23,165,11,9,0,20,6,3,24,14,15,21,48,95,24,39,
20,48,7,64,61,83,8,7,4,23,44,82,15,9,12,4,
7,16,7,15,0,2,7,49,10,18,2,24,58,0,79,166,
35,13,8,0,69,4,40,24,72,20,30,12,17,1,4,9,
9,75,7,21,8,86,7,0,0,138,0,54,13,44,151,42,
85,82,67,34,0,2,9,50,39,107,7,192,2,5,8,2,
52,1,10,7,6,69,12,34,15,0,11,6,45,11,8,29,
20,19,190,12,8,137,3,14,3,50,9,7,19,17,4,17,
26,34,0,7,7,21,1,4,85,185,5,62,2,0,62,63,
117,0,44,178,2,18,2,3,31,32,1,80,172,34,1,6,
1,4,12,1,42,5,40,5,8,2,4,47,4,0,0,38,
5,27,25,6,80,22,61,82,1,60,9,20,0,5,35,7,
1,0,6,9,3,0,41,21,21,0,24,20,45,0,1,0,
26,11,1,9,13,0,14,41,19,9,0,30,74,0,16,0,
16,47,5,2,97,38,5,0,46,18,2,6,10,51,0,2,
0,37,1,4,5,20,4,2,14,141,1,47,68,1,8,16,
4,27,7,38,8,0,20,0,5,45,53,1,1,4,15,1,
0,0,3,0,70,25,39,48,27,0,2,3,9,4,2,5,
3,0,10,10,8,2,6,89,4,1,87,3,99,41,33,34,
26,4,123,6,2,5,3,20,79,1,0,155,10,2,71,1,
15,9,20,33,6,2,18,0,88,0,2,3,38,21,5,36,
56,1,35,7,0,18,0,0,7,12,3,2,20,5,117,32,
11,6,33,17,49,112,9,67,147,24,31,14,2,0,184,56,
4,100,1,0,77,9,11,212,5,25,146,43,66,9,0,94,
1,5,16,16,14,11,66,7,85,1,4,5,47,11,84,0,
32,10,14,6,50,11,1,9,12,66,41,137,3,26,13,8,
28,31,7,9,59,5,13,2,116,8,19,18,4,21,6,14,
51,5,57,6,2,0,0,1,46,12,19,5,80,13,35,0,
18,156,38,33,18,1,146,11,0,10,12,1,3,1,63,6,
48,24,3,22,53,21,64,33,85,89,0,6,24,3,27,13,
9,1,32,35,30,15,1,2,47,13,4,63,33,0,1,0,
48,0,12,32,30,39,0,25,17,4,27,53,11,2,19,0,
3,7,45,43,4,16,37,37,62,59,5,1,0,83,7,37,
8,3,7,30,31,8,0,0,2,5,42,39,13,1,2,19,
15,11,0,18,20,4,1,0,0,45,5,3,0,4,1,11,
9,13,167,1,11,2,17,72,42,46,0,20,54,11,86,4,
21,5,2,4,3,0,142,4,7,81,0,55,19,61,19,158,
8,37,25,95,9,1,28,1,1,88,2,44,0,39,21,24,
31,4,37,17,121,107,2,7,11,2,13,52,127,2,12,51,
6,1,1,115,0,7,0,25,123,25,46,46,2,2,0,8,
0,18,12,34,1,3,19,1,11,33,82,15,99,0,9,77,
26,0,80,10,16,15,9,0,26,75,55,33,26,23,158,0,
37,74,50,61,10,0,17,81,4,6,19,2,23,16,2,30,
11,1,39,137,9,0,11,6,55,1,27,56,15,42,6,37,
9,35,17,68,20,0,1,2,31,93,24,38,64,1,4,11,
3,3,2,3,25,0,17,80,13,13,0,75,4,30,7,14,
2,0,0,5,85,34,6,26,25,46,38,3,0,6,7,128,
103,23,33,22,45,32,27,0,26,2,47,80,13,115,3,0,
2,0,70,181,1,227,0,31,4,19,234,3,0,76,7,9,
0,10,1,10,16,0,0,86,13,74,109,1,0,26,19,9,
1,46,0,89,1,143,57,37,7,0,43,127,55,89,13,5,
1,3,27,26,15,6,26,90,61,3,0,16,0,7,14,34,
22,0,19,2,111,80,44,52,2,10,127,6,44,15,24,11,
2,4,0,77,13,8,21,2,35,9,2,29,66,45,24,1,
0,7,10,2,2,2,16,46,174,14,101,3,1,6,88,0,
100,50,48,51,10,5,48,0,18,88,28,0,69,26,1,10,
10,20,10,1,2,36,13,142,91,3,21,186,0,12,11,3,
4,71,3,18,8,48,38,94,1,16,2,2,8,6,23,147,
0,157,2,52,3,156,0,68,34,0,2,20,83,29,42,4,
14,0,64,0,3,1,6,4,185,33,12,28,67,0,2,6,
45,10,0,2,20,86,40,10,61,9,5,48,3,18,0,1,
1,7,37,4,0,1,0,16,165,8,1,92,2,70,1,0,
74,7,2,12,75,31,0,3,3,27,0,1,40,0,10,4,
179,137,92,26,76,43,0,6,0,9,129,7,40,2,82,29,
8,31,146,3,44,90,3,12,1,73,10,6,35,95,16,10,
0,91,0,81,0,6,3,113,140,46,23,34,7,5,1,8,
3,31,20,139,64,9,2,50,50,16,0,0,11,5,37,31,
2,4,15,4,6,32,7,6,19,71,0,15,179,0,30,110,
8,2,0,33,7,29,35,1,0,37,3,3,102,1,1,37,
125,0,1,17,2,14,1,133,68,18,1,67,93,87,28,45,
23,9,20,58,16,31,59,4,17,71,0,18,2,1,58,81,
1,7,6,18,7,0,72,52,49,1,17,89,0,83,9,253,
92,1,2,66,5,100,8,73,3,3,0,22,24,34,19,24,
32,15,92,9,91,50,0,31,11,31,24,0,9,3,121,22,
22,24,44,124,14,35,73,5,0,66,72,8,14,42,28,8,
17,102,35,65,1,1,14,123,20,1,73,1,3,35,72,12,
15,2,7,138,1,62,79,20,3,26,0,3,5,1,185,3,
9,3,10,19,0,4,1,52,22,19,60,16,11,7,19,14,
29,101,16,80,159,1,0,65,1,6,112,108,4,11,171,33,
28,2,12,9,23,10,4,7,10,125,187,6,8,0,0,73,
42,6,77,91,5,64,113,3,0,12,31,6,50,27,23,131,
0,0,6,76,4,5,35,20,54,44,6,3,9,0,0,99,
0,20,38,106,88,16,4,0,8,12,4,18,234,1,113,0,
45,62,75,32,13,0,146,3,8,2,6,16,0,3,1,54,
99,97,3,18,35,7,18,101,1,31,16,210,22,150,9,27,
3,3,11,7,13,2,1,0,3,14,50,6,6,6,6,3,
0,13,0,0,8,1,36,11,12,187,15,7,17,3,18,63,
4,1,15,59,54,0,111,12,11,133,32,53,79,2,68,29,
0,0,86,0,41,3,24,4,12,35,206,11,18,2,0,7,
91,65,22,34,0,0,39,0,13,29,114,123,122,15,5,26,
0,0,42,68,7,15,1,0,3,0,0,8,45,17,1,89,
95,30,2,32,1,5,71,16,3,13,16,8,62,1,2,54,
42,14,150,39,8,39,18,64,88,0,106,98,71,13,19,13,
18,4,1,103,17,1,0,26,10,21,8,27,44,165,7,18,
0,0,85,0,211,19,0,11,0,13,0,1,0,85,16,6,
7,4,2,0,1,109,120,132,0,11,29,97,0,14,68,93,
3,11,2,16,117,22,3,145,10,18,50,33,37,10,1,19,
71,106,4,8,13,90,4,82,13,60,59,8,14,32,35,8,
4,61,0,70,14,9,21,6,200,7,75,36,20,48,1,18,
13,2,38,1,0,94,11,0,1,102,28,20,22,25,13,2,
44,69,219,56,4,5,4,8,52,49,29,37,9,36,43,56,
9,26,63,253,156,0,159,101,4,32,150,8,1,24,91,8,
13,0,62,0,0,0,209,99,36,31,24,71,119,71,0,16,
37,10,29,1,217,1,9,1,20,3,2,7,85,5,6,5,
4,4,85,49,126,2,100,7,5,229,10,58,99,54,14,33,
11,12,41,15,45,19,5,5,0,105,69,5,10,4,61,34,
0,8,3,182,9,0,61,41,0,9,0,5,13,38,46,0,
22,6,0,1,9,106,36,0,1,0,56,98,5,138,1,4,
70,0,5,17,34,25,42,14,58,0,0,0,7,14,0,19,
7,0,4,80,43,3,1,9,66,13,3,13,87,22,126,14,
1,217,9,2,91,2,54,58,3,0,34,29,1,6,31,24,
60,33,73,3,80,14,1,82,23,0,44,205,32,28,0,64,
50,154,16,18,69,0,8,2,2,37,53,70,6,7,19,25,
7,65,57,97,34,213,0,2,1,0,17,70,8,3,147,8,
2,35,7,122,0,81,32,0,0,13,28,253,171,50,51,110,
21,26,9,0,0,0,5,29,3,10,134,0,177,248,195,0,
3,75,8,85,0,12,66,110,0,37,12,0,157,46,4,3,
60,0,32,14,1,33,0,0,85,39,12,8,10,0,38,56,
3,7,27,35,2,15,42,49,11,26,0,113,6,9,0,23,
2,15,10,53,12,2,68,0,11,82,27,24,67,70,12,6,
127,21,3,0,0,0,54,2,27,66,1,137,0,2,9,54,
90,1,9,10,3,1,15,8,0,8,82,107,15,7,0,0,
0,3,131,2,6,24,34,70,41,12,8,62,138,5,39,114,
5,234,115,26,18,166,5,21,0,133,44,23,13,188,5,5,
0,17,1,7,13,13,2,17,30,84,26,46,155,26,0,37,
55,1,0,0,111,0,2,10,0,16,2,6,56,15,120,50,
187,0,16,1,131,72,0,29,21,179,34,15,3,2,11,20,
218,19,0,66,8,6,54,133,0,0,11,151,1,3,1,2,
9,12,41,64,5,241,7,73,10,20,11,6,58,2,28,237,
20,1,5,9,30,11,41,75,39,23,20,0,1,35,50,4,
4,13,44,23,4,5,63,9,22,14,3,0,99,7,0,31,
20,3,26,7,52,98,198,20,28,2,4,0,0,13,2,1,
2,16,9,10,6,0,21,12,174,3,81,24,171,9,42,0,
44,2,5,9,52,8,16,73,16,28,12,5,0,24,35,1,
48,172,6,0,43,121,79,31,43,51,1,10,58,63,29,6,
18,62,11,1,53,10,71,61,161,42,4,36,154,82,56,8,
5,2,32,35,100,13,10,159,8,104,10,0,7,12,11,77,
2,88,1,53,70,0,79,8,80,109,139,0,38,131,10,4,
7,2,23,61,1,0,18,51,9,5,18,172,5,110,4,10,
14,12,0,1,30,9,79,218,48,51,35,75,0,93,1,40,
79,72,124,6,0,0,11,19,43,1,5,94,1,26,191,3,
31,9,0,3,0,7,20,15,1,54,6,0,34,6,52,43,
27,5,147,1,0,30,162,50,14,35,0,39,2,37,139,25,
50,162,20,12,25,14,4,3,63,4,0,20,0,11,44,1,
1,20,5,4,0,68,49,0,145,6,36,0,29,3,42,115,
0,15,3,2,2,60,0,53,1,0,105,6,0,63,49,11,
7,5,10,56,1,11,8,5,4,9,92,1,31,197,51,2,
0,2,3,33,21,2,0,16,4,6,11,6,26,12,12,77,
16,5,24,10,114,3,10,70,4,19,17,0,3,0,4,81,
62,5,3,40,51,117,2,1,44,116,3,2,0,97,30,5,
4,0,13,1,3,12,21,20,102,1,54,1,5,126,15,12,
18,34,234,179,166,0,1,25,0,70,7,32,187,20,3,0,
57,9,65,1,78,10,82,31,0,3,96,2,15,13,19,0,
10,7,1,6,86,91,1,93,23,1,114,0,245,90,4,180,
14,39,16,3,68,1,5,74,1,7,136,20,5,14,4,31,
54,0,33,32,7,16,4,5,25,50,0,7,128,23,0,160,
29,46,112,0,5,19,104,41,70,6,7,237,0,9,18,13,
43,250,34,111,12,89,9,140,34,24,26,25,58,17,0,128,
20,36,83,44,34,250,0,61,0,0,110,13,107,177,14,0,
66,77,1,39,9,2,28,21,0,8,77,86,93,6,23,156,
34,15,11,18,7,37,4,14,96,10,23,0,95,80,3,61,
7,10,39,18,49,67,3,105,18,5,132,61,7,41,1,2,
38,40,3,92,4,0,90,9,0,87,34,22,2,5,130,248,
3,0,178,0,94,15,71,29,26,6,1,0,0,22,93,97,
86,63,6,13,20,10,1,52,5,93,3,57,40,2,0,1,
6,20,7,8,38,0,0,3,7,15,12,3,5,8,25,48,
14,89,76,77,72,0,71,20,20,3,0,0,42,42,11,18,
1,40,18,9,80,3,136,20,35,2,19,30,171,159,4,2,
94,18,0,1,33,91,44,5,0,10,0,3,37,9,115,15,
27,136,22,4,40,33,26,15,7,0,37,28,4,9,44,32,
17,35,5,1,25,21,10,1,20,31,0,5,11,1,26,183,
1,5,37,111,9,79,28,86,21,30,5,25,5,35,9,65,
6,0,97,45,2,117,8,44,7,11,225,5,70,99,157,0,
1,2,4,132,15,44,0,115,28,24,0,12,22,0,42,3,
25,89,40,244,33,82,26,156,49,58,52,0,47,2,117,24,
35,66,45,15,82,66,67,13,8,80,68,11,22,2,0,10,
1,47,30,1,203,68,19,76,157,34,110,33,21,135,6,51,
31,12,24,177,10,0,2,37,0,34,23,36,46,7,4,11,
5,5,17,21,226,7,33,7,22,149,52,0,78,59,5,52,
0,148,41,57,71,16,2,11,165,117,5,18,87,50,58,31,
2,1,12,49,2,0,1,42,2,94,0,7,72,94,4,130,
172,28,2,44,0,7,38,87,6,52,28,8,1,38,20,36,
0,13,184,40,0,59,147,0,20,80,7,165,16,1,18,36,
0,0,12,59,97,45,0,70,93,70,165,12,111,20,0,82,
36,0,202,23,35,49,149,4,1,1,128,15,1,49,100,11,
6,13,14,28,24,9,15,11,37,204,10,0,15,17,15,12,
39,0,17,16,80,97,84,4,16,70,58,121,75,148,67,5,
21,0,12,51,4,9,3,18,5,105,71,173,166,18,83,174,
5,11,208,19,123,0,29,0,4,0,88,23,109,61,66,97,
1,59,8,29,53,1,31,19,197,152,4,41,28,10,2,60,
112,2,5,58,9,193,45,80,10,57,9,36,104,131,1,212,
28,11,142,0,224,70,14,38,6,1,9,85,31,72,5,61,
8,77,9,8,7,38,0,21,0,63,53,0,8,4,9,3,
0,18,13,86,73,5,2,0,71,21,0,14,89,88,2,37,
41,19,25,1,69,28,18,132,2,4,3,29,0,82,26,8,
19,63,26,3,0,16,93,37,22,0,33,2,27,3,62,12,
};

/* The hash function */
__private_extern__ ub4 phash(key, len)
char *key;
int   len;
{
  ub4 rsl, val = lookup(key, len, 0x5384540f);
  rsl = ((val>>17)^scramble[tab[val&0x1fff]]);
  return rsl;
}
