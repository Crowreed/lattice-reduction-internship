from sage.all import *

def row_degree(M):
    r"""
    Calcule le degré de chaque ligne d'une matrice de polynômes.
    
    Le degré d'une ligne est défini comme le degré maximum parmi tous 
    les polynômes présents dans cette ligne.
    
    INPUT:
        M -- Une matrice dont les coefficients sont des polynômes 
             (ex: sur un anneau R[x]).
             
    OUTPUT:
        Une matrice de taille 1 x n (vecteur ligne) contenant les degrés.
    """
    rdeg = Matrix(ZZ, 1, M.nrows())

    for i in range(M.nrows()):
        rdeg[0, i] = max(M[i, j].degree() for j in range(M.ncols()))

    return rdeg