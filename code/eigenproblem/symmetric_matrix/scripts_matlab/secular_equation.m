% D?finition de la matrice tridiagonale 6x6
SIGN=1 % rho positif
SIGN=-1 % rho négatif
fprintf('Matrice initiale T : \n');
T = [6 6 0 0 0 0; 6 1 3 0 0 0; 0 3 4 8 0 0; 0 0 8 4 8 0; 0 0 0 8 8 7; 0 0 0 0 7 4];
i_pivot=5
T(i_pivot, i_pivot+1)=T(i_pivot, i_pivot+1)*SIGN;
T(i_pivot+1, i_pivot)=T(i_pivot+1, i_pivot)*SIGN;

T_or=T;
% Affichage de la matrice
disp(T);
beta = T(i_pivot, i_pivot+1);
SIGN=(beta<0);
% en vérifiant dans  https://en.wikipedia.org/wiki/Tridiagonal_matrix
% et en regardant le calcul du déterminant, on voit que si on change
% le signe de T(i_pivot, i_pivot+1) et de T(i_pivot+1, i_pivot)
% le déterminant reste le même.  Donc on peut se ramener au cas rho>0 avec
% cette astuce.  Par contre je n'ai pas regardé ce que ça implique sur les
% vecteurs propres.

if (beta<0)
    beta=-beta;
    T(i_pivot, i_pivot+1)=beta;
    T(i_pivot+1, i_pivot)=beta;
    SIGN=1;
end


% Division de T en deux matrices T1 et T2
T1 = T(1:i_pivot, 1:i_pivot);
T2 = T(i_pivot+1:6, i_pivot+1:6);

% Extraction de l'?l?ment beta

% Mise ? jour des ?l?ments T1_nn et T2_11 en soustrayant beta
T1(i_pivot, i_pivot) = T1(i_pivot, i_pivot) - beta;
T2(1, 1) = T2(1, 1) - beta;

% Affichage des sous matrices 
fprintf('Matrice T1 : \n');
disp(T1);
fprintf('Matrice T2 : \n');
disp(T2);

%La matrice initiale T peut ?tre ?crite sous la forme
% T=|T1   |+beta*u*u'
%   |   T2|

fprintf('Vecteur u\n');
u = [0;0;1;1;0;0];
u = zeros(6,1);
u(i_pivot)=1;
u(i_pivot+1)=1;
disp(u);

fprintf('Recombinaison de T1 et T2\n');
disp(blkdiag(T1,T2));
%reconstruction de la matrice T pour v?rification
T_reconstructed = blkdiag(T1,T2)+beta*u*u';
fprintf('On retombe sur T\n');
disp(T_reconstructed);

%Maintenant on calcule les valeurs propres et vecteurs propres des matrices
%T1 et T2
fprintf('Calcul des valeurs propres et vecteurs propres de T1 et T2\n');
[Q1,D1]=eig(T1);
[Q2,D2]=eig(T2);
fprintf('Q1\n');
disp(Q1);
fprintf('D1\n');
disp(D1);
fprintf('Q2\n');
disp(Q2);
fprintf('D2\n');
disp(D2);

%d?fintion de zT
zT = [ Q1(end,:), Q2(1,:)]; % z^T est le vecteur ligne
fprintf('Caclul de Z^T\n');
disp(zT);

