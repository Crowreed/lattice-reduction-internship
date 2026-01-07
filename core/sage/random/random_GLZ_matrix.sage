def random_GLZ_matrix(n):
    random = matrix.identity(ZZ, n)
    
    for i in range(100):
        
        a=ZZ.random_element(n)
        b=ZZ.random_element(n)
        
        if a!=b:
            random = random.with_added_multiple_of_row(a, b, 1)
        
    return random