///write_raw_txt_famitracker();
var A0, B0, C0, D0, E0, F0, actual_cl, actual_output, thisfile, Enter;

//Init useful variables
Enter = '
';
actual_cl = (rows+4) div 4;

/*** Table of Contents

A0 - head
B0 - macros (settings for instruments)
C0 - DPCM
D0 - instruments
E0 - track
F0 - patterns
*/

//-------------------------------------------------------------------------------------------------------------------------------//

///head
A0 = '# FamiTracker text export 0.4.2

# Song information
TITLE           "'+songname+'"
AUTHOR          "8Tones App"
COPYRIGHT       "8Tones App"

# Song comment
COMMENT ""

# Global settings
MACHINE         0
FRAMERATE       0
EXPANSION       8
VIBRATO         1
SPLIT           32

';

//-------------------------------------------------------------------------------------------------------------------------------//

///macros
B0 = '# Macros
MACRO       0   0  -1  -1   0 : 15 6 5 4 3 2 1 0
MACRO       0   1  -1  -1   0 : 9 13 7 7 6 6 5 5 4 4 3 3 2 2 0
MACRO       0   2  -1  -1   0 : 15 6 6 5 5 4 4 3 3 2 2 1 1 1 0
MACRO       1   0  -1  -1   0 : -7 -3
MACRO       4   0  -1  -1   0 : 2
MACRO       4   1  -1  -1   0 : 1
MACRO       4   2  -1  -1   0 : 0

'

//-------------------------------------------------------------------------------------------------------------------------------//

