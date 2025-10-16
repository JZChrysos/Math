if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="317HW2P3";
if(settings.render < 0) settings.render=4;
settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(10cm);
//draw((0,0)--(0,6)--(6,6)--(6,0)--(0,0), black+linewidth(2));
//
//draw((2,0)--(2,6));
//draw((4,0)--(4,6));
//draw((0,2)--(6,2));
//draw((0,4)--(6,4));
//
//draw((1,0)--(0,1));
//draw((3,0)--(0,3));
//draw((5,0)--(0,5));
//draw((1,6)--(6,1));
//draw((3,6)--(6,3));
//draw((5,6)--(6,5));

pen r = mediumred + linewidth(2);
pen b = mediumblue + linewidth(2);

for(int i = 0; i < 3; ++i){
	for(int j = 0; j < 3; ++j){
		real x = 2*i;
		real y = 2*j;
		draw((x,y)--(x+1,y),r,arrow=Arrow(size=3mm,position=0.6));
		draw((x+1,y)--(x,y+1),r,arrow=Arrow(size=3mm,position=0.6));
		draw((x,y+1)--(x,y),r,arrow=Arrow(size=3mm,position=0.6));
		
		draw((x+2,y+1)--(x+1,y+2),b,arrow=Arrow(size=3mm,position=0.6));
		draw((x+1,y+2)--(x+2,y+2),b,arrow=Arrow(size=3mm,position=0.6));
		draw((x+2,y+2)--(x+2,y+1),b,arrow=Arrow(size=3mm,position=0.6));
		
		draw((x+1,y)--(x+2,y),b,arrow=Arrow(size=3mm,position=0.6));
		draw((x+2,y+1)--(x+2,y),r,arrow=Arrow(size=3mm,position=0.6));
		draw((x,y+2)--(x,y+1),b,arrow=Arrow(size=3mm,position=0.6));
		draw((x,y+2)--(x+1,y+2),r,arrow=Arrow(size=3mm,position=0.6));
		}
	}

for(int i = 0; i < 7; ++i){
	for(int j = 0; j < 7; ++j){
		if( i * j % 2 == 0){
			dot(" ",(i,j),black+linewidth(5));
			dot(" ",(i,j),white+linewidth(3));
		}
	}
}