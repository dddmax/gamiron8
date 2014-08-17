//0=limit
//1=var name
//2=how many days old the score can be [0 for it doesnt matter]
//3=id of scores
//4=var is global or not
var fields,size,i,glo,AHG,newLine,firstword,retVal,_idd,_id,_li,_lil,_da,_dad;
glo=real(string(argument4))
AHG=0
_id=string(argument3) if string_length(_id)>0 _idd='&&id='+_id else _idd=''
_li=string(argument0) if string_length(_li)>0 _lil='&&limit='+_li else _lil=''
_da=string(argument2) if real(argument2)<>0 _dad='&&date='+string(date_current_date()-argument2) else _dad=''

global.sockId = tcpconnect("mystuff.host56.com", 80, 0);
if(!global.sockId) return -2;
newLine = chr(13) + chr(10);
setformat(global.sockId, 1, newLine);
clearbuffer();
writechars("GET /ohs.php?type=2&&gameid="+string(12312309)+_idd+_lil+_dad+" HTTP/1.0" + newLine);
writechars("Host: mystuff.host56.com" + newLine);
sendmessage(global.sockId);
processHeader = true;
while(processHeader)
{
	receivemessage(global.sockId);
	firstWord = readsep(" ");
	switch(firstWord)
	{
		case "":		//blank line
			processHeader = false;
		break;		//read important stuff from header...
	}
}

setformat(global.sockId, 2); retVal = "";
while(1)
{
	size = receivemessage(global.sockId, 60000);
	if(size > 0) retVal += readchars(size);
	else break;
}
retVal=string_delete(retVal,string_pos('<!-- www.000',retVal),288)
retVal=string_replace_all(retVal,'
','');
closesocket(global.sockId)

///MAKE ARRAYS\\\
eXplode(retVal,'&#164;','yo')
fields=real(yo[1])
size=string_count('&#165;',yo[0])
eXplode(yo[0],'&#165;','dip')
for(i=0;i<=size;i+=1)
  {
  if glo=1 variable_global_array2_set(argument1,i mod fields,i div fields,string(dip[i]))
  else variable_local_array2_set(argument1,i mod fields,i div fields,string(dip[i]))
  }
return real(size+AHG)/3
