/* IMLAI CORRECTIONS */

update Quran set imlai = Replace(imlai,'اً','ًا') where imlai like "%اً%";
/* 3058 ocuurences */

update Quran set imlai = Replace(imlai,'آَ','آ') where imlai like "%آَ%";
/* 1511 ocuurences */

update Quran set imlai = Replace(imlai,'ىً','ًى') where imlai like "%ىً%";
/* 93 ocuurences */

update Quran set imlai = Replace(imlai,'أَئِذَا','أَإِذَا') where imlai like "%أَئِذَا%" and id not in (5026);
/* 12 ocuurences */

update Quran set imlai = Replace(imlai,'أَمْ مَنْ','أَمَّنْ') where id in (1395, 1399, 3219, 3220, 3221, 3222, 3223, 3226, 4067, 5061, 5062, 5063);
/* 12 ocuurences */

update Quran set imlai = Replace(imlai,'أَئِنَّا','أَإِنَّا') where id in (1712, 2078, 2127, 2316, 2755, 3513, 3804, 3841, 5026, 5722);
/* 11 ocuurences */

update Quran set imlai = Replace(imlai,'سَّمَوَات','سَّمَاوَات') where id in (426, 1580, 1581, 1798, 2073, 2340, 2744, 4277);
/* 8 ocuurences */

update Quran set imlai = Replace(imlai,'نِعْمَةَ','نِعْمَتَ') where id in (238, 396, 680, 1778, 1784, 1984, 2015, 3663);
/* 8 ocuurences */

update Quran set imlai = Replace(imlai,'سَمَوَات','سَمَاوَات') where id in (36, 4230, 5229, 5244, 5434);
/* 5 ocuurences */

update Quran set imlai = Replace(imlai,'كَلِمَةُ','كَلِمَتُ') where id in (904, 1091, 1397, 1460, 4139);
/* 6 ocuurences */

update Quran set imlai = Replace(imlai,'أَئِلَهٌ','أَإِلَهٌ') where id in (3219, 3220, 3221, 3222, 3223);
/* 5 ocuurences */

update Quran set imlai = Replace(imlai,'امْرَأَةُ','امْرَأَتُ') where id in (328, 1626, 1647, 3261);
/* 4 ocuurences */

update Quran set imlai = Replace(imlai,'رَحْمَةَ','رَحْمَتَ') where id in (225, 1010, 4357);
/* 3 ocuurences */

update Quran set imlai = Replace(imlai,'أَمَّنْ','أَمْ مَنْ') where id in (602, 1344, 4258);
/* 3 ocuurences */

/*update Quran set imlai = Replace(imlai,'أَيُّهَ','أَيُّهَا') where id in (1808, 5113, 5230);*/
/* 3 ocuurences */

update Quran set imlai = Replace(imlai,'أَمْ مَنْ','أَمَّنْ') where id in (5261, 5262, 5263);
/* 3 ocuurences */

update Quran set imlai = Replace(imlai,'مِئَةَ','مِائَةَ') where id in (266, 2793);
/* 2 ocuurences aya 266 and 2793*/

update Quran set imlai = Replace(imlai,'مَرْضَاةِ','مَرْضَاتِ') where id in (272, 607);
/* 2 ocuurences aya 272 and 607*/

update Quran set imlai = Replace(imlai,'لَعْنَةَ','لَعْنَتَ') where id in (354, 2798);
/* 2 ocuurences aya 354 and 2798*/

update Quran set imlai = Replace(imlai,'يَشَأِ','يَشَإِ') where id in (828, 4296);
/* 2 ocuurences aya 828 and 4296*/

update Quran set imlai = Replace(imlai,'مِئَةٌ','مِائَةٌ') where id in(1225, 1226);
/* 2 ocuurence aya 1225 and 1226 */

update Quran set imlai = Replace(imlai,'وَيْلَتَا','وَيْلَتَى') where id in(1545, 2883);
/* 2 ocuurence aya 1545 and 2883 */

update Quran set imlai = Replace(imlai,'رَحْمَةُ','رَحْمَتُ') where id in(1546, 2812);
/* 2 ocuurence aya 1546 and 2812 */

