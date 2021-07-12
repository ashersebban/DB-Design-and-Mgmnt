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
    with open("../infile.csv", mode = 'r') as source_file:
       
        #set up csv reader
        csv_reader = csv.reader(source_file)
        
        
        #sort file by opening
        first_sort = sorted(csv_reader,key=operator.itemgetter(14))
        
        #sort file by black vs white
        sorted_final = sorted(first_sort,key=operator.itemgetter(6))
        
        #open target file
        with open("outfile2.csv", mode = 'w') as target_file:
            
            #set up csv writer
            csv_writer = csv.writer(target_file , delimiter = ",")
            lines_read = 0
            lines_written = 0
            
            header = ["White","Black","[:]","Victory","Winner","+/-","ECO","System"]
            
            
            
            for line in sorted_final:

                #SKIP ORIGINAL HEADING LINE
                if line[0] == "id":
                    header = True
                else:
                    header = False
                
                #IF THE LINE IS DATA
                #and not the header
                if header == False:
                    
                    #read the line
                    lines_read += 1
                    
                    #CREATE COLUMN NAMES
                    rated = line[1]
                    white = int(line[9])
                    black = int(line[11])
                    winner = line[6]
                    difference = abs(white-black)
                    moves = line[4]
                    victory_type = line[5]
                    if victory_type == "outoftime":
                        victory_type = "time";
                    eco = line[13]
                    system = line[14]
                    #optional:
                    game_log = line[12]
                    
                    if rated == "TRUE":
                        #if user wanted to see game log before
                        if response == "yes":
                            
                            #upload COLUMNS with optional game log
                            csv_writer.writerow((white,black,moves,victory_type,winner,difference,eco,system,game_log))
                            #write the line
                            lines_written +=1
                            
                        #if user didnt not want to see game log
                        elif response == "no":
                            
                            #upload COLUMNS without optional game log
                            csv_writer.writerow((white,black,moves,victory_type,winner,difference,eco,system))
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
