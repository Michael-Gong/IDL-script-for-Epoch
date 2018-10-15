pro plo
restore,'trso.sav'
for i=0,500 do begin
   ;iplot,xx[0:250,2,i],xx[0:250,1,i],rgb_table=39,vert_color=bytscl(findgen(250)),/overplot
   ;iplot,xx[251:500,2,i],xx[251:500,1,i],rgb_table=39,vert_color=bytscl(findgen(250)),/overplot
   ;iplot,xx[500:750,2,i],xx[500:750,1,i],rgb_table=39,vert_color=bytscl(findgen(250)),/overplot
   iplot,xx[*,2,i],xx[*,1,i],rgb_table=39,vert_color=bytscl(findgen(500)),/overplot
endfor

end
