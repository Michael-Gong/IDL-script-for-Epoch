pro fieldanime
restore,'./sav/parameter.sav'
;for n=0,nfield-1 do begin
for i=0,199 do begin
a=getdata(i,/ez)
field=a.(3)
x=getdata(i,/grid)
x=x.(3).x
device,decomposed=1,/tt_font
!P.MULTI=[0,1]
loadct,1
plot,congrid(x[plotarea[0]:plotarea[1]],rex),congrid(field[plotarea[0]:plotarea[1]],rex),$
xtitle='x [!9m!3m]',ytitle='E!Iz!N [V/m]',xstyle=9,ystyle=9,yrange=[-6e12,6e12],pos=[0.15,0.15,0.8,0.9],charsize=1.5,charthick=1.5,font=1
WRITE_GIF,'ez.gif',tvrd() ,delay_time=0.2,/multiple,repeat_count=0
;endfor
endfor
WRITE_GIF,'x_px.gif',/close
end
