//Bresenham line drawing algorithm
 //Procedure DrawLine(x1,y1,x2,y2,id:integer);

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
mapid = argument4; 
    
//   var dx,dy,i,sx,sy,check,e,x,y:integer;
    begin
        dx=abs(x1-x2);
        dy=abs(y1-y2);
        sx=scr_Sign(x2-x1);
        sy=scr_Sign(y2-y1);
        xx=x1;
        yy=y1;
        check=0;
        if dy>dx then begin
            dx=dx+dy;
            dy=dx-dy;
            dx=dx-dy;
            check=1;
        end;
        e= 2*dy - dx;
        for(i=0; i<dx+1; i+=1) begin
            ds_grid_set(global.map, xx, yy, mapid);            
            if e>=0 then begin
                if check=1 then xx=xx+sx else yy=yy+sy;
                e=e-2*dx;
            end;
            if check=1 then yy=yy+sy else xx=xx+sx;
            e=e+2*dy;
        end;
    end;
