from sage.all import *

def nint(x):
    r"""
    Retourne l'entier le plus proche de `x`.

    L'entier le plus proche de `0.5` est `1`.

    INPUT:

    - ``x`` -- réel, entier, relatif

    OUTPUT:

    Entier. L'entier le plus proche de `x`.

    EXAMPLES:

        sage: nint(pi)
        3
        sage: nint(11/4)
        3
        sage: nint(0.5)
        1
        sage: nint(-1.234)
        -1
    """
    return ZZ(floor(x + QQ(1/2)))