# Bad Channel
Aim: Finding the bad channel missing subruns, Runs and higher fraction
Author: Ayse Bat (aaysbt@gmail.com)

Use the bash file to downloand the bad_chan_stats.txt and prcess the python script to find the bad channel missing subruns, Runs and higher fraction

Folllowing argument need to be modify:
* DATE
* FIRST_RUN
* LAST_RUN

The exaple file location: /home/novadq/Releases/BadChanValidation/badchan_validation/FarDet/2022-12-21_45142_45161/badchan_45142-45161/bad_chan_stats.txt

**2022-12-21_45142_45161**
You need to modity the information for the correspending file that you want to check
* DATE=2022-12-21
* FIRST_RUN=45142
* LAST_RUN=45161

The script will do the rest, After you run the script bad_chan_stats.txt file will as rename bad_chan_stats_${FIRST_RUN}_${LAST_RUN}.txt and move related location **Stats/NearDet/** for Near Detector, and **Stats/FarDet/** for Far Detector. 

The Python script result will print to the terminal and also created the txt file in the **Result** folder.


