#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 26 17:36:20 2019

@author: ash
"""

import pandas as pd

new_file = "../HW2/outfile.csv"
df = pd.read_csv(new_file,sep='\t')

#TOTAL NUMBER OF ROWS
num_rows = df.shape[0]
print("Number of rows:    "+str(num_rows))

#TOTAL NUMBER OF COLUMNS
num_cols = df.shape[1]
print("Number of columns: "+str(num_cols)) 

#COLUMNS EXPLAINED
print("\n     KEY:")
for column in df.columns:
    if column == "White":
         print(column + "\tRating")
    elif column == "Black":
         print(column + "\tRating") 
    elif column == "[:]":
         print(column + "\tTotal Moves")     
    elif column == "Victory":
         print(column + "\tType") 
    elif column == "Winner":
         print(column + "\tBlack or White")   
    elif column == "+/-":
        print(column + "\tPlayer Difference")
    elif column == "ECO":
        print(column + "\tOpening Code")
    else:
        print(column + "\tOpening Name")
    
#OVERALL ANALYSIS
print("\nOVERALL ANALYSIS")
print(df.describe().round(0))

#BAD DATA

viable = df.loc[(df["[:]"] >= 8)]
bad = df.loc[(df["[:]"] < 8)]
bad_total = bad.shape[0] #counts total columns
print("\nBAD DATA FOUND: "+ str(bad_total))
print(bad[["[:]","Victory"]])



#PROBLEMATIC GAMES

problematic = viable.loc[((df["[:]"] <= 30) & (df["Victory"] != "mate"))]
problematic = problematic.sort_values("[:]",ascending=False)
problematic_total = problematic.shape[0]#counts total columns
print("\nPOTENTIALLY BAD DATA: " + str(problematic_total))
print(problematic[["[:]","Victory"]])


#WHITE GAMES

white = viable.loc[(viable["Winner"]=="white")]
white = white.sort_values("White")
white_total = white.shape[0]#counts total columns
white_best_openings = pd.value_counts(white["ECO"]).head(5)

print("\nTOTAL GAMES AS WHITE: "+ str(white_total))
print("\nBest Openings as White:")
print(white_best_openings)

#user given the option to view all white games 
#these are sorted by white's rating from worst to best (86)
response = input("Would you like to view the data? ")
if response.lower() == "yes":
   print(white[["White","Black","[:]","ECO"]])
elif response.lower() != "no":
    print("Invalid Response. Game viewer: off")



#BLACK GAMES

black = viable.loc[(viable["Winner"]=="black")]
black = black.sort_values("Black")
black_total = black.shape[0]#counts total columns
black_best_openings = pd.value_counts(black["ECO"]).head(5)

print("\nTOTAL GAMES AS BLACK: "+ str(black_total))
print("\nBest Openings as Black:")
print(black_best_openings)

#user given the option to view all black games 
#these are sorted by white's rating from worst to best (110)
response = input("Would you like to view the data? ")
if response.lower() == "yes":
    print(black[["Black","White","[:]","ECO"]])

elif response.lower() != "no":
    print("Invalid Response. Game viewer: off")


#TOP 20 UPSETS

#user given the option to view top 20 upsets
response = input("Would you like to see the top 20 upsets? ")
if response.lower() == "yes":
    top_20_upsets = viable.sort_values("+/-",ascending=False).head(20)
    print("\nTop 20 Upsets:")
    print(top_20_upsets[["White","Black","[:]","ECO"]])

elif response.lower() != "no":
    print("Invalid Response. Upset viewer: off")

#BEATING THE MASTER
"""
This is useful because user can view openings used to beat the best of the best
"""
    
#user given the option to view top 20 upsets
response = input("Would you like to see games where amateurs beat the masters? ")
if response.lower() == "yes":
    beating_the_master = viable.loc[((df["White"] >= 2000) & (viable["Black"]<1900)) | ((viable["Black"] >= 2000) & (viable["White"] < 1900))]
    BTM_total = beating_the_master.shape[0]
    print("\nBeating the Master: " +str(BTM_total))
    print(beating_the_master[["White","Black","[:]","+/-","ECO"]])
    
elif response.lower() != "no":
    print("Invalid Response. Upset viewer: off")

OpeningBook = df[["ECO","Opening System"]].drop_duplicates()
openings_total = OpeningBook.shape[0]
print(OpeningBook)
print(openings_total)
        
response = input("ECO: ")
while (response.lower() != "off"):
    if response in OpeningBook["ECO"]:
        opening = OpeningBook.loc[(df["ECO"]==response)]
        print(opening)
    else:
        print("Elo not found")
    response = input("ELO: ")

