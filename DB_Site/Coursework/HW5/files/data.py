#!/usr/bin/python3
import cgi
import sqlite3

import cgitb
cgitb.enable() 
  
#1 set up and open an HTML page
print("Content-Type: text/html\r\n\r\n")
print( "<html>\n<head>")
print( "<title>Homework 5</title>")
print( '''<link href="custom.css" rel="stylesheet" type="text/css" />''')
print(" </head>")
print( "<body>")

print('''<h1>Database Design and Web Implementation</h1>\n
	<nav id="mainNav">\n
		<div class="navBoxes">\n
			<a href="../../../Home/index.html">Home</a>\n
		</div>\n
		<div class="navBoxes">\n
			<a href="../../index.html">Coursework</a>\n
		</div>\n
		<div class="navBoxes">\n
			<a href="#">Recent</a>\n
		</div>\n
	</nav>\n

	<section>\n
		<h3>HOMEWORK 5</h3>\n
		<div id="box1">\n
			<p>This data set contains thousands of online chess matches that have 
            already been played. The goal of our program is to list available data 
            on particular openings. The user has the option to choose a particular 
            opening, or simply sort through all them! The user also has the option 
            to choose an 'underdog'. If an underdog is chosen, only games in which 
            a lower rated player beat a high rated player will be presented. This 
            makes it easier to compile data on which openings may be best to use 
            when playing someone better than you.<br>\n
			The original set comes from this website:\n
			<a href="https://www.kaggle.com/datasnaek/chess" target="_blank">https://www.kaggle.com/datasnaek/chess</a></p>\n
			<ul>Visible Changes:\n
				<li>Data now includes player names for both black and white.</li>\n
			</ul>\n
			<ul>Invisible Changes:\n
				<li>Csv file now includes a computed column for underdog.</li>\n
			</ul>\n
		</div>\n
	</section>\n
    <div id="box2">\n
		<form method="POST" action="data.py">\n
			<p>Select Opening:</p>\n
			<select name="opening">\n
				<option></option>\n
				<option>Alekhine Defense</option>\n
				<option>Benoni Defense</option>\n
				<option>Bird Opening</option>\n
				<option>Bishop's Opening</option>\n
				<option>Blackmar-Diemer Gambit</option>\n
				<option>Caro-Kann Defense</option>\n
				<option>Center Game</option>\n
				<option>Dutch Defense</option>\n
				<option>Elephant Gambit</option>\n
				<option>English</option>\n
				<option>Englund Gambit</option>\n
				<option>Four Knight's Game</option>\n
				<option>French Defense</option>\n
				<option>Gruenfeld Defense</option>\n
				<option>Horwitz Defense</option>\n
				<option>Hungarian Opening</option>\n
				<option>Indian Game</option>\n
				<option>Italian Game</option>\n
				<option>King's Gambit</option>\n
				<option>King's Indian Defense</option>\n
				<option>King's Knight Opening</option>\n
				<option>King's Pawn Game</option>\n
				<option>Mieses Opening</option>\n
				<option>Modern Defense</option>\n
				<option>Nimzo-Indian Defense</option>\n
				<option>Nimzo-Larsen Attack</option>\n
				<option>Nimzowitsch Defense</option>\n
				<option>Old Indian Defense</option>\n
				<option>Philidor Defense</option>\n
				<option>Pirc Defense</option>\n
				<option>Queen's Gambit</option>\n
				<option>Queen's Pawn</option>\n
				<option>Reti Opening</option>\n
				<option>Russian Game</option>\n
				<option>Ruy Lopez</option>\n
				<option>Saragossa Opening</option>\n
				<option>Scandinavian Defense</option>\n
				<option>Scotch Game</option>\n
				<option>Slav Defense</option>\n
				<option>Sicilian Defense</option>\n
				<option>Three Knights Opening</option>\n
				<option>Van't Kruijs Opening</option>\n
				<option>Vienna Game</option>\n
				<option>Zukertort Opening</option>\n
			</select>\n
			<p>Select Underdog:</p>\n
			<select name="underdog">\n
				<option></option>\n
				<option>white</option>\n
				<option>black</option>\n
			</select>\n
			 <!--\n
			<p>Underdog rating :</p>
			<select name="under_min">
	    		<option></option>
				<option>700</option>
				<option>800</option>
				<option>900</option>
				<option>1000</option>
				<option>1100</option>
				<option>1200</option>
				<option>1300</option>
				<option>1400</option>
				<option>1500</option>
				<option>1600</option>
				<option>1700</option>
				<option>1800</option>
				<option>1900</option>
				<option>2000</option>
				<option>2100</option>
				<option>2200</option>
				<option>2300</option>
				<option>2400</option>
			</select>
			<select name="under_max">
	    		<option></option>
				<option>2500</option>
				<option>2400</option>
				<option>2300</option>
				<option>2200</option>
				<option>2100</option>
				<option>2000</option>
				<option>1900</option>
				<option>1800</option>
				<option>1700</option>
				<option>1600</option>
				<option>1500</option>
				<option>1400</option>
				<option>1300</option>
				<option>1200</option>
				<option>1100</option>
				<option>1000</option>
				<option>900</option>
				<option>800</option>
			</select>
			<p>Opposition rating :</p>
			<select name="over_min">
	    		<option></option>
				<option>700</option>
				<option>800</option>
				<option>900</option>
				<option>1000</option>
				<option>1100</option>
				<option>1200</option>
				<option>1300</option>
				<option>1400</option>
				<option>1500</option>
				<option>1600</option>
				<option>1700</option>
				<option>1800</option>
				<option>1900</option>
				<option>2000</option>
				<option>2100</option>
				<option>2200</option>
				<option>2300</option>
				<option>2400</option>
			</select>
			<select name="over_max">
	    		<option></option>
				<option>2500</option>
				<option>2400</option>
				<option>2300</option>
				<option>2200</option>
				<option>2100</option>
				<option>2000</option>
				<option>1900</option>
				<option>1800</option>
				<option>1700</option>
				<option>1600</option>
				<option>1500</option>
				<option>1400</option>
				<option>1300</option>
				<option>1200</option>
				<option>1100</option>
				<option>1000</option>
				<option>900</option>
				<option>800</option>
			</select>
			-->\n
			<p>How many items would you like to see:</p>\n
			<select name="number">\n
				<option>All</option>\n
				<option>10</option>\n
				<option>20</option>\n
				<option>50</option>\n
				<option>100</option>\n
				<option>500</option>\n
			</select>\n
			<select name="order">\n
				<option>ASC</option>\n
				<option>DESC</option>\n
			</select>\n
			<hr>\n
			<input type="submit" value="Submit">\n
			<input type="reset" value="Cancel">\n
		</form>\n
		<div id="data">\n
			<div class="background">\n
			</div>\n
        </div>\n
    </div>\n
    <div class="box3">\n''')
