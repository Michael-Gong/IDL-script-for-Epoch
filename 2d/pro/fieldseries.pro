pro fieldseries,start,stop,interval
ez=dblarr(1000,1000)
bx=dblarr(1000,1000)
by=dblarr(1000,1000)

for i=0,(stop-start)/interval do begin
    a=getdata(start+i*interval,/ez,/bx,/by)
    ez0=a.ez
    ez=[[[ez]],[[ez0]]]
    bx0=a.bx
    bx=[[[bx]],[[bx0]]]
    by0=a.by
    by=[[[by]],[[by0]]]
    print,'finished',100.0*(i*interval+1)/(stop-start+1),'%'
endfor
a=getdata(start,/grid)
x=a.x
y=a.y
save,ez,bx,by,x,y,filename='./fieldseries.sav'
end
