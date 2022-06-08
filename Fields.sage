#Cálculo de los campos Hamiltonianos
load("Hamiltonian.sage")

'''Función que recibe una 1-forma(diferencial) y retorna un campo vectorial. El campo es definido en el frame por
    defecto de la variedad M sobre la que está definida la forma.
INPUT: (forma diferencial en sagemanifolds) forma diferencial alpha
OUTPUT: (campo vectorial en sagemanifolds) campo vectorial X_alpha'''
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
#Campos
X_T = beta_inverse(dH_T)
X_V = beta_inverse(dH_V)