%v?rification de l'?quation 
%T= |Q1   |(|D1   |+beta*z*z') |Q1'    |
%   |   Q2| |   D2|            |    Q2'|

T_reconstructed=blkdiag(Q1,Q2)*(blkdiag(D1,D2)+beta*zT'*zT)*blkdiag(Q1',Q2');
fprintf('Reconstruction de T\n');
disp(T_reconstructed);


%Il faut maintenant r?soudre le syst?me D+beta*w*w'  avec w=beta*zT'
%On construit D :
fprintf('Construction de D\n');
D=blkdiag(D1,D2);
disp(D);
fprintf('Construction de Q\n');
Q=blkdiag(Q1,Q2);
disp(Q);

%definition de w = beta*z
fprintf('Construction de Q\n');
w=zT';
%  Il me semble que c'était la bonne définition de w (pas beta*zT'), mais
%  ça ne change pas le résultat

disp(w);

Dl= secular_solutionDC2(D,w,beta);

fprintf('solution de l''équation séculaire \n')
disp(Dl)

%calcul et comparaison des valeurs propres et vecteurs propres
[Q_T,D_T]=eig(T);
[Q_T_or,D_T]=eig(T_or);
Q_T./Q_T_or;
% La correction pour obtenir les vecteurs propres de départ
% Je n'ai pas la preuve formelle, à creuser ...

D_corr=diag([ones(1,i_pivot) -ones(1,6-i_pivot)]);

Q_Tcorr=D_corr*Q_T;
%  Verification que la correction fonctionne ...

Q_Tcorr'*T_or*Q_Tcorr




function [lambda,dl]=zerodandc(d,v,i)

%  Pages 105  - corrigée

n=length(d);
Ds=diag(d);
di=d(i);
if i < n
    di1=d(i+1);lambda=(di+di1)/2;          %initialiser
else
    di1=d(n)+norm(v)^2;lambda=di1;
end
eta = 1;
psi1 = sum((v(1:i).^2)./(d(1:i) - lambda));
psi2 = sum((v(i+1:n).^2)./(d(i+1:n) - lambda));
if (1+psi1+psi2)>0, % zero is on the left half of the interval
    d=d-di; lambda=lambda-di;di1=di1-di;di=0;
    while abs(eta) > 10*eps
        psi1 = sum(v(1:i).^2./(d(1:i) - lambda));
        psi1s = sum(v(1:i).^2./((d(1:i) - lambda)).^2);
        psi2 = sum((v(i+1:n)).^2./(d(i+1:n) - lambda));
        psi2s = sum(v(i+1:n).^2./((d(i+1:n) - lambda)).^2);
        % Solve for zero
        Di = -lambda; Di1 = di1 - lambda;
        a = (Di + Di1)*(1 + psi1 + psi2) - Di*Di1*(psi1s+psi2s);
        b = Di*Di1*(1 + psi1 + psi2);
        c = (1 + psi1 + psi2) - Di*psi1s - Di1*psi2s;
        if a > 0,
            eta = (2*b)/(a + sqrt(a^2 - 4*b*c)); else
            eta = (a - sqrt(a^2 - 4*b*c))/(2*c);
        end
        lambda = lambda + eta;
    end
    dl=Ds(i,i)+lambda;
else % zero is on the right half of the interval
    d = d - di1; lambda = lambda - di1; di = di - di1;
    while abs(eta) > 10*eps
        psi1 = sum(v(1:i).^2./(d(1:i) - lambda));
        psi1s = sum(v(1:i).^2./((d(1:i) - lambda)).^2);
        psi2 = sum((v(i+1:n)).^2./(d(i+1:n) - lambda));
        psi2s = sum(v(i+1:n).^2./((d(i+1:n) - lambda)).^2);
        % Solve for zero
        Di = di - lambda;
        Di1 = - lambda;
        a = (Di + Di1)*(1 + psi1 + psi2) - Di*Di1*(psi1s+psi2s);
        b = Di*Di1*(1 + psi1 + psi2);
        c = (1 + psi1 + psi2) - Di*psi1s - Di1*psi2s;
        if a > 0,
            eta = (2*b)/(a + sqrt(a^2 - 4*b*c));
        else
            eta = (a - sqrt(a^2 - 4*b*c))/(2*c);
        end
        lambda = lambda + eta;
    end
    dl=Ds(i+1,i+1)+lambda;
end
end %end function [lambda,dl]=zerodandc(d,v,i)





function Dl=secular_solutionDC2(D,w,rho)
%  Suivant le 5.5 de DC2.  On suppose que tous les éléments de \bfv sont
%  non nuls (sinon il faut faire la deflation) et les éléments de D sont
%  tous différents

% order diagonal elements
[d,Index]=sort(diag(D));
Ds=diag(d);
Dl=Ds;
v=w(Index)*sqrt((rho));    % renommage de w pour être cohérent avec 5.5
% et rho ...
n=length(d);
    for i = 1:n
        [ lambda, Dl(i,i)]=zerodandc(d,v,i);
    end
end










