if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="Fig3";
settings.render=16;
settings.outformat="png";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(6cm);
pen r = rgb(244/255,107/255,103/255)+linewidth(5);
pen b = rgb(103/255,107/255,244/255) + linewidth(3);
//pen g = rgb(103/255,244/255,152/255) + linewidth(2);
pen g = rgb(50/255,200/255,100/255) + linewidth(3);
pen p = rgb(225/255,200/255,83/255) + linewidth(4);
pen c = rgb(178/255,223/255,87/255) + linewidth(2);
pen gr = mediumgray + linewidth(6);
pen o = rgb(245/255,179/255,135/255) + linewidth(2);
pen m = rgb(189/255,86/255,220/255) + linewidth(2);

pair A = (0,0);
pair C = (0,0);
pair B = (2,0);
pair v1 = (1,0);
pair v2 = (2,0);

draw(A--B,black+1);
dot("$A$",A,N,r);
dot("$B$",B,N,r);
dot("$C$",C,S,r);
dot("$10$",v1,S,b);
dot("$9$",v2,S,b);


