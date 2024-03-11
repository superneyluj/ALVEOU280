% D?finition de la matrice tridiagonale 6x6
SIGN=1 % rho positif
%SIGN=-1 % rho négatif
fprintf('Matrice initiale T : \n');
T = [6 6 0 0 0 0; 6 1 3 0 0 0; 0 3 4 SIGN*8 0 0; 0 0 SIGN*8 4 8 0; 0 0 0 8 8 7; 0 0 0 0 7 4];

% Affichage de la matrice
disp(T);

% Division de T en deux matrices T1 et T2
T1 = T(1:3, 1:3);
T2 = T(4:6, 4:6);

% Extraction de l'?l?ment beta
beta = T(3, 4);

% Mise ? jour des ?l?ments T1_nn et T2_11 en soustrayant beta
T1(3, 3) = T1(3, 3) - beta;
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
fprintf('Q_T\n');
disp(Q_T);
fprintf('D_T\n');
disp(D_T);





function [lambda,dl]=zerodandc(d,v,i,rho)

%  Pages 105  - corrigée

SIGN=sign(rho);
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
if 1+psi1+psi2>0, % zero is on the left half of the interval
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
v=w(Index)*sqrt(abs(rho))*sign(rho);    % renommage de w pour être cohérent avec 5.5
% et rho ...
n=length(d);
if rho>0
    for i = 1:n
        [ lambda, Dl(i,i)]=zerodandc(d,v,i,rho);
    end
else
    d(2:n)=d(1:n-1);
    d(1)=d(1)-norm(v);
    for i = 1:n
        [ lambda, Dl(i,i)]=zerodandc(d,v,i,rho);
    end


end
end










function lambda=secular_solution(D,w,beta)

epsilon = 1e-4; % Petite quantité pour ajuster la valeur initiale de lambda
lambda_init = D(1,1) + epsilon; % Ajustement de la valeur initiale de lambda

% Méthode de Newton pour trouver la racine de l'équation séculaire
tolerance = 1e-6; % Seuil de tolérance pour l'arrêt
lambda = lambda_init;
iter = 0;
max_iter = 100; % Nombre maximal d'itérations
while iter < max_iter
    f_lambda = secular_equation(lambda, D, w);
    % Calcul de la dérivée de f par rapport à lambda
    df_lambda = -beta * sum((w.^2) ./ ((diag(D) - lambda).^2));
    
    % Mise à jour de lambda en utilisant la méthode de Newton
    lambda_new = lambda - f_lambda / df_lambda;
    
    % Vérification de la condition d'arrêt
    if abs(lambda_new - lambda) < tolerance
        break;
    end
    
    lambda = lambda_new;
    iter = iter + 1;
end

fprintf('Valeur approchée de lambda : %f apres %d iterations\n', lambda,iter);

end
% Définition de l'équation séculaire
function f = secular_equation(lambda, D, w)
    f = 1 +  sum((w.^2) ./ (diag(D) - lambda));
end



% function Dl=secular_solution2(D,w,rho)
% 
% % order diagonal elements
% [d,Index]=sort(diag(D));
% Ds=diag(d);
% Dl=Ds;
% v=w(Index)*sqrt(rho);    % renommage de w pour être cohérent avec 5.5
% % et rho ...
% n=length(d);
% for i = 1:n
%     d=diag(Ds);
%     di=d(i);
%     if i < n
%         di1=d(i+1);lambda=(di+di1)/2;          %initialiser 
%     else
%         di1=d(n)+norm(v)^2;lambda=di1;
%     end
%     eta = 1;
%     psi1 = sum((v(1:i).^2)./(d(1:i) - lambda));
%     psi2 = sum((v(i+1:n).^2)./(d(i+1:n) - lambda));
%     if 1+psi1+psi2>0, % zero is on the left half of the interval
%         d=d-di; lambda=lambda-di;di1=di1-di;di=0;
%         while abs(eta) > 10*eps
%             psi1 = sum(v(1:i).^2./(d(1:i) - lambda));
%             psi1s = sum(v(1:i).^2./((d(1:i) - lambda)).^2);
%             psi2 = sum((v(i+1:n)).^2./(d(i+1:n) - lambda));
%             psi2s = sum(v(i+1:n).^2./((d(i+1:n) - lambda)).^2);
%             % Solve for zero
%             Di = -lambda; Di1 = di1 - lambda;
%             a = (Di + Di1)*(1 + psi1 + psi2) - Di*Di1*(psi1s+psi2s);
%             b = Di*Di1*(1 + psi1 + psi2);
%             c = (1 + psi1 + psi2) - Di*psi1s - Di1*psi2s;
%             if a > 0,
%                 eta = (2*b)/(a + sqrt(a^2 - 4*b*c)); else
%                 eta = (a - sqrt(a^2 - 4*b*c))/(2*c);
%             end
%             lambda = lambda + eta;
%         end
%         Dl(i,i)=Ds(i,i)+lambda;
%     else % zero is on the right half of the interval
%         d = d - di1; lambda = lambda - di1; di = di - di1;
%         while abs(eta) > 10*eps
%             psi1 = sum(v(1:i).^2./(d(1:i) - lambda));
%             psi1s = sum(v(1:i).^2./((d(1:i) - lambda)).^2);
%             psi2 = sum((v(i+1:n)).^2./(d(i+1:n) - lambda));
%             psi2s = sum(v(i+1:n).^2./((d(i+1:n) - lambda)).^2);
%             % Solve for zero
%             Di = di - lambda;
%             Di1 = - lambda;
%             a = (Di + Di1)*(1 + psi1 + psi2) - Di*Di1*(psi1s+psi2s);
%             b = Di*Di1*(1 + psi1 + psi2);
%             c = (1 + psi1 + psi2) - Di*psi1s - Di1*psi2s;
%             if a > 0,
%                 eta = (2*b)/(a + sqrt(a^2 - 4*b*c));
%             else
%                 eta = (a - sqrt(a^2 - 4*b*c))/(2*c);
%             end
%             lambda = lambda + eta;
%         end
%         Dl(i,i)=Ds(i+1,i+1)+lambda;
%     end
% end
% 
% 
% 
% 
% 
% 
% % solution de l'équation 5.26
% % b=-(c1+c2+c3*(d1+d2));
% % c=c1*d2+c2*d1+c3*d1*d2;
% % deter=sqrt(b*b-4*c);
% % r1=(-b+deter)/2;
% % r2=(-b-deter)/2;
% % if(d1<=r1<=d2)
% %     root=r1;
% % else
% %     root=r2;
% % end
% 
% 
% 
% 
% end

