pro plop
  restore,'tr.sav'
  for i=0,124 do begin
    ;iplot,xx[0:250,2,i],xx[0:250,1,i],rgb_table=39,vert_color=bytscl(findgen(250)),/overplot
    ;iplot,xx[251:500,2,i],xx[251:500,1,i],rgb_table=39,vert_color=bytscl(findgen(250)),/overplot
    ;iplot,xx[500:750,2,i],xx[500:750,1,i],rgb_table=39,vert_color=bytscl(findgen(250)),/overplot
    iplot,((xx[9000:9500,2,i] mod 1) + 1) mod 1,pp[9000:9500,2,i],rgb_table=39,vert_color=bytscl(findgen(500)),symbol=3,linestyle=6,/overplot
    ;iplot,xx[0001:2000,2,i],pp[001:2000,2,i],rgb_table=39,vert_color=bytscl(findgen(500)),symbol=3,linestyle=6,/overplot
  endfor

end