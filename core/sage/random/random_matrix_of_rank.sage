def random_matrix_of_rank (n_rows, n_cols, rank, ring, bound, seed):
    
    if seed is not None:
        set_random_seed(seed)
        
    if not (1 <= rank <= min(n_rows, n_cols)):
        raise ValueError("Le rang doit être dans [1, max(n_rows, n_cols)]")

    if(rank == max(n_rows, n_cols)):
        return random_full_rank_matrix(n_rows, n_cols, ring, bound, seed)
    
    U = random_full_rank_matrix(n_rows, rank, ring, bound, seed)
    V = random_full_rank_matrix(rank, n_cols, ring, bound, seed)
    
    A = U * V
    
    #P = Permutations(n_rows)[randint(0, factorial(n_rows))].to_matrix()
    
    #A = P*A
    
    if A.rank() != rank:
        raise RuntimeError(f"Rang inattendu : {A.rank()} ≠ {r}")
    
    return A