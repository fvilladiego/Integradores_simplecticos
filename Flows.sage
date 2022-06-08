load("Fields.sage")

dt = var('dt', latex_name = r'\Delta t')
Psi_T = M.diff_map(M, [x + X_T[0].expr() * dt ,
                            y + X_T[1].expr() * dt, z + X_T[2].expr()* dt ,
                       px , py , pz], latex_name=r"\psi_{H_T}^{\Delta t}")

Psi_V = M.diff_map(M, [x, y, z,  X_V[3].expr()*dt + px,
                       X_V[4].expr()*dt + py, X_V[5].expr()*dt + pz],
                       latex_name=r"\psi_{H_V}^{\Delta t}")
