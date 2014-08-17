var fields,size,i,glo,AHG,newLine,firstword,retVal;
glo=real(string(argument2))

global.sockId = tcpconnect("mystuff.host56.com", 80, 0);
if(!global.sockId) return -2;
newLine = chr(13) + chr(10);
setformat(global.sockId, 1, newLine);
clearbuffer();
writechars("GET /mysql.php?pass=FlowThePro&&q="+string_replace_all(argument0,' ','%20')+" HTTP/1.0" + newLine);
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
if string_pos('&#164;',retVal)<1// only one data///
{if string_length(argument1)>0 if glo=1 variable_global_set(argument1,retVal) else variable_local_set(argument1,retVal) return string(retVal)}

if eXplode(retVal,'&#164;','yo')=2
{
fields=real(yo[1]) if fields=0 AHG=0 else AHG=1
size=string_count('&#165;',yo[0])
if size>fields//we got rows!!!
{
eXplode(yo[0],'&#165;','dip')
for(i=0;i<=size;i+=1)
{if glo=1 variable_global_array2_set(argument1,i mod fields,i div fields,string(dip[i]))
else variable_local_array2_set(argument1,i mod fields,i div fields,string(dip[i]))}
}
else eXplode(yo[0],'&#165;',argument1,0,glo)
return real(size+AHG)
}
return -1//well someone ruined it...
