pro plotfield
restore,'./sav/parameter.sav'
restore,'./sav/grid.sav'
restore,'./sav/field.sav'
set_plot,'ps'
for n=0,nfield-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/'+fname[n]+'-'+strtrim(string(starttime+i*interval),2)+'.'+filetype,$
/color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=8,ysize=4.5,font_size=12,/tt_font
!P.MULTI=[0,1]
loadct,1
plot,congrid(x[plotarea[0]:plotarea[1],i],500),congrid(field[plotarea[0]:plotarea[1],i,n],500),$
title='Time is '+strtrim(string(realtime[i]),2)+' fs',xtitle='x [!9m!3m]',ytitle=fname[n]+' [V/m]',xstyle=9,ystyle=9,pos=[0.15,0.15,0.8,0.9],charsize=1.5,charthick=1.5,font=1
device,/close
endfor
endfor
end
