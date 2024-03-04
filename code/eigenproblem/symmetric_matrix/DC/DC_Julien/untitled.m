% D?finition de la matrice tridiagonale 6x6
fprintf('Matrice initiale T : \n');
T = [6 6 0 0 0 0; 6 1 3 0 0 0; 0 3 4 5 0 0; 0 0 5 4 8 0; 0 0 0 8 8 7; 0 0 0 0 7 4];

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

fprintf('Recombinainson de T1 et T2\n');
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
zT = [Q1(end,:), Q2(1,:)]; % z^T est le vecteur ligne
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
w=beta*zT';
disp(w);


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

%calcul et comparaison des valeurs prorpes et vecteurs propres 
[Q_T,D_T]=eig(T);
fprintf('Q_T\n');
disp(Q_T);
fprintf('D_T\n');
disp(D_T);

% Définition de l'équation séculaire
function f = secular_equation(lambda, D, w)
    f = 1 +  sum((w.^2) ./ (diag(D) - lambda));
end