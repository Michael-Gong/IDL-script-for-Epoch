pro hamiton
a=250.0
x=dindgen(1000)/500.0-1.0
g=dindgen(500)/500*a+100
hamiton=dblarr(1000,500)
h=dblarr(1000,500)
device,decomposed=1
loadct,39
for t=0,99 do begin
!p.multi=[0,2]
for j=0,499 do begin
    for i=0,999 do begin
        hamiton[i,j]=g[j]+2*a^2*cos(2*!pi*x[i])^2/g[j]*sin(2*!pi*(t/100.0))^2
        h[i,j]=g[j]+2*a^2*cos(2*!pi*x[i])^2/g[j]
    endfor
endfor

;save,x,g,hamiton,filename='./hamiton.sav'
levels=findgen(1000)/1000*(max(h)-min(h))+min(h)
contour,hamiton,x,g,levels=levels,/fill,position=[0.1,0.1,0.85,0.9],title='time='+string(t/100.0)+'hamiton for x and gamma'

xx=rebin(transpose(levels),4,1000)
contour,xx,levels=levels,/fill,position=[0.89,0.1,0.91,0.9]
print,'finished',t/100.0*100,'%'
write_gif,'hamiton.gif',tvrd(),delay_time=25,/multiple,repeat_count=0
endfor
;save,x,g,hamiton,levels,filename='./hamiton.sav'
end