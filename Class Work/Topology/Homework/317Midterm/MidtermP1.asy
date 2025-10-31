if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="MidtermP1";
if(settings.render < 0) settings.render=4;
settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);
pair A,B,C,D,E,F,G,H;
A = dir(0);
B = dir(45);
C = dir(90);
D = dir(135);
E = dir(180);
F = dir(225);
G = dir(270);
H = dir(315);

pen r = rgb(244/255,107/255,103/255) + linewidth(2);
pen b = rgb(103/255,107/255,244/255) + linewidth(2);
pen g = rgb(103/255,244/255,152/255) + linewidth(2);
pen p = rgb(225/255,200/255,83/255) + linewidth(2);
pen c = rgb(178/255,223/255,87/255) + linewidth(2);
pen gr = mediumgrey + linewidth(2);
pen o = rgb(245/255,179/255,135/255) + linewidth(2);
pen m = rgb(189/255,86/255,220/255) + linewidth(2);

filldraw(A--B--C--cycle,lightgray);
filldraw(C--D--E--cycle,lightgray);
filldraw(E--F--G--cycle,palegray);
filldraw(G--H--A--cycle,palegray);
filldraw(A--C--E--cycle,palegray);
filldraw(E--G--A--cycle,lightgray);

draw(A--B, r, arrow=Arrow(size=3mm,position=0.55));
draw(B--C, b, arrow=Arrow(size=3mm,position=0.55));
draw(D--C, r, arrow=Arrow(size=3mm,position=0.55));
draw(E--D, b, arrow=Arrow(size=3mm,position=0.55));
draw(E--F, g, arrow=Arrow(size=3mm,position=0.55));
draw(F--G, p, arrow=Arrow(size=3mm,position=0.55));
draw(H--G, g, arrow=Arrow(size=3mm,position=0.55));
draw(A--H, p, arrow=Arrow(size=3mm,position=0.55));

draw(A--C, c, arrow=Arrow(size=3mm,position=0.55));
draw(E--C, c, arrow=Arrow(size=3mm,position=0.55));
draw(A--G, m, arrow=Arrow(size=3mm,position=0.55));
draw(E--G, m, arrow=Arrow(size=3mm,position=0.55));
draw(A--E, o, arrow=Arrow(size=3mm,position=0.55));

label("$\mathbf{a}$",dir(22.5), r);
label("$\mathbf{b}$",dir(45+ 22.5), b);
label("$\mathbf{a}$",dir(90+22.5), r);
label("$\mathbf{b}$",dir(135+22.5), b);
label("$\mathbf{c}$",dir(180+22.5), g);
label("$\mathbf{d}$",dir(225+22.5), p);
label("$\mathbf{c}$",dir(270+22.5), g);
label("$\mathbf{d}$",dir(315+22.5), p);

real rad = 0.6;

label("$\mathbf{x_1}$",rad*dir(45), c);
label("$\mathbf{x_2}$",rad*dir(135), c);
label("$\mathbf{y_1}$",rad*dir(225), m);
label("$\mathbf{y_2}$",rad*dir(315), m);
label("$\mathbf{z}$",(0,0.1), o);

label("$E$",dir(315)*0.85);
label("$F$",dir(45)*0.85);
label("$G$",dir(135)*0.85);
label("$H$",dir(225)*0.85);
label("$I$",(0,0.4));
label("$J$",(0,-0.4));

for(int i=0; i < 8; ++i){
	dot(" ",dir(45*i),black+linewidth(6));
	dot(" ",dir(45*i),white+linewidth(4));
}
