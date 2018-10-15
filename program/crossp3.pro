FUNCTION crossp3,x,y
a=dblarr(3)
a[0]=x[1]*y[2]-x[2]*y[1]
a[1]=-x[0]*y[2]+x[2]*y[0]
a[2]=x[0]*y[1]-x[1]*y[0]
return, a
end