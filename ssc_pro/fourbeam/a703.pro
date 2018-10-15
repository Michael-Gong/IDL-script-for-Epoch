pro a703
n=100
series=findgen(200)+1000
set=0

if (set eq 1) then restore,'chaostracelp.sav' else  restore,'chaostracelp.0.sav'

pxx=congrid(px[100:900,*],n,2000)
xx=congrid(x[100:900,*],n,2000)

iplot,(xx[*,series]+0.25)mod 1,pxx[*,series],linestyle=6,symbol=3,sym_size=1,sym_color='blue'

if (set eq 1) then restore,'chaostracelp1.sav' else  restore,'chaostracelp1.0.sav'

pxx=congrid(px[100:900,*],n,2000)
xx=congrid(x[100:900,*],n,2000)

iplot,(xx[*,series]+0.25)mod 1,pxx[*,series],linestyle=6,symbol=3,sym_size=1,sym_color='blue'

if (set eq 1) then  restore,'chaostracecp.sav' else restore,'chaostracecp.0.sav'


pxx=congrid(px[100:900,*],n,2000)
xx=congrid(x[100:900,*],n,2000)

iplot,(xx[*,series]+0.25)mod 1,pxx[*,series],linestyle=6,symbol=3,sym_size=1,sym_color='blue'

if(set eq 1) then  restore,'chaostracecp1.sav' else  restore,'chaostracecp1.0.sav'


pxx=congrid(px[100:900,*],n,2000)
xx=congrid(x[100:900,*],n,2000)

iplot,(xx[*,series]+0.25)mod 1,pxx[*,series],linestyle=6,symbol=3,sym_size=1,sym_color='blue'

end