///DPCM
C0 = '# DPCM samples
DPCMDEF   0  1185 "beat6.dmc"
DPCM : 00 00 00 00 40 AF D5 76 DB 5A 4A 29 49 22 52 55 DB B6 DD DD B6 2A 25 11 11 22 A4 AA B6 BB FB BE
DPCM : B7 B5 54 22 82 40 40 A2 54 AD DD F7 EF 7B B7 D5 54 12 82 20 10 10 49 AA B5 DD F7 FB EF BB 6D 55
DPCM : 25 89 10 04 08 88 90 54 55 DB DD FB F7 F7 DD 6D AB 2A 25 11 82 40 40 84 48 4A 55 6D DB BB EF FB
DPCM : BB BB 6D AD 4A 25 89 08 22 08 22 24 92 52 55 6D DD EE DE 7B DF ED 6E 6B 55 55 4A 92 44 88 10 21
DPCM : 22 92 A4 52 55 AB 6D BB BD 7B F7 76 B7 6D AD 55 55 4A 49 12 89 88 88 88 24 92 92 2A D5 AA B5 6D
DPCM : DB DD ED ED 76 DB B6 D6 AA AA 2A A5 24 49 22 89 48 24 91 A4 A4 54 A9 6A D5 5A DB B6 ED B6 DB 6D
DPCM : DB B6 D5 5A 55 53 55 2A 25 25 49 92 48 92 24 49 52 4A A9 4A 55 AD 5A 6D 6D 6D DB B6 6D DB B6 B5
DPCM : B5 56 AB 6A A5 AA 54 29 29 25 29 49 92 A4 24 25 A5 94 4A 55 A9 5A 55 AB B5 D6 DA DA B6 B6 B5 AD
DPCM : AD B5 56 AB 55 55 55 55 A5 4A A9 94 52 52 52 52 52 52 4A 29 A5 52 A5 AA AA AA AA 55 AB D5 5A 6B
DPCM : AD AD B5 B5 D6 D6 6A AD 5A D5 AA AA AA AA 52 95 4A A5 52 4A A9 A4 54 52 2A A5 54 2A 55 AA 2A 55
DPCM : 55 55 AB AA 55 AB D5 6A B5 D6 5A AD B5 5A AB D5 AA 55 AB AA 55 55 55 A5 AA 4A 55 AA 54 2A 95 4A
DPCM : A9 54 2A A5 52 A5 52 95 AA 52 55 55 55 55 55 B5 AA 56 B5 6A B5 6A B5 5A AD 56 AD 56 AB 56 B5 AA
DPCM : 5A 55 55 55 55 55 55 A5 AA 52 55 AA 54 A9 52 A5 52 A5 4A 95 2A 55 A9 2A 55 55 A5 AA AA AA AA 5A
DPCM : 55 D5 AA 6A 55 AB 5A B5 AA 55 AB 5A B5 AA 55 AD AA 56 55 D5 AA AA AA AA AA 2A 55 55 A5 AA 4A 55
DPCM : A9 4A 55 A9 4A 55 AA 52 55 AA 2A 55 55 AA AA AA AA AA AA AA AA AA AA 5A 55 D5 AA 6A 55 B5 AA 56
DPCM : D5 AA 5A 55 AD AA 56 55 B5 AA AA AA AA 5A 55 A5 AA AA AA AA 2A 55 55 A5 AA 4A 55 A5 AA 4A 55 95
DPCM : AA 2A 55 55 A9 AA AA 52 55 55 55 55 55 55 55 55 55 D5 AA AA AA 56 55 D5 AA AA 56 55 D5 AA AA 56
DPCM : 55 D5 AA AA AA 56 55 55 55 55 55 55 55 55 55 55 55 55 A5 AA AA AA 54 55 55 AA AA 2A 55 55 55 AA
DPCM : AA AA 54 55 55 55 A5 AA AA AA AA AA AA AA AA AA AA AA 5A 55 55 55 55 AB AA AA 6A 55 55 55 AB AA
DPCM : AA 6A 55 55 55 55 AB AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA 54 55 55 55 55 AA AA AA AA 52
DPCM : 55 55 55 55 AA AA AA AA AA 52 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 AD AA AA AA AA AA 5A
DPCM : 55 55 55 55 D5 AA AA AA AA AA 5A 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 A5 AA AA AA AA AA AA 54 55 55 55 55 55 55 AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA
DPCM : AA AA AA AA AA AA AA AA 6A 55 55 55 55 55 55 55 55 AB AA AA AA AA AA AA AA AA AA 5A 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 95 AA AA AA AA AA AA AA AA AA AA AA 52 55 55 55 55 55 55 55 55 55 55
DPCM : 55 A9 AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA 6A 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 AD AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA
DPCM : AA AA AA AA AA AA AA 2A 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 AD AA AA AA AA
DPCM : AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA 2A 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : AD AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA AA CA 4A 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55
DPCMDEF   1   449 "beat7.dmc"
DPCM : 55 60 6B 79 EA F8 FF 43 82 24 00 20 8E ED C7 A5 1F 10 B7 7F FF FF 4D 63 C1 15 24 41 92 28 09 4D
DPCM : 25 44 42 10 CA BE FB FF 7F DF F5 EE D3 31 0E FF 41 10 00 21 92 20 00 F4 38 56 5D EB F9 9D 3C BF
DPCM : ED E7 D7 AA 6C 59 16 A2 00 61 83 F0 72 3A 0B 81 45 41 09 DA F1 FD FF FF 5E AF C4 4B D3 C9 8A 82
DPCM : 24 89 28 06 02 47 55 E1 3D AE EF BC F4 52 D5 55 BD BC 7A 1E 57 51 0A 25 29 A8 A8 38 69 D3 88 AA
DPCM : 18 78 6C BA DE 7D ED FB 43 E7 34 4C 2C 25 AD 92 A4 51 A5 C8 62 E2 06 8D C7 F1 AD 65 37 B4 AC 5A
DPCM : 4D 9F 3E 6D 3C A5 B2 24 A9 A2 92 86 A9 44 45 EE 2C 5E AA 2D AE 53 9F 4A 9D 3D 4E 8D 3B 8A A9 E5
DPCM : C8 B2 2C 34 52 D4 59 B1 D2 8A 55 C3 5B A9 55 8B 76 7C 79 6C 2B CE F2 64 31 8E 64 45 72 64 D1 92
DPCM : E3 54 AD 5A 35 55 D7 58 1E 1D 55 4E 1D 57 56 55 CB AA AA 2A 69 A5 4A AA AA 4A 4D 6A 31 4D D3 A9
DPCM : 6A AD 7A 5C 65 AB AA AC CA 72 AA 4A B5 D0 8A 95 AC 54 95 6C D9 52 5B A5 AA D5 4A B5 2C 4B B6 D4
DPCM : 34 9D 95 56 55 55 55 55 9A 2A 15 A7 AA 52 2D 55 69 95 B6 AA 65 D5 6A AA 5A EA 58 55 69 6A A9 96
DPCM : D2 34 95 53 A9 A9 2A 35 55 D3 AA 6A 55 B5 E2 AA 34 B5 9C C6 B1 95 AA A9 AA B4 52 55 8B A9 9A A6
DPCM : AA 9A 5A 6A A5 56 56 65 55 55 AD B4 B2 AA 54 55 2D D5 AA AC AA 52 2B 4B 95 AA AA B2 2A AB AA 6A
DPCM : A5 55 D5 B4 AA AA AA A9 AA AA 52 55 59 A9 A5 AA 56 5A A5 95 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55 55 55 55 55 55 53 35 55 D5 54 55 55 55 A9 A5 AA AA 6A 59 69 55 55 B5 AA AA B2 2C 2B 55 55 55
DPCM : FF
DPCMDEF   2   129 "beat8.dmc"
DPCM : 55 55 55 95 AA 2A 95 E0 7F FC C0 F1 03 28 FE FF FF F1 5F 3F 00 00 00 00 00 00 08 80 C0 F1 FF C7
DPCM : 8B 1F FF FF FF FF FF FF FF AB 6A 9B AA 92 52 25 95 24 25 92 80 4A 50 05 00 00 80 20 42 04 08 E2
DPCM : FF 01 80 6D AB 6D DF BB 77 7B AB AF DD D5 7D DD BF FF EF B6 6D 6F BB 6D AF 2A 95 94 24 49 92 88
DPCM : 42 84 48 88 04 09 49 92 24 51 22 A5 92 22 49 AA 52 A9 AA 5A 55 AD 55 55 AD 6D B5 AD 6D B5 6D DB
DPCM : 55
DPCMDEF   3   257 "beat9.dmc"
DPCM : 55 55 55 55 55 55 55 55 55 55 55 55 55 B5 82 DC 7F 00 E0 FF 03 E8 FF 03 00 F8 FF 00 F0 FF 62 0B
DPCM : 40 DF 8B EA 27 00 FC BF 00 14 FD FF 03 00 F6 FF 07 00 70 DF FF 02 00 F8 FF 07 00 E0 FF 0F 00 D4
DPCM : FE FF 04 80 FE BF 04 00 EC FF 9F 00 80 FE FF 01 00 FF FF 03 00 A0 FF FF 00 00 FF 7F 02 00 FA FF
DPCM : 07 00 EC FF 0F 00 E8 FE 9F 00 80 FF 5F 01 A0 FA FE 8A 00 B4 FF 17 01 50 FF 5F 02 A0 F6 BF 02 41
DPCM : ED ED 56 02 52 F7 AF 04 C8 F6 5B 49 90 D5 DB 4A 92 AA 56 AF 4A 90 ED B6 92 24 B5 5D 93 A4 AA AD
DPCM : 56 89 D4 B6 96 2A 55 6A AD AA 92 AA B6 96 52 A9 56 AB 4A 95 55 AB AA 94 AA 55 AB 54 AA D5 AA 52
DPCM : 55 55 AD 2A 55 55 AD AA 52 55 D5 AA 52 55 55 AB 4A 55 55 2B 55 55 55 55 AB 54 55 2D AB 4A 55 55
DPCM : B5 2A 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55
DPCM : 55
DPCMDEF   4   897 "beat10.dmc"
DPCM : 55 55 55 55 55 55 D5 AA D5 37 02 00 F4 A3 FF FF 7F 00 2A 00 00 80 FF FF FF 7F 05 00 00 E0 FF 1F
DPCM : C0 FF 17 00 F0 FF C0 89 FF 00 00 E0 FF FF FF 03 00 00 00 FA FF 3F 00 EC FF 7F 00 FF 7F 00 E0 08
DPCM : 00 F8 F7 FF 07 0E 90 00 80 FE FF 7F 00 C0 FE 7F 7F 01 FE 2F 00 8C 00 80 FF FF 4F 00 C0 7F 00 F8
DPCM : 0F FC 07 F0 7F FF A6 BF 40 5B 00 C0 0A 01 FB 8B FE 04 00 FC FF 00 FC 04 FE 91 FB FF 1F E0 FF 03
DPCM : 00 00 60 7F 2B 48 C0 FF 02 D0 FE 1F 00 FE 09 FA A5 FF FF 21 A2 FF 01 00 04 B0 EF 17 81 1D C0 FE
DPCM : 0F 54 0B AA FA 3F 00 FF FE FF 00 F4 57 02 00 89 A4 3E 50 FF 0F 80 FF 0B 01 EA C4 FD 27 DA B6 FB
DPCM : 2F E0 85 56 02 C0 0B A8 90 BA FF 2F 80 FD 07 C0 56 D2 FE 83 FF 89 4F A5 D6 0A 24 01 FC 03 F0 02
DPCM : F8 FF 6B 52 BB 09 80 BE BD 84 F6 7F DF 09 00 FB 4B 00 D0 8A 4A 55 49 FD AA FA AD 5A 05 08 7B B7
DPCM : A2 52 FF FF 03 00 6D 2B 40 52 13 D1 B6 EA AB 42 ED 7F 12 92 5A 51 9F A8 4B DB B7 AF 40 4B 00 D0
DPCM : 2E 91 AA AA FD 1F 01 F6 BF 08 AD 64 2B 95 FA 26 B5 A5 7E A9 2A 01 10 D8 2B B1 EA BE 7D 25 49 6D
DPCM : 15 A9 6B 95 C8 EA DD 49 52 5B 2B 49 13 41 88 D4 F7 91 FA BE 6D 25 28 95 D4 5E 55 85 B6 BD 64 4B
DPCM : 52 AD 88 6A 25 08 6A FB AA 55 6F FB 91 54 09 A8 AD DA AD 24 BB 5D 05 A9 49 92 BA 92 24 59 6D 57
DPCM : DB 56 D3 2E AD 2A 08 B0 7B 5B 49 DB 57 49 22 A9 92 64 2B B5 95 A4 B7 6B B5 6A 25 B5 55 22 A4 B2
DPCM : ED 4A 7D 17 A9 89 D4 04 50 DB DB 15 EA B6 6A 9B D4 96 A4 5A 49 55 49 6C AF 76 95 54 55 55 02 A8
DPCM : 56 DB 5E 69 5F A5 52 6D 25 89 6A 5B AA 24 B5 55 DB 25 69 95 54 95 20 B5 6A DB F6 6D 92 5A 95 2A
DPCM : 41 EA 2B B5 52 5A AB 52 6D AB 92 50 B5 52 25 A9 ED 6B B7 91 AD 24 95 24 A5 56 6B B5 B6 25 A4 B6
DPCM : 55 49 A2 D5 4A 55 95 D6 6D 6D AB AA 44 29 95 54 A5 6A DF A6 4A A5 AA 92 54 55 B5 2A B5 B5 AA 54
DPCM : 7D AB 2A 11 D5 54 92 AA DA B6 D5 56 52 25 29 95 AA 56 A9 7B 55 55 2A DB AA AA A4 52 2A 55 55 AD
DPCM : AA 76 5B 49 15 52 55 A9 D4 B6 B5 D5 5A A9 54 49 B5 9A 4A 89 DA 4E 49 6B B5 AD 2A 29 A9 92 CA 6A
DPCM : AB B6 55 DB 54 4A 85 AA 55 AA AA 6A 55 55 95 D5 AA AA 55 09 95 AA B6 95 DA B6 B5 92 4A 49 95 A4
DPCM : B6 AA 5A B5 6A 55 52 AA DA 56 92 54 B5 AA AA B5 AD 56 A9 2A 25 49 AA 5A B5 5A B5 6A AD 24 A9 AA
DPCM : B4 6A 55 A5 6A 55 AB 55 D5 CA AA 24 49 AA DA 54 AD 6B 55 95 AA 56 82 5A D5 56 53 D5 6A 55 A9 AA
DPCM : 6A 55 49 A5 4A A9 55 B5 6D 55 55 55 95 A4 92 6A AB 55 6B 55 55 55 A9 4A A5 D6 4A A5 4A 55 6D AB
DPCM : AA 55 55 95 92 54 B5 52 AB 6D AB 54 6A 2B 25 4A 55 AB 55 95 5A 55 5A B5 6A 55 A5 52 95 4A 55 AD
DPCM : B6 B5 AA 54 55 95 24 55 55 AB 6A 6B A9 52 AB AA 52 AD AA 52 A5 D4 AA D5 5A B5 AA 54 52 AA AA 52
DPCM : 55 B5 6D 95 AA A9 AA 4A AA 5A 55 55 55 55 A9 55 5B B5 94 2A 95 AA 54 55 AD D6 56 55 55 95 52 A9
DPCM : 6A AA 5A AD 5A 29 55 AB AA AA AA 2A 95 54 B5 AA 5A AB 55 AB 24 55 55 55 AA 6A D5 AA 55 55 AA AA
DPCM : 54 55 AB 54 AA 55 A9 AA D5 5A 55 55 A9 52 95 AA AA 55 B5 6A 55 55 4A 55 55 95 55 55 55 2B 55 55
DPCM : DA
DPCMDEF   5   513 "beat11.dmc"
DPCM : 2A 55 55 AD 2A 55 55 AD 4A 55 55 AB 4A 53 55 AB 4A 55 55 AB CA 54 D5 AA 52 55 D5 AA EC F9 61 44
DPCM : 10 00 F8 01 FF FF 1F F6 FF A6 7F 01 00 00 00 00 00 7F FE FF FF 9F 7F 16 01 00 00 00 01 FE FF FF
DPCM : FF FF FF 0F 06 00 00 00 00 00 FE FF FF FF FF FF 67 00 00 00 00 00 80 FF FF FF FF FF FF 05 00 00
DPCM : 00 00 00 80 FF FF FF FF FF FF 1F 00 00 00 00 00 00 F8 FF FF FF FF FF FF 11 00 00 00 00 00 00 FA
DPCM : FF FF FF FF FF FF 09 00 00 00 00 00 00 EA FF FF FF FF FF FF 2B 01 00 00 00 00 00 90 FB FF FF FF
DPCM : FF FF AF 52 10 00 00 00 00 00 6A ED FF FF FF FF FF 6B 55 48 00 00 00 00 00 54 D5 F7 FF FF FF FF
DPCM : EF 9A 52 10 00 00 00 00 10 53 EB FE FF FF FF FF 6D D5 28 01 00 00 00 00 49 AA BA EF FF FF FF FF
DPCM : CE 95 12 05 00 00 00 01 49 AA E5 BB EF FF FF BB DB 9A 2A 25 04 41 00 41 44 54 AA B5 B6 FB FE BD
DPCM : FB BA B5 AA 94 24 21 04 10 11 49 51 55 DB BA EF BB EF BB AE 56 55 29 11 84 10 44 44 92 D2 AA B6
DPCM : ED BB EF BB BB AE 55 95 54 24 41 10 81 28 89 AA AA F6 EA ED FB EE 6B 5B B3 AA 28 49 44 12 42 14
DPCM : 49 95 AA 5A AB DB EB ED AE D7 56 AB AA 4A 45 11 91 44 50 24 A9 52 B5 EA FA AE EF EE 6E 6D AD 4A
DPCM : A9 24 12 11 14 11 45 A5 6A 5A AB EB EE B6 EB AE EB B4 AA 4A 95 44 12 11 49 44 29 55 D5 AC AE AE
DPCM : B7 EB BA AD AB 5A 55 A9 92 92 44 51 44 92 54 AA AA 6A B5 ED BA EE BA AD AD AA AA 2A 29 51 52 54
DPCM : 22 29 95 AA AA AA D5 B6 5A 6B EB 5A 6B B5 AA 9A 2A 95 52 49 51 52 54 45 55 A5 DA AA B5 5A EB 6A
DPCM : AD D5 6A 55 55 55 59 29 95 94 32 49 52 49 55 A5 6A D5 BA DA DA B6 AE B5 AA 9A 95 54 4A 49 29 25
DPCM : 25 95 A5 AA AA AA AB 5A AB D5 5A B5 6A B5 AA AA 4A 55 A5 52 A9 2C A5 54 AA B2 54 55 55 AB 55 AB
DPCM : 0F

