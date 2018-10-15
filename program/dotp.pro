FUNCTION dotp, x,y,n
a=0d
for i=0,n-1 do begin
  a=a+x[i]*y[i]
  endfor
return,a
end
