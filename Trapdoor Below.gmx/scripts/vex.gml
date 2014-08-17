/*
Vex K Script 1.0
Written by Vishnu Aravind.

Comment: This script works with Netread DLL written by Roach(GMC Member).

Usage:
//For submitting a score ->
rank = vex(1,"VEX_K_username","VEX_K_password","playername",playerscore);//returns the rank of the player in the highscore table.

//For retrieving scores.
vex(0,"VEX_K_username");//This declares two arrays, vex_name,vex_score. These contain names and scores of the players in the highscore table.
*/

vex_position = 0;
if argument0 then url = "http://vexk.uni.cc/Vex.php?usr="+string(argument1)+"&pswd="+string(argument2)+"&nm="+string(argument3)+"&scr="+string(argument4) else url = "http://vexk.uni.cc/Vex.php?usr="+string(argument1)+"&ret=game";
text = netread(url,2000);
execute_string(text);
if argument0 then return vex_position;

