FUNCTION swfield,t,x
  a=250
  field=dblarr(2,3)
  field[0,2]=a*cos(x[0]-t)+a*cos(2.0/3.0*x[0]+t)
  field[1,0]=2*a*sin(2*!pi*x[1])*cos(2*!pi*t)
  field[1,1]=-2*a*sin(2*!pi*x[0])*cos(2*!pi*t)
  return, field
end