';

//-------------------------------------------------------------------------------------------------------------------------------//

///instruments
D0 = '# Instruments
INST2A03   0    -1  -1  -1  -1   0 "50%"
INST2A03   1    -1  -1  -1  -1   1 "25%"
INST2A03   2    -1  -1  -1  -1   2 "12.5%"
INST2A03   3    -1  -1  -1  -1  -1 "Triangle"
INST2A03   4     0  -1  -1  -1  -1 "Beat A"
INST2A03   5     1   0  -1  -1  -1 "Beat B"
INST2A03   6     2  -1  -1  -1   1 "Beat C"
INST2A03   7    -1  -1  -1  -1  -1 "DPCM"
KEYDPCM   7   3   0     0  15   0     0  -1
KEYDPCM   7   3   1     1  15   0     0  -1
KEYDPCM   7   3   2     2  15   0     0  -1
KEYDPCM   7   3   3     3  15   0     0  -1
KEYDPCM   7   3   4     4  15   0     0  -1
KEYDPCM   7   3   5     5  15   0     0  -1

';

//-------------------------------------------------------------------------------------------------------------------------------//

///track
var _get_speed, rowz; //init
_get_speed = (abs(tempo-11))+1;

E0 = '# Tracks

TRACK  64   '+string(_get_speed)+' 150 "'+songname+'"
COLUMNS : 1 1 1 1 1 1 1

