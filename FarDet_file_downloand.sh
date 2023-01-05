#!/bin/bash

#This is For Far Dedector
#Location in novabd: /home/novadq/Releases/BadChanValidation/badchan_validation/FarDet
#exaple location for the file:
#/home/novadq/Releases/BadChanValidation/badchan_validation/FarDet/2022-12-21_45142_45161/badchan_45142-45161/bad_chan_stats.txt

DATE=2022-12-21
FIRST_RUN=45142
LAST_RUN=45161

echo 'Copying bad channel txt file in local .....'
scp  -o GSSAPIAuthentication=true "novadq@novadqgpvm01.fnal.gov:/home/novadq/Releases/BadChanValidation/badchan_validation/FarDet/${DATE}_${FIRST_RUN}_${LAST_RUN}/badchan_${FIRST_RUN}-${LAST_RUN}/bad_chan_stats.txt" .

echo 'Changing the name of the file'
cp  bad_chan_stats.txt  Stats/FarDet/bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt

echo 'Running Python command ...'
python3 printBadChannel.py -d FarDet  > Result/FarDet/result_of_bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt
cd Result/FarDet
cat result_of_bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt

cd ../..
echo ''
echo 'Removing the bad_chan_stats.txt'
rm bad_chan_stats.txt
echo 'Done ...'

