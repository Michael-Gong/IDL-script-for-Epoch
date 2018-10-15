pro plotekbar
restore,'./sav/parameter.sav'
restore,'./sav/grid.sav'
restore,'./sav/ekbar.sav'
set_plot,'ps'
for n=0,nspecie-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/ekbar-'+sname[n]+'-'+strtrim(string(starttime+interval*i),2)+'.'+filetype,$
/color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=8,ysize=4.5,font_size=16,/tt_font
!P.MULTI=[0,3]
loadct,39
levels=findgen(denlevel)*(max(b[*,*,i,n])-min(b[*,*,i,n]))/denlevel+min(b[*,*,i,n])
contour,congrid(b[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],i,n],500,200),congrid(x[plotarea[0]:plotarea[1],i],500),congrid(y[plotarea[2]:plotarea[3],i],200),$
levels=levels,/fill,title='Time is '+strtrim(string(realtime[i]),2)+' fs',xtitle='x [!9m!3m]',ytitle='y [!9m!3m]',xstyle=9,ystyle=9,pos=[0.15,0.15,0.8,0.9],charthick=1.5,charsize=1.5,font=1
plot,congrid(x[plotarea[0]:plotarea[1],i],500),congrid(b[plotarea[0]:plotarea[1],ny/2,i,n],500),thick=1.5,pos=[0.15,0.15,0.8,0.9],xstyle=5,ystyle=5,color=255,font=1
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='on-axis ekbar [joule]',font=1
xx=rebin(transpose(levels),4,denlevel)
contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.15,0.92,0.9],xstyle=4,ystyle=5,font=1
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='ekbar [joule]',font=1
device,/close
endfor
endfor
end
