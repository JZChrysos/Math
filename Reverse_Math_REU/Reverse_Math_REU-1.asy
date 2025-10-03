if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="Reverse_Math_REU-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
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
			
			\end{asy}
			
			\caption{$T$ embedded into the Cantor set. The blue intervals are $\U$.}
		\end{figure}
		
		Because there are no infinite paths in $T$, every infinite binary sequence $\ell$ has a smallest initial segment $\sigma$ where it first exits $T$, for which the real number $f(\ell)$ is in $(a_{\sigma},b_{\sigma})$. This shows that $\U$ covers all of $f(2^{\N})$, i.e. the Cantor set.\\
		
		Now, Heine-Borel implies that $[0,1]$ is compact, and the Cantor set is closed in $[0,1]$ hence it is compact as well. Thus there must be a finite subcover of the Cantor set among $\U$, represented by some $\sigma_1,\sigma_2,\dots,\sigma_j\in U$. Every $\tau\in T$ must be an initial segment of one of these $\sigma_i$, so $T$ is bounded in depth by $\max\{|\sigma_1|,|\sigma_2|,\dots,|\sigma|_j\}$, and hence finite.
	\end{proof}\\
	
	These results suggest the idea that $\WKL$ is the ``combinatorial core'' of compactness, one of the many insights to come out of reverse mathematics. But the question remains: is $\sf{WKL}$ actually weaker than $\KL$ over $\RCA$?
	
	\newpage
	
	
	
	
	\section{Separation of Problems}
	
	The goal for this section is to prove that $\WKL$ does not prove $\KL$, but we will approach the question more generally: given two problems $\sf{A}$ and $\sf{B}$, how can we prove that $\sf{A}\centernot\implies \sf{B}$? We do it by building a model of $\sf{A}$ in which $\sf{B}$ does not hold. If there is such a model, then that immediately precludes any proof of $\sf{A}\implies \sf{B}$.\\
	
	We've already implicitly used this idea in a simple form when showing that $\RCA$ does not prove the existence of any non-computable set. Similarly, by again working with the $\SS=\Delta_1$ model of $\RCA$, we can show that $\WKL$ is stronger than $\RCA$:\\
	
	\noindent \textbf{Theorem 3.1:} $\RCA\centernot\implies \WKL$.
	\begin{proof}
		In this model, we can construct a binary tree $T$ in $S$ for which there is no path in $S$. In particular, we will ensure that the path is not computable by making the $e$th element of all paths differ from $\Phi_e(e)$: define $T$ by
		$$
		\sigma \in T \iff (\forall e < |\sigma|):\; \neg\big(\Phi_e(e)[|\sigma|]\downarrow \, \^ \;\, \sigma(e) = \Phi_e(e)\big).
		$$
		That is, $T$ severs a path at the depth when it first detects that $\sigma(e)=\Phi_e(e)$ for any $e$ where $\Phi_e(e)$ halts, and it eventually detects all such discrepancies. Thus, any infinite path (there are many) must disagree with all computable functions, and hence is non-computable.
	\end{proof}\\
	
	Note the difference in strength between $\KL$ and $\sf{WKL}$ here: from the perspective of $\ACA$, as shown in the previous section, there exists a computable tree $T\subseteq \N^{\N}$ whose only path computes $\emptyset'$. In contrast, among \textit{binary} trees $T\subseteq 2^{\N}$, we can force all paths to be non-computable but cannot hit any particular complexity. We could say that $\KL$ \textit{avoids} solutions below $\emptyset'$, whereas $\sf{WKL}$ only avoids (as far as we know) solutions equivalent to $\emptyset$. These are examples of \textit{strength} properties. To separate $\sf{WKL}$ from $\KL$, we will show that $\sf{WKL}$ holds some \textit{weakness} property.\\
	
	Showing that a problem is not provable in $\RCA$ is a convenient case because $\RCA$ has a standard model that we already understand well. But what does a model of $\WKL$ look like? Here, there is not a simple choice for $\SS$ we can just use---we have to make one ourselves. This section will be about the process of model construction and the many tools one can use during that process.
	
	% \newpage
	
	\subsection{Methods of Model-building}
	
	Suppose that we want to construct a model of $\sf{B}\^\neg \sf{A}$, where $\sf{A},\sf{B}$ are two principles between $\RCA$ and $\ACA$.
	
	% Let $\CC(X)$ denote the cone below $X$, i.e. $\{Z:Z\leq_T X\}$. We'll build $\SS$ in stages $$\CC(\emptyset)\subset \CC(X_1)\subset \CC(X_2)\subset \dots$$
	% and then take
	% $$
	% \SS := \bigcup_{i\in\N} \CC(X_i).
	% $$
	% To choose $X_i$
	
	To construct a model of $\sf{B}$ is fairly simple: you just keep adding solutions to $\sf{B}$ instances until (after $\N$-many steps) everything has a solution. Define sets $Z_0\leq_T Z_1 \leq_T \dots$ inductively as follows: first, let $Z_0=\emptyset$. To define $Z_j$ for $j\geq 1$, let
	$$X := \text{ the $e_j$th set computed by $Z_{n_j}$}$$
	where $j\mapsto (e_j,n_j)$ is an ordering of $\N\times \N$ such that $n_j<j$ (so that $Z_j$ is not defined referencing itself). If this $X$ is a $\sf{B}$-instance without a $Z_{j-1}$-computable solution, choose a solution $Y$ and let
	$$
	Z_j := Z_{j-1} \oplus Y.
	$$
	Otherwise we let $Z_j=Z_{j-1}$. Finally, define $\SS$ to be the Turing ideal generated by the sets $Z_j$.
	
	For every $\sf{B}$-instance $X\in \SS$, there is a finite stage $n$ in which $X$ is first computable from $Z_n$, and $X$ is the $e$th set computable from $Z_n$ for some $e$, so there must be a stage $j>n$ for which $(e_j,n_j)=(e,n)$ and so a solution to $X$ is added (or already exists). \\
	
	The difficulty is not in modeling $\sf{B}$, but in \textit{not} modeling $\sf{A}$. It suffices to pick a particular $\sf{A}$-instance and deliberately avoid adding any of its solutions to $\SS$ at any stage. In the case of $\sf{A}=\KL$, for example, we might avoid adding $\emptyset'$. But moreover, one also has to avoid adding sets which compute $\emptyset'$, and instances whose only solutions compute $\emptyset'$, and so on. Thus, we look for a sharp dividing line between sets we must add (e.g. $\emptyset$) and sets we don't want to add (e.g. $\emptyset'$) for which we can keep the construction on the right side of the line.\\
	
	% Now, we'll need to repeatedly add solutions to instances of $\sf{B}$, thus we need some way of selecting a particular solution for each instance. Let
	% $$L:2^{\N}\to 2^{\N}$$
	% map each instance of $\sf{B}$ to a solution of that instance (and for all other $X$ assume $L(X)=\emptyset$). Given a choice of $L$, we can define $\SS$ as the minimal collection of sets which includes $\Delta_1$ and is closed under $L$ and $\Delta_1$-comprehension.
	
	% This $\SS$ is a model of $\sf{B}$, but possibly of $\sf{A}$ as well. To prevent this, we need to choose a solution-finding map $L$ with special properties.
	
	
	% We begin with a collection of sets $S_0=\Delta_1$. If $\sf{B}$ is stronger than $\RCA$, then $S_0$ will contain $\sf{B}$-instances for which it has no solutions, so we must expand to a larger Turing ideal $S_1\supset S_0$ which solves all the $\sf{B}$-instances in $S_0$. But now $S_1$ may have unsolved $\sf{B}$-instances, so we go on:
	% $$
	% S_0 \subset S_1 \subset S_2\subset \dots
	% $$
	% and finally we cap our model off by taking the union
	% $$
	% \SS := \bigcup_{j\in \N} S_j.
	% $$
	% Now we have a model of $\sf{B}$. But while we build this model, we also have to be careful to avoid accidentally making $\SS$ a model of $\sf{A}$ as well.
	
	
	% But this actually entails avoiding many sets: in particular,
	% \begin{align*}
		% E_1 &= \{X: \text{ all $\sf{B}$-solutions to $X$ compute $\emptyset'$}\}\\
		% E_2 &= \{X: \text{ all $\sf{B}$-solutions to $X$ compute something in $E_1$}\}\\
		% E_3 &= \{X: \text{ all $\sf{B}$-solutions to $X$ compute something in $E_2$}\}\\
		% \vdots &\;\;\;\;\;\;\;\;\vdots
		% \end{align*}
	% Thus, we need some way to track the ``complexity'' of solutions that we add to $\SS$, and keep this complexity low.\\
	
	\noindent \textbf{Definition (Preservation and Avoidance)}: Let $\QQ$ be some collection of sets that is downward-closed under $\leq_T$ (but not necessarily a Turing ideal). We say that $\sf{B}$ \textit{preserves} $\QQ$ if for every $Z\in \QQ$ and every $\sf{B}$-instance $X\leq_T Z$, there is a solution $Y$ such that $Y\oplus Z\in \QQ$.
	
	If $\QQ$ is upward-closed under $\leq_T$ and $\sf{B}$ preserves $\overline{\QQ}$, then we say $\sf{B}$ \textit{avoids} $\QQ$.\\
	
	
	% Let $\K$ be a map between classes of sets,
	% $$
	% \K : 2^{\N} \to \PP(2^{\N}).
	% $$
	% We can measure the complexity of $\sf{B}$ against such a $\K$:
	% \begin{itemize}
		% \item $\sf{B}$ \textit{admits solutions in $\K$} if for every set $X\subset \N$, the class $\K(X)$ contains a solution to every $X$-computable $\sf{B}$-instance.
		% \item $\sf{B}$ \textit{omits solutions in $\K$} if for every $X\subset \N$, the class $\K(X)$ \textit{does not} contain any solution to at least one $X$-computable $\sf{B}$-instance.
		% \end{itemize}
	% If $\sf{B}$ admits solutions in $\K$, then we may build the model by choosing $L(X)\in \K(X)$ for all $X$. This is useful when repeated application of $\K$ is ``bounded'' inside some complexity-level, in the sense that
	% $$
	% \K^{\N}(\Delta_1) :=\bigcup_{n\in \N} \K^n(\Delta_1)
	% $$
	% is not too big. In the $\WKL$ case, for example, we would seek a $\K$ for which $\emptyset'\not\in \K^{\N}(\Delta_1)$.\\
	\begin{figure}[h]
		\begin{asy}
		size(8cm);
		path p = (0,0)--(-50,100){dir(110)}..{right}(-40,130){right}..{dir(-60)}(-30,120)..(10,150)..(30,130)..{dir(-110)}(50,100)--cycle;
		filldraw(p,palegreen);
		pair Z = (5,110);
		pair X = (10,85);
		pair W = Z+(1,2)*8;
		pair Y = W+(1,-2)*17;
		real d = 20;
		draw((Z+(1,-2)*d)--Z--(Z+(-1,-2)*d),dashed);
		dot("$\mathbf{Z}$",Z,dir(130));
		dot("$\mathbf{X}$",X,S);
		dot("$\mathbf{Y}$",Y,E);
		dot("$\mathbf{Z\oplus Y}$",W,N);
		dot("$\mathbf{\emptyset}$",(0,0),N*3);
		draw(Z--W--(Y+(1,-2)*3),dotted);
		label("$\mathcal{Q}$",(40,130),heavygreen);
		draw(X--Y,Arrow(Relative(0.92)));
		draw((-70,140)--(0,0)--(70,140),black+0.5);
		dot("$\mathbf{\emptyset'}$",(0,145),N);
		\end{asy}
		\caption{$\QQ$-preservation inside the order $\leq_T$. Here, $\QQ$ separates $\emptyset$ from $\emptyset'$.}
	\end{figure}
	
	Clearly, if we find a suitable $\QQ$ and prove that $\sf{B}$ preserves $\QQ$, then a model can be constructed as above while keeping $Z_0,Z_1,Z_2,\dots \in \QQ$, and hence $\SS\subset \QQ$, since by construction every set in $\SS$ is computable from some $Z_j$.
	
	Now the question becomes choosing a suitable class as $\QQ$. Below are some key examples of $\QQ$ commonly used in preservation and avoidance arguments:
	
	\begin{itemize}
		\item \textbf{Cone Avoidance}: Let $\QQ$ be the ``cone above'' some non-computable set $C$, i.e.
		$$
		\QQ := \{A: C\leq_T A\}.
		$$
		In this case, if $\sf{B}$ avoids $\QQ$ for all $C$, we say that $\sf{B}$ \textit{admits cone avoidance}. \\
		
		\item \textbf{Low Degree}: Let $\QQ$ be the collection of \textit{low} sets, i.e.
		$$
		\QQ := \{A: A'\equiv_T \emptyset'\}.
		$$
		If $\sf{B}$ preserves $\QQ$, we say that $\sf{B}$ \textit{admits low solutions}.
		
		\noindent There is a similar notion of \textit{low}$_n$ for each $n\in\N$, where $\QQ$ is defined
		$$
		\QQ := \{A: A^{(n)}\equiv_T \emptyset^{(n)}\}.
		$$
		\item \textbf{Hyperimmune-free}: A function $f$ is said to be \textit{hyperimmune} if it is not dominated (i.e. bounded above except at finitely-many values) by any computable function.
		
		A set is \textit{hyperimmune-free} if it does not compute any hyperimmune function. Being hyperimmune-free is clearly downward-closed under $\leq_T$. If $\sf{B}$ preserves
		$$
		\QQ := \{A: A\text{ is hyperimmune-free}\},
		$$
		we say that $\sf{B}$ \textit{admits hyperimmune-free solutions}.\\
		
		\item \textbf{PA Degree}: $A$ is of \textit{PA degree} if every computable tree $T\subseteq 2^{\N}$ has an $A$-computable path\footnote{The name ``PA degree" comes from the fact that a set $A$ has PA degree if and only if it can compute a complete, consistent extension of Peano Arithmetic. Another equivalent condition is that $A$ can compute a function which can accurately tell \textit{which} of two algorithms halts, given that at least one does.}. From our discussions of $\KL$ and $\sf{WKL}$ so far, it follows that $\emptyset$ does not have PA degree, but $\emptyset'$ does. If $\sf{B}$ avoids
		$$
		\QQ := \{A: A \text{ has PA degree}\},
		$$
		we say that $\sf{B}$ \textit{admits PA avoidance}.
	\end{itemize}
	
	Note that all four of these classes $\QQ$ separate $\emptyset$ from $\emptyset'$ (choosing $C=\emptyset'$ in the case of cone avoidance). In general, one can relativize each one to separate other pairs of sets.
	
	To make a model of $\WKL$ and not $\KL$, it will suffice to show that $\sf{WKL}$ has any of the above four properties. In fact, we will show all of them except PA avoidance, which $\sf{WKL}$ does not admit.
	
	% \newpage
	
	\subsection{Forcing and its Uses}
	
	To show any $\QQ$-preservation for $\sf{WKL}$ entails constructing a path $Y$ through each $Z$-computable binary tree such that $Y\oplus Z \in \QQ$. To make this and similar constructions easier to follow, we'll use a system of bookkeeping called \textit{forcing}.\\
	
	Forcing is a method of specifying an object (typically a subset of $\N$), which we call $\mathtt{G}$, through a series of approximations. The construction follows a descending path through a partially-ordered collection of \textit{conditions}, denoted $P$. In each stage, the condition $p$ is \textit{extended} to some $p^*\leq p$ (the extension is considered \textit{lower} in the order because it allows a smaller space for possible sets $\mathtt{G}$).
	
	To instantiate a notion of forcing, then, requires a partially-ordered set $(P,\leq)$, and an order-preserving interpretation of each $p\in P$ as a formula. We also require that $P$ enjoy the ``saturation" property that every descending chain of conditions is satisfied by some $\tt{G}$.
	
	Before explaining how to use forcing to construct sets with specific desirable properties, let's see a couple of examples of different notions of forcing, each with its own interpretation of $P$:\\
	
	\textbf{Cohen Forcing}:
	\begin{itemize}
		\item $P = 2^{\N}$, ordered by $p^*\leq p := p^*\succeq p$.
		\item The condition $p$ is interpreted as $p\prec \mathtt{G}$.
	\end{itemize}
	
	\textbf{Jockusch-Soare Forcing}:
	\begin{itemize}
		\item $P$ is the set of infinite \textit{computable} sub-trees of $2^{\N}$, ordered by $p^*\leq p := p^*\subseteq p$.
		\item The condition $p$ is interpreted as $\mathtt{G}\in [\, p \,]$, i.e. $\tt{G}$ is a path in $p$.
		\item Unlike the other two forcing notions here, it is not immediately clear that a descending sequence of Jockusch-Soare conditions is satisfied (i.e. a descending sequence of trees has a common path). But this actually follows from the compactness of $[\, 2^{\N}\,]$: each $[\,p\,]$ is a closed (and thus compact) subset of $[\,2^{\N}\,]$, and a descending sequence of compact sets always has a nonempty intersection.
	\end{itemize}
	
	\textbf{Mathias Forcing}:
	\begin{itemize}
		\item $P$ is the set of pairs $(E,R)$, where $E$ is a finite set and $R$ is an infinite set, with $E<R$. The order is $(E^*,R^*)\leq (E,R)$ if $E^*\supseteq E\cup R$ and $R^*\subseteq R$. We think of $R$ as the ``reservoir'' of elements that are available to be added to $E$.
		\item $(E,R)$ is interpreted as $E\subseteq \mathtt{G}\subseteq E\cup R$.
	\end{itemize}
	
	\begin{figure}[h]
		\begin{asy}
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
		
		\end{asy}
		\caption{The space of sets (visualized as paths in $2^{\N}$) obeying each of three conditions.}
	\end{figure}
	
	Notice that each of these three forcing notions has a different range of formulas that its conditions can articulate. For example, consider the two statements
	\begin{center}``$\tt{G}$ is infinite'' and ``$\overline{\tt{G}}$ is infinite."\end{center}
	
	In Cohen forcing, there is no condition which could decide either of these for $\tt{G}$, since at any point the undecided elements could all be put in $\tt{G}$ or $\overline{\tt{G}}$.
	
	In Jockusch-Soare forcing, there are conditions deciding both---in fact, a condition can specify any computable $\tt{G}$ entirely by being a tree with only one path.
	
	In Mathias forcing, there is an asymmetry: no condition can decide whether $\tt{G}$ is infinite because at condition $(E,R)$, $\tt{G}$ could be all of $E\cup R$ (infinite) or only $E$ (finite) or anything in between. However, $(E,R)$ \textit{can} decide that $\overline{\tt{G}}$ is infinite, when $\overline{R}$ is infinite.\\
	
	Though they differ in precision, all three types of conditions are considerably less precise than second-order arithmetic in general. This is what $P$ gives up in exchange for its saturation property. Conditions in $P$ cannot usually enforce the properties that we want in $\tt{G}$, but we can try to get at these properties through infinite descending sequences in $P$, and get a corresponding $\tt{G}$ using saturation.
	
	For example, suppose we are working in the setting of Cohen forcing and we want to produce a $\tt{G}$ which is infinite. As we know, there is no individual condition in $P$ that can guarantee this. However, for each $n\in\N$ there are $p\in P$ which imply $|\mathtt{G}|>n$. In fact, the property $|\mathtt{G}|>n$ is equivalent to obeying at least one condition $p\in P$ which has more than $n$ 1's. If the set of such $p$ is denoted $E_n\subset P$, then we say
	$$
	|\mathtt{G}|>n \iff \mathtt{G} \text{ ``meets" } E_n.
	$$
	To meet a condition-set means to obey at least one of its conditions. We can express $|\mathtt{G}|=\N$ by
	$$
	|\mathtt{G}|=\N \iff (\forall n): \mathtt{G} \text{ meets } E_n.
	$$
	So if we have a descending sequence of conditions
	$$
	p_0\geq p_1 \geq p_2 \geq \dots
	$$
	for which $p_n\in E_n$ for each $n$, then the $\mathtt{G}$ approximated by these conditions will meet each $E_n$ and hence be infinite. And it is easy to construct such a sequence, since any condition at all can be extended to one in $E_n$, which is to say that $E_n$ is \textit{dense} in $P$.\\
	
	Of course, this is a very roundabout way of proving that an infinite set exists when one can much more easily name a particular infinite set. But when the desired properties are more complicated, forcing becomes increasingly helpful as a way of organizing the construction of $\tt{G}$.
	
	In general, when we want a set $\tt{G}$ with some particular property $F(\tt{G})$, we express $F$ as a countable list of \textit{dense} condition-sets $D_e\subset P$,
	$$
	(D_0,D_1,D_2,\dots)
	$$
	such that if $\tt{G}$ meets each $D_e$ then $F(\tt{G})$ holds. In all of the cases in this paper, meeting $D_e$ will be equivalent to some definable property of $\tt{G}$, but this is not always the case in general. Using density, we produce a descending sequence of conditions
	$$
	p_0 \geq p_1 \geq p_2 \geq \cdots
	$$
	where $p_e\in D_e$ for each $e$.
	
	Expressing $F$ as a countable conjunction of dense condition-sets---and proving that they are dense---is the essential piece of any forcing argument.\\
	
	A descending sequence $p_0\geq p_1 \geq \dots$ which meets every dense condition-set in some collection is called \textit{generic}, and a set $\tt{G}$ obeying it is called a generic set. The name ``generic" is quite fitting, since it seems much more unusual to \textit{not} meet a dense set at $\N$-many opportunities than to meet it once. If there exists any sequence of dense condition-sets implying $F$, as described above, then we say that $F(\tt{G})$ holds for any \textit{sufficiently generic} $\tt{G}$. In such a situation, we say that $F$ is \textit{forced}. It may also be that given a certain condition $p$, any sufficiently generic $\tt{G}$ obeying $p$ is forced to hold $F(\tt{G})$, in which case we say $p$ forces $F$.
	
	% The typical construction via forcing looks like this: we want to exhibit a set $\mathtt{G}$ satisfying some desired properties. We express these properties as a countable list of second-order formulas:
	% $$(F_1(X),F_2(X),F_3(X),\dots)$$
	% Then we choose a suitable notion of forcing, $P$, and build a sequence of extensions in $P$:
	% $$
	% p_0\geq p_1\geq p_2\geq \dots
	% $$
	% such that $p_e(X)\Rightarrow F_e(X)$ for each $e$, and conclude by defining $\mathtt{G}$ as a set obeying $p_e(\mathtt{G})$ for all $e$.\\
	% \indent To prove that such a sequence exists, we use induction. For the inductive step, it is sufficient to establish that each $F_e(X)$ is \textit{dense} in $P$, meaning that for any $p\in P$ there is an extension $p^*\leq p$ for which $p^*\imp F_e$. Thus, the difficulty of the argument is in choosing $(F_e)$ and $P$ so that each $F_e$ is dense in $P$, and proving that they are dense.\\
	
	% As an example, Cantor's diagonalization argument can be viewed as a simple case of forcing:\\
	
	% \textbf{Example (Cantor)}: $2^{\N}$ is uncountable.
	% \begin{proof}
		% Given any countable list of sets $$B_1,B_2,B_3,\dots \in 2^{\N},$$ we seek to construct a set $\mathtt{G}$ outside of this list; that is, satisfying $F_e(X) := X\neq B_e$ for all $e\in \N$. Let $P=2^{\N}$, the set of all finite binary strings ordered by $p^*\leq p$ if $p^*\succeq p$ (i.e. $p^*$ contains $p$ as an initial segment). Interpret $p\in P$ as the formula $p\prec \mathtt{G}$, so that each condition $p$ determines membership in $\mathtt{G}$ up to $|p|$.\\
		% \indent Now to show density: for any $p\in P$ of length $\ell$ and $e\in \N$, we can extend $p$ to $p^*$ by appending the opposite of $B_e(\ell+1)$, so that $p^*(\ell+1)\neq B_e(\ell+1)$. Thus, $p^*\imp \mathtt{G}\neq B_e$.
		% \end{proof}\\
	
	% Often, the desired properties may have to be distributed out over the infinite sequence $(F_e)$. For example, using $P=2^{\N}$ as above, properties like ``$\mathtt{G}$ is infinite'' and ``$\mathtt{G}$ is uncomputable'' cannot be guaranteed by any individual condition $p$. But they be broken up as
	% \begin{align*}
		% X \text{ is infinite } &= \bigwedge_{e\geq 1} (|X|>e)\\
		% X \text{ is uncomputable } &= \bigwedge_{e\geq 1} (\Phi_e \neq X)
		% \end{align*}
	% and for any $e$, the formulas $|X|>e$ and $\Phi_e\neq X$ \textit{are} dense in $P$. Also note that, since both lists are dense and countable, one can force both by combining them into a single countable list. In fact, any countable number of separate dense conditions can be stacked like this.\footnote{TO DO: List common decompositions of other useful conditions.}\\
	
	Note that if $F_1,F_2$ are both forced, with the two corresponding sequences of dense condition-sets $(D^1_e)$ and $(D^2_e)$, then $F_1\^F_2$ is also forced, with the sequence
	$$
	(D^1_0,D^2_0,D^1_1,D^2_1,\dots).
	$$
	And naturally the same is true for any countable collection of forced formulas. Thus, conveniently, we may treat every desired property separately.\\
	
	% There are some standard ways to express commonly desired properties in terms of dense sets of conditions. In Cohen forcing, for example, we have the following correspondences:
	% \begin{align*}
		% |\mathtt{G}|=\N &: D_e := \{p \text{ has more than $e$ 1s}\}\\
		% \mathtt{G}\nleq_T C &: D_e := \{p(e) \neq \Phi^C_e(e)\}\\
		% \mathtt{G}\ngeq_T C &: D_e := \{\Phi^p_e\neq \Phi_e^C(e)\}
		% \end{align*}
	% \\
	
	When aiming to construct a set by forcing, the choice of which forcing notion to use is critical. As we've seen, the strengths of each system differ. Cohen forcing is strictly coarser than both Jockusch-Soare and Mathias forcing, and the latter two each have their own areas of high and low precision. If we plan to achieve some property $\ph(\mathtt{G})$ at the $e$th stage of the construction, i.e. to correspond to a dense subset $D_e\subset P$, then $P$ must be coarse enough that no $p\in P$ can ever imply $\neg(\ph(\mathtt{G}))$, yet fine enough that there are $p\in P$ (and densely-many!) implying $\ph(\mathtt{G})$. This is analogous to the choice of a suitable inductive hypothesis: it must be strong enough to prove the inductive step, but weak enough that it can be maintained in each step.
	
	In order to tweak the coarseness of $P$, we will often start with one of the three main forcing notions as a base and then add further restrictions onto $P$. We may even add on new objects to be tracked. For example, we will later see an instance of Mathias forcing which builds two sets at once, each with its own reservoir.
	
	% \newpage
	
	\subsection{The Weakness of \texorpdfstring{$\sf{WKL}$}{WKL}}
	
	% A computable instance of $\WKL$ does not necessarily admit a computable solution. But unlike with $\KL$, there seems to be no way to construct a computable instance of $\WKL$ whose only solution lies in $\Sigma_1$ (we will soon see that no such instance exists). Thus, we may hypothesize that even in the worst case, there will be solutions in some intermediate class between $\Delta_1$ and $\Sigma_1$. We now prove two results of this kind:\\
	
	With the structure of forcing as a guide, we can approach the question of whether $\WKL$ is genuinely weaker than $\ACA$ or not. To do this, it will suffice to show that $\WKL$ admits preservation of some $\QQ$ which separates it from $\emptyset'$, which will allow for the construction of a model of $\WKL$ without $\emptyset'$ in it. We can actually show that $\sf{WKL}$ preserves several of the classes $\QQ$ that we introduced.
	
	In all of these preservation results, we will use a version of Jockusch-Soare forcing, as it is a natural way to constrain objects that we are thinking of as paths in the first place. In each one, note how the fact that $T$ is computably bounded plays an essential role. This is to be expected, given that $\KL$ does not admit any of these weaknesses.\\
	
	\noindent \textbf{Theorem 3.2 ($\sf{WKL}$ Admits Hyperimmune-Free Solutions)}: If $Z$ is hyperimmune-free and $T$ is a $Z$-computable binary tree, there is an infinite path $\ell\in [\,T\,]$ such that $\ell\oplus Z$ is hyperimmune-free; that is, every function computed by $\ell\oplus Z$ is dominated by some computable function.
	\begin{proof} We'll use Jockusch-Soare forcing with subtrees of $T$.
		
		We want to construct $\mathtt{G}\in [\,T\,]$ such that
		$$
		(\forall e): \Phi_e^{\mathtt{G}\oplus Z} \text{ is computably bounded}
		$$
		for which it suffices to meet the condition sets
		$$
		D_e := \{p: \ell \in [\,p\,] \imp \Phi_e^{\ell\oplus Z} \text{ is computably-bounded}\}
		$$
		for each $e$. We will show that $D_e$ is dense. \\
		
		Assume otherwise, i.e. that for some tree $p$ there is no extension $p^*$ meeting $D_e$. This implies that there is some depth $d_x$ such that $\Phi_e^{\sigma\oplus Z}(x)[d_x]\downarrow$ for $|\sigma|\geq d_x$; otherwise,
		$$
		p^* := \{\sigma\in p : \Phi_e^{\sigma\oplus Z}(x)[|\sigma|]\uparrow \}
		$$
		would be an infinite $Z$-computable tree whose paths $\ell$ all have $\Phi_e^{\ell\oplus Z}(x)\uparrow$, and thus meet $D_e$.
		
		Moreover, $d_x$ is $Z$-computable as a function of $x$, since $p$ is binary and thus one can explore all depths $d$ until finding one for which $\Phi_e^{\sigma\oplus Z}(x)[d]\downarrow$ for all $|\sigma|=d$. Using this fact, for any given $\ell\in [\,p\,]$ we can construct a $Z$-computable function $g(x)$ that dominates $\Phi_e^{\ell\oplus Z}$:
		$$
		g(x) := \max\{\Phi_e^{\sigma\oplus Z}(x): |\sigma|=d_x\}.
		$$
		And because $Z$ itself is hyperimmune-free, there is also a computable function dominating $g(x)$. Thus, in this case, $p$ already meets $D_e$.
	\end{proof}\\
	
	\noindent \textbf{Theorem 3.3 ($\sf{WKL}$ Admits Cone Avoidance)}: Given a $Z$-computable binary tree $T\subset 2^{\N}$ and a set $C\nleq_T Z$, there is a path $\ell\in [\,T\,]$ for which $\ell\oplus Z$ does not compute $C$.
	\begin{proof}
		We use Jockusch-Soare forcing, with the modification that all trees in $P$ are subsets of $T$ and are $Z$-computable. The desired condition, not computing $C$, can be expressed as
		$$
		(\forall e): \Phi_e^{\mathtt{G}\oplus Z}\neq C,
		$$
		and $\Phi_e^{\mathtt{G}\oplus Z} \neq C$ is equivalent to meeting the condition set
		$$
		D_e := \{p: \ell \in [\, p \,] \imp \Phi_e^{\ell\oplus Z}\neq C\}.
		$$
		Thus, it suffices to show that $D_e$ is dense in $P$, i.e. that for any tree $p\in P$, there is an extension $p^*\leq p$ (i.e. a subtree) for which $\ell\in [\,p^*\,] \imp \Phi_e^{\ell\oplus Z}\neq C$.\\
		
		Assume for the sake of contradiction that all extensions $p^*\leq p$ in $P$ contain a path $\ell$ with $\Phi_e^{\ell\oplus Z}=C$. We will use this fact to compute $C$ from $Z$, showing a contradiction. The key is that this assumption greatly limits the extent to which the computable functions $\Phi_e^{\sigma\oplus Z}$ can differ from $C$, in two ways:
		\begin{enumerate}[label=(\alph*)]
			\item No $\sigma\in p$ that extends to a path in $p$ has $\Phi^{\sigma\oplus Z}\bot C$; otherwise,
			$$p^*=\{\tau\in p :\tau\succeq \sigma \}$$
			would be infinite and meet $D_e$.
			\item For every $x$, there is some depth $d_x$ such that $\Phi^{\sigma\oplus Z}(x)\downarrow$ for all $\sigma\in p$ with $|\sigma|\geq d_x$; otherwise,
			$$p^*=\{\tau\in p:\Phi^{\tau\oplus Z}(x)[|\tau|]\uparrow \}$$
			would be infinite and also all $\ell\in [\,p^*\,]$ have $\Phi_e^{\ell\oplus Z}(x)\uparrow$, thus $p^*$ would meet $D_e$.
		\end{enumerate}
		Given $d_x$, we can calculate $C(x)$ as follows: let
		$$D = \{\sigma\in p : |\sigma| = d_x\}.$$
		Because $p$ is a \textit{binary} tree, $D$ is $Z$-computable. We know by (b) that every $\sigma\in D$ has $\Phi^{\sigma\oplus Z}(x)\downarrow$, so we can $Z$-computably split $D$ into
		$$
		D = A\cup B = \{a_1,a_2,\dots,a_m\}\cup \{b_1,b_2,\dots,b_n\}
		$$
		where $\Phi^{a_j\oplus Z}(x)=0$ and $\Phi^{b_j\oplus Z}(x)=1$. By (a), either $A$ or $B$ (whichever disagrees with $C$) is entirely non-extendable, and hence the depth of its descendants is bounded. Then for each $d'>d$, we can compute from $Z$ the set of nodes of depth $d'$ (again relying on the fact that $p$ is binary) and check which are descended from $A$ versus $B$. For sufficiently large $d'$, only one of the two groups will remain, whence we will have computed $C(x)$ from $Z$.
	\end{proof}\\
	
	From cone avoidance, it also follows as a corollary that $\WKL$ has no minimal model; any non-computable $C$ can be avoided. In other words, like $\RCA$, $\WKL$ does not imply the existence of any particular non-computable set, though it does imply the existence of \textit{some} non-computable set.\\
	
	Next, we'll show that $\sf{WKL}$ also admits low solutions. This argument will be a little bit different from the previous two. It is an example of \textit{effective forcing}, in which a constructed object is made to be $A$-computable (for some $A$) by deciding each of its values at a particular finite stage, and choosing each extension $p^*$ in an $A$-computable way.\\
	
	\noindent \textbf{Theorem 3.4 ($\sf{WKL}$ Admits Low Solutions)}: If $Z\subseteq \N$ is low, then for any $Z$-computable infinite binary tree $T\subset 2^{\N}$, there is an infinite path $\ell\in [\,T\,]$ such that $\ell\oplus Z$ is low, i.e. $(\ell\oplus Z)'\leq_T \emptyset'$.
	
	\begin{proof}
		We'll construct a path $\mathtt{G}\in [\, T\,]$ \textit{and} a $\emptyset'$-computable function $f$ which computes $(\mathtt{G}\oplus Z)'$.\\
		\indent We employ a variant of Jockusch-Soare forcing as follows:
		\begin{itemize}
			\item $p\in P$ are of the form $p=(U,\sigma)$, where
			\begin{itemize}
				\item $U$ is an infinite, $Z$-computable subtree of $T$,
				\item $\sigma$ is a finite binary sequence,
				\item $g' \succ \sigma$ for all $g\in [\, U\,]$.
			\end{itemize}
			\item $(U^*,\sigma^*)\leq (U,\sigma)$ if $U^*\subseteq U$ and $\sigma^*\succeq \sigma$.
			\item $(U,\sigma )$ is interpreted as $\mathtt{G}\in [\, U \,]$ and $\sigma \prec f$.
		\end{itemize}
		The properties of $P$ already guarantee that $f=\ell'$, so the only thing to be forced is that $f$ is total:
		$$
		(\forall e): f(e)\downarrow,
		$$
		and $f(e)\downarrow$ is equivalent to meeting the condition set
		$$
		D_e := \{(U,\sigma): |\sigma| \geq e\}.
		$$
		To ensure that $f$ is $\emptyset'$-computable, we will explicitly construct an extension for $(U,\sigma)$ computably relative to $\emptyset'$, and thus every place of $f$ will be $\emptyset'$-computable.\\
		
		We want an extension $(U^*,\sigma^*)$ such that all $\mathtt{G}\in [\,U^*\,]$ have the same halting behavior on $e$, i.e.
		$$
		\Phi_e^{\mathtt{G}\oplus Z}(e)\downarrow \iff \sigma^*(e),
		$$
		and we need to decide $\sigma^*(e)$ in a $\emptyset'$-computable way. It might be that $U$ already has this property, so we first check if this is the case. We can do this $Z'$-computably (and hence $\emptyset'$-computably, since $Z$ is low): it is equivalent to checking
		$$
		\Psi(U) := (\exists\, d)(\forall\, \tau\in U): (|\tau|=d) \imp \Phi^{\tau\oplus Z}_e(e)[|\tau|]\downarrow
		$$
		Note that the $\forall$ is bounded because $U$ is a \textit{binary} tree, so $\Psi(U)$ is $\Sigma_1^Z$ and hence $Z'$-computable. If $\Psi(U)$ is true, then $\Phi_e^{\mathtt{G}\oplus Z}(e)\downarrow$ for all $\mathtt{G}\in [\, U \,]$, so we can extend $(U,\sigma)$ to $U^*:=U$ and $\sigma^*(e)=1$. On the other hand, if $\Psi(U)$ is false, the subtree
		$$E := \{\tau\in U: \Phi^{\tau\oplus Z}_e(e)[|\tau|]\uparrow\}$$
		is infinite and $Z$-computable, so we can take $U^*:=U\cap E$ with $\sigma^*(e)=0$.\\
		
		In summary, we can extend $(U,\sigma)$ in a way depending only on the $\emptyset'$-computable function $\Psi(U)$:
		$$
		(U^*,\sigma^*) := \begin{cases}
			(U,\sigma^{\smallfrown} 1) & \text{if $\Psi(U)$,}\\
			(U \cap E,\sigma^{\smallfrown} 0) & \text{if $\neg\Psi(U)$.}
		\end{cases}
		$$
		In either case, $\Phi^{\mathtt{G}\oplus Z}_e(e)$ has the same halting behavior for all $\mathtt{G}\in [\, U^* \,]$, and it is matched by $\sigma^*(e)$. Since every extension is found $\emptyset'$-computably, $f=(\mathtt{G}\oplus Z)'$ is $\emptyset'$-computable, thus $\mathtt{G}\oplus Z$ is low, as desired.
	\end{proof}\\
	
	With $\sf{WKL}$ shown to admit solutions in several complexity classes not containing $\emptyset'$, we can handily reach this section's goal:\\
	
	\begin{samepage}
		
		\noindent \textbf{Theorem 3.5}: $\WKL\centernot \implies \ACA$.
		\begin{proof}
			This follows from any of the preservation results shown for $\sf{WKL}$, which allow us to build a model of $\WKL$ consisting entirely of $\emptyset'$-cone-avoiding or low or hyperimmune-free sets. The resulting model does not contain $\emptyset'$ as a set, therefore it is not a model of $\KL$ (or $\ACA$).
		\end{proof}\\
		
	\end{samepage}
	
	\begin{figure}[h]
		\begin{tikzcd}
			{\sf{ACA_0}} \\
			\\
			{\sf{WKL_0}} \\
			\\
			{\sf{RCA_0}}
			\arrow[Rightarrow, from=1-1, to=3-1]
			\arrow[Rightarrow, from=3-1, to=5-1]
		\end{tikzcd}
	\end{figure}
	
	Historically, the hierarchy of these three theories has been a focus of reverse mathematics. They are the bottom three of the ``big five" hierarchy, which also includes the stronger theories $\sf{ATR_0}$ and $\Pi^1_1\sf{CA_0}$.\footnote{$\sf{ATR_0}$ stands for Arithmetic Transfinite Recursion. Roughly speaking, it extends $\ACA$ to allow induction and comprehension along any well-order, rather than just $\N$. $\Pi^1_1\sf{CA_0}$ extends comprehension to $\Pi^1_1$ formulas. It is strictly weaker than full second-order arithmetic but stronger than $\sf{ATR_0}$.} The big five are notable because of how many theorems from other areas have been shown equivalent in strength to one of them.
	
	We have seen already that the completeness of $\R$ is equivalent to $\ACA$ and the compactness of $[0,1]$ is equivalent to $\WKL$. One can actually show that a wide range of results in algebra, analysis, logic, and combinatorics are equivalent to one of these levels. A few key examples are listed below.\footnote{Proofs of all of these equivalences can be found in \cite{simpson}.}
	
	Note that the language of second-order arithmetic is limited in what it can express; all results below referring to algebraic structures and metric spaces apply only to \textit{countable} structures and \textit{separable} metric spaces, as general uncountable sets are third-order objects and thus cannot be discussed directly in second-order arithmetic. Continuous functions on separable metric spaces are determined by their values on a countable dense set, and thus they can be described as second-order objects.
	
	\begin{itemize}
		\item $\RCA$
		\begin{itemize}
			\item Intermediate Value Theorem
			\item Nested Interval Completeness
			\item Baire Category Theorem
			\item Existence of algebraic closures
		\end{itemize}
		\item $\WKL$
		\begin{itemize}
			\item Heine-Borel Theorem (compactness of $[0,1]$)
			\item The Hahn-Banach Theorem
			\item Riemann integrability of continuous functions
			\item Uniqueness of algebraic closures
			\item Existence of prime ideals in commutative rings
			\item G\"odel's Completeness and Compactness Theorems
		\end{itemize}
		\item $\ACA$
		\begin{itemize}
			\item Completeness of $\R$
			\item Bolzano-Weierstrass Theorem (sequential compactness of $[0,1]$)
			\item Existence of maximal ideals in commutative rings
			\item Existence of bases for $\Q$-vector spaces
			\item K\"onig's Lemma
		\end{itemize}
	\end{itemize}
	
	In the next section, we will set our reverse-mathematical techniques onto Ramsey's Theorem, a problem from infinitary combinatorics, and investigate its relationship to this hierarchy.
	
	\newpage
	
	\section{Ramsey Theory}
	
	So far, we've developed a nice hierarchy of three naturally-arising theories. We've seen that many statements in second-order arithmetic can be located in one of these three levels. To complicate this picture, we now consider Ramsey's Theorem:\\
	
	\noindent \textbf{Definition (Ramsey's Theorem in degree $n$ for $k$ colors, or $\RT_k^n$):} Given a $k$-coloring of $[\N]^n$ (the size-$n$ subsets of $\N$), i.e. a function $c:[\N]^n\to \{1,2,\dots,k\}$, there exists an infinite set $X$ that is $c$-\textit{homogeneous}, i.e. $c$ is constant on $[X]^n$.\\
	
	In this section, we'll use the methods developed in previous sections---forcing in particular---to determine the precise strength of $\RT^n_k$ relative to the Big Five. This was not known for general $n,k\in \N$ until Liu closed the last remaining case in 2011.
	
	\subsection{\texorpdfstring{$\RT$ over $\RCA$}{RT over RCA}} First, we'll see what can be proven about $\RT^n_k$ over $\RCA$. $\RCA$ does prove some relationships between $\RT^n_k$ for different $n$ and $k$, but we will see that it does not actually prove any $\RT^n_k$ for $n>1$.\\
	
	\noindent \textbf{Lemma 4.1 (Ramsey Theory over $\RCA$):}
	\begin{enumerate}[label=(\alph*)]
		\item For $k\geq 2$, $\RCA\vdash \RT^1_k$.
		\item For $k\geq 2$, $\RCA\vdash \RT^n_k\iff \RT^n_{k+1}$.
		\item For $n\geq 1$, $\RCA\vdash \RT^{n+1}_k \implies \RT^{n}_k$.
	\end{enumerate}
	\begin{proof} (a): This is essentially the infinitary pigeonhole principle for a fixed number of colors. Given a coloring $c:\N\to \{1,2,\dots,k\}$, the homogeneous sets $$c^{-1}(j):=\{x:c(x)=j\}$$
		are all computable from $c$, thus exist in $\RCA$. One of these sets must be unbounded; if there exist upper bounds $a_j$ on each of these sets so that $c^{-1}(j) < a_j$, then the union of all of them is bounded above by $\max\{a_1,a_2,\dots,a_k\}$, but their union is $\N$, which is unbounded.\\
		
		(b): Given a $(k+1)$-coloring $c:[\N]^n\to \{1,2,\dots,k+1\}$, we can produce a slightly reduced $k$-coloring by identifying $1$ and $2$:
		$$c^*: A \mapsto \begin{cases}
			1 & c(A)=1\\
			c(A)-1 & c(A) >1
		\end{cases}$$
		This $c^*$ clearly $c$-computable, thus it is a function in $\RCA$. Assuming $\RT^n_k$, there exists an infinite $c^*$-homogeneous set $X$. If $X$ is any color other than $1$, then $X$ is also $c$-homogeneous. Otherwise, $c^*(A)\in \{1,2\}$ for $A\in [X]^n$, so $c^*$ is a 2-coloring of $X$. Thus, we can apply $\RT^n_2$ (which clearly follows from $\RT^n_k$) to $c$ on $X$ to get an infinite $c$-homogeneous set. Either case implies $\RT^n_{k+1}$.\\
		
		(c): Given a $k$-coloring $c:[\N]^n\to \{1,2,\dots,k\}$, we have a $k$-coloring
		$$c^*:[\N]^{n+1}\to\{1,2,\dots,k\} \;\; \text{given by} \;\; c^*(A)=c(A\setminus \min(A)).$$
		$c^*$ is clearly $c$-computable, thus it is also a function in $\RCA$. Assuming $\RT^{n+1}_k$, there exists a $c^*$-homogeneous set $X$ (say with color $j$). For any size-$n$ subset $B\subset (X\setminus \min(X))$, we have
		$$
		c(B) = c^*(B\cup \{\min(X)\}) = j,
		$$
		thus $X\setminus \min(X)$ is an infinite $c$-homogeneous set of color $j$, implying that $\RT^n_k$ also holds.
	\end{proof}\\
	
	Thus, $\RCA$ proves that the strength of $\RT^n_k$ (for $k\geq 2$) depends only on $n$, and that it is non-decreasing in $n$. As a corollary, $\RCA$ proves that the weakest case of $\RT$ is $\RT^2_2$. The natural question is whether $\RCA$ can actually prove this simplest case, and the answer is: no. To show this, we will give a computable $2$-coloring of $[\N]^2$ with no computable infinite homogeneous set.\\
	
	\newpage
	
	\noindent \textbf{Theorem 4.2:} $\RCA\centernot\implies \RT^2_2$.
	\begin{proof} We'll describe a coloring algorithm that systematically makes every infinite computable set non-homogeneous. In fact, we can do even better and avoid all infinite c.e. sets. Let
		$$A_e = \{n:\Phi_e(n)\downarrow\}$$
		and denote by $A_e[s]$ the approximation of $A_e$ up to input $s$ and for $s$ steps:
		$$A_{e}[s] := \{n< s : \Phi_e(n)[s]\downarrow\}.$$
		Note that $A_e[s]$ is computable and that $\lim_s A_e[s] = A_e$. We will ensure that if $A_e[s]$ gets sufficiently large, then we eventually color two of its edges oppositely.\\
		
		The construction will proceed in $\N$-many stages: in stage $s$, we decide the colors of edges
		$$E_s := \{(0,s),(1,s),\dots,(s-1,s)\}.$$
		During stage $s$, for each $e<s$ we compute the set of $x\in A_e[s]$ such that $(x,s)$ is still uncolored. If this set has at least two elements $a,b$, we color their edges oppositely:
		$$
		c((a,s)) = 0, \;\; c((b,s))=1.
		$$
		Otherwise we do nothing and move on. Note that at most 2 edges of $E_s$ can be colored for each $e<s$. At the end of stage $s$, some of $E_s$ may remain uncolored---their colors don't matter.\\
		
		Now to show that the coloring works: if $A_e$ is infinite, then for sufficiently large $s$,
		$$|A_e[s]|\geq 2e.$$
		For such $s$, our coloring is guaranteed to find $a,b\in A_e[s]$ with $(a,s)$ and $(b,s)$ uncolored, since at most $2(e-1)$ edges of $E_s$ can be colored up to this point in stage $s$. And because $A_e$ is infinite, there will be some sufficiently large $s$ which is also in $A_e$, so that $(a,s),(b,s)$ are both edges in $A_e$, and thus $A_e$ is not homogeneous. Thus, we've colored all infinite c.e. sets non-homogeneously.
	\end{proof}\\
	
	This argument focuses on the c.e. sets, but in fact it can be extended to all \textit{limit-computable} sets, i.e. sets $A$ such that
	$$
	A(n) = \lim_m g(n,m)
	$$
	for some computable $g(n,m)$. This requires only a minor change: define $A_e[s]$ as
	$$
	A_e[s] := \{n<s : g_e(n,s)[s]\downarrow = 1\}
	$$
	where $(g_e)$ enumerates the algorithms on two inputs. Define $c$ in the same way relative to $A_e[s]$, and $c$ will color every limit-computable $A$ non-homogeneously by the same argument.
	
	So $\RT^2_2$ implies the existence of non-limit-computable sets, but $\WKL$ \textit{does not}. Because $\sf{WKL}$ admits low solutions, one can build an entirely low model of $\WKL$. Low sets are $\emptyset'$-computable, and hence limit-computable as well,\footnote{In fact, $\emptyset'$-computable and limit-computable are equivalent properties. This is Shoenfield's Limit Lemma.} so we have a model of $\WKL$ whose sets are all limit-computable. Thus, $\WKL$ is not strong enough to prove $\RT^2_2$ (or any other $\RT^n_k$) either!
	
	% Now we'll turn our attention to $\ACA$.
	
	% In $\5$, we needed a coloring that would avoid infinite homogeneous sets of complexity $\Delta_1$. As written, this construction also avoids $\Sigma_1$ sets. But it can be strengthened even further to avoid $\Delta_2$ sets as well, using the characterization of $\Delta_2$ as the limit-computable sets; $\ph_e$ becomes a computable \textit{sequence} of sets, and the approximation $A_e[s]$ becomes an approximation up to time $s$ and input $s$ \textit{of the $s$th set in the sequence}. This establishes that $\WKL\centernot\implies \RT^2_2$. The proof is nearly identical, so I will omit it.\\
	
	
	% \begin{center}
		% \begin{tikzcd}[sep = large]
			% 	{\sf{KL}} && {\sf{ACA_0}} && {\sf{RT}^{\geq 3}_k} \\
			% 	\\
			% 	{\sf{WKL_0}} &&&& {\sf{RT}^2_k} \\
			% 	\\
			% 	&& {\sf{RCA_0}}
			% 	\arrow["\1"', Rightarrow, 2tail reversed, from=1-3, to=1-1]
			% 	\arrow["\4", Rightarrow, 2tail reversed, from=1-3, to=1-5]
			% 	\arrow["\3"', Rightarrow, from=1-3, to=3-1]
			% 	\arrow["\6", Rightarrow, from=1-3, to=3-5]
			% 	\arrow["\7", "\shortmid"{marking}, Rightarrow, 2tail reversed, from=3-1, to=3-5]
			% 	\arrow["\2"', Rightarrow, from=3-1, to=5-3]
			% 	\arrow["\5", Rightarrow, from=3-5, to=5-3]
			% \end{tikzcd}
		% \end{center}
	
	
	\subsection{\texorpdfstring{$\RT$ over $\ACA$}{RT over ACA}}
	
	First, $\ACA$ is strong enough to prove $\RT^n_k$ for all $n$ and $k$:\\
	
	\noindent \textbf{Theorem 4.3}: $\ACA\implies \RT^n_k$.
	\begin{proof}
		Given a coloring $c:[\N]^n\to \{1,2,\dots,k\}$, we say that a set $X$ is \textit{pre-homogeneous} if the coloring of $n$-edges in $X$ does not depend on their largest element, in the sense that
		$$
		\forall s\in [X]^{n-1} \text{ and } \, a,b \in X \text{ with } a,b>\max(s), \;\; c(s\cup \{a\}) = c(s\cup \{b\}).
		$$
		Such $c$ and $X$ give rise to a derived coloring
		$$
		c^*:[X]^{n-1}\to \{1,2,\dots,k\} \;\;\;\; c^*(s) = c(s\cup \{a\}) \;\; \text{where} \;\; a\in X, a>\max(s).
		$$
		Any $c^*$-homogeneous set is also $c$-homogeneous, so if such an $X$ exists for any coloring $c$, then $\RT^{n-1}_k\imp \RT^n_k$. We've shown that $\RT^1_k$ is provable in $\RCA$, so to prove $\RT^n_k$ for every $n$, it suffices to show that an infinite, pre-homogeneous set exists for every coloring.\\
		
		Now given $c$ we'll construct an infinite pre-homogeneous set $\tt{G}$ via a variation of Mathias forcing:
		\begin{itemize}
			\item $p\in P$ are of the form $(E,R)$ where $E$ is finite, $R$ is infinite, and $E<R$.
			\begin{itemize}
				\item Additionally, $E$ must be pre-homogeneous with respect to $c$.
				\item All elements of $R$ must be able to be added to $E$ while maintaining pre-homogeneity.
			\end{itemize}
			\item $(E^*,R^*)\leq (E,R)$ if $E\subseteq E^*\subseteq E\cup R$ and $R^*\subseteq R$.
			\item $(E,R)$ is interpreted as $E\subseteq \mathtt{G}\subseteq E\cup R$.
		\end{itemize}
		We'd like to construct a $\mathtt{G}$ that is infinite, for which it suffices to meet
		$$
		D_e := \{(E,R) : \max{E}>e\}
		$$
		for all $e$. Any such $\tt{G}$ will automatically be pre-homogeneous because of the additional constraints on $P$. We'll show that $D_e$ is dense.\\
		
		Let $(E,R)\in P$ and fix $e$. For each $\sigma:[E]^{n-1}\to \{0,1\}$ (of which there are finitely many) let
		$$
		R_{\sigma} := \{x\in R : (\forall A\in [E]^{n-1}):c(A\cup \{x\}) = \sigma(A)\},
		$$
		so that every element of $R_{\sigma}$ has the same coloring behavior with respect to $E$, and
		$$
		R = \bigcup_{\sigma} R_{\sigma}.
		$$
		$R$ is infinite, so by the pigeonhole principle, at least one of these $R_{\sigma}$ is infinite. Selecting such an $R_{\sigma}$, let $x\in R_{\sigma}$ be its least element above $e$, and choose the extension
		$$
		(E^*,R^*) := (E\cup \{x\},R_{\sigma} \cap (x,\infty))
		$$
		which indeed meets $D_e$, and one can check that $(E^*,R^*)\in P$. Thus, $D_e$ is dense, as desired.
		% Everything done so far is valid in $\RCA$, but to show the existence of pre-homogeneous sets will require the full strength of $\ACA$. We construct $X = \{x_1,x_2,\dots\}$ in steps. Let $Y_k$ be the set of potential values for $x_k$, given $x_1,\dots,x_{k-1}$:
		% $$
		% Y_k = \{y : \, \{x_1,x_2,\dots,x_{k-1},y\} \; \text{is pre-homogeneous}\}.
		% $$
		% Initially, $Y_1=\N$ is infinite. I claim that if $Y_k$ is infinite, then we can choose $x_k$ so that $Y_{k+1}$ is infinite: there are finitely many $n$-edges that $x_{k}$ can make with $x_1,\dots,x_{k-1}$, and finitely many combinations of colors those edges could be, and these colors determine $Y_{k+1}$. Thus, there are finitely many possible sets $Y_{k+1}$, and their union is $Y_{k}$, thus we can choose $x_{k}$ so that $Y_k$ is infinite (by pigeonhole principle). \textit{Checking which one is infinite} is the only part requiring $\ACA$.
	\end{proof}\\
	
	A note on the complexity of this construction: $R_{\sigma}$ is $c$-computable, and testing whether $R_{\sigma}$ is infinite is $c''$-computable, as being infinite is a $\Pi_2$ property. This shows that one can find an infinite pre-homogeneous set that is $c''$-computable. Thus, one can reduce an instance $c$ of $\RT^n_k$ to a $c''$-computable instance of $\RT^{n-1}_k$. To prove $\RT^n_k$, this reduction must be done $n-1$ times, after which $\RT^1_k$ can be computably solved, giving a $c^{(2n-2)}$-computable solution to $c$.\\
	
	We can also show a partial reversal of this result: $\RT^3_2$ (and thus all $\RT^n_k$ for $n\geq 3$) implies $\ACA$. To prove this requires an $A$-computable coloring of triples whose infinite homogeneous sets all compute $A'$:\\
	
	\noindent \textbf{Theorem 4.4 (Jockusch)}: $\RT^3_2 \implies \ACA$.
	\begin{proof}
		Let $A$ be a set. We will describe a $\Delta_1^A$ coloring $c:[\N]^3\to \{0,1\}$ whose only infinite homogeneous sets compute $A'$, and thus show that $A'$ exists for all $A$.\\
		\indent Specifically, consider the following coloring: given a triple $(a,s,t)$ with $a<s<t$, let
		$$c:(a,s,t)\mapsto \begin{cases}
			0 & \exists (e<a) : \Phi^A_e(e)[s]\uparrow \, \^ \; \Phi^A_e(e)[t]\downarrow\\
			1 & \text{otherwise}
		\end{cases}$$
		There are no infinite $c$-homogeneous sets of color 0; if such a set $\{a_1,a_2,\dots\}$ existed, then there would be Turing machines \textit{of index at most} $a_1$ which halt in time-windows $(a_2,a_3],(a_3,a_4],\dots$ but this is impossible because there are only finitely many of these.\\
		\indent Thus, the infinite set $X$ guaranteed by $\RT^3_2$ must have color 1. Let $X=\{a_1,a_2,\dots\}$. Given $X$, we can compute $A'$: to test whether $e\in A'$, take some $a_p>e$ (one exists because $X$ is infinite) and check $\Phi^A_e(e)[a_{p+1}]$. If this doesn't halt then it never will, since $c((a_p,a_q,a_{q+1}))=1$ for $q>p$, hence $\Phi^A_e(e)$ does not halt in $(a_q,a_{q+1}]$ for any $q>p$, and these intervals cover the rest of $\N$.
	\end{proof}\\
	
	This proves that $\RT^3_2$ is equivalent to $\ACA$, and likewise for $\RT^n_k$ with $n\geq 3$, so now $\RT^2_2$ is the only outstanding case. It is unclear how one could encode the halting problem with only a coloring of pairs. Indeed, there turns out to be a genuine difference in strength between $\RT^2_2$ and $\RT^3_2$. To prove this, we will use a forcing argument to show that $\RT^2_2$ admits cone avoidance.\\
	
	\newpage
	
	\noindent \textbf{Theorem 4.5 (Seetapun)}: $\RT^2_2\centernot\implies \ACA$.
	\begin{proof}
		We will prove this by establishing cone avoidance for $\RT^2_2$. That is, we'll show that for any $Z$, if $c:[\N]^2\to\{0,1\}$ is $Z$-computable and $C\nleq_T Z$, then there is an infinite $c$-homogeneous set $\mathtt{G}$ for which $Z\oplus C\nleq_T \mathtt{G}$. We'll assume $Z=\emptyset$ wlog, as it does not affect the argument.
		
		% Assume for the sake of contradiction that such a $\mathtt{G}$ does not exist. We will construct $\tt{G}$.\\
		
		% \indent Normally, in an argument like this, we would build the set $H$ in stages such that in stage $e$, we guarantee that $\Phi_e^H\neq C$. This is generally difficult to do for Ramsey's Theorem in particular, since the result may not be true for both colors at once; it forces us to choose the correct color at the beginning. \textit{say a little more about this}\\
		% \indent Seetapun's proof maintains flexibility between the two colors: we intend to build \textit{two} sets $\tt{G}_0$ and $\tt{G}_1$, homogeneous of colors $0,1$ respectively, and between them we will ensure that at least one is both infinite and does not compute $C$. We still only need to find one homogeneous set, though, so the outcome we must avoid is that \textit{both} $H_0$ and $H_1$ end up computing $C$, with the Turing Machines of some pair of indices $e_0$ and $e_1$. Indexing our construction by $\N\times\N$, we prevent this outcome in stage $(e_0,e_1)$. \\
		% \indent We will use a notion of Mathias forcing defined as follows: at each stage $(e_0,e_1)$ we have finite conditions $E_0,E_1$ and a ``reservoir'' $R$, representing the set of elements which we may later add to $E_0$ or $E_1$. We say that $(E_0,E_1,R)$ is \textit{valid} if
		% \begin{itemize}
			% \item $E_0,E_1$ are finite and homogeneous of colors $0$ and $1$.
			% \item $R\subseteq N_0(E_0)\cap N_1(E_1)$, is infinite, and doesn't compute $C$.
			% \end{itemize}
		% A condition $(E_0^*,E_1^*,R^*)$ extends $(E_0,E_1,R)$ if $E_0\subseteq E_0^*$, $E_1\subseteq E_1^*$, and $R^*\subseteq R$.\\
		
		We can't simply choose a color and begin the construction, since it's possible that there is only an infinite homogeneous set of one color, and it's not apparent which color will work. Instead, we can start constructing \textit{two} homogeneous sets at once, one in each color, and show that \textit{at least one} will have the desired properties.
		
		Proceeding by contradiction, we'll assume that no such $\tt{G}$ exists. This assumption is necessary to force both sets to be infinite.\\
		
		We construct $\tt{G_0}$ and $\tt{G_1}$ with a variation of 2-fold Mathias forcing defined as follows:
		\begin{itemize}
			\item $p\in P$ are of the form $(E_0,E_1,R)$, where $E_0,E_1$ are finite, $R$ is infinite, and $E_0,E_1<R$.
			\begin{itemize}
				\item Additionally, $E_0$ and $E_1$ must be $c$-homogeneous of colors 0 and 1 respectively.
				\item All elements of $R$ can be added to $E_0$ \textit{or} $E_1$ while maintaining homogeneity.
				\item $R$ must not compute $C$.
			\end{itemize}
			\item $(E_0^*,E_1^*,R^*)\leq (E_0,E_1,R)$ if $E_i\subseteq E_i^*\subseteq E_i\cup R$ for $i\in\{0,1\}$ and $R^*\subseteq R$.
			\item $(E_0,E_1,R)$ is interpreted as $E_i\subseteq \mathtt{G}_i \subseteq E_i \cup R$ for $i\in \{0,1\}$.
		\end{itemize}
		% In the case that $c$ has any infinite homogeneous sets that are \textit{computable}, then clearly such a set does not compute $C$, which is non-computable, which shows cone avoidance. Thus, we can restrict our attention to the other case, in which all infinite $c$-homogeneous sets are non-computable, and use this fact to construct one which does not compute $C$.\\
		Now we seek to force three properties:
		\begin{enumerate}
			\item $\tt{G_0}$ is infinite.
			\item $\tt{G_1}$ is infinite.
			\item At least one of $\tt{G_0}$ and $\tt{G_1}$ does not compute $C$.
		\end{enumerate}
		We'll show separately that each one is forced.\\
		
		First, some notation: for any set $A$ and color $i\in \{0,1\}$, define the $i$-neighborhood of $A$ as
		$$N_i(A):= \{x : (\forall a\in A): c((a,x)) = i\}.$$
		Note that the conditions on $P$ imply that $R\subseteq N_0(E_0)\cap N_1(E_1)$ for $(E_0,E_1,R)\in P$.\\
		
		(1): It suffices to meet the condition-sets
		$$
		D_e := \{(E_0,E_1,R) : (\max\{E_0\}\geq e)\}
		$$
		for $e\in \N$. If a given $(E_0,E_1,R)$ has no extension meeting $D_e$, then for every $x\geq e$ in $R$,
		$$
		(E_0^*,E_1^*,R^*) := (E_0 \cup \{x\},E_1,R \cap N_0(x))
		$$
		must not be a valid extension, otherwise it would meet $D_e$. This can only be because $R\cap N_0(x)$ is finite for all $x \geq e$ in $R$. But if this is true, then $R\cap N_1(x)$ is infinite for all $x\geq e$ in $R$, which makes it $R$-computable to find an infinite $c$-homogeneous set of color 1: the extension
		$$
		(E_0^*,E_1^*,R^*) := (E_0,E_1 \cup \{x\},R\cap N_1(x))
		$$
		(where $x = \min \{R_{\geq e}\}$) is guaranteed to be valid, so one can repeatedly choose such extensions, resulting in a $\tt{G_1}$ that is $R$-computable and infinite, and hence witnesses cone avoidance. We had assumed that such $\tt{G_1}$ did not exist, so we must now assume that $D_e$ is dense. \\
		
		(2): This follows similarly.
		\\
		
		(3): This property is the most substantive. The only case we must avoid is both $\tt{G_0}$ and $\tt{G_1}$ compute $C$, i.e. for some $e_0,e_1\in \N$, $\Phi^{\tt{G_0}}_{e_0}=\Phi^{\tt{G_1}}_{e_1}=C$. Thus, it suffices to meet the condition-sets
		$$
		D_{(e_0,e_1)} := \{(E_0,E_1,R): (\Phi_{e_0}^{\mathtt{G_0}}\neq C) \vee (\Phi_{e_1}^{\mathtt{G_1}}\neq C) \}
		$$
		for $(e_0,e_1)\in \N^2$. We aim to show that $D_{(e_0,e_1)}$ is dense. Assume otherwise, and that $(E_0,E_1,R)$ is a condition in $P$ with no extensions meeting $D_{(e_0,e_1)}$.\\
		
		% In stage $(e_0,e_1)$, we seek to finitely (and non-trivially, so that our $H_0,H_1$ are sure to be infinite) extend $(E_0,E_1,R)$ to a valid extension $(E_0^*,E_1^*,R^*)$ in such a way that for any $H_0,H_1$ with $E_0^*\subseteq H_0$ and $E_1^*\subseteq H_1$,
		% $$
		% \Phi_{e_0}^{H_0} \neq C \;\; \text{or} \;\; \Phi_{e_1}^{H_1}\neq C.
		% $$
		% Call an extension \textit{forceful} if it guarantees this. If there is \textit{any} such extension, then we can take it (building the model does not have to computable). So assume that none exist.\\
		
		% One way extension could fail is if there are no valid nontrivial extensions $E_0$ (or $E_1$) at all. That would imply that for every $r\in R$, $N_0(r)\cap R$ is finite. But in that case the reservoir can never be depleted by extending $E_1$, so we can find a \textit{computable} infinite $1$-homogeneous set (by always extending to $\min(R)$), which is strictly stronger than not computing $C$. Thus we can assume that all valid reservoirs contain nontrivial extensions of $E_0$ and $E_1$, but that none are forceful.\\
		
		% Our ultimate aim in this proof is to use the non-existence of valid and forceful extensions to compute $C$, yielding contradiction. First, we will show the existence of an infinite and computable set of forceful extensions, then we will find a valid one among them.\\
		
		We define an $i$-\textit{fork} to be a pair of finite $i$-homogeneous sets $(X,Y)$ for which
		$$\exists w< \max(X\cup Y): \;\; \Phi_{e_i}^{E_i\cup X}(w)[\max(X\cup Y)] \downarrow \; \neq \Phi_{e_i}^{E_i\cup Y}(w)[\max(X\cup Y)].$$
		Whereas the property of differing from $C$ is non-computable, the two extensions in an $i$-fork differ from \textit{one another} in a bounded way, which can be verified $R$-computably. Say an $i$-fork is \textit{valid} if
		$$(E_i\cup X,E_{1-i},R^*) \;\;\; \text{and}\;\;\; (E_i\cup Y,E_{1-i},R^*)$$ are both in $P$, for some $R^*$. If $(X,Y)$ is valid, then one of these two extensions (the one that differs from $C$) must meet $D_{(e_0,e_1)}$, thus it suffices to show that a valid $i$-fork exists.
		We'll first show the existence of many $i$-forks, and then show there is a valid one among them.\\
		
		\noindent \textbf{Lemma ($\ast$):} Every infinite set $R^*\subseteq R$ which does not compute $C$ must contain an $i$-fork.
		
		\begin{proof}
			Suppose otherwise. We have assumed that no extension meets $D_{(e_0,e_1)}$. This implies that for every $w$ there is some finite $X\subset R^*$ with
			$$
			\Phi_{e_i}^{E_i\cup X}(w)[\max(X)] \downarrow \, = C(w).
			$$
			Otherwise, the extension $(E_0,E_1,R^*)$ would meet $D_{(e_0,e_1)}$, as it implies $\Phi_{e_i}^{\tt{G_i}}(w)$ is either undefined or disagrees with $C(w)$. If, in addition, there are no $i$-forks in $R^*$, then
			$$
			\Phi_{e_i}^{E_i\cup X}(w)[\max(X)] \in \{\uparrow,C(w)\}
			$$
			for all finite $X\subset R^*$, since no two $X$ can contradict one another. Now we can check all such $X$ until halting, thus computing $C(w)$ from $R^*$, which contradicts the assumption that $C\nleq_T R^*$.
		\end{proof}\\
		
		As an immediate corollary, there are infinitely many $i$-forks (one can take $R^* = R\cap \{x>M\}$ to get an $i$-fork of arbitrarily high minimum). So let $(X_j,Y_j)$ be a \textit{computable} sequence of $0$-forks (one can compute it by repeatedly taking the next largest $0$-fork in some computable ordering):
		$$
		X_0 < Y_0 < X_1 < Y_1 < X_2 < Y_2 < \dots
		$$
		By assumption, all of these $0$-forks are invalid. This is actually a rather strong condition, because it tells us that for any potential reservoir $R^*$, each $X_j\cup Y_j$ contains some $z_j$ for which $N_1(z_j)\cap R^*$ is infinite; otherwise, $R^* \cap_{z\in X_j\cup Y_j} N_0(z)$ would be a valid reservoir for the fork $(X_j,Y_j)$.
		
		% $N_0(z)$ would be cofinite inside $R$ for all $z\in X_j\cup Y_j$, thus making
		% $$
		% R^* := R\cap \bigg(\bigcap_{z\in X_j\cup Y_j} N_0(z)\bigg)
		% $$
		% an infinite and $R$-computable reservoir for which
		% $$
		% (E_0\cup X,E_1,R^*), \; (E_0\cup Y,E_1,R^*)\in P.
		% $$
		The goal now is to leverage the invalidity of the $0$-forks to produce a valid $1$-fork within $(z_j)$. We'll first show that such a sequence $z_j$ of sufficient depth $d$ will eventually include a 1-fork. Then, we'll find a reservoir $R^*$ with respect to which all $z\in \{X_j\cup Y_j\}_{j\leq d}$ have edges of only one color. This $R^*$ will serve as reservoir to the 1-fork included in $(z_j)$, hence the 1-fork will be valid.\\
		% , which implies that if $R^*$ is any valid reservoir, $N_1(z_j)\cap R^*$ is infinite for at least one $z_j\in X_j\cup Y_j$ (otherwise $R\cap_{z\in X_j\cup Y_j}N_0(z)$ would be infinite).\\
		
		% \begin{figure}[h]
			% \begin{asy}
			% size(7cm);
			
			% \end{asy}
			% \end{figure}
		
		Construct a computable tree $T\subseteq \N^{\N}$ from all sequences $\sigma$ with
		$$
		\sigma(e) \in X_e\cup Y_e
		$$
		such that the immediate parent of $\sigma$ does not contain any 1-forks. $T$ is computably bounded (since $X_e\cup Y_e$ is finite), so if $T$ is infinite then it contains a $C$-cone avoiding path by $\sf{WKL}$ cone avoidance. But by ($\ast$), any infinite non-$C$-computing set necessarily contains 1-forks, so \textit{there can be no such path}, and thus $T$ must be finite. Let its depth be $d$.
		
		\begin{figure}[h]
			\begin{asy}
			size(7cm);
			void oval(real x, real w, real h, pen c = black){
			pair a,b,c,d,e,f;
			a = (x-w,h);
			b = (x,h+w);
			c = (x+w,h);
			d = (x+w,-h);
			e = (x,-h-w);
			f = (x-w,-h);
			path p = a{up}..{right}b{right}..{down}c--d{down}..{left}e{left}..{up}f--a;
			draw(p,c);
			}
			oval(0,1,10);
			dot(" ",(0,9),cmyk(blue)+5);
			dot(" ",(0,7),cmyk(blue)+5);
			dot(" ",(0,5),cmyk(blue)+5);
			dot("$z_0$",(0,3),W,cmyk(red)+5);
			dot(" ",(0,1),cmyk(blue)+5);
			dot(" ",(0,-1),cmyk(blue)+5);
			dot(" ",(0,-3),cmyk(blue)+5);
			dot(" ",(0,-5),cmyk(red)+5);
			dot(" ",(0,-7),cmyk(blue)+5);
			dot(" ",(0,-9),cmyk(blue)+5);
			oval(5,1,10);
			dot(" ",(5,9),cmyk(blue)+5);
			dot(" ",(5,6),cmyk(red)+5);
			dot(" ",(5,3),cmyk(blue)+5);
			dot(" ",(5,0),cmyk(blue)+5);
			dot(" ",(5,-3),cmyk(blue)+5);
			dot(" ",(5,-6),cmyk(blue)+5);
			dot(" ",(5,-9),cmyk(blue)+5);
			oval(10,1,10);
			dot(" ",(10,9),cmyk(blue)+5);
			dot(" ",(10,7),cmyk(blue)+5);
			dot(" ",(10,5),cmyk(blue)+5);
			dot(" ",(10,3),cmyk(blue)+5);
			dot(" ",(10,1),cmyk(red)+5);
			dot(" ",(10,-1),cmyk(red)+5);
			dot(" ",(10,-3),cmyk(red)+5);
			dot(" ",(10,-5),cmyk(blue)+5);
			dot(" ",(10,-7),cmyk(blue)+5);
			dot(" ",(10,-9),cmyk(blue)+5);
			oval(15,1,10);
			dot(" ",(15,9),cmyk(blue)+5);
			dot(" ",(15,9-18/7),cmyk(blue)+5);
			dot(" ",(15,9-2*18/7),cmyk(blue)+5);
			dot(" ",(15,9-3*18/7),cmyk(blue)+5);
			dot(" ",(15,9-4*18/7),cmyk(blue)+5);
			dot(" ",(15,9-5*18/7),cmyk(blue)+5);
			dot(" ",(15,9-6*18/7),cmyk(blue)+5);
			dot(" ",(15,-9),cmyk(red)+5);
			oval(20,1,10);
			dot(" ",(20,9),cmyk(blue)+5);
			dot(" ",(20,9-18/8),cmyk(red)+5);
			dot(" ",(20,9-2*18/8),cmyk(blue)+5);
			dot(" ",(20,9-3*18/8),cmyk(blue)+5);
			dot(" ",(20,9-4*18/8),cmyk(blue)+5);
			dot(" ",(20,9-5*18/8),cmyk(blue)+5);
			dot(" ",(20,9-6*18/8),cmyk(red)+5);
			dot(" ",(20,9-7*18/8),cmyk(blue)+5);
			dot(" ",(20,-9),cmyk(blue)+5);
			oval(25,1,10);
			dot(" ",(25,9),cmyk(blue)+5);
			dot(" ",(25,9-18/5),cmyk(blue)+5);
			dot(" ",(25,9-2*18/5),cmyk(red)+5);
			dot(" ",(25,9-3*18/5),cmyk(blue)+5);
			dot(" ",(25,9-4*18/5),cmyk(blue)+5);
			dot(" ",(25,9-5*18/5),cmyk(blue)+5);
			oval(30,1,10);
			dot(" ",(30,9),cmyk(red)+5);
			dot(" ",(30,9-18/7),cmyk(blue)+5);
			dot(" ",(30,9-2*18/7),cmyk(blue)+5);
			dot(" ",(30,9-3*18/7),cmyk(blue)+5);
			dot(" ",(30,9-4*18/7),cmyk(blue)+5);
			dot(" ",(30,9-5*18/7),cmyk(blue)+5);
			dot("$z_d$",(30,9-6*18/7),E,cmyk(red)+5);
			dot(" ",(30,9-7*18/7),cmyk(blue)+5);
			draw((0,3)--(5,6)--(10,-3)--(15,-9)--(20,9-6*18/8)--(25,9-2*18/5)--(30,9-6*18/7),cmyk(red)+linewidth(2));
			label("$X_0\cup Y_0$",(-1.5,-16.3),fontsize(10pt));
			draw((-1,-15)--(-0.3,-12),Arrow(Relative(1.00)));
			label("$\cdots$",(15,-16.3),fontsize(10pt));
			label("$X_d\cup Y_d$",(31.5,-16.3),fontsize(10pt));
			draw((31,-15)--(30.3,-12),Arrow(Relative(1.00)));
			\end{asy}
			\caption{The elements of $X_j\cup Y_j$ for $j\leq d$ colored by $\tau$ (blue = 0, red = 1). The sequence $(z_j)$ must contain a valid 1-fork with reservoir $R^*$.}
		\end{figure}
		
		Finally, for each function
		$$
		\tau : \bigcup_{j=0}^d X_j\cup Y_j \to \{0,1\}
		$$
		let
		$$
		R_{\tau} := \{r\in R : (\forall z\in \textrm{Dom}(\tau)): c((z,r)) = \tau(z) \}.
		$$
		There are finitely many such $\tau$ since $T$ is finite, and $R_{\tau}$ finitely partitions $R$ into $R$-computable parts. For some $\tau$, $R_{\tau}$ will be infinite: call this $R^*$. Since the $0$-forks $(X_j,Y_j)$ are all invalid, there is a sequence $z_j\in X_j\cup Y_j$ which all have $\tau(z_j) = c(z_j,R^*)=1$. By the definition of $T$, there is a 1-fork among this sequence. This 1-fork is valid, with $R^*$ as its corresponding reservoir.
		% \textit{Alternate approach}: Let $(X,Y)$ be a 0-fork. We assume it to be invalid, which implies that if $R^*$ is any valid reservoir, $N_1(z)\cap R^*$ is infinite for at least one $z\in X\cup Y$ (otherwise $R\cap_{z\in X\cup Y}N_0(z)$ would be infinite). But we can use this to get arbitrarily-long (though not infinite) 1-homogeneous sequences with valid reservoirs. If any of these contain 1-forks, they are guaranteed to be valid, so we must assume there are no 1-forks. Taken together, this is an infinite 1-homogeneous sequence with no 1-forks. If we can construct this sequence in such a way that it avoids computing $C$, then we will derive a contradiction with claim 1.
	\end{proof}\\
	
	This shows that $\RT^2_2$ is strictly weaker than $\RT^3_2$, casting $\RT^2_2$ out of the $\RCA-\WKL-\ACA$ hierarchy, though we haven't yet ruled out the possibility that $\RT^2_2$ lies between $\WKL$ and $\ACA$. Seetapun's proof was published in 1995, but the relationship between $\RT^2_2$ and $\WKL$ was left open until 2011, when Jiayi Liu proved that $\RT^2_2\centernot\implies \sf{WKL}$. Liu showed that $\RT^2_2$ admits PA avoidance by using a Mathias forcing argument.\\
	
	\noindent \textbf{Theorem 4.6 (Liu)}: $\RT^2_2\centernot \implies \sf{WKL}$.
	\begin{proof}
		Omitted. See \cite{dm} or \cite{hirschfeldt} for full proofs of Liu's Theorem.
	\end{proof}\\
	
	With Liu's proof, $\RT^2_2$ could be placed firmly outside of the Big Five hierarchy:
	
	\begin{figure}[h]
		$$\begin{tikzcd}
			\KL && \ACA && {\RT^{\geq 3}_k} \\
			\\
			\sf{WKL} &&&& {\RT^2_k} \\
			\\
			&& \RCA
			\arrow[Rightarrow, 2tail reversed, from=1-1, to=1-3]
			\arrow[Rightarrow, from=1-1, to=3-1]
			\arrow[Rightarrow, 2tail reversed, from=1-3, to=1-5]
			\arrow[Rightarrow, from=1-5, to=3-5]
			\arrow[dashed, no head, from=3-1, to=3-5]
			\arrow[Rightarrow, from=3-1, to=5-3]
			\arrow[Rightarrow, from=3-5, to=5-3]
		\end{tikzcd}$$
		\caption{The full dependency chart between $\RT$ and $\KL$. $\WKL$ and $\RT^2_k$ are independent.}
	\end{figure}
	
	But unlike $\sf{WKL}$, which we find embedded within proofs of all sorts of major theorems throughout mathematics, $\RT^2_2$ is mysteriously not equivalent to any other major theorems. $\RT^2_2$ is its own principle, with its own set of consequences. Much of the work in reverse mathematics in recent decades has been dedicated to studying it.
	
	% But where does $n=2$ actually matter in this proof? One key fact about $n=2$ is that $N_0(x)$ and $N_1(x)$ are complements. In contrast, for $n=3$,
	
	\subsection{Study of \texorpdfstring{$\RT^2_2$}{RT22}} In this final section, we'll take a look at the world of $\RT^2_2$ and several related coloring principles, and see some longstanding open problems. First, we introduce two new properties a coloring $c:[\N]^2\to \{0,1\}$ can have on a domain $X$:
	
	\begin{itemize}
		% \item \textit{Homogeneous}: $c$ is constant on $[X]^n$.
		\item \textit{Stable}: For $x\in X$, $c$ takes a single value on all but finitely-many edges containing $x$.
		\item \textit{Transitive} For $x<y<z\in X$, $c((x,y))=c((y,z))=q\implies c((x,z))=q$.
	\end{itemize}
	
	Stability and Transitivity turn out to be quite significant classes of colorings. In a sense, they are the only two classes that must be considered; as we will see, if $\RT^2_2$ holds on all stable colorings and all transitive colorings, then it holds in general.\\
	
	$\RT^n_k$ says \textit{any} coloring has an infinite subset on which it is \textit{homogeneous}. This principle can be weakened in several ways. If $\CC$ and $\DD$ are two classes of colorings, let
	$$
	\CC \rightarrowtail \DD \; \; \text{denote} \;\; ``\,\forall c\in \CC, \; \exists \text{ an infinite subset } X\subseteq \N \; \text{ such that } c \in \DD \; \text{on} \; X."
	$$
	Note that $\rightarrowtail$ is transitive. Using this notation,
	$$
	\RT^2_2 := Any \rightarrowtail Homogeneous.
	$$
	$\RT^2_2$ can be split into several interesting coloring principles based on the coloring classes of stable and transitive, many of which are collected in Figure $\ref{fig:rt22}$.
	
	\begin{figure}[h]
		\begin{center}
			\begin{tikzcd}[sep=large]
				&& {\textit{Homogeneous}} \\
				\\
				\\
				&& {Transitive+Stable} \\
				{\textit{Transitive}} &&&& {\textit{Stable}} \\
				\\
				&& {\textit{Any}}
				\arrow["{\sf{SADS}}"{description}, tail, from=4-3, to=1-3]
				\arrow["{\sf{ADS}}", tail, from=5-1, to=1-3]
				\arrow["{\sf{CADS}}"{description}, tail, from=5-1, to=4-3]
				\arrow["{\sf{SRT}^2_2}"', tail, from=5-5, to=1-3]
				\arrow["{\sf{SEM}}"{description}, tail, from=5-5, to=4-3]
				% \arrow["{\sf{CEM}}"{description}, tail, from=7-3, to=4-3]
				\arrow["{\sf{EM}}", tail, from=7-3, to=5-1]
				\arrow["{\sf{CRT}^2_2}"', tail, from=7-3, to=5-5]
			\end{tikzcd}
		\end{center}
		\caption{A decomposition of the coloring principles below $\RT^2_2$.}
		\label{fig:rt22}
	\end{figure}
	
	\begin{samepage}
		The abbreviations are:
		\begin{itemize}
			\item $\RT$: Ramsey's Theorem.
			\begin{itemize}
				\item $\SRT$ = Stable Ramsey's Theorem.
				\item $\sf{CRT}$ = Cohesive Ramsey's Theorem.
			\end{itemize}
			\item $\mathsf{ADS}$: The Ascending/Descending Sequence Principle.
			\begin{itemize}
				\item For every linear order on $\N$, there is an infinite increasing or decreasing sequence. A linear order can be expressed as a transitive coloring of $[\N]^2$.
				\item $\SADS$ = Stable Ascending/Descending Sequence.
				\item $\sf{CADS}$ = Cohesive Ascending/Descending Sequence.
			\end{itemize}
			\item $\mathsf{EM}$: The Erd\H{o}s-Moser Principle.
			\begin{itemize}
				\item This is sometimes called the ``Tournament Principle," because it can be interpreted as the statement ``for every infinite set of teams, there is an infinite subset on which teams can be linearly ordered by their strength."
				\item $\sf{SEM}$ = Stable Erd\H{o}s-Moser.
			\end{itemize}
			% \item $\mathsf{UCOH}$: The Uniform Coherent Set Principle.
			% \begin{itemize}
				% \item This is a weaker form of $\COH$, which states that for any collection of functions $$\{f_i:[\NN]\to [k]\}_i$$ there is an infinite set $X\subseteq \NN$ such that all the $f_i$ are stable on $X$.
				% \item $\sf{UCOH}$ requires the $f_i$ to be uniform in $i$, i.e. that $$c(i,j) := f_i(j)$$ must also be a function in $i,j$. In $\RCA$, this is an important distinction.
				% \item The distinction matters because the statement that $All\rightarrowtail Stable$ is equivalent to $\UCOH$, taking $c(i,j)=f_i(j)$ to be the coloring, but $\COH$ is strictly stronger.
				% \end{itemize}
		\end{itemize}
	\end{samepage}
	It is known that all of these principles lay in the expanse strictly between $\RCA$ and $\RT^2_2$, though in many cases this is very nontrivial. In terms of their relative strengths, some equivalences can be found by identifying paths in the diagram: for instance,
	$$
	\ADS + \EM \iff \SRT^2_2 + \CRT^2_2 \iff \RT^2_2.
	$$
	But there are also some unexpected implications---for example, we will show that $\ADS \imp \CRT^2_2$. In fact, $\ADS$ proves the \textit{Cohesive Set Principle} ($\COH$), which is a stronger result.
	
	$\COH$ states that for any sequence of functions $f_i:\N\to \{0,1\}$, there is a set $A$ for which all of the $f_i$ are stable (i.e. converge to 0 or 1) on $A$---we say that $A$ is a \textit{cohesive set} for $(f_i)$. $\CRT^2_2$ follows from a special case of $\COH$ where
	$$f_i(x):= c((i,x))$$
	and, say, $f_i(i):=0$ (the diagonal values do not matter to the cohesiveness of $A$). The essential difference is that $f_i(x)$ must be stable on $A$ for all $i$, whereas $c((i,x))$ only needs to be stable for $i\in A$. \\
	
	\noindent \textbf{Lemma 4.7}: $\ADS \implies \sf{COH}$.
	\begin{proof}
		% ($\SRT^2_2+\COH\implies \RT^2_2$): Given a (not necessarily stable) coloring $c:[\NN]^2\to \{0,1\}$, let $C$ be the set given by $\COH$ on which
		% $$
		% f_i : x \mapsto c((i,x))
		% $$
		% stabilizes for all $i$. Then $c$ is a stable coloring of $[C]^2$, thus by $\SRT^2_2$, $C$ contains an infinite $c$-homogeneous set $X\subseteq C\subseteq \NN$.\\
		Given a sequence of functions $f_i:\N\to \{0,1\}$, let $f(x)$ denote the binary sequence
		$$
		f(x) := (f_1(x),f_2(x),f_3(x),\dots).
		$$
		We may assume that $f$ is injective\footnote{In general, we can interleave the sequence $f_i$ with a characteristic functions $\chi_i$ for each $i$, which makes $f$ injective. Proceeding with the proof will yield a set $A$ that is cohesive for both $f_i$ and $\chi_i$, which also serves as a cohesive set for just the $f_i$.}. Between two binary sequences there is a lexicographic order; e.g. $(1,0,0,1,1,\dots) > (1,0,0,1,0,\dots)$. Let $c:[\N]^2\to \{0,1\}$ color pairs based on this ordering:
		$$
		\text{for} \; x<y, \;\; c: (x,y)\mapsto \begin{cases}
			0 & f(x) < f(y) \\
			1 & f(x) > f(y)
		\end{cases}
		$$
		Given that $f(x)\neq f(y)$, the sequences differ at some finite index, so $c$ is computable relative to the functions $f_i$. Then, by $\ADS$ there must exist an infinite ascending (wlog) subsequence
		$$A = \{a_1,a_2,\dots\},$$
		so that
		$$
		f(a_1) < f(a_2) < f(a_3) < \dots
		$$
		Now we can show (in $\RCA$) that $A$ is a cohesive set for the functions $f_i$: for any $n$, the $n$-tuple
		$$(f_1(a_j),f_2(a_j),\dots,f_n(a_j))$$
		is non-decreasing in $j$, and takes at most $2^n$ values, so it changes at most $2^n$ times. In particular, this implies $\{f_n(a_j)\}_j$ changes between 0 and 1 at most $2^n$ times, and thus is eventually constant. As this is true of all $n$, $A$ is cohesive for the functions $f_i$.
	\end{proof}\\
	
	Thus, as promised, $\RT^2_2$ can be reduced to the two cases of transitive and stable colorings, as
	$$
	\SRT^2_2 + \ADS \implies \SRT^2_2 + \CRT^2_2 \iff \RT^2_2.
	$$
	This decomposition is unique to $n=2$, as the property of transitivity does not make sense for colorings with $n\geq 3$. The decomposition can be used to more easily prove weakness principles for $\RT^2_2$ by proving them for $\SRT^2_2$ and $\ADS$ (or $\COH$), which are often simpler. Both Seetapun's Theorem and Liu's Theorem have ``modernized" proofs along these lines.
	
	\begin{figure}[h]
		$$\begin{tikzcd}[sep=large]
			&& {\RT^2_2} \\
			{\sf{ADS}} &&&& {\SRT^2_2} \\
			\\
			& {\CRT^2_2} & {\sf{SADS}} & {\sf{EM}} \\
			{\sf{CADS}} &&&& {\sf{SEM}} \\
			&& {\sf{RCA_0}}
			\arrow[Rightarrow, from=1-3, to=2-1]
			\arrow[Rightarrow, from=1-3, to=2-5]
			\arrow[Rightarrow, from=1-3, to=4-2]
			\arrow[Rightarrow, from=1-3, to=4-4]
			\arrow[Rightarrow, from=2-1, to=4-2]
			\arrow[Rightarrow, from=2-1, to=4-3]
			\arrow[Rightarrow, from=2-1, to=5-1]
			\arrow[Rightarrow, from=2-5, to=4-3]
			\arrow[Rightarrow, from=2-5, to=5-5]
			\arrow[from=4-2, to=5-1]
			\arrow[Rightarrow, from=4-3, to=6-3]
			\arrow[from=4-4, to=5-5]
			\arrow[Rightarrow, from=5-1, to=6-3]
			\arrow[Rightarrow, from=5-5, to=6-3]
		\end{tikzcd}$$
		\caption{Known dependencies between principles below $\RT^2_2$.}
		\label{fig:last}
	\end{figure}
	
	The presently-known implications among the coloring principles discussed in this section are listed above in Figure \ref{fig:last}.
	
	The single arrows denote implications that are not proven to be strict (i.e. may be equivalences). Two open questions are whether $\sf{SEM}$ is weaker than $\EM$ and whether $\sf{CADS}$ is weaker than $\sf{CRT}^2_2$. Between $\CRT^2_2$, $\SADS$, and $\EM$, five of six non-implications have been proven; the only unproven one is whether $\EM\imp \CRT^2_2$, or more generally whether $\EM\imp \COH$. The precise strength of $\EM$ remains uncertain.
	
	The full state of progress on these and many other questions in reverse mathematics is cataloged and displayed in the \href{https://rmzoo.math.uconn.edu/diagrams/}{Reverse Mathematics Zoo}, though the diagrams there are not up to date.\\
	
	\section*{Acknowledgments}
	
	I would like to thank Professors Maryanthe Malliaris and Denis Hirschfeldt for giving helpful advice and direction during this project. I am especially grateful to my REU mentor Miles Kretschmer for teaching me all that I know about reverse mathematics and providing excellent feedback on dozens of drafts of this paper.
	
	\printbibliography
	
	
\end{document}
