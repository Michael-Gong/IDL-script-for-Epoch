pro plotenergy
restore,'./sav/parameter.sav'
restore,'./sav/grid.sav'
restore,'./sav/energy.sav'
set_plot,'ps'
for n=0,nspecie-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/energy-'+sname[n]+'-'+strtrim(string(starttime+interval*i),2)+'.'+filetype,$
/color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=8,ysize=4.5,font_size=12,/tt_font
!P.MULTI=[0,1]
loadct,0
plot,congrid(bx[*,i,n],500)/(1.6e-19*1e6),congrid(b[*,i,n],500),$
title='Time is '+strtrim(string(realtime[i]),2)+' fs',xtitle='Energy [MeV]',ytitle='dN/dE [a.u.]',xstyle=9,ystyle=9,pos=[0.15,0.15,0.8,0.9],charthick=1.5,charsize=1.5,font=1
device,/close
endfor
endfor
end
 
