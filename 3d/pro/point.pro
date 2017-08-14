pro point
lamda=1.00
w0=4.00
ZR=w0^2*!pi/lamda


x=dblarr(500)
y=dblarr(500)
z=dblarr(500)
for i=0,499 do begin
   x[i]=i*0.080-20 
   y[i]=i*0.080-20
   z[i]=i*0.080-20
endfor
B=dblarr(500,500)
E=dblarr(500,500,500)
for k=100,199 do begin
    for i=200,299 do begin
       for j=200,299 do begin
          E[i,j,k]=100.0/sqrt(1+z[k]^2/ZR)*exp(-(x[i]^2+y[j]^2)/(w0^2*(1+z[k]^2/ZR)))
          if (i eq 250) then B[j,k]=E[i,j,k]
       endfor
    endfor
endfor

icontour,B,y,z
end

