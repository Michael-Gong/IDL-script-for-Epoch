FUNCTION givefield,t,x
field=dblarr(4,3)
a0=250.0
;field[0,1]=-a0*sin(2*!pi*(x[2]-t))
;field[1,0]=a0*sin(2*!pi*(x[2]-t))
field[0,1]=2*a0*cos(2*!pi*x[2])*sin(2*!pi*t)
field[1,0]=2*a0*sin(2*!pi*x[2])*cos(2*!pi*t)
return,field

end
