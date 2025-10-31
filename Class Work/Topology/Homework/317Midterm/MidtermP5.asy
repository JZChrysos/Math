if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="MidtermP5";
if(settings.render < 0) settings.render=4;
settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);
pen r = rgb(244/255,107/255,103/255) + linewidth(2);
pen b = rgb(103/255,107/255,244/255) + linewidth(2);
pen g = rgb(103/255,244/255,152/255) + linewidth(2);
pen p = rgb(225/255,200/255,83/255) + linewidth(2);
pen c = rgb(178/255,223/255,87/255) + linewidth(2);
pen gr = mediumgrey + linewidth(2);
pen o = rgb(245/255,179/255,135/255) + linewidth(2);
pen m = rgb(189/255,86/255,220/255) + linewidth(2);

fill((-1,-1)--(-1,5)--(5,5)--(5,-1)--cycle, lightgrey);

for(int i = 0; i < 5; ++i){
	for(int j = 0; j < 5; ++j){
		pair P = (i,j);
		if(j % 2 == 0){
			draw(P--(i+1,j), r, arrow=Arrow(size=3mm,position=0.6));
			draw((i-1,j)--P, r, arrow=Arrow(size=3mm,position=0.6));
		}
		else{
			draw(P--(i-1,j), r, arrow=Arrow(size=3mm,position=0.6));
			draw((i+1,j)--P, r, arrow=Arrow(size=3mm,position=0.6));
		}
		draw(P--(i,j+1),b, arrow=Arrow(size=3mm,position=0.6));
		draw((i,j-1)--P,b, arrow=Arrow(size=3mm,position=0.6));
	}
}

for(int i = 0; i < 5; ++i){
	for(int j = 0; j < 5; ++j){
		pair P = (i,j);
		dot(" ",P,black+linewidth(6));
		dot(" ",P,white+linewidth(4));
	}
}