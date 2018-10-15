pro aa
a0=300
a=dblarr(1000,500)
x=findgen(1000)/100
y=findgen(500)/100-2.5
t=5
t0=2.5
w=1
for i=0,999 do begin
  for j=0,499 do begin
     a[i,j]=a0*exp(-((t-x[i])/t0)^2)*exp(-(y[j]/w)^2)*cos(2*!pi*(t-x[i]))
  endfor
endfor
b=[a,dblarr(300,500),rotate(a,2)]
;device,decomposed=0
;loadct,39
icontour,abs(b),rgb_table=25,levels=findgen(200)*max(b)/199,/fill
end