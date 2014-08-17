//0=name
//1=score
//2=id of scores
//3=var is global or not
//returns 1 if sucess, -1 if failure
var fields,size,i,glo,AHG,newLine,firstword,retVal,_id,_idd;
glo=real(string(argument3))
_id=string(argument2)
if string_length(_id)>0 _idd='&&id='+_id else _idd=''

global.sockId = tcpconnect("mystuff.host56.com", 80, 0);
if(!global.sockId) return -2;
newLine = chr(13) + chr(10);
setformat(global.sockId, 1, newLine);
clearbuffer();
writechars("GET /ohs.php?type=1&&name="+string_replace_all(argument0,' ','%20')+"&&score="+string(round(real(argument1)))+"&&gameid="+string(12312309)+"&&date="+string(date_current_date())+_idd+" HTTP/1.0" + newLine);
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
return retVal
