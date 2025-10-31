if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="MidtermP4";
if(settings.render < 0) settings.render=4;
settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(10cm);

path p = (-1,2)--(-1,3)..(0,4)..(1,3)--(1,2){down}..{right}(2,1)--(3,1)..(4,0)..(3,-1)--(2,-1){left}..{down}(1,-2)--(1,-3)..(0,-4)..(-1,-3)--(-1,-2){up}..{left}(-2,-1)--(-3,-1)..(-4,0)..(-3,1)--(-2,1){right}..{up}cycle;

filldraw(p, rgb(186, 247, 151), black+linewidth(2));

path q =  (-0.7,0){dir(45)}..{dir(-45)}(0.7,0){dir(-135)}..{dir(135)}cycle;

pair A,B,C,D;
A = intersectionpoint((0,0)--(2,2),p);
B = intersectionpoint((0,0)--(-2,-2),p);
D = intersectionpoint((0,0)--(-2,2),p);
C = intersectionpoint((0,0)--(2,-2),p);

path sector = buildcycle(A--B,C--D,p);
fill(sector,paleblue);

draw(A--B, mediumred+linewidth(1.5));
draw(C--D, mediumred+linewidth(1.5));

draw(p, black+linewidth(2));

filldraw(q,white,black+linewidth(2));
filldraw(shift((2.5,0))*q,white,black+linewidth(2));
filldraw(shift((0,2.5))*q,white,black+linewidth(2));
filldraw(shift((-2.5,0))*q,white,black+linewidth(2));
filldraw(shift((0,-2.5))*q,white,black+linewidth(2));

path r = (0,1)--(2,1)..(3,0)..(2,-1)--(0,-1)--(-2,-1)..(-3,0)..(-2,1)--cycle;

real sh = 11;

filldraw(shift(sh,0)*r, rgb(186, 247, 151), black+linewidth(2));

draw((sh-3,0)--(sh-1.5,0), mediumred+linewidth(1.5));

filldraw(shift((sh-1.3,0))*q,white,black+linewidth(2));
filldraw(shift((sh+1.3,0))*q,white,black+linewidth(2));

draw(shift(sh,0)*r, black+linewidth(2));

real dist = sh - 7;
real length = 2;

draw((dist/2 - length/2 + 4,0)--(dist/2 + length/2 + 4,0), arrow=Arrow(size=3mm,position=1.0),black+linewidth(2));
