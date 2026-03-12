if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="Fig2";
settings.render=16;
settings.outformat="png";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import three;

size(6cm);
pen r = rgb(244/255,107/255,103/255)+linewidth(0.5);
pen b = rgb(103/255,107/255,244/255);
pen g = rgb(103/255,244/255,152/255) + linewidth(4);
pen p = rgb(225/255,200/255,83/255) + linewidth(4);
pen c = rgb(178/255,223/255,87/255) + linewidth(2);
pen gr = mediumgray + linewidth(6);
pen o = rgb(245/255,179/255,135/255) + linewidth(2);
pen m = rgb(189/255,86/255,220/255) + linewidth(2);

int A = 16;
int B = 8;
real R = 1;
real length = 0.15;
//real pi = 3.142;

//path3 c = circle((0,0,0), R, normal=X);
//
//surface torus = surface(c, c=(0,0,0), axis=Z);

draw(unitsphere, surfacepen = b);

dot(" ",(0,0,1), r+3);

for(int i = 0; i < A; ++i){
	for(int j = 0; j < B; ++j){
		real theta = 2*pi*i/A;
		real phi = -1*pi/2 + pi*j/B;
		triple P = (cos(theta) * (R*cos(phi)), sin(theta)*(R*cos(phi)),R*sin(phi));
		triple vec = length*(cos(theta) * (R*cos(phi + pi/2)), sin(theta)*(R*cos(phi + pi/2)),R*sin(phi + pi/2));
		draw(P--(P + vec), arrow=Arrow3(emissive(r)), r);
	}
}

//draw((0,3,0)--(0,3,0.5), arrow=Arrow3(DefaultHead2,emissive(r)), r);

currentprojection=perspective((1.25,1,1.3));
