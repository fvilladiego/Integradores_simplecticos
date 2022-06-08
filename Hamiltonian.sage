#Definición del Hamiltoniano


n = 3 #cantidad de grados de libertad

M=Manifold(2*n, name='M', structure="differentiable"); M

std.<x, y, z, px, py, pz> = M.chart('x y z px:p_x py:p_y pz:p_z',
        coord_restrictions= lambda x,y,z,px,py,pz :x**2 + y**2 + z**2 !=0); std

##Notese que estamos restringiendo la carta para que no considere el origen y
##también le pasamos la restricción
##a sage para la manipulación simbólica.

(x**2 + y**2+z**2>0).assume()

H_V = M.scalar_field(-1/sqrt(x**2 + y**2 + z**2), name=r'H_V')
H_T = M.scalar_field( (px^2 +py^2 + pz^2 )/2  , name='H_T' )
H = H_V + H_T

def beta_inverse(alpha):
    M = alpha.domain()
    e = M.default_frame()
    ##hasta donde revisé, no hay una forma más simple de acceder a los componentes de la forma.
    ##Me faltó revisar la documentación de campos tensoriales, a lo mejor allá hablan algo de eso.
    #OJO: Se asume que la variedad es de dimensión par y el marco por defecto es la base canónica.
    n= M.dimension()
    X_alpha_q = sum(alpha(e[i+n/2])*e[i] for i in range(0,n/2))
    X_alpha_p = sum(-alpha(e[i])*e[i+n/2] for i in range(0,n/2))
    X_alpha = X_alpha_q + X_alpha_p
    return X_alpha

#Diferenciales
dH_V = H_V.differential()
dH_T = H_T.differential()

#Campos Hamiltonianos
X_V = beta_inverse(dH_V)
X_T = beta_inverse(dH_T)
