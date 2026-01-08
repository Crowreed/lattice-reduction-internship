def diagonal_matrix_from_vector(s):
    r"""
    Construit une matrice diagonale de polynômes où les éléments diagonaux 
    sont des puissances de x définies par le vecteur d'entrée s.

    Cette fonction initialise un anneau de polynômes sur les rationnels (QQ[x]) 
    et retourne une matrice carrée de dimension n x n, où n est la longueur de s.

    Mathématiquement, si $s = [s_0, s_1, ..., s_{n-1}]$, la matrice $M$ est définie par :
    $$ M_{i,j} = \begin{cases} x^{s_i} & \text{si } i = j \\ 0 & \text{sinon} \end{cases} $$

    Args:
        s (list[int]): Une liste ou un vecteur d'entiers représentant les exposants 
                       de la variable x sur la diagonale.

    Returns:
        sage.matrix.matrix_space.Matrix: Une matrice diagonale dans l'anneau R = QQ[x].

    Example:
        sage: s = [1, 2, 0]
        sage: M = diagonal_matrix_from_vector(s)
        sage: print(M)
        [x 0 0]
        [0 x^2 0]
        [0 0
    # Définir l'anneau des polynômes en x sur les rationnels (ou un autre corps si nécessaire)
    R.<x> = QQ[]
    
    # Créer la matrice diagonale
    n = len(s)
    M = Matrix(R, n, n, lambda i, j: x^s[i] if i == j else 0)
    
    return M