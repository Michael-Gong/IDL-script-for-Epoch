FUNCTION swfield2d,t,x
  a=100
  field=dblarr(2,3)
  field[0,2]=2*a*cos(2*!pi*x[0])*sin(2*!pi*t)
  field[1,1]=-2*a*sin(2*!pi*x[0])*cos(2*!pi*t)
  return, field
end