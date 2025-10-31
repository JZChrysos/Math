if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="MidtermP6";
settings.render=16;
settings.outformat="png";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import three;

size(6cm);
pen r = rgb(244/255,107/255,103/255) + linewidth(4);
pen b = rgb(103/255,107/255,244/255) + linewidth(4);
pen g = rgb(103/255,244/255,152/255) + linewidth(4);
pen p = rgb(225/255,200/255,83/255) + linewidth(4);
pen c = rgb(178/255,223/255,87/255) + linewidth(2);
pen gr = mediumgray + linewidth(6);
pen o = rgb(245/255,179/255,135/255) + linewidth(2);
pen m = rgb(189/255,86/255,220/255) + linewidth(2);

path3 p1,p2,p3,p4,p0;
p0=(0,-2,0)..(0.5,-1,0.5)..{(-1,1,0)}(0,0,1){(-1,1,0)}..(-1,2,0)..(0,3,0.5)..(1,2,1)..{(-1,-1,0)}(0,0,0){(-1,-1,0)}..(-0.5,-1,0.5)..(0,-2,1)..(2,0,0.5)..(1,2,0)..(-1,2,1)..(-2,0,0.5)..cycle;
//p1 = (0,0,0)..(-0.5,-1,0.5)..(0,-2,1)..(2,0,0.5)..(1,2,0);
//p2 = (1,2,0)..(-1,2,1)..(-2,0,0.5)..(0,-2,0);
//p3 = (0,-2,0)..(0.5,-1,0.5)..(0,0,1)..{up}(-1,2,0);
//p4 = (-1,2,0)..(0,3,0.5)..(1,2,1)..(0,0,0);
p1 = subpath(p0,0,3);
p2 = subpath(p0,3,6);
p3 = subpath(p0,6,10);
p4 = subpath(p0,10,13);

path3 below = shift((0,0,-0.2)) * p0;

draw(below,gr);
draw(p1,r);
draw(p2,b);
draw(p3,g);
draw(p4,p);

label("$\mathbf{a}$",(-1.5,-1,0.5),p);
label("$\mathbf{d}$",(1.5,-1,0.5),g);
label("$\mathbf{b}$",(-1,0.7,0.5),r);
label("$\mathbf{c}$",(1,0.7,0.5),b);

void normalvec(real t, real L = 0.25, path3 q){
	triple V = dir(q,t);
	pair v = (xpart(V),ypart(V));
	v = dir(v);
	v = rotate(90)*v;
	triple V = (xpart(v),ypart(v),0);
	triple P = point(q,t);
	draw(P--(P+L*V), mediumgray+linewidth(0.5), arrow=Arrow3(TeXHead2));
}

real len = arclength(below);
real T = arctime(below,len);
real[] Ts = {0.08,0.2,0.27,0.34,0.41,0.53,0.64,0.7,0.8,0.9,0.97};

for(int i = 0; i < Ts.length; ++i){
	normalvec(Ts[i]*T,below);
}

currentprojection = TopView;
