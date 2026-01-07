def random_full_rank_matrix (n_rows, n_cols, ring, bound, seed):
    if seed is not None:
        set_random_seed(seed)

    while True:
        try:
            if(ring.is_finite()):
                    M = matrix(ring, n_rows, n_cols, lambda i, j: ring.random_element())
            else:
                M = matrix(ring, n_rows, n_cols, lambda i, j: ring.random_element(bound))
        
        except (AttributeError, TypeError):
            M = matrix(ring, n_rows, n_cols, lambda i, j: ring(randint(-bound, bound)))
        
        if M.rank() == min(n_rows, n_cols):
            return M