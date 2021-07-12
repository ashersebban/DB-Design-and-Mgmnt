#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 14 16:22:41 2019

@author: ash
"""
import csv
import operator

def main():
    #ask user if wants to see moves of game. User "yes" or "no"to write lines
    response = input("Would you like to see the game log? ")
    #open source file
    with open("infile.csv", mode = 'r') as source_file:
        #set up csv reader
        csv_reader = csv.reader(source_file)
        #sort file by opening
        first_sort = sorted(csv_reader,key=operator.itemgetter(14))
        #sort file by black vs white
        sorted_final = sorted(first_sort,key=operator.itemgetter(6))
        #open target file
        with open("outfile.csv", mode = 'w') as target_file:
            #set up csv writer
            csv_writer = csv.writer(target_file , delimiter = "\t")
            lines_read = 0
            lines_written = 0
            for line in sorted_final:
                #read every line and store it
                lines_read += 1
                # if game is rated and (both players are above 1500 rating)
                if line[1]=="TRUE" and (int(line[9])>=1500 and int(line[11])>=1500):
                    #set variable for winner
                    winner = line[6]
                    #if white is rated higher than black
                    if int(line[9]) > int(line[11]) :
                        underdog = "black"
                        #calculate difference
                        difference = int(line[9])-int(line[11])
                    #if black is rated higher than white
                    elif int(line[9]) < int(line [11]):
                        underdog = "white"
                        #calculate difference
                        difference = int(line[11])-int(line[9])
                    #if the game is an "upset" (difference must be by 100+)
                    if underdog == winner and difference >= 100:
                        #if user wanted to see game log way back when
                        if response == "yes":
                            #write program with total moves and list of moves
                            csv_writer.writerow((line[9],line[11],line[6],line[14],line[4],line[12]))
                            #write the line and store it
                            lines_written +=1
                        #if user didnt not want to see game log way back when
                        elif response == "no":
                            #write program without game log
                            csv_writer.writerow((line[9],line[11],line[6],line[14]))
                            #write the line and store it
                            lines_written +=1
            #print lines read  
            print(f"Read {lines_read} lines.")
            #print lines written
            print(f"Wrote {lines_written} lines.")
            
            
    #close both files       
    source_file.close() # close the source file
    target_file.close() # close the target file
    
main()
