function ffield,t,x
field=dblarr(4,3)
a0=250.0
set = 0
if (set eq 0) then begin
  field[0,1]=-2*a0*cos(2*!pi*x[0])*cos(2*!pi*t)
  field[0,2]= 2*a0*cos(2*!pi*x[0])*sin(2*!pi*t)
  field[1,1]= 2*a0*sin(2*!pi*x[0])*cos(2*!pi*t)
  field[1,2]=-2*a0*sin(2*!pi*x[0])*sin(2*!pi*t)
endif else begin
  field[0,2]=2*a0*cos(2*!pi*x[0])*sin(2*!pi*t)
  field[1,1]=2*a0*sin(2*!pi*x[0])*cos(2*!pi*t)
endelse
return,field

end