global.sockId = tcpconnect("flowarcade.com", 80, 0);
if(!global.sockId) return -2;
newLine = chr(13) + chr(10);
setformat(global.sockId, 1, newLine);
clearbuffer();
writechars("GET /mysql.php?getIP=1 HTTP/1.0" + newLine);
writechars("Host: flowarcade.com" + newLine);
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
return retVal;