form = cgi.FieldStorage()
#2 set variables
user_rows  = form["number"].value
user_order = form["order"].value



if "underdog" in form:
    user_underdog = form["underdog"].value
else:
    user_underdog = " "
    
if user_underdog == 'black':
   user_overdog = 'white'
elif user_underdog == 'white':
    user_overdog = 'black'

if "opening" in form:  # checking for a non-empty field
    user_opening = form["opening"].value
    print ("<h4>The opening you selected is "+user_opening+"</h4>")
else:
    user_opening = 'All'
    print ("<h4>You selected all openings.</h4>")
    
print ( "<hr />")


# 4. connect the database
conn = sqlite3.connect('chessDB.db')
c = conn.cursor()

# 5. write the query
if user_opening != "All":
    query = '''SELECT ECO, systemName,gameTime,Winner,ratingDifference,whiteID,whiteRating,blackID,blackRating,victoryType,totalMoves
               FROM chessgames
               WHERE systemName LIKE "%'''+user_opening+'%" '
    if user_underdog!=" ":
        query +=' AND Winner="'+user_underdog+'" '
        query +=' AND underdog ="'+user_underdog[0]+'" '
    query += 'ORDER BY systemName '
    query += user_order
    if user_rows != "All":
        query += ' LIMIT '+ user_rows 
    
else:
    query = '''SELECT ECO, systemName,gameTime,Winner,ratingDifference,whiteID,whiteRating,blackID,blackRating,victoryType,totalMoves
               FROM chessgames '''
    if user_underdog!=" ":
        query +=' AND Winner="'+user_underdog+'" '
        query +=' AND underdog ="'+user_underdog[0]+'" '
    query += 'ORDER BY systemName '
    query += user_order
    if user_rows != "All":
        query += ' LIMIT '+ user_rows         

print("<h4>QUERY: "+query+"</h4>") 

#6. run the query
c.execute(query)
    
#7. table
print("<table>")

#8. heading
print("<tr>")
print("<th>ECO</th>")
print("<th>System</th>")
print("<th>Time</th>")
print("<th>Winner</th>")
print("<th>+/-</th>")
print("<th>White</th>")
print("<th>Rating</th>")
print("<th>Black</th>")
print("<th>Rating</th>")
print("<th>Status</th>")
print("<th>Moves</th>")
print("</tr>")

#9. data
for ECO,systemName,gameTime,Winner,ratingDifference,whiteID,whiteRating,blackID,blackRating,victoryType,totalMoves in c:
    print("<tr>")
    print("\t<td>"+ECO+"</td>")
    print("\t<td>"+systemName+"</td>")
    print("\t<td>"+gameTime+"</td>")
    print("\t<td>"+Winner+"</td>")
    print("\t<td>"+str(ratingDifference)+"</td>")
    print("\t<td>"+whiteID+"</td>")
    print("\t<td>"+str(whiteRating)+"</td>")
    print("\t<td>"+blackID+"</td>")
    print("\t<td>"+str(blackRating)+"</td>")
    print("\t<td>"+victoryType+"</td>")
    print("\t<td>"+str(totalMoves)+"</td>")
    print("</tr>")
print("</table>")

# close up the database
c.close()

print('''
	</div>\n
</body>\n
</html>''')