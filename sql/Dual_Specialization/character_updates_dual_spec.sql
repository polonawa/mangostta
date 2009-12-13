DROP TABLE `character_glyphs`;
CREATE TABLE `character_glyphs` (
  `guid` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `glyph1` int(11) unsigned NOT NULL DEFAULT '0',
  `glyph2` int(11) unsigned DEFAULT '0',
  `glyph3` int(11) unsigned DEFAULT '0',
  `glyph4` int(11) unsigned DEFAULT '0',
  `glyph5` int(11) unsigned DEFAULT '0',
  `glyph6` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `character_glyphs`
SELECT `guid`, 0,
(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1288),  ' ', -1) AS UNSIGNED)) AS `glyph1`,
(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1289),  ' ', -1) AS UNSIGNED)) AS `glyph2`,
(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1290),  ' ', -1) AS UNSIGNED)) AS `glyph3`,
(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1291),  ' ', -1) AS UNSIGNED)) AS `glyph4`,
(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1292),  ' ', -1) AS UNSIGNED)) AS `glyph5`,
(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1293),  ' ', -1) AS UNSIGNED)) AS `glyph6`
FROM `characters`;

DROP TABLE `character_talent`;
CREATE TABLE `character_talent` (
  `guid` int(11) unsigned NOT NULL,
  `spell` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `character_spell` WHERE `spell` IN (724,974,1329,5570,5923,5924,5925,5926,5952,9452,9453,9799,10060,11069,11070,11071,11078,11080,11083,11094,11095,11100,11103,11108,11113,11115,11119,11120,11124,11129,11151,11160,11170,11175,11180,11185,11189,11190,11207,11210,11213,11222,11232,11237,11242,11247,11252,11255,11366,11367,11368,11426,11958,12042,12043,12163,12281,12282,12284,12285,12286,12287,12289,12290,12292,12294,12295,12296,12297,12298,12299,12300,12301,12308,12311,12312,12313,12317,12318,12319,12320,12321,12322,12323,12324,12328,12329,12330,12338,12339,12340,12341,12349,12350,12351,12353,12357,12358,12378,12398,12399,12400,12463,12464,12467,12469,12472,12473,12487,12488,12489,12490,12496,12497,12500,12501,12502,12503,12518,12519,12569,12571,12574,12575,12576,12577,12592,12598,12605,12606,12658,12663,12664,12665,12666,12668,12672,12676,12677,12697,12700,12701,12702,12703,12704,12711,12712,12724,12725,12726,12727,12750,12751,12752,12753,12761,12762,12763,12764,12781,12783,12784,12785,12797,12799,12803,12804,12809,12810,12811,12812,12813,12814,12815,12818,12834,12835,12839,12840,12846,12847,12848,12849,12852,12853,12855,12856,12857,12858,12860,12861,12862,12867,12872,12873,12876,12877,12878,12879,12950,12952,12953,12958,12959,12960,12963,12971,12972,12973,12974,12975,12982,12983,12999,13000,13001,13002,13043,13045,13046,13047,13048,13705,13706,13709,13712,13713,13715,13732,13733,13741,13742,13743,13750,13754,13788,13789,13792,13793,13800,13801,13802,13803,13804,13805,13806,13807,13832,13843,13844,13845,13848,13849,13851,13852,13853,13854,13863,13865,13866,13867,13872,13875,13877,13958,13960,13961,13962,13963,13964,13970,13971,13975,13976,13979,13980,13981,13983,14057,14062,14063,14066,14070,14071,14072,14076,14079,14080,14082,14083,14094,14113,14114,14115,14116,14117,14128,14132,14135,14136,14137,14138,14139,14140,14141,14142,14144,14148,14156,14158,14159,14160,14161,14162,14163,14164,14165,14166,14168,14169,14171,14172,14173,14174,14175,14176,14177,14179,14183,14185,14186,14190,14193,14194,14195,14251,14278,14520,14521,14522,14523,14531,14747,14748,14749,14750,14751,14767,14768,14769,14770,14771,14772,14774,14776,14777,14780,14781,14784,14785,14788,14789,14790,14791,14889,14892,14898,14901,14908,14909,14910,14911,14912,14913,14983,15008,15009,15010,15011,15012,15013,15014,15017,15018,15020,15028,15029,15030,15031,15047,15058,15059,15060,15257,15259,15260,15270,15272,15273,15274,15275,15286,15307,15308,15309,15310,15311,15312,15313,15314,15316,15317,15318,15320,15327,15328,15331,15332,15335,15336,15337,15338,15349,15354,15355,15356,15362,15363,15392,15407,15448,15473,15487,16035,16038,16039,16040,16041,16043,16086,16089,16105,16106,16107,16108,16109,16110,16111,16112,16113,16114,16115,16116,16130,16160,16161,16164,16166,16173,16176,16178,16179,16180,16181,16182,16184,16187,16188,16190,16194,16196,16198,16205,16206,16209,16210,16211,16212,16213,16214,16215,16216,16217,16218,16219,16220,16221,16222,16223,16224,16225,16226,16227,16228,16229,16230,16232,16235,16240,16252,16254,16255,16256,16258,16259,16261,16262,16266,16268,16271,16272,16281,16282,16283,16284,16287,16290,16293,16295,16302,16303,16304,16305,16306,16307,16308,16309,16462,16463,16464,16465,16466,16487,16489,16492,16493,16494,16511,16513,16514,16515,16538,16539,16540,16541,16542,16544,16578,16579,16580,16581,16582,16757,16758,16763,16765,16766,16769,16770,16814,16815,16816,16817,16818,16819,16820,16821,16822,16833,16834,16835,16836,16839,16840,16845,16846,16847,16850,16858,16859,16860,16861,16862,16864,16880,16896,16897,16899,16909,16910,16911,16912,16913,16923,16924,16929,16930,16931,16934,16935,16936,16937,16938,16940,16941,16942,16943,16944,16947,16948,16949,16966,16968,16972,16974,16975,16998,16999,17002,17003,17004,17005,17006,17007,17050,17051,17056,17058,17059,17060,17061,17063,17065,17066,17069,17070,17071,17072,17073,17074,17075,17076,17077,17078,17104,17106,17107,17108,17111,17112,17113,17116,17118,17119,17120,17123,17124,17191,17322,17323,17364,17485,17486,17487,17488,17489,17778,17779,17780,17783,17784,17785,17788,17789,17790,17791,17792,17793,17796,17801,17802,17803,17804,17805,17810,17811,17812,17813,17814,17815,17833,17834,17877,17917,17918,17927,17929,17930,17954,17955,17956,17957,17958,17959,17962,18073,18094,18095,18096,18119,18120,18126,18127,18130,18135,18136,18174,18175,18176,18179,18180,18182,18183,18213,18218,18219,18220,18223,18271,18272,18273,18274,18275,18288,18372,18427,18428,18429,18459,18460,18462,18463,18464,18530,18531,18533,18534,18535,18551,18552,18553,18554,18555,18562,18692,18693,18694,18695,18696,18697,18698,18699,18703,18704,18705,18706,18707,18708,18709,18710,18731,18743,18744,18754,18755,18756,18767,18768,18769,18770,18771,18772,18773,18827,18829,19028,19159,19160,19168,19180,19181,19184,19236,19255,19256,19257,19258,19259,19286,19287,19290,19294,19295,19297,19298,19306,19370,19371,19373,19376,19386,19387,19388,19407,19412,19416,19417,19418,19419,19420,19421,19422,19423,19426,19427,19429,19430,19431,19434,19454,19455,19456,19461,19462,19464,19465,19466,19485,19487,19488,19489,19490,19498,19499,19500,19503,19506,19507,19508,19509,19549,19550,19551,19552,19553,19554,19555,19556,19559,19560,19572,19573,19574,19575,19577,19578,19583,19584,19585,19586,19587,19590,19592,19598,19599,19600,19601,19602,19609,19610,19612,19616,19617,19618,19619,19620,19621,19622,19623,19624,19625,20042,20045,20049,20056,20057,20060,20061,20062,20063,20064,20066,20096,20097,20098,20099,20100,20101,20102,20103,20104,20105,20111,20112,20113,20117,20118,20119,20120,20121,20127,20130,20135,20138,20139,20140,20143,20144,20145,20146,20147,20174,20175,20177,20179,20180,20181,20182,20196,20197,20198,20205,20206,20207,20208,20209,20210,20212,20213,20214,20215,20216,20224,20225,20234,20235,20237,20238,20239,20243,20244,20245,20254,20255,20256,20257,20258,20259,20260,20261,20262,20263,20264,20265,20266,20330,20331,20332,20335,20336,20337,20359,20360,20361,20375,20468,20469,20470,20473,20487,20488,20496,20500,20501,20502,20503,20504,20505,20711,20895,20911,20925,23584,23585,23586,23587,23588,23695,23785,23822,23823,23824,23825,23881,23989,24283,24296,24297,24443,24691,24858,24866,24894,24943,24944,24945,24946,24968,24969,24970,24971,24972,25829,25836,25956,25957,25988,26016,26022,26023,27789,27790,27811,27815,27816,27839,27840,27900,27901,27902,27903,27904,28332,28574,28592,28593,28996,28997,28998,28999,29000,29062,29064,29065,29074,29075,29076,29079,29080,29082,29084,29086,29140,29143,29144,29179,29180,29187,29189,29191,29192,29193,29202,29205,29206,29438,29439,29440,29441,29444,29447,29590,29591,29592,29593,29594,29598,29599,29623,29721,29723,29724,29725,29759,29760,29761,29762,29763,29776,29787,29790,29792,29801,29834,29836,29838,29859,29888,29889,30054,30057,30060,30061,30062,30063,30064,30108,30143,30144,30145,30146,30160,30242,30245,30246,30247,30248,30283,30288,30289,30290,30291,30292,30293,30295,30296,30299,30301,30302,30319,30320,30321,30326,30664,30665,30666,30672,30673,30674,30675,30678,30679,30706,30798,30802,30808,30809,30812,30813,30814,30816,30818,30819,30823,30864,30865,30866,30867,30868,30869,30872,30873,30881,30883,30884,30885,30886,30892,30893,30894,30895,30902,30903,30904,30905,30906,30919,30920,31122,31123,31124,31126,31130,31131,31208,31209,31211,31212,31213,31216,31217,31218,31219,31220,31221,31222,31223,31226,31227,31228,31229,31230,31244,31245,31380,31382,31383,31569,31570,31571,31572,31574,31575,31579,31582,31583,31584,31585,31586,31587,31588,31589,31638,31639,31640,31641,31642,31656,31657,31658,31661,31667,31668,31669,31670,31672,31674,31675,31676,31677,31678,31679,31680,31682,31683,31687,31785,31821,31822,31823,31825,31826,31828,31829,31830,31833,31835,31836,31837,31838,31839,31840,31841,31842,31844,31845,31848,31849,31850,31851,31852,31858,31859,31860,31866,31867,31868,31869,31871,31872,31876,31877,31878,31879,31880,31881,31935,32043,32381,32382,32383,32385,32387,32392,32393,32394,32477,32483,32484,32601,33142,33145,33146,33150,33154,33158,33159,33160,33161,33162,33167,33171,33172,33186,33190,33191,33192,33193,33201,33202,33206,33213,33214,33215,33221,33222,33223,33224,33225,33371,33589,33590,33591,33592,33596,33597,33599,33600,33601,33602,33603,33604,33605,33606,33607,33776,33831,33851,33852,33853,33855,33856,33859,33866,33867,33872,33873,33879,33880,33881,33882,33883,33886,33887,33888,33889,33890,33917,33956,33957,34151,34152,34153,34293,34295,34296,34297,34300,34453,34454,34455,34459,34460,34462,34464,34465,34466,34467,34468,34469,34470,34475,34476,34482,34483,34484,34485,34486,34487,34488,34489,34490,34491,34492,34493,34494,34496,34497,34498,34499,34500,34502,34503,34506,34507,34508,34692,34753,34838,34839,34859,34860,34861,34908,34909,34910,34914,34935,34938,34939,34948,34949,34950,34954,35029,35030,35100,35102,35104,35110,35111,35363,35364,35395,35396,35397,35446,35448,35449,35541,35550,35551,35552,35553,35578,35581,35691,35692,35693,36554,37116,37117,43338,44378,44379,44394,44395,44396,44397,44398,44399,44400,44402,44403,44404,44425,44442,44443,44445,44446,44448,44449,44457,44469,44470,44471,44472,44543,44545,44546,44548,44549,44557,44560,44561,44566,44567,44568,44570,44571,44572,44745,45234,45243,45244,46854,46855,46859,46860,46865,46866,46867,46908,46909,46910,46911,46913,46914,46915,46917,46924,46945,46949,46951,46952,46953,46968,47193,47195,47196,47197,47198,47199,47200,47201,47202,47203,47204,47205,47220,47221,47223,47230,47231,47236,47237,47238,47239,47240,47245,47246,47247,47258,47259,47260,47266,47267,47268,47269,47270,47294,47295,47296,47507,47508,47509,47511,47515,47516,47517,47535,47536,47537,47540,47558,47559,47560,47562,47564,47565,47566,47567,47569,47570,47573,47577,47578,47580,47581,47582,47585,47586,47587,47588,47788,48181,48384,48389,48392,48393,48395,48396,48409,48410,48411,48412,48432,48433,48434,48438,48483,48484,48485,48488,48489,48491,48492,48494,48495,48496,48499,48500,48505,48506,48510,48511,48514,48516,48521,48525,48532,48535,48536,48537,48539,48544,48545,48962,48963,48965,48977,48978,48979,48982,48985,48987,48988,48997,49004,49005,49006,49013,49015,49016,49018,49023,49024,49027,49028,49032,49036,49039,49042,49137,49140,49143,49145,49146,49149,49158,49175,49182,49184,49186,49188,49189,49194,49200,49202,49203,49206,49208,49217,49219,49220,49222,49223,49224,49226,49377,49390,49391,49392,49393,49394,49395,49455,49467,49471,49477,49478,49479,49480,49483,49488,49489,49490,49491,49495,49497,49500,49501,49503,49504,49508,49509,49526,49529,49530,49533,49534,49538,49542,49543,49562,49564,49565,49567,49568,49571,49572,49588,49589,49599,49610,49611,49627,49628,49631,49632,49633,49635,49636,49638,49654,49655,49657,49661,49662,49663,49664,49786,49787,49788,49789,49790,49791,49796,50029,50031,50033,50034,50040,50041,50043,50115,50117,50118,50119,50120,50121,50127,50128,50129,50130,50137,50138,50147,50149,50150,50151,50152,50154,50187,50190,50191,50334,50365,50371,50384,50385,50391,50392,50516,50685,50686,50687,50720,50796,50880,50884,50885,50886,50887,51052,51099,51108,51109,51123,51127,51128,51129,51130,51160,51161,51166,51167,51179,51180,51181,51182,51183,51267,51268,51269,51271,51456,51459,51462,51463,51464,51465,51466,51468,51470,51472,51473,51474,51478,51479,51480,51481,51482,51483,51485,51486,51490,51521,51522,51523,51524,51525,51526,51527,51528,51529,51530,51531,51532,51533,51554,51555,51556,51557,51558,51560,51561,51562,51563,51564,51565,51566,51625,51626,51627,51628,51629,51632,51633,51634,51635,51636,51662,51664,51665,51667,51668,51669,51672,51674,51679,51682,51685,51686,51687,51688,51689,51690,51692,51696,51698,51700,51701,51708,51709,51710,51711,51712,51713,51745,51746,51881,51883,51884,51885,51886,52143,52456,52783,52785,52786,52787,52788,52795,52797,52798,52799,52800,52802,52803,53137,53138,53209,53215,53216,53217,53221,53222,53224,53228,53232,53234,53237,53238,53241,53243,53244,53245,53246,53252,53253,53256,53259,53260,53262,53263,53264,53265,53270,53290,53291,53292,53295,53296,53297,53298,53299,53301,53302,53303,53304,53375,53376,53379,53380,53381,53382,53385,53484,53486,53488,53501,53502,53503,53519,53527,53530,53551,53552,53553,53556,53557,53563,53569,53576,53583,53585,53590,53591,53592,53595,53620,53621,53622,53648,53660,53661,53671,53673,53695,53696,53709,53710,53711,53754,53759,54037,54038,54117,54118,54151,54154,54155,54347,54348,54349,54354,54486,54488,54489,54490,54637,54638,54639,54646,54658,54659,54734,54747,54749,54787,55050,55061,55062,55090,55091,55092,55094,55107,55108,55129,55130,55131,55132,55133,55136,55198,55225,55226,55233,55236,55237,55339,55340,55610,55620,55623,55666,55667,56314,56315,56316,56317,56318,56333,56336,56337,56339,56340,56341,56342,56343,56344,56611,56612,56613,56614,56636,56637,56638,56822,56834,56835,56924,56927,56929,56930,56931,56932,57470,57472,57499,57810,57811,57812,57813,57814,57849,57850,57851,57865,57873,57876,57877,57878,57880,57881,58410,58413,58414,58415,58422,58423,58424,58425,58426,58435,58872,58874,59057,59088,59089,59672,59738,59739,59740,59741,60103,60184,60185,60187,60188,60970,61154,61155,61156,61157,61158,61216,61221,61222,61295,61329,61330,61331,61336,61345,61346,62097,62098,62099,62100,62101,62905,62908,63108,63117,63121,63123,63156,63158,63245,63349,63350,63351,63370,63372,63373,63374,63410,63411,63457,63458,63503,63504,63505,63506,63534,63542,63543,63560,63574,63625,63626,63627,63646,63647,63648,63649,63650,63730,63733,63737,64044,64127,64129,64205,64353,64357,64976,65139,65661,66191,66192,66799,66814,66815,66816,66817);

DELETE FROM `character_spell` WHERE `spell` IN (12505,12522,12523,12524,12525,12526,13018,13019,13020,13021,13031,13032,13033,16979,17311,17312,17313,17314,17347,17348,18807,18809,18867,18868,18869,18870,18871,18937,18938,19238,19240,19241,19242,19243,20900,20901,20902,20903,20904,20909,20910,21551,21552,21553,24132,24133,24974,24975,24976,24977,25248,25387,25437,26864,27013,27065,27067,27068,27132,27133,27134,27263,27265,27870,27871,28275,30016,30022,30330,30404,30405,30413,30414,30546,32593,32594,33041,33042,33043,33405,33876,33878,33933,33938,33982,33983,33986,33987,34411,34412,34413,34863,34864,34865,34866,34916,34917,42890,42891,42944,42945,42949,42950,43038,43039,44780,44781,47485,47486,47497,47498,47826,47827,47841,47843,47846,47847,48086,48087,48088,48089,48155,48156,48159,48160,48172,48173,48468,48563,48564,48565,48566,48660,48663,48666,48998,48999,49011,49012,49049,49050,49283,49284,49376,53005,53006,53007,53199,53200,53201,53223,53225,53226,53227,53248,53249,53251,55359,55360,57720,57721,57722,59092,59156,59158,59159,59161,59163,59164,59170,59171,59172,60051,60052,60053,61299,61300,61301,61384);

DELETE FROM `character_spell` WHERE `spell` IN (3674,5420,9800,19263,20927,20928,20929,20930,24905,27174,27179,31904,32699,32700,33072,33891,34123,48359,48824,48825,48826,48827,48951,48952,50170,50171,50172,50306,50536,51373,51374,51375,51376,51378,51379,52881,53640,55265,55270,55271,57019,57224,62795,63668,63669,63670,63671,63672,64299,65139);

ALTER TABLE `characters` ADD `speccount` tinyint(3) unsigned NOT NULL default 1 AFTER `arena_pending_points`;
ALTER TABLE `characters` ADD `activespec` tinyint(3) unsigned NOT NULL default 0 AFTER `speccount`;

DROP TABLE `character_action`;
CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL default '0',
  `spec` tinyint(3) unsigned NOT NULL default '0',
  `button` tinyint(3) unsigned NOT NULL default '0',
  `action` int(11) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO `character_action` (`guid`,`button`,`action`,`type`) SELECT `guid`,`button`,`action`,`type` FROM `character_action_old`;
DROP TABLE `character_action_old`;
