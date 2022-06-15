'''Function that recieves a differentiable map and produces a set of
fast_callables in order to evaluate the map in coordinates'''
def get_num_funcs(Psi):
    expressions = Psi.expr()
    psi_x = fast_callable(expressions[0], vars=[x,y,z, px, py, pz, dt])
    psi_y = fast_callable(expressions[1], vars=[x,y,z, px, py, pz, dt])
    psi_z = fast_callable(expressions[2], vars=[x,y,z, px, py, pz, dt])
    psi_px = fast_callable(expressions[3], vars=[x,y,z, px, py, pz, dt])
    psi_py = fast_callable(expressions[4], vars=[x,y,z, px, py, pz, dt])
    psi_pz = fast_callable(expressions[5], vars=[x,y,z, px, py, pz,  dt])
    return psi_x, psi_y,psi_z, psi_px, psi_py,psi_pz
