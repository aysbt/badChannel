#!/usr/bin/env python
# author : Ayse Bat (abat@fnal.gov)
# This script reads the bad_chan_stats.txt file and print the 
# Run number, Total SubRuns
# Missing SubRuns
# Different Fracition Number

#import pandas to manupulate the data frames
import pandas as pd
import argparse
def get_args():
    """Getting the Detector name for the script"""
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--detector", default="NearDet")
    return parser.parse_args()

def printMissingRun(arrRun, N):
    """Function to find the missing runs in a given elements"""
    cnt = 0
    for i in range(arrRun[0], arrRun[N - 1]+1):
         
        # Check if number is equal to the first element in
        # given array if array element match skip it increment for next element
        if (arrRun[cnt] == i):
            #print(i)             
            # Increment the count to check next element
            cnt += 1
             
        else:             
            # Print missing number            
            print(i, "Missing Run " , end = " ")
            print()

def printDecoration (printName):
    print()
    print("######################################")
    print("########## ", printName  ,"###########")
    print("######################################")
    print()

def main():
    #instantiate get_args function()
    args = get_args()

    #Read the txt file 
    df = pd.read_csv('bad_chan_stats.txt', sep=" ", header=None, names=['Run',"SubRun","frac1","frac2","diff"])

    for count in range(len(df["Run"])-1):
        currentCount = df["Run"][count]
        nextCount = df["Run"][count+1]
        if (currentCount == nextCount):
            item_counts = df["Run"].value_counts().sort_index()

    frame = { 'Run': item_counts.index, 'totalSubRuns': item_counts.values}
    df_item = pd.DataFrame(frame) 
 
    if args.detector == "NearDet":
        df_item_checksub = df_item[df_item['totalSubRuns'] != 24]
    else:
        df_item_checksub = df_item[df_item['totalSubRuns'] != 64]


    df_frac= df[ (df["frac1"]>1) | (df["frac2"]>1) | (df["diff"]!=0) ]  

    printDecoration('RUN INFORMATION')
    print(df_item_checksub.to_markdown())

    printDecoration('MISSING RUN')
    N = len(item_counts)
    printMissingRun(item_counts.index, N)

    printDecoration('Frac Information')
    print(df_frac.to_markdown())
if __name__ == '__main__':
    main()

