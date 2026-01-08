def plot_lattice(L,
                 grid_radius = 5,
                 grid1 = True,
                 grid2 = True,
                 L_basis = True,
                 GS_basis = False,
                 LLL_basis = False,
                 circles = None,
                 dots = None,
                 save = True,
                 filename = None):
    
    if filename is None:
        filename="plot.png"
        
    G = Graphics()

    if grid1:
        for k in range(-2*grid_radius^2, 2*grid_radius^2+1):
            G += line(
                [
                    (k, -grid_radius),
                    (k, grid_radius)
                ], color = 'lightgray', thickness = 0.9, linestyle = ':', zorder = 1)

            G += line(
                [
                    (-grid_radius, k),
                    (grid_radius, k)
                ], color = 'lightgray', thickness = 0.9, linestyle = ':', zorder = 1)

    if grid2:
        for k in range(-2*grid_radius^2, 2*grid_radius^2):
            G += line(
                [
                    (
                        -grid_radius^2 * L[0, 0] + k * L[1, 0], 
                        -grid_radius^2 * L[0, 1] + k * L[1, 1]
                    ), 
                    (
                        grid_radius^2 * L[0, 0] + k * L[1, 0], 
                        grid_radius^2 * L[0, 1] + k * L[1, 1]
                    )
                ], color = 'lightgray', thickness = 1.1, linestyle = ':', zorder = 2)
            
            G += line(
                [
                    (
                        -grid_radius^2 * L[1, 0] + k * L[0, 0], 
                        -grid_radius^2 * L[1, 1] + k * L[0, 1]
                    ), 
                    (
                        grid_radius^2 * L[1, 0] + k * L[0, 0], 
                        grid_radius^2 * L[1, 1] + k * L[0, 1]
                    )
                ], color = 'lightgray', thickness = 1.1, linestyle = ':', zorder = 2)
            
            
    pts = []
    
    for i in range(-2*grid_radius^2, 2*grid_radius^2):
        for j in range(-2*grid_radius^2, 2*grid_radius^2):
                x = L[0, 0] * i + L[1, 0] * j
                y = L[0, 1] * i + L[1, 1] * j

                pts.append((x, y))

    G += points(pts, size = 20, color = 'black', zorder = 3)

    if(L_basis):
        G += arrow((0,0), L[0], color = 'black', width = 2)
        G += arrow((0,0), L[1], color = 'black', width = 2)

    if(GS_basis):
        GS = gram_schmidt(L)[1]
        G += arrow((0,0), GS[0], color = 'red', linestyle = ':', width = 2)
        G += arrow((0,0), GS[1], color = 'red', linestyle = ':', width = 2)

    if(LLL_basis):
        LL = LLL(L)
        G += arrow((0,0), LL[0], color = 'green', width = 2)
        G += arrow((0,0), LL[1], color = 'green', width = 2)

    if circles is not None:
        for xy, r, n, col in circles:
            (x, y) = xy
            G += circle((x, y), r, thickness = 0.9, color = col)
            G += text(n, (r - 0.2, -r + 0.2), fontsize = 20, color = col)
            
    if dots is not None:
        for xy, n, col in dots:
            (x, y) = xy
            G += point((x, y), size = 30, color = col)
            G += text(n, (x + 0.4, y + 0.4), fontsize = 20, color = col)
    

    G.show(xmin = -grid_radius,
           xmax = grid_radius,
           ymin = -grid_radius,
           ymax = grid_radius,
           axes = False,
           dpi = 150,
           aspect_ratio = 1)
    
    if save:
        G.save(filename,
               dpi = 300,
               axes = False,
               aspect_ratio = 1)