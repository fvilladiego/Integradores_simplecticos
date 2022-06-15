#Here we define multiple flows that will be used
load("Fields.sage")

dt = var('dt', latex_name = r'\Delta t')
Psi_T = M.diff_map(M, [x + X_T[0].expr() * dt ,
                            y + X_T[1].expr() * dt, z + X_T[2].expr()* dt ,
                       px , py , pz], latex_name=r"\psi_{H_T}^{\Delta t}")

Psi_V = M.diff_map(M, [x, y, z,  X_V[3].expr()*dt + px,
                       X_V[4].expr()*dt + py, X_V[5].expr()*dt + pz],
                       latex_name=r"\psi_{H_V}^{\Delta t}")
#Euler Flows
EulerFlow1 = Psi_T * Psi_V
EulerFow2 = Psi_V * Psi_T

#Storm-Verlet Flow
Psi_V_scaled = M.diff_map(M, [x, y, z,  X_V[3].expr()*dt/2 + px,
                              X_V[4].expr()*dt/2 + py, X_V[5].expr()*dt/2 + pz],
                          latex_name=r"\psi_{H_{V'}}^{\Delta t}")

SVFlow = Psi_V_scaled * Psi_T * Psi_V_scaled
