pro haha
a=300
x=findgen(500)/500
px=findgen(600)*4-299.5*4
H1=findgen(500,600)
h=0
for n=0,99 do begin
t=0.01*n
for i=0,499 do begin
    for j=0,599 do begin
        H1[i,j]=sqrt(1+px[j]^2+(2*a*cos(2*!pi*x[i])*cos(2*!pi*t))^2)
    endfor
endfor
h=h+H1
endfor
h=h/100.0
device,decomposed=0
loadct,39
l=findgen(200)/200*(max(h)-min(h))+min(h)
icontour,h,x,px,rgb_table=56,levels=l,label=none
end
