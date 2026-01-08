def sandpile(B, title, save=False, show_=True):
    _, _, norms = gram_schmidt(copy(B))
    
    lognorms = [log(sqrt(norm), 2).n() for norm in norms]
        
    plot_values(values=[lognorms],
                title=title,
                axes_labels=('',''),
                legend_labels=[r"$\log(D)=$"+str(nint(log(D(B), 2)))],
                lines=[],
                save=save,
                show_=show_)