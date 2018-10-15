pro hb
a=250.0
restore,'./hatrace.sav'
xxx=xx[*,2,*] mod 1.0
xxx= (xxx +1.0) mod 1.0
ppp=pp[*,2,*]

x=findgen(200)/200
px=findgen(2000)-1000
x1=rebin(x,200,2000)
px1=rebin(transpose(px),200,2000)
h=dblarr(200,2000)

device,decomposed=1
loadct,39
h0=sqrt(1+px1^2+a^2*4*(sin(2*!pi*x1))^2)
levels=findgen(1000)/1000*(max(h0)-min(h0))+min(h0)
for i=0,500 do begin
    h=sqrt(1+px1^2+a^2*4*(sin(2*!pi*x1))^2)
    contour,h,x,px,levels=levels,/fill,title='H_x_px,time at '+strtrim(string(1.0*i/100.0),2)+' T'
    plots,xxx[i,0,*],ppp[i,0,*],psym=2,color=0
    write_gif,'hc.gif',tvrd(),delay_time=20,/multiple,repeat_count=0
    print,'finished',100.0*i/100.0,'%'
endfor

end

