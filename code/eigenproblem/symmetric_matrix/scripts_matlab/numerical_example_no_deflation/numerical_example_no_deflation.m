%Numerical example of Cuppen's divide and conquer algorithm

T=[
1,1,0,0,0,0;
1,2,1,0,0,0;
0,1,3,1,0,0;
0,0,1,4,1,0;
0,0,0,1,5,1;
0,0,0,0,1,6];

disp(T);

T_0=[
1,1,0,0,0,0;
1,2,1,0,0,0;
0,1,2,0,0,0;
0,0,0,3,1,0;
0,0,0,1,5,1;
0,0,0,0,1,6];

u=[
0;
0;
1;
1;
0;
0;];

%verification
fprintf('\n Verfication d egalites \n');
T_reconstructed = T_0+u*u';

if isequal(T,T_reconstructed)
   disp('OK');
else
   disp('Les matrices ne sont pas egales');
end

%diagonalisation de la matrice T_0
[Q,D]=eig(T_0);

% Trouver les indices des colonnes non nulles pour la partie superieure (lignes 1 a 3)
non_zero_columns_top = find(any(Q(1:3, :) ~= 0, 1));

% Trouver les indices des colonnes non nulles pour la partie inferieure (lignes 4 a 6)
non_zero_columns_bottom = find(any(Q(4:6, :) ~= 0, 1));

% Organiser Q en placant ces colonnes dans l'ordre souhaite
organized_columns = [non_zero_columns_top, non_zero_columns_bottom];
Q_organized_by_column = Q(:, organized_columns);

% Affichage de la nouvelle matrice Q_organized_by_column
disp('Q reorganisee :');
disp(Q_organized_by_column);

% Construction du vecteur v
v = [Q_organized_by_column(1:3,3); Q_organized_by_column(4:6,4)];

% Afficher le vecteur v
disp('Vecteur v :');
disp(v);

%verification que Q'*T*Q=D+v*v'
verif1 =  Q'*T*Q;
verif2 = D+v*v';
verif3 = Q*D*Q';

disp('Verif : Q^T*T*Q');
disp(verif1);
disp('Verif: D+v*v^T');
disp(verif2);
disp('Verif1 devrait etre egale a Verif2');
disp('Verif3 matrice Q*D*Q^T');
disp(verif3);
