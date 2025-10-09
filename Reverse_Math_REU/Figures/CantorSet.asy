if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="asyfig1";
if(settings.render < 0) settings.render=4;
settings.outformat="pdf";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);
			
			pen T = deepgreen;
			
			void closedint(real L, real R, real y, pen c=black, bool d = true){
			real w = abs(L-R);
			real h = 0.01;
			draw((L,y)--(R,y),c+0.6);
			draw((L,y-h)--(L,y+h),c+0.6);
			draw((R,y-h)--(R,y+h),c+0.6);
			if (d){
			dot(" ", ((L+R)/2,y), T);
			}
			}
			
			void openint(real L, real R, real y, pen c){
			real w = abs(L-R);
			real h = 0.015;
			real x = 0.008;
			pair A,B,C,D,E,F;
			A = (L-w/3,y);
			B = (L-w/3 + x,y+h);
			C = (R+w/3 - x,y+h);
			D = (R+w/3,y);
			E = (R+w/3 - x,y-h);
			F = (L-w/3 + x,y-h);
			path p = F{left}..{up}A{up}..{right}B;
			path q = C{right}..{down}D{down}..{left}E;
			draw(p,c+0.8);
			draw(q,c+0.8);
			}
			
			closedint(0,1,0);
			closedint(0,1/3,-0.1);
			closedint(2/3,1,-0.1);
			closedint(2/3,7/9,-0.2);
			closedint(8/9,1,-0.2);
			closedint(0,1/9,-0.2);
			closedint(2/9,1/3,-0.2,false);
			
			closedint(0,1/27,-0.3,false);
			closedint(2/27,3/27,-0.3,true);
			closedint(6/27,7/27,-0.3,false);
			closedint(8/27,1/3,-0.3,false);
			closedint(18/27,19/27,-0.3,true);
			closedint(20/27,21/27,-0.3,true);
			closedint(24/27,25/27,-0.3,false);
			closedint(26/27,1,-0.3,true);
			
			openint(2/9,1/3,-0.2,blue);
			openint(0,1/27,-0.3,blue);
			openint(24/27,25/27,-0.3,blue);
			
			draw((0.5,0)--(0.5/3,-0.1)--(0.5/9,-0.2),T+1.0);
			draw((0.5,0)--(0.5/3+2/3,-0.1)--(0.5/9+8/9,-0.2),T+1.0);
			draw((0.5/3+2/3,-0.1)--(0.5/9+6/9,-0.2),T+1.0);
			draw((5/54,-0.3)--(0.5/9,-0.2),T+1.0);
			draw((37/54,-0.3)--(0.5/9+6/9,-0.2),T+1.0);
			draw((41/54,-0.3)--(0.5/9+6/9,-0.2),T+1.0);
			draw((53/54,-0.3)--(0.5/9+8/9,-0.2),T+1.0);
			
			label("$\vdots$",(5/54,-0.33),T);
			label("$\vdots$",(37/54,-0.33),T);
			label("$\vdots$",(41/54,-0.33),T);
			label("$\vdots$",(53/54,-0.33),T);