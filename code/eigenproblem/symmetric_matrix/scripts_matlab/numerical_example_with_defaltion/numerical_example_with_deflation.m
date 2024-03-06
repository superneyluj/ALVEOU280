%Numerical example of Cuppen's divide and conquer algorithm

T=[
2,1,0,0,0,0;
1,2,1,0,0,0;
0,1,2,1,0,0;
0,0,1,2,1,0;
0,0,0,1,2,1;
0,0,0,0,1,2];
disp('Matrice initiale T');
disp(T);

T_0=[
2,1,0,0,0,0;
1,2,1,0,0,0;
0,1,1,0,0,0;
0,0,0,1,1,0;
0,0,0,1,2,1;
0,0,0,0,1,2];
disp('Matrice T_0');
disp(T);

u=[
0;
0;
1;
1;
0;
0;];
disp('Vecteur u qui permet de retomber sur le matrice initiale en faisant T=T_0+u*u^T');
disp(u);

%verification
disp('Verfication d egalites');
T_reconstructed = T_0+u*u';

if isequal(T,T_reconstructed)
   disp('OK');
else
   disp('Les matrices ne sont pas egales');
end

%diagonalisation de la matrice T_0
[Q,D]=eig(T_0);
disp('Récupération des valeurs propres dans D et vecteurs propres dans Q');
disp('D');
disp(D);

% Trouver les indices des colonnes non nulles pour la partie superieure (lignes 1 a 3)
non_zero_columns_top = find(any(Q(1:3, :) ~= 0, 1));

% Trouver les indices des colonnes non nulles pour la partie inferieure (lignes 4 a 6)
non_zero_columns_bottom = find(any(Q(4:6, :) ~= 0, 1));

% Organiser Q en placant ces colonnes dans l'ordre souhaite
organized_columns = [non_zero_columns_top, non_zero_columns_bottom];
Q_organized_by_column = Q(:, organized_columns);

% Affichage de la nouvelle matrice Q_organized_by_column
disp('Q');
disp(Q_organized_by_column);

% Construction du vecteur u
v = [Q_organized_by_column(1:3,3); Q_organized_by_column(4:6,4)];

% Afficher le vecteur u
disp('Vecteur v :');
disp(v);

%verification que Q_0'*T*Q_0=D_0+u_0*u_0'
verif1 =  Q'*T*Q;
verif2 = D+v*v';
verif3 = Q*D*Q';

disp('Verif1 : Q^T*T*Q');
disp(verif1);
disp('Verif2: D+v*v^T');
disp(verif2);
disp('Verif1 devrait etre egale a Verif2');
disp('Verif3 matrice T_0=Q*D*Q^T');
disp(verif3);

disp('Sur la matrice diagonale, nous observons 3 doubles eigenvalues');
disp(D);
disp('On peut donc creer des matrices de rotation pour annuler les elements en double');
disp('G=G1(1,4,Pi/4)G2(2,5,Pi/4)G3(3,6,Pi/4)');

% Taille de la matrice
n = 6;

% Génération des matrices de rotation
G1 = rotationMatrix(1, 4, pi/4, n);
G2 = rotationMatrix(2, 5, pi/4, n);
G3 = rotationMatrix(3, 6, pi/4, n);
G=G1*G2*G3;

% Affichage des matrices générées
disp('Matrice de rotation G :');
disp(G);

%Donc G^T*Q^T*T*Q_0*G=G^T*Q^T*T_0*Q*G+G^T*v(G^T*^)^T=D+G^T*v(G^T*v)^T
disp('Verification numerique');
new_v = G'*v;
new_v2 = v'*G;
disp(new_v);

