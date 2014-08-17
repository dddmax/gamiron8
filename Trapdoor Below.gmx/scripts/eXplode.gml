//arg0 = string
//arg1 = seperator
//arg2 = var
//arg3 = global or not
//returns the amount of values stored [size]
   var str, sep, arr, pos, count, len, limit, i;
   
   str = argument0;
   sep = argument1;
   arr = argument2;
   glo=real(string(argument4))
   
   count = string_count(sep, str);
   limit = min(argument3 - 1, count);
   
   // If no limit was given, use separator count
   if (limit < 1)  limit = count;
   
   len = string_length(sep) - 1;
   
   // Get all the pieces before last
   for (i = 0; i < limit; i += 1)
   {    
       pos = string_pos(sep, str);      
       if glo=1 variable_global_array_set(arr, i, string_copy(str, 1, pos - 1));
       else variable_local_array_set(arr, i, string_copy(str, 1, pos - 1));
       str = string_delete(str, 1, pos + len);
   }
   
   // Get last piece
   if glo=1 variable_global_array_set(arr, i, str); else  variable_local_array_set(arr, i, str);
   
   return i + 1;
/*
var _i,_cnt;
_cnt=string_count(argument1,argument0);
  for(_i=0;_i<_cnt;_i+=1)
  {
   variable_local_array_set(string(argument2),_i,string(string_copy(argument0,0,string_pos(argument1,argument0)-1)));
   argument0=string_copy(argument0,string_pos(argument1,argument0)+string_length(argument1),string_length(argument0));
  }
variable_local_array_set(string(argument2),_cnt,string(string_replace_all(string_copy(argument0,0,string_length(argument0)),argument1,"")));
return _cnt+1;