'; //make the main string

for (rowz = 0; rowz < actual_cl; rowz ++)
{
    HEXX = '';
    HEXX = dec_to_hex(rowz);
    
    if (string_length(HEXX) == 0)
    {
        _add[rowz] = 'ORDER 00 : 00 00 00 00 00 00 00'+Enter;
    }
    else if (string_length(HEXX) == 1)
    {
        _add[rowz] = 'ORDER 0'+HEXX+' : 0'+HEXX+' 0'+HEXX+' 0'+HEXX+' 0'+HEXX+' 0'+HEXX+' 0'+HEXX+' 0'+HEXX+Enter;
    }
    else if (string_length(HEXX) == 2)
    {
        _add[rowz] = 'ORDER '+HEXX+' : '+HEXX+' '+HEXX+' '+HEXX+' '+HEXX+' '+HEXX+' '+HEXX+' '+HEXX+Enter;
    }
    else
    {
        _add[rowz] = 'error';
    }
    E0 = string_insert(_add[rowz],E0,string_length(E0));
}

//-------------------------------------------------------------------------------------------------------------------------------//

///patterns
var ptt, rw, chn;
F0 = '';
for (ptt = 0; ptt < actual_cl; ptt++)
{
    HEXX = '';
    HEXX = dec_to_hex(ptt);
    //head
    if (string_length(HEXX) == 0)
    {
        heAd[ptt] = 'PATTERN 00';
    }
    else if (string_length(HEXX) == 1)
    {
        heAd[ptt] = Enter+'PATTERN 0'+HEXX+Enter;
    }
    else if (string_length(HEXX) == 2)
    {
        heAd[ptt] = Enter+'PATTERN '+HEXX;
    }
    else
    {
        heAd[ptt] = Enter+'PATTERN FF';
    }
    F0 = string_insert(heAd[ptt],F0,string_length(F0));
    //MAIN
    var ZZZ, abrupt;
    ZZZ = 64;
    abrupt = 0
    if (ptt*4 > rows-1)
    {
        ZZZ = ((ptt*4)-(rows-1))*(16);
        abrupt = 1;
    }
    for (rw = 0; rw < ZZZ; rw++)
    {
        //THIS IS THE MAIN CODE FOR INSERTING EVERY SINGLE NOTES FROM EVERY CHANNEL!!
        HEXX = '';
        HEXX = dec_to_hex(rw);
        //Start (ROW $$)
        if (string_length(HEXX) == 0)
        {
            STARt[rw] = Enter+'ROW 00 : ';
        }
        else if (string_length(HEXX) == 1)
        {
            STARt[rw] = 'ROW 0'+HEXX+' : ';
        }
        else if (string_length(HEXX) == 2)
        {
            STARt[rw] = 'ROW '+HEXX+' : ';
        }
        else
        {
            STARt[rw] = 'ROW FF'; //error
        }
        //get every single channel (except beats)
        //INIT ALL!!!!
        String0[rw] = '... .. . ... : '; //square 50%
        String1[rw] = '... .. . ... : '; //square 25%
        String2[rw] = '... .. . ... : '; //square 12.5%
        String3[rw] = '... .. . ... : '; //triangle
        String4[rw] = '... .. . ... : '; //noise
        String5[rw] = '... .. . ... : '; //dpcm
        //start the loop
        for (chn = 0; chn <= 3; chn ++)
        {
            //channel 50%
            if (chn == 0)
            {
                RawPitch_A[chn] = 0;
                RawVolume_A[chn] = 0;
                RawPitch_A[chn] = ds_grid_get(channel_a,0,(ptt*64)+rw); //get pitch
                RawVolume_A[chn] = ds_grid_get(channel_a,1,(ptt*64)+rw)*10; //get volume
                if (RawPitch_A[chn] != -1)
                {
                    switch (RawVolume_A[chn])
                    {
                        case(0): VolvoA[chn] = '0'; break;
                        case(1): VolvoA[chn] = '2'; break;
                        case(2): VolvoA[chn] = '3'; break;
                        case(3): VolvoA[chn] = '5'; break;
                        case(4): VolvoA[chn] = '6'; break;
                        case(5): VolvoA[chn] = '8'; break;
                        case(6): VolvoA[chn] = '9'; break;
                        case(7): VolvoA[chn] = 'B'; break;
                        case(8): VolvoA[chn] = 'C'; break;
                        case(9): VolvoA[chn] = 'E'; break;
                        case(10): VolvoA[chn] = 'F'; break;
                        default: VolvoA[chn] = '0'; break;
                    }
                    MainPitchA[chn] = string(pitch_string_raw_save(RawPitch_A[chn]));
                    OctaveA[chn] = string((RawPitch_A[chn] div 12)+1);
                    if (VolvoA[chn] != '0')
                    {
                        String0[rw] = MainPitchA[chn]+OctaveA[chn]+' 00 '+VolvoA[chn]+' ... : ';
                    }
                    else
                    {
                        String0[rw] = '--- .. . ... : ';
                    }
                }
            }
            //channel 25%
            if (chn == 1)
            {
                RawPitch_B[chn] = 0;
                RawVolume_B[chn] = 0;
                RawPitch_B[chn] = ds_grid_get(channel_b,0,(ptt*64)+rw); //get pitch
                RawVolume_B[chn] = round((ds_grid_get(channel_b,1,(ptt*64)+rw)*10)); //get volume
                if (RawPitch_B[chn] != -1)
                {
                    switch (RawVolume_B[chn])
                    {
                        case(0): VolvoB[chn] = '0'; break;
                        case(1): VolvoB[chn] = '2'; break;
                        case(2): VolvoB[chn] = '3'; break;
                        case(3): VolvoB[chn] = '5'; break;
                        case(4): VolvoB[chn] = '6'; break;
                        case(5): VolvoB[chn] = '8'; break;
                        case(6): VolvoB[chn] = '9'; break;
                        case(7): VolvoB[chn] = 'B'; break;
                        case(8): VolvoB[chn] = 'C'; break;
                        case(9): VolvoB[chn] = 'E'; break;
                        case(10): VolvoB[chn] = 'F'; break;
                        default: VolvoB[chn] = '0'; break;
                    }
                    MainPitchB[chn] = string(pitch_string_raw_save(RawPitch_B[chn]));
                    OctaveB[chn] = string((RawPitch_B[chn] div 12)+1);
                    if (VolvoB[chn] != '0')
                    {
                        String1[rw] = MainPitchB[chn]+OctaveB[chn]+' 01 '+VolvoB[chn]+' ... : ';
                    }
                    else
                    {
                        String1[rw] = '--- .. . ... : ';
                    }
                }
            }
            //channel 12.5%
            if (chn == 2)
            {
                RawPitch_C[chn] = 0;
                RawVolume_C[chn] = 0;
                RawPitch_C[chn] = ds_grid_get(channel_c,0,(ptt*64)+rw); //get pitch
                RawVolume_C[chn] = round((ds_grid_get(channel_c,1,(ptt*64)+rw)*10)); //get volume
                if (RawPitch_C[chn] != -1)
                {
                    switch (RawVolume_C[chn])
                    {
                        case(0): VolvoC[chn] = '0'; break;
                        case(1): VolvoC[chn] = '2'; break;
                        case(2): VolvoC[chn] = '3'; break;
                        case(3): VolvoC[chn] = '5'; break;
                        case(4): VolvoC[chn] = '6'; break;
                        case(5): VolvoC[chn] = '8'; break;
                        case(6): VolvoC[chn] = '9'; break;
                        case(7): VolvoC[chn] = 'B'; break;
                        case(8): VolvoC[chn] = 'C'; break;
                        case(9): VolvoC[chn] = 'E'; break;
                        case(10): VolvoC[chn] = 'F'; break;
                        default: VolvoC[chn] = '0'; break;
                    }
                    MainPitchC[chn] = string(pitch_string_raw_save(RawPitch_C[chn]));
                    OctaveC[chn] = string((RawPitch_C[chn] div 12)+1);
                    if (VolvoC[chn] != '0')
                    {
                        String2[rw] = MainPitchC[chn]+OctaveC[chn]+' 02 '+VolvoC[chn]+' ... : ';
                    }
                    else
                    {
                        String2[rw] = '--- .. . ... : ';
                    }
                }
            }
            //channel triangle
            if (chn == 3)
            {
                RawPitch_D[chn] = 0;
                RawVolume_D[chn] = 0;
                RawPitch_D[chn] = ds_grid_get(channel_d,0,(ptt*64)+rw); //get pitch
                RawVolume_D[chn] = round((ds_grid_get(channel_d,1,(ptt*64)+rw)*10)); //get volume
                if (RawPitch_D[chn] != -1)
                {
                    switch (RawVolume_D[chn])
                    {
                        case(0): VolvoD[chn] = '0'; break;
                        case(1): VolvoD[chn] = '2'; break;
                        case(2): VolvoD[chn] = '3'; break;
                        case(3): VolvoD[chn] = '5'; break;
                        case(4): VolvoD[chn] = '6'; break;
                        case(5): VolvoD[chn] = '8'; break;
                        case(6): VolvoD[chn] = '9'; break;
                        case(7): VolvoD[chn] = 'B'; break;
                        case(8): VolvoD[chn] = 'C'; break;
                        case(9): VolvoD[chn] = 'E'; break;
                        case(10): VolvoD[chn] = 'F'; break;
                        default: VolvoD[chn] = '0'; break;
                    }
                    MainPitchD[chn] = string(pitch_string_raw_save(RawPitch_D[chn]));
                    OctaveD[chn] = string((RawPitch_D[chn] div 12)+1);
                    if (VolvoD[chn] != '0')
                    {
                        String3[rw] = MainPitchD[chn]+OctaveD[chn]+' 03 '+VolvoD[chn]+' ... : ';
                    }
                    else
                    {
                        String3[rw] = '--- .. . ... : ';
                    }
                }
            }
        }
        //NOISE/DPCM
        RawSample[rw] = ds_grid_get(channel_e,0,(ptt*64)+rw); //get pitch
        RawVolume_E[rw] = ds_grid_get(channel_e,1,(ptt*64)+rw)*10; //get volume
        switch (RawVolume_E[rw])
        {
            case(0): VolvoE[rw] = '0'; break;
            case(1): VolvoE[rw] = '2'; break;
            case(2): VolvoE[rw] = '3'; break;
            case(3): VolvoE[rw] = '5'; break;
            case(4): VolvoE[rw] = '6'; break;
            case(5): VolvoE[rw] = '8'; break;
            case(6): VolvoE[rw] = '9'; break;
            case(7): VolvoE[rw] = 'B'; break;
            case(8): VolvoE[rw] = 'C'; break;
            case(9): VolvoE[rw] = 'E'; break;
            case(10): VolvoE[rw] = 'F'; break;
            default: VolvoE[rw] = '0'; break;
        }
        switch (RawSample[rw])
        {
            case(0): String4[rw] = 'D-# 04 '+VolvoE[rw]+' ... : '; break;
            case(1): String4[rw] = '4-# 04 '+VolvoE[rw]+' ... : '; break;
            case(2): String4[rw] = 'A-# 05 '+VolvoE[rw]+' ... : '; break;
            case(3): String4[rw] = '1-# 04 '+VolvoE[rw]+' ... : '; break;
            case(4): String4[rw] = '6-# 06 '+VolvoE[rw]+' ... : '; break;
            case(5): String5[rw] = 'C-3 07 '+VolvoE[rw]+' ... : '; break;
            case(6): String5[rw] = 'C#3 07 '+VolvoE[rw]+' ... : '; break;
            case(7): String5[rw] = 'D-3 07 '+VolvoE[rw]+' ... : '; break;
            case(8): String5[rw] = 'D#3 07 '+VolvoE[rw]+' ... : '; break;
            case(9): String5[rw] = 'E-3 07 '+VolvoE[rw]+' ... : '; break;
            case(10): String5[rw] = 'F-3 07 '+VolvoE[rw]+' ... : '; break;
        }
        
        //add all of the channels of this 'ROW' to the string
        if (abrupt == 0)
        {
            FINAL_ROW[rw] = STARt[rw]+String0[rw]+String1[rw]+String3[rw]+String4[rw]+String5[rw]+String2[rw]+'... .. . ...'+Enter;
        }
        else
        {
            if (rw >= ZZZ-1)
            {
                FINAL_ROW[rw] = STARt[rw]+String0[rw]+String1[rw]+String3[rw]+String4[rw]+String5[rw]+String2[rw]+'... .. . B00'+Enter;
            }
            else
            {
                FINAL_ROW[rw] = STARt[rw]+String0[rw]+String1[rw]+String3[rw]+String4[rw]+String5[rw]+String2[rw]+'... .. . ...'+Enter;
            }
        }
        F0 = string_insert(FINAL_ROW[rw],F0,string_length(F0));
    }
}
if (string_char_at(F0,string_length(F0)) = '0')
{
    F0 = string_delete(F0,string_length(F0),1);
}
if (string_char_at(F0,string_length(F0)-1) = '0')
{
    F0 = string_delete(F0,string_length(F0)-1,1);
}

///SAVE
actual_output = A0+B0+C0+D0+E0+F0+'

# End of export';
//environment_get_variable('HOMEPATH')
var _getsave;
if (os_type == os_android)
{
    _getsave = '/storage/sdcard0/Documents/'+songname+'.txt';
}
else if (os_type = os_ios)
{
    _getsave = songname+'.txt';
}
else if (os_type == os_windows)
{
    _getsave = get_save_filename('.txt',songname+'.txt');
}
thisfile = file_text_open_write(_getsave);//working_directory+songname+".txt");
file_text_write_string(thisfile,actual_output);
file_text_close(thisfile);
if !(os_type = os_ios)
{
    show_message('Your file is saved as "'+_getsave+'"!');
}
else
{
    show_message('Text file saved!');
}
