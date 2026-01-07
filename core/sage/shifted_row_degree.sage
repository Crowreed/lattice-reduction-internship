from sage.all import *

def shifted_row_degree(M, s):
    r"""
    Calcule le degré décalé (shifted degree) des lignes d'une matrice de polynômes.
    
    Le degré décalé d'une ligne $i$ par rapport à un vecteur de poids $s$ est défini par :
    $deg_s(row_i) = \max_{j} \{ \deg(M_{i,j}) + s_j \}$
    
    INPUT:
        M -- Une matrice de polynômes à r lignes et c colonnes.
        s -- Un vecteur (ou liste) d'entiers de taille c représentant les décalages (weights).
             
    OUTPUT:
        Une matrice 1 x r (vecteur ligne) contenant les degrés décalés de chaque ligne.
    """
    r = M.nrows()
    c = M.ncols()
    
    shifted_row_degree = Matrix(ZZ, 1, r)

    for i in range(r):
        shifted_row_degree[0, i] = max((M[i, j].degree()+s[j]) for j in range(c))

    return shifted_row_degree