update Quran set imlai = Replace(imlai,'غَيَابَةِ','غَيَابَتِ') where id in (1606, 1611);
/* 2 ocuurences aya 1606 and 1611 */

update Quran set imlai = Replace(imlai,'أَئِنَّكَ','أَإِنَّكَ') where id in (1686, 3840);
/* 2 ocuurences aya 1606 and 3840 */

update Quran set imlai = Replace(imlai,'نَدْعُوا','نَدْعُو') where id in (1987, 2100);
/* 2 ocuurences aya 1987 and 2100 */

update Quran set imlai = Replace(imlai,'رَحْمَةِ','رَحْمَتِ') where id in (2252, 3459);
/* 2 ocuurences  aya 2252 and 3459 */

update Quran set imlai = Replace(imlai,'الْعُلَا','الْعُلَى') where id in (2352, 2423);
/* 2 ocuurences  aya 2352 and 2423 */

update Quran set imlai = Replace(imlai,'بِنِعْمَةِ','بِنِعْمَتِ') where id in (3500, 4764);
/* 2 ocuurences  aya 2352 and 4764 */

update Quran set imlai = Replace(imlai,'سُنَّةَ','سُنَّتَ') where id in (3703, 4218);
/* 2 ocuurences  aya 3703 and 4218 */

/* update Quran set imlai = Replace(imlai,'أَيُّهَا','أَيُّهَ') where id in (5113, 5230);*/
/* 2 ocuurences 5113 and 5230 */

update Quran set imlai = Replace(imlai,'مَرْضَاةِ','مَرْضَاتِ') where id = 214;
/* 1 ocuurence aya 214 */

update Quran set imlai = Replace(imlai,'مِئَةُ','مِائَةُ') where id = 268;
/* 1 ocuurence aya 268 */

update Quran set imlai = Replace(imlai,'بِأَفْواهِهِمْ','بِأَفْوَاهِهِمْ') where id = 460;
/* 1 ocuurence aya 460 ( fatha missing on waw ) */

update Quran set imlai = Replace(imlai,'يُدْرِكُكُمُ','يُدْرِكْكُمُ') where id = 571;
/* 1 ocuurence aya 571 */

update Quran set imlai = Replace(imlai,'سَوْأَةَ','سَوْءَةَ') where id = 700;
/* 2 ocuurence aya 700 */

update Quran set imlai = Replace(imlai,'اقْتَدِهِ','اقْتَدِهْ') where id = 879;
/* 1 ocuurence aya 879 */

update Quran set imlai = Replace(imlai,'يَهدِيَهُ','يَهْدِيَهُ') where id = 914;
/* 1 ocuurence aya 914 ( soukoun missing on ha ) */

update Quran set imlai = Replace(imlai,'فَإِنْ لَمْ يَسْتَجِيبُوا لَكُمْ فَاعْلَمُوا','فَإِلَّمْ يَسْتَجِيبُوا لَكُمْ فَاعْلَمُوا') where id = 1487;
/* 1 ocuurence aya 1487 */

update Quran set imlai = Replace(imlai,'بَقِيَّةُ','بَقِيَّتُ') where id = 1559;
/* 1 ocuurence aya 1559 */

update Quran set imlai = Replace(imlai,'وَلَيَكُونَنْ','وَلَيَكُونًا') where id = 1628;
/* 1 ocuurence aya 32 Yussuf (1628) ( I took the moshaf version ) */

update Quran set imlai = Replace(imlai,'اسْتَيْئَسُوا','اسْتَيْأَسُوا') where id = 1676;
/* 1 ocuurence aya 1676 */

update Quran set imlai = Replace(imlai,'يَيْئَسُ','يَيْأَسُ') where id = 1683;
/* 1 ocuurence aya 1683 */

update Quran set imlai = Replace(imlai,'تَيْئَسُوا','تَيْأَسُوا') where id = 1683;
/* 1 ocuurence aya 1683 */

