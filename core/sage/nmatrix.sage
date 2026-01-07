
load("nint.sage")

from sage.all import *

def nmatrix(M):
    r"""
    Retourne la matrice `A` dont les coefficients sont les arrondis de `M`.

    Autrement dit, si `M = (m_{ij})`, la fonction retourne `A = (a_{ij})` 
    tel que `a_{ij} = \text{nint}(m_{ij})`.

    INPUT:

    - ``M`` -- une matrice (à coefficients réels, rationnels ou symboliques).

    OUTPUT:

    Une matrice définie sur l'anneau des entiers (``ZZ``).

    EXAMPLES::

        sage: M = matrix([[1.1, 1.9], [-2.6, 3.5]])
        sage: nmatrix(M)
        [ 1  2]
        [-3  4]

        Cela fonctionne aussi avec des nombres rationnels :

        sage: A = matrix(QQ, [[1/3, 2/3], [4/3, 5/3]])
        sage: nmatrix(A)
        [0 1]
        [1 2]
        
        Vérification du type de retour :
        
        sage: nmatrix(M).parent()
        Full MatrixSpace of 2 by 2 dense matrices over Integer Ring
    """
    f = lambda x: nint(x) # type: ignore
        
    return M.apply_map(f).change_ring(ZZ)