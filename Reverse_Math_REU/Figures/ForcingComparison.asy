if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="asyfig3";
if(settings.render < 0) settings.render=4;
settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(12cm);

void branch(int[] b, pen c = cmyk(red)+linewidth(2)+opacity(0.15), pair start = (0,0), int neck = 3){
int L = b.length;
real x = 25;
real y = 32;
real ycurrent = 0;
path p = nullpath;
for(int i = 0; i < L-1; ++i){
real step = 10;
if(i>neck-1){
step = 100/(2**i);
}
real ynext = ycurrent + (b[i]*2-1)*step;
pair A = start + (x*i,ycurrent);
pair B = start + (x*(i+1),ynext);
path q = A--B;
p = p&q;
ycurrent = ynext;
}
draw(p,c);
}

branch(new int[]{0,1,0,1,1,1,1,0});
branch(new int[]{0,1,0,1,1,1,0,0});
branch(new int[]{0,1,0,1,1,0,1,0});
branch(new int[]{0,1,0,1,1,0,0,0});
branch(new int[]{0,1,0,1,0,1,1,0});
branch(new int[]{0,1,0,1,0,1,0,0});
branch(new int[]{0,1,0,1,0,0,1,0});
branch(new int[]{0,1,0,1,0,0,0,0});
branch(new int[]{0,1,0,0,1,1,1,0});
branch(new int[]{0,1,0,0,1,1,0,0});
branch(new int[]{0,1,0,0,1,0,1,0});
branch(new int[]{0,1,0,0,1,0,0,0});
branch(new int[]{0,1,0,0,0,1,1,0});
branch(new int[]{0,1,0,0,0,1,0,0});
branch(new int[]{0,1,0,0,0,0,1,0});
branch(new int[]{0,1,0,0,0,0,0,0});
branch(new int[]{0,1,0,1,1,1,1,1});
branch(new int[]{0,1,0,1,1,1,0,1});
branch(new int[]{0,1,0,1,1,0,1,1});
branch(new int[]{0,1,0,1,1,0,0,1});
branch(new int[]{0,1,0,1,0,1,1,1});
branch(new int[]{0,1,0,1,0,1,0,1});
branch(new int[]{0,1,0,1,0,0,1,1});
branch(new int[]{0,1,0,1,0,0,0,1});
branch(new int[]{0,1,0,0,1,1,1,1});
branch(new int[]{0,1,0,0,1,1,0,1});
branch(new int[]{0,1,0,0,1,0,1,1});
branch(new int[]{0,1,0,0,1,0,0,1});
branch(new int[]{0,1,0,0,0,1,1,1});
branch(new int[]{0,1,0,0,0,1,0,1});
branch(new int[]{0,1,0,0,0,0,1,1});
branch(new int[]{0,1,0,0,0,0,0,1});

pen c = heavygray+linewidth(3.8);

branch(new int[]{0,1,0,1,1,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,0,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,0,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,0,1},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,0,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,0,0,1},c,start=(0,-60));

branch(new int[]{0,1,0,0,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,0,0},c,start=(0,-60));
branch(new int[]{0,0,1},c,start=(0,-60));

pen c = white+linewidth(2.4);

branch(new int[]{0,1,0,1,1,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,0,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,0,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,0,1},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,0,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,0,0,1},c,start=(0,-60));

branch(new int[]{0,1,0,0,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,0,0},c,start=(0,-60));
branch(new int[]{0,0,1},c,start=(0,-60));

pen c = cmyk(red)+linewidth(2.0)+opacity(0.15);

branch(new int[]{0,1,0,1,1,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,0,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,1,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,0,0,0},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,1,1,1,0,1},c,start=(0,-60));
branch(new int[]{0,1,0,1,0,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,1,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,1,0,1},c,start=(0,-60));
branch(new int[]{0,1,0,0,0,0,0,1},c,start=(0,-60));

branch(new int[]{0,1,0,1,1,0,1,0},start=(0,-120));
branch(new int[]{0,1,0,1,1,0,0,0},start=(0,-120));
branch(new int[]{0,1,0,1,0,0,1,0},start=(0,-120));
branch(new int[]{0,1,0,1,0,0,0,0},start=(0,-120));
branch(new int[]{0,1,0,0,1,0,1,0},start=(0,-120));
branch(new int[]{0,1,0,0,1,0,0,0},start=(0,-120));
branch(new int[]{0,1,0,0,0,0,1,0},start=(0,-120));
branch(new int[]{0,1,0,0,0,0,0,0},start=(0,-120));
branch(new int[]{0,1,0,1,1,0,1,1},start=(0,-120));
branch(new int[]{0,1,0,1,1,0,0,1},start=(0,-120));
branch(new int[]{0,1,0,1,0,0,1,1},start=(0,-120));
branch(new int[]{0,1,0,1,0,0,0,1},start=(0,-120));
branch(new int[]{0,1,0,0,1,0,1,1},start=(0,-120));
branch(new int[]{0,1,0,0,1,0,0,1},start=(0,-120));
branch(new int[]{0,1,0,0,0,0,1,1},start=(0,-120));
branch(new int[]{0,1,0,0,0,0,0,1},start=(0,-120));

draw((175.9,15)--(175.9,-160),white+linewidth(2.4));

label("Cohen forcing with $p=(0,1,0)$:", (0,10),align=right,fontsize(10pt));
label(minipage("Jockusch-Soare forcing with $p=$ the black-outlined tree:",width=130pt), (0,-50),align=right,fontsize(10pt));
label("Mathias forcing with $E=\{1\},R=\{3,4,6,\dots\}$:", (0,-110),align=right,fontsize(10pt));