update Quran set imlai = Replace(imlai,'اسْتَيْئَسَ','اسْتَيْأَسَ') where id = 1706;
/* 1 ocuurence aya 1706 */

update Quran set imlai = Replace(imlai,'يَيْئَسِ','يَيْأَسِ') where id = 1738;
/* 1 ocuurence aya 1738 */

update Quran set imlai = Replace(imlai,'يَمْحُوا','يَمْحُو') where id = 1746;
/* 1 ocuurence aya 1746 */

update Quran set imlai = Replace(imlai,'وَبِنِعْمَةِ','وَبِنِعْمَتِ') where id = 1973;
/* 1 ocuurence aya 1973 */

update Quran set imlai = Replace(imlai,'أَبْكَم','أَبْكَمُ') where id = 1977;
/* 1 ocuurence aya 1977 */

update Quran set imlai = Replace(imlai,'ثَلَاثَ مِئَةٍ','ثَلَاثَ مِائَةٍ') where id = 1977;
/* 1 ocuurence aya 1977 */

update Quran set imlai = Replace(imlai,'سُنَّةُ','سُنَّتُ') where id = 1198;
/* 1 ocuurence aya 1978 */

update Quran set imlai = Replace(imlai,'لِيَقْطَعْ','لْيَقْطَعْ') where id = 2610;
/* 1 ocuurence aya 2610 */

update Quran set imlai = Replace(imlai,'مِرفَقًا','مِرْفَقًا') where id = 2156;
/* 1 ocuurence aya 2156 */

update Quran set imlai = Replace(imlai,'مِئَةٍ','مِائَةٍ') where id = 2165;
/* 1 ocuurence aya 2165 */

update Quran set imlai = Replace(imlai,'وَأَسْمِع','وَأَسْمِعْ') where id = 2166;
/* 1 ocuurence aya 2166 */

update Quran set imlai = 'وَجَعَلَنِي مُبَارَكًا أَيْنَ مَا كُنْتُ وَأَوْصَانِي بِالصَّلَاةِ وَالزَّكَاةِ مَا دُمْتُ حَيًّا' where id = 2281;
/* 1 occurence the whole aya 2281 is wrong */

update Quran set imlai = Replace(imlai,'يَا ابْنَ أُمَّ','يَبْنَؤُمَّ') where id = 2442;
/* 1 ocuurence aya 2442 */

update Quran set imlai = Replace(imlai,'يَعِظُكُمَ','يَعِظُكُمُ') where id = 2808;
/* 1 ocuurence aya 2808 */

update Quran set imlai = Replace(imlai,'جَمِيعًا أَيُّهَا الْمُؤْمِنُونَ','جَمِيعًا أَيُّهَ الْمُؤْمِنُونَ') where id = 2822;
/* 1 ocuurence aya 2822 */

update Quran set imlai = Replace(imlai,'زَكَا','زَكَى') where id = 2812;
/* 1 ocuurence aya 2812 */

update Quran set imlai = Replace(imlai,'يُكْرِهُّنَّ','يُكْرِهْهُنَّ') where id = 2824;
/* 1 ocuurence aya 2824 */

update Quran set imlai = Replace(imlai,'أَحَطتُ','أَحَطْتُ') where id = 3181;
/* 1 ocuurence aya 3181 */

update Quran set imlai = Replace(imlai,'فَأَلْقِهِ','فَأَلْقِهْ') where id = 3187;
/* 1 ocuurence aya 3187 */

update Quran set imlai = Replace(imlai,'عِفْريتٌ','عِفْرِيتٌ') where id = 3198;
/* 1 ocuurence aya 3198 */

/* Replace(imlai,'بِهَادِ','بِهَادِي'); */
update Quran set imlai = 'وَمَا أَنْتَ بِهَادِي الْعُمْيِ عَنْ ضَلَالَتِهِمْ إِنْ تُسْمِعُ إِلَّا مَنْ يُؤْمِنُ بِآيَاتِنَا فَهُمْ مُسْلِمُونَ' where id = 3240;
/* 1 ocuurence aya 3240 */

