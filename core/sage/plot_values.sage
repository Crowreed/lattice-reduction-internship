def plot_values(values,
                title=None,
                axes_labels=('', ''),
                legend_labels=[],
                lines=[],
                colors=['darkblue', 'red', 'green'],
                save=False,
                show_=True,
                filename=None,
                dpi=300):
    
    G = Graphics()
    
    for k, value in enumerate(values):
        coords = [(i, j) for i, j in enumerate(value)]
        pts=point(coords, size=20, color=colors[k], legend_label=legend_labels[k])
        
        pts.set_legend_options(loc='upper right', fontsize=9, frameon=False, bbox_to_anchor=(1.4, 1))
        G += pts
    
    ymax = max([max(value) for value in values])
    ymin = min([min(value) for value in values])

    G.set_axes_range(xmin=0, ymin=ymin, ymax=ymax)
    
    for y in lines:
        G += line([(0,y), (len(value),y)], color='red', linestyle='--', legend_label=r"$y=$"+str(y))
    
    
    if show_:
        G.show(title=title, axes_labels=axes_labels, ticks=[max(nint(len(value)/10), 1), max(nint((ymax-ymin)/10), 1)], gridlines=False)
    
    if save:
        if filename is None:
            filename = str(title)+"_plot.png"
        G.save(filename, dpi=dpi)