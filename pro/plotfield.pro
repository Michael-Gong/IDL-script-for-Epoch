pro plotfield
restore,'./sav/parameter.sav'
restore,'./sav/grid.sav'
restore,'./sav/field.sav'
set_plot,'ps'
for n=0,nfield-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/'+fname[n]+'-'+strtrim(string(starttime+i*interval),2)+'.'+filetype,$
/color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=8,ysize=4.5,font_size=16,/tt_font
!P.MULTI=[0,3]
loadct,33
levels=findgen(fielevel)*2*(min([max(field[*,*,i,n]),abs(min(field[*,*,i,n]))]))/fielevel-min([max(field[*,*,i,n]),abs(min(field[*,*,i,n]))])
contour,congrid(field[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],i,n],500,200),congrid(x[plotarea[0]:plotarea[1],i],500),congrid(y[plotarea[2]:plotarea[3],i],200),$
levels=levels,/fill,title='Time is '+strtrim(string(realtime[i]),2)+' fs',xtitle='x [!9m!3m]',ytitle='y [!9m!3m]',xstyle=9,ystyle=9,pos=[0.15,0.15,0.8,0.9],charsize=1.5,charthick=1.5,font=1
plot,congrid(x[plotarea[0]:plotarea[1],i],500),congrid(field[plotarea[0]:plotarea[1],ny/2,i,n],500),thick=1.5,pos=[0.15,0.15,0.8,0.9],xstyle=5,ystyle=5,color=255,font=1
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='on-axis '+fname[n]+' [V/m]',font=1
xx=rebin(transpose(levels),4,fielevel)
contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.15,0.92,0.9],xstyle=4,ystyle=5,font=1
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle=fname[n]+' [V/m]',font=1
device,/close
endfor
endfor
end
