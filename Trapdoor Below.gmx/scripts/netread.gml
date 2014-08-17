/*
Script Name: netread
Author: Roach

Function: Returns the source of an online document.

Arguments:
   0 - string - online document
   1 - real - number of bytes to read
   
Returns:
  string - the source of the document

Example:
  src = netread("http://google.com",5000);
  draw_text(10,10,src);
*/

act = external_define("NetRead.dll","NetRead",1,1,2,1,1);
return external_call(act,argument0,string(argument1));
