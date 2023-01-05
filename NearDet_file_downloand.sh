#!/bin/bash

#This is For Near Dedector
#Location in novabd: /home/novadq/Releases/BadChanValidation/badchan_validation/NearDet


DATE=2022-12-19
FIRST_RUN=14883
LAST_RUN=14883

echo 'Copying bad channel txt file in local .....'
scp  -o GSSAPIAuthentication=true "novadq@novadqgpvm01.fnal.gov:/home/novadq/Releases/BadChanValidation/badchan_validation/NearDet/${DATE}_${FIRST_RUN}_${LAST_RUN}/badchan_${FIRST_RUN}-${LAST_RUN}/bad_chan_stats.txt" .

echo 'Changing the name of the file'
cp  bad_chan_stats.txt  Stats/NearDet/bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt

echo 'Running Python command ...'
python3 printBadChannel.py -d NearDet  > Result/NearDet/result_of_bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt
cd Result/NearDet
cat result_of_bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt

cd ../..
echo ''
echo 'Removing the bad_chan_stats.txt'
rm bad_chan_stats.txt
echo 'Done ...'