update Quran set imlai = Replace(imlai,'أَمْ مَاذَا','أَمَّاذَا') where id = 3243;
/* 1 ocuurence aya 3243 */

update Quran set imlai = Replace(imlai,'نَتْلُوا','نَتْلُو') where id = 3255;
/* 1 ocuurence aya 3255 */

update Quran set imlai = Replace(imlai,'فِطْرَةَ','فِطْرَتَ') where id = 3439;
/* 1 ocuurence aya 3439 */

update Quran set imlai = Replace(imlai,'قُرَّةُ','قُرَّتُ') where id = 3261;
/* 1 ocuurence aya 3461 */

update Quran set imlai = Replace(imlai,'بِهَادِي','بِهَادِ') where id = 3462;
/* 1 ocuurence aya 3462 */

update Quran set imlai = Replace(imlai,'امْرَأتَيْنِ','امْرَأَتَيْنِ') where id = 3275;
/* 1 ocuurence aya 3275 */

update Quran set imlai = Replace(imlai,'بَيِّنَةٍ','بَيِّنَتٍ') where id = 3700;
/* 1 ocuurence aya 3700 */

update Quran set imlai = Replace(imlai,'لِسُنَّةِ','لِسُنَّتِ') where id = 3703;
/* 2 ocuurence aya 3703 */

update Quran set imlai = Replace(imlai,'أحْصَيْنَاهُ','أَحْصَيْنَاهُ') where id = 3717;
/* 1 ocuurence aya 3717 */

update Quran set imlai = 'فَاسْتَفْتِهِمْ أَهُمْ أَشَدُّ خَلْقًا أَمْ مَنْ خَلَقْنَا إِنَّا خَلَقْنَاهُمْ مِنْ طِينٍ لَازِبٍ' where id = 3799;
/* 1 ocuurence aya 3799 */

update Quran set imlai = Replace(imlai,'لَتَارِكُوا','لَتَارِكُو') where id = 3824;
/* 1 ocuurence aya 3824 */

update Quran set imlai = Replace(imlai,'أَئِنَّكَ','أَإِنَّكَ') where id = 3840;
/* 1 ocuurence aya 3840 */

update Quran set imlai = Replace(imlai,'مِئَةِ','مِائَةِ') where id = 3935;
/* 1 ocuurence aya 3935 */

update Quran set imlai = Replace(imlai,'أَؤُنْزِلَ','أَأُنْزِلَ') where id = 3978;
/* 1 ocuurence aya 3978 */

update Quran set imlai = Replace(imlai,'صَالُوا','صَالُو') where id = 4029;
/* 1 ocuurence aya 4029 */

update Quran set imlai = Replace(imlai,'دِيَارِهِمْ هُوَ قَانِتٌ','أَمَّنْ هُوَ قَانِتٌ') where id = 4067;
/* 1 ocuurence aya 4067 */

update Quran set imlai = Replace(imlai,'وَالسَّماوَاتُ','وَالسَّمَاوَاتُ') where id = 4125;
/* 1 ocuurence aya 4125 */

update Quran set imlai = Replace(imlai,'اِئْتِيَا','ائْتِيَا') where id = 4229;
/* 1 ocuurence aya 4229 */

update Quran set imlai = Replace(imlai,'الَّذَيْنِ','اللَّذَيْنِ') where id = 4247;
/* 1 ocuurence aya 4247 */

update Quran set imlai = Replace(imlai,'مَلْجَأٍ','مَلْجَإٍ') where id = 4319;
/* 1 ocuurence aya 4319 */

/* Replace(imlai,'وَقَالُوا يَا أَيُّهَا','وَقَالُوا يَا أَيُّهَ') */
update Quran set imlai = 'وَقَالُوا يَا أَيُّهَ السَّاحِرُ ادْعُ لَنَا رَبَّكَ بِمَا عَهِدَ عِنْدَكَ إِنَّنَا لَمُهْتَدُونَ' where id = 4374;
/* 1 ocuurence aya 4347 */

update Quran set imlai = Replace(imlai,'وَرَحْمَةُ','وَرَحْمَتُ') where id = 4357;
/* 1 ocuurence aya 4357 */

