pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- Armory
-- by 0x2D

#include main.lua
#include player.lua
#include weapons.lua
#include bonus.lua
#include enemies.lua
#include gui.lua

__gfx__
00000000008000008000000001666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002044502000445516666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700002422452004224466666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000020452440204524411661166000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000024422240244222511661166000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700020444450204444566666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000200444450024444566666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000200444450024444561616100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000500500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00066000000660001500150000000000001111000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00668600006686001500055000000000012222100122221000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666600006666001500055000055550022222800222228000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666000006660000155555000558585202222202022222000000000000000000000000000000000000000000000000000000000000000000000000000000000
06665660006666600015858005515555202222022002200200000000000000000000000000000000000000000000000000000000000000000000000000000000
66650000006650000001550005100015202002022002200200000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066500000000000001000001202002022002200200000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000181810000000000
0088088000fff00000ddd00000000000000000000000000000000000000000000000000000000000000000000019910000188100000000001118111000000000
08778ee80fffff000d565d0000000000000000000000000000000000000000000000000000000000000000000022221000888810000000001a98a91000000000
087eeee801f11f000d566d00000000000000000000000000000aa000000000000000000000000000000000000002210000088100000000001998991000000000
088eee8800fff0000d555d00000000000000000000000000000aa000000000000000000000000000000000000022221000222210000000001888881000000000
008eee8000ff000000ddd00000000000000000000000000000000000000000000000000000000000000000000022221000222210000000001a98991000000000
00088800000000000000000000000000000000000000000000000000000000000000000000000000000000000022221000222210000000001998991000000000
00008000000000000000000000000000000000000000000000000000000000000000000000000000000000000002210000022100000000001111111000000000
000000000000000000000000000ddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000030000000000000666d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000003000000000000066666d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000003003000000060000064446d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000300000000646000066666d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000300000003060000064446d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000003000000066666d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000005555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555ddd55555ddd55555ddd555555555555555555
5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555666d5555666d5555666d55555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566666d5566666d5566666d5555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555565555564446d5564446d5564666d5555655555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555646555566666d5566666d5566866d5556465555555555
555555ddd55557775555577755555555555555555555555555555555555555555555555555555555553565555564446d5564446d5566666d5535655555555555
55555d565d5557575555575755555555555555555555555555555555555555555555555555555555553555555566666d5566666d556666665535555555555555
55555d566d5557775555575755555555555555555555555555555555555555555555555555555555555555555555555555555555556666665555555555555555
55555d555d5557575555575755555555555555555555555555555555555555555555555555555555555555555555555555555555555556666555555555555555
555555ddd55557775575577755555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555655555556555555565555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555556465555564655555646555555555555555555
55555556655557775555555555555555555555555555555555555555555555555555555555555555555555555535655555356555553565555555555555555555
55555566665557555555555555555555555555555555555555555555555555555555555555555555555555555535555555355555553555555555555555555555
55555556555557775555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555566665555575555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555556655557775555555555555555555555555555555555555555555553555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555535555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555535535555555555555555555555555555555555555556555555555555555555555555555
55555555555555555555555555555555555555555555555555555555553555555555555555555555555555555555555555564655555555555555555555555555
55555555555555555555555555555555555555555555555555555555553555555555555555555555555555555555555555356555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555355555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555665555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555556866555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555556666555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555666655555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566666655555555555555555555555555555555
55555555555555555555535555555555555555555555555555555555555555555555555555555555555555555555566665555555555555555555555555555555
55555555555555555555355555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555355355555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555535555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555535555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555ddd55555555555555555555555555555555555555555555555555555ddd5555555555
55555555555555555555555555555555555555555555555555555555555666d5555555555555555555555355555555555555555555555555555666d555555555
555555555555555555555555555555555555555555555555555555555566666d5555555555555555555535555555555555555555555555555566666d55555555
555555555555555555555555555555555555555555555555555555555564446d5555555555555555535535555555555555555555555555555564446d55555555
555555555555555555555555555555555555555555555555555555555566666d5555555555555555553555555555555555555555555555555566666d55555555
555555555555555555555555555555555555555555555555555555999999999d5555555555555555553555555555555555555555555555555564446d55555555
55555555555555555555555555555555555555555555555555999955556666699995555555555555555555555555555555555555555555555566666d55555555
55555555555555555555555555555555555555555555555599555555555555555559955555555555555555555555555555555555555555555555555555555555
55555555555ddd555555555555555555555555555555559955555555555555555555599555555555555555555555555555555555555555555555555555555555
55555555555666d55555555555555555555555555555595555555555555555555555555955555555555555555555555555555555555555555555555555555555
555555555566666d5555555555555555555555555566955555555555555555555555555599555555555555555555555555555555555555555555555555555555
555555555564446d5555555555555555555555555668655555555555555555555555555555955555555555555555555555555555555565555555555555555555
555555555566666d5555555555555555555555555666655555555555555555555555555555595555555555555555555555555555555646555555555555555555
555555555564446d5555555555555555555555556666555555555555555555555555555555559555555555555555555555555555553565555555555555555555
555555555566666d5555555555555555555555596666665555555555555555555555555555555955555555555555555555555555553555555555555555555555
55555555555555555555555555555555555555566665555555555555555555555555555555555955555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555955555555555555555665555555555555555555595555555555555555555555555555555555555555555555555
55555555555555555555555555555555555559555555555555555556686553555555555555555559555555555555555555555555555555555555555555555555
55555555555555555555555555555555555559555555555555555556666535555555555555555559555555555555555555555555555555555555555555555555
55555555555565555555555555555555555595555555555556655566665535555555555555555555955555555555555555555555555555555555555555555555
55555555555646555555555555555555555595555555555566865566666655555555556655555555955555555555555555555555555555555555555555555555
55555555553565555555555555555555555955555555555566665666653555555555568665555555595555555555555555555555555555555555555555555555
55555555553555555555555555555555555955555555555666655555555555555555566665555555595555555555555555555555555555555555555555555555
555555555555555555555555555555555559555555555556666665aaaaaaa5555555556666555555595555555555555555555555555555555555555555555555
55555555555555555555555555555555555955555555556666555555555555555555666666555555595555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555555855555555555555666655555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555555284455555555555555555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555555242245555555555555555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555552545244555665555555555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555552442224556866555555555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555552244445556666555555555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555525244445555666655555555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555555665544445566666656655555555559555555555555555555555555555555555555555555555
55555555555555555555555555555555559555555555555555556686555555555566668665555555559555555555555555555355555555555555555555555555
55555555555555555555555555555555555955555555555555556666555555555555566665555555595555555555555555553555555555555555555555555555
55555555555555555555555555555555555955555555555555566665555555555555556666555555595555555555555553553555555555555555555555555555
55555555555555555555555555555555555955555555566555666666655555555555666666555555595555555555555555355555555555555555555555555555
55555555555555555555555555555555555955555555668656686655555555555555555666655555595555555555555555355555555555555555555555555555
55555555555555555555555555555555555595555555666656666555555555555555555555555555955555555555555555555555555555555555555555555555
55555555555555555555555555555555555595555556666666665555555555555555555555555555955555555555555555555555555555555555555555555555
55555555555555555555555555555555555559555556666666666655555555555555555555555559555555555555555555555555555555555555555555555555
55555555555555555555555555555555555559555566666666655555555555555555555555555559555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555955566665555555555555555555555555555555595555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555595555555555555555555555555555555555555955555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555595555555555555555555555555555555555555955555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555559555555555555556655555555555555555559555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555955555555555566865555555555555555595555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555595555555555566665555555555555555955555555555555555555555555555555555665555555555555555
55555555555555555555555555555555555555555559955555555666655ddd555555555599555555555555555555555555555555555556866555555555555555
55555555555555555555555555555555555555555555595555555666666666d55555555955555555555553555555555555555555555556666555555555555555
555555555555555555555555555555555555555555555599555566665566666d5555599555555555555535555555555555555555555555666655555555555555
555555555555555555555555555555555555555555555555995555555564446d5559955555555555535535555555555555555555555566666655555555555555
55555555555555555555555555555555555555555555555555999955556666699995555555555555553555555555555555555555555555566665555555555555
555555555555555555555555555555555555555555555555555555999999999d5555555555555555553555555555555555555555555555555555555555555555
555555555555555555555555555555555555555555555555555555555566666d5555555555555555555555555555555555555555566555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555686655555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555666655555555555555555555
55555555555555555555535555555555555555555555555555555555555555555555555555555555555555555555555555555555566665555555555555555555
55555555555555555555355555555555555555555555555555555555555555555555555555555555555555555555555555555556666665555555555555555555
55555555555555555355355555555555555555555555555555555555555555555555555555555555555555555555555555555555556666555555555555555555
55555555555555555535555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555535555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55556655555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55566865555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555553555555555555555555
55566665555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555535555555555555555555
55666655555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555535535555555555555555555
55666666555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555553555555555555555555555
56666555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555553555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5555555555555555555555555555555555555555555ddd5555555555555555555555555555555555555555555555555555555555555555555555555555555555
5555555555555555555555555555555555555555555666d555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555566666d55555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555564446d55555555555565555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555566666d55555555555646555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555564446d55555555553565555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555566666d55555555553555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555556655555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555568665555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566665555555555555

__map__
4040404040404040404042434343424000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040424242404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404041404040404240404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040414040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404043404041404040434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4043404040404040404040404042404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4042404040404041404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404240404040404140404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404043404041404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040414040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404041404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040434042404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000400000b2500d2000e2001e10000000000000000000000000000000000000000000000000000000000620000000000000000000000000000000000000000000000000000000000000000000000000000000000
000300003b6503b65039650396503865035650306502a650236501c650146500a6500265000600006000460003600026000060000600000000000000000000000000000000000000000000000000000000000000
0005000003650096500f6501565000000000000000000000000000000000000000000000000000000002b60000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000003104036040360000000034000000000000000000000002200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1c16131e2d7502d7502d75029750277502376025760247601b7601c7601f7601c7601475017750117500b75008750067500475001750007002d7002d7002d7002d7002d7002d7002d7002d7002d7002d7002d700
__music__
00 20424344

