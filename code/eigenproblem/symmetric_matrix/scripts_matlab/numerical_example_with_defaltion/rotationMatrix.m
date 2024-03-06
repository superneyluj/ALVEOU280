% Fonction pour generer une matrice de rotation G
function G = rotationMatrix(i, j, theta, n)
    % Creation de la matrice d'identite
    G = eye(n);

    % Calcul des elements de la matrice de rotation
    c = cos(theta);
    s = sin(theta);

    % Mise a jour des elements de la matrice de rotation
    G(i, i) = c;
    G(j, j) = c;
    G(i, j) = s;
    G(j, i) = -s;
end
