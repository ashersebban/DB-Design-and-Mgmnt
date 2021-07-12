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
            
            header = ["White","Black","[:]","Victory","Winner","+/-","ECO","System"]
            csv_writer.writerow(header)
            
            
            
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
                    
                    #Games where both players are 'good'
                    if (white >= 1500 and black >=1500):
                        competative_game = True
                    else:
                        competative_game = False
                    
                    #Games where at least one player is 'very good'
                    if (white >= 1700 or black >= 1700):
                        master_game = True
                    else:
                        master_game = False
                    
                    # FILTER 1:
                    #Game must be rated
                    #Both players must be good OR one player must be very good
                    if rated == "TRUE" and (competative_game == True or master_game == True):
                    
                        #Black is the underdog
                        if white > black :
                            underdog = "black"
                            
                        #White is the underdog
                        elif black > white:
                            underdog = "white"
                            
                        #FILTER 2:
                        #The underdog wins
                        #The difference between the two players is large enough to be an upset
                        if underdog == winner and difference >= 100:
                            
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