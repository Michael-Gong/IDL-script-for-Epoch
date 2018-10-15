pro plotdensity3d
restore,'./sav/parameter.sav'
restore,'./sav/grid.sav'
restore,'./sav/density.sav'
set_plot,'ps'
for n=0,nspecie-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/density3d-'+sname[n]+'-'+strtrim(string(starttime+interval*i),2)+'.'+filetype,$
/color,set_font='Helvetica',bits_per_pixel=8,/inches,xsize=8,ysize=6,font_size=16,/tt_font
loadct,10
if max(b[*,*,i,n]) gt 0 then levels=findgen(denlevel)*(0.5*max(b[*,*,i,n])-min(b[*,*,i,n]))/denlevel+min(b[*,*,i,n]) else levels=findgen(denlevel)/denlevel
c=congrid(b[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],i,n],rex,rey)
scale3
pos=[0.15,0.15,0.8,0.85]
shade_surf,c,congrid(x[plotarea[0]:plotarea[1],i],rex),congrid(y[plotarea[2]:plotarea[3],i],rey),$
ax=30,az=-60,zst=5,shades=0.05*255+0.95*(255-(c-min(c))/(max(c)-min(c))*255),pixels=1000,position=pos,/save,zrange=[min(c),max(c)],$
title='Time is '+strtrim(string(realtime[i]),2)+' fs',xtitle='x [!9m!3m]',ytitle='y [!9m!3m]',xstyle=9,ystyle=9,charthick=1.5,charsize=1.5,font=1
t3d,/yzexch
plot,congrid(x[plotarea[0]:plotarea[1],i],rex),c[*,rey/2],/t3d,/noclip,zvalue=0.85,/noerase,position=pos+[0,-0.2,0,0.1],yrange=[min(c),max(c)],$
thick=1.5,xstyle=1,ystyle=1,font=1,ytitle='Electron density / on-axis value [m!E-3!N]'
device,/close
endfor
endfor
end
 