update Quran set imlai = Replace(imlai,'كَاشِفُوا','كَاشِفُو') where id = 4429;
/* 1 ocuurence aya 4429 */

update Quran set imlai = Replace(imlai,'شَجَرَةَ','شَجَرَتَ') where id = 4457;
/* 1 ocuurence aya 4457 */

update Quran set imlai = Replace(imlai,'وَنَتَجاوَزُ','وَنَتَجَاوَزُ') where id = 4526;
/* 1 ocuurence aya 4526 */

update Quran set imlai = Replace(imlai,'الْمُسَيْطِرُونَ','الْمُصَيْطِرُونَ') where id = 4772;
/* 1 ocuurence aya 4772 */

update Quran set imlai = Replace(imlai,'أَؤُلْقِيَ','أَأُلْقِيَ') where id = 4871;
/* 1 ocuurence aya 4871 */

update Quran set imlai = Replace(imlai,'سَنَفْرُغُ لَكُمْ أَيُّهَا','سَنَفْرُغُ لَكُمْ أَيُّهَ') where id = 4932;
/* 1 ocuurence aya 4932 */

update Quran set imlai = Replace(imlai,'وَجَنَّةُ','وَجَنَّتُ') where id = 5068;
/* 1 ocuurence aya 5068 */

update Quran set imlai = Replace(imlai,'وَمَعْصِيَةِ','وَمَعْصِيَتِ') where id in (5112, 5113);
/* 2 ocuurence aya 5112 and 5113 */

update Quran set imlai = Replace(imlai,'مَرْضَاةَ','مَرْضَاتَ') where id = 5230;
/* 1 ocuurence aya 5230 */

update Quran set imlai = Replace(imlai,'اِمْرَأَةَ نُوحٍ وَامْرَأَةَ لُوطٍ','امْرَأَتَ نُوحٍ وَامْرَأَتَ لُوطٍ') where id = 5239;
/* 1 ocuurence aya 5239 */

update Quran set imlai = Replace(imlai,'بِأَيِّيكُمُ','بِأَيِّكُمُ') where id = 5277;
/* 1 ocuurence aya 5277 */

update Quran set imlai = Replace(imlai,'اِمْرَأَةَ فِرْعَوْنَ','امْرَأَتَ فِرْعَوْنَ') where id = 5240;
/* 1 ocuurence aya 5240 */

update Quran set imlai = 'يَا لَيْتَهَا كَانَتِ الْقَاضِيَةَ' where id = 5350;
/* 1 occurence the whole 5350 aya is wrong */

update Quran set imlai = Replace(imlai,'تَدْعُوا مَنْ أَدْبَرَ','تَدْعُو مَنْ أَدْبَرَ') where id = 5392;
/* 1 ocuurence aya 5392 */

update Quran set imlai = Replace(imlai,'نُعجِزَ','نُعْجِزَ') where id = 5459;
/* 1 ocuurence aya 5459 */

update Quran set imlai = Replace(imlai,'وَأَنْ لَوِ اسْتَقَامُوا','وَأَلَّوِ اسْتَقَامُوا') where id = 5463;
/* 1 ocuurence aya 5463 */

update Quran set imlai = Replace(imlai,'كَانَتْ قَوَارِيرَ','كَانَتْ قَوَارِيرَا') where id = 5606;
/* 1 ocuurence aya 5606 */

update Quran set imlai = Replace(imlai,'جِمَالَةٌ','جِمَالَتٌ') where id = 5655;
/* 1 ocuurence aya 5655 */

update Quran set imlai = 'أَحْيَاءً وَأَمْوَاتًا' where id = 5648;
/* 1 occurence the whole 5648 aya is wrong */

update Quran set imlai = Replace(imlai,'بِمُسَيْطِرٍ','بِمُصَيْطِرٍ') where id = 5989;
/* 1 ocuurence aya 5989 */

update Quran set imlai = Replace(imlai,'لَنَسْفَعَنْ','لَنَسْفَعًا') where id = 6121;
/* 1 ocuurence aya 6121 */
