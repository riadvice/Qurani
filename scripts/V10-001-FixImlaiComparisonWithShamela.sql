/* IMLAI CORRECTIONS */

update Quran set imlai = Replace(imlai,'آَ','آ');
/* 1511 ocuurences */

update Quran set imlai = Replace(imlai,'ىً','ًى');
/* 93 ocuurences */

update Quran set imlai = Replace(imlai,'اً','ًا');
/* 3058 ocuurences */

update Quran set imlai = Replace(imlai,'سَمَوَات',سَمَاوَات');
/* 5 ocuurences */

update Quran set imlai = Replace(imlai,'سَّمَوَات',سَّمَاوَات');
/* 8 ocuurences */

update Quran set imlai = Replace(imlai,'مِئَةَ','مِائَةَ');
/* 3 ocuurences */

update Quran set imlai = Replace(imlai,'مِئَةُ','مِائَةُ');
/* 1 ocuurence aya 268 */

update Quran set imlai = Replace(imlai,'مِئَةٌ','مِائَةٌ');
/* 2 ocuurence aya 1224 and 1225 */

update Quran set imlai = Replace(imlai,'مِئَةِ','مِائَةِ');
/* 1 ocuurence aya 3935 */

update Quran set imlai = Replace(imlai,'بِأَفْواهِهِمْ','بِأَفْوَاهِهِمْ');
/* 1 ocuurence aya 460 ( fatha missing on waw ) */

update Quran set imlai = Replace(imlai,'يَهدِيَهُ','يَهْدِيَهُ');
/* 1 ocuurence aya 460 ( soukoun missing on ha ) */

update Quran set imlai = Replace(imlai,'أَمْ مَنْ','أَمَّنْ') where id in ( 1395, 1399, 3219, 3220, 3221, 3222, 3223, 4067, 5061, 5062, 5063 ) ;
/* 1 ocuurence aya 460 ( soukoun missing on ha ) */

update Quran set imlai = Replace(imlai,'وَلَيَكُونَنْ','وَلَيَكُونًا');
/* 1 ocuurence aya 32 Yussuf ( I took the moshaf version ) */

update Quran set imlai = Replace(imlai,'فَإِنْ لَمْ يَسْتَجِيبُوا لَكُمْ فَاعْلَمُوا','فَإِلَّمْ يَسْتَجِيبُوا لَكُمْ فَاعْلَمُوا');
/* 1 ocuurence aya 1487 */

update Quran set imlai = Replace(imlai,'يَمْحُوا','يَمْحُو');
/* 1 ocuurence aya 1746 */

update Quran set imlai = Replace(imlai,'أَبْكَم','أَبْكَمُ');
/* 1 ocuurence aya 1977 */

update Quran set imlai = Replace(imlai,'نَدْعُوا','نَدْعُو');
/* 2 ocuurences aya 1987 and 2100 */

update Quran set imlai = Replace(imlai,'ثَلَاثَ مِئَةٍ','ثَلَاثَ مِائَةٍ');
/* 1 ocuurence aya 1977 */

update Quran set imlai = Replace(imlai,'مِرفَقًا','مِرْفَقًا');
/* 1 ocuurence aya 2156 */

update Quran set imlai = Replace(imlai,'وَأَسْمِع','وَأَسْمِعْ');
/* 1 ocuurence aya 2166 */

update Quran set imlai = 'وَجَعَلَنِي مُبَارَكًا أَيْنَ مَا كُنْتُ وَأَوْصَانِي بِالصَّلَاةِ وَالزَّكَاةِ مَا دُمْتُ حَيًّا' where id = 2281;
/* 1 occurence the whole aya is wrong */

/* Aya 2824 يُكْرِهُّنَّ do not change to يُكْرِهْهُنَّ */
/* update Quran set imlai = Replace(imlai,'يُكْرِهُّنَّ','يُكْرِهْهُنَّ'); */
/* 1 ocuurence aya 2824 */

update Quran set imlai = Replace(imlai,'يَا ابْنَ أُمَّ','يَبْنَؤُمَّ');
/* 1 ocuurence aya 2442 */

update Quran set imlai = Replace(imlai,'جَمِيعًا أَيُّهَا الْمُؤْمِنُونَ','جَمِيعًا أَيُّهَ الْمُؤْمِنُونَ');
/* 1 ocuurence aya 2822 */

update Quran set imlai = Replace(imlai,'أَحَطتُ','أَحَطْتُ');
/* 1 ocuurence aya 3181 */

update Quran set imlai = Replace(imlai,'عِفْريتٌ','عِفْرِيتٌ');
/* 1 ocuurence aya 3198 */

update Quran set imlai = Replace(imlai,'أَمْ مَاذَا','أَمَّاذَا');
/* 1 ocuurence aya 3243 */

update Quran set imlai = Replace(imlai,'نَتْلُوا','نَتْلُو');
/* 1 ocuurence aya 3255 */

update Quran set imlai = Replace(imlai,'بِهَادِي','بِهَادِ') where id = 3462;
/* 1 ocuurence aya 3462 */

update Quran set imlai = Replace(imlai,'امْرَأتَيْنِ','امْرَأَتَيْنِ');
/* 1 ocuurence aya 3275 */

update Quran set imlai = Replace(imlai,'أحْصَيْنَاهُ','أَحْصَيْنَاهُ');
/* 1 ocuurence aya 3717 */

update Quran set imlai = 'يَا لَيْتَهَا كَانَتِ الْقَاضِيَةَ' where id = 5350;
/* 1 occurence the whole aya is wrong */

update Quran set imlai = 'أَحْيَاءً وَأَمْوَاتًا' where id = 5648;
/* 1 occurence the whole aya is wrong */

update Quran set imlai = Replace(imlai,'نُعجِزَ','نُعْجِزَ');
/* 1 ocuurence aya 5459 */

update Quran set imlai = 'فَاسْتَفْتِهِمْ أَهُمْ أَشَدُّ خَلْقًا أَمْ مَنْ خَلَقْنَا إِنَّا خَلَقْنَاهُمْ مِنْ طِينٍ لَازِبٍ') where id = 3799;
/* 1 ocuurence aya 3799 */

update Quran set imlai = Replace(imlai,'لَتَارِكُوا','لَتَارِكُو');
/* 1 ocuurence aya 3824 */

update Quran set imlai = Replace(imlai,'صَالُوا','صَالُو');
/* 1 ocuurence aya 4029 */

update Quran set imlai = Replace(imlai,'دِيَارِهِمْ هُوَ قَانِتٌ','أَمَّنْ هُوَ قَانِتٌ') where id = 4067;
/* 1 ocuurence aya 4067 */

update Quran set imlai = Replace(imlai,'وَالسَّماوَاتُ','وَالسَّمَاوَاتُ');
/* 1 ocuurence aya 4125 */

update Quran set imlai = Replace(imlai,'اِئْتِيَا','ائْتِيَا');
/* 1 ocuurence aya 4229 */

/* Aya 4247 الَّذَيْنِ do not change to اللَّذَيْنِ */
/* update Quran set imlai = Replace(imlai,'الَّذَيْنِ','اللَّذَيْنِ'); */
/* 1 ocuurence aya 4247 */

update Quran set imlai = Replace(imlai,'وَقَالُوا يَا أَيُّهَا','وَقَالُوا يَا أَيُّهَ') where id = 4347;
/* 1 ocuurence aya 4347 */

update Quran set imlai = Replace(imlai,'كَاشِفُوا','كَاشِفُو');
/* 1 ocuurence aya 4429 */

update Quran set imlai = Replace(imlai,'وَنَتَجاوَزُ','وَنَتَجَاوَزُ');
/* 1 ocuurence aya 4526 */

update Quran set imlai = Replace(imlai,'سَنَفْرُغُ لَكُمْ أَيُّهَا','سَنَفْرُغُ لَكُمْ أَيُّهَ');
/* 1 ocuurence aya 4932 */

/* Aya 5239 اِمْرَأَةَ نُوحٍ وَامْرَأَةَ لُوطٍ do not change to امْرَأَتَ نُوحٍ وَامْرَأَتَ لُوطٍ */
/* update Quran set imlai = Replace(imlai,'اِمْرَأَةَ نُوحٍ وَامْرَأَةَ','امْرَأَتَ نُوحٍ وَامْرَأَتَ لُوطٍ'); */
update Quran set imlai = Replace(imlai,'اِمْرَأَةَ نُوحٍ وَامْرَأَةَ لُوطٍ','امْرَأَةَ نُوحٍ وَامْرَأَةَ لُوطٍ');
/* 1 ocuurence aya 5239 */

/* Aya 5240 اِمْرَأَةَ فِرْعَوْنَ do not change to امْرَأَتَ نُوحٍ وَامْرَأَتَ لُوطٍ */
/* update Quran set imlai = Replace(imlai,'اِمْرَأَةَ فِرْعَوْنَ','امْرَأَتَ نُوحٍ وَامْرَأَتَ لُوطٍ'); */
update Quran set imlai = Replace(imlai,'اِمْرَأَةَ فِرْعَوْنَ','امْرَأَةَ فِرْعَوْنَ') where id = 5240;
/* 1 ocuurence aya 5240 */

update Quran set imlai = Replace(imlai,'بِأَيِّيكُمُ','بِأَيِّكُمُ');
/* 1 ocuurence aya 5277 */

update Quran set imlai = Replace(imlai,'تَدْعُوا مَنْ أَدْبَرَ','تَدْعُو مَنْ أَدْبَرَ');
/* 1 ocuurence aya 5392 */

update Quran set imlai = Replace(imlai,'وَأَنْ لَوِ اسْتَقَامُوا','وَأَلَّوِ اسْتَقَامُوا');
/* 1 ocuurence aya 5463 */

update Quran set imlai = Replace(imlai,'كَانَتْ قَوَارِيرَ','كَانَتْ قَوَارِيرَا');
/* 1 ocuurence aya 5463 */

update Quran set imlai = Replace(imlai,'لَنَسْفَعَنْ','لَنَسْفَعًا');
/* 1 ocuurence aya 6121 */
