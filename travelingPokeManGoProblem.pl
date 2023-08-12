% camino(GymA, GymB, DuracionViajeMin, CantidadPokeparadas).
camino(plaza_de_mayo, congreso, 9, 15).
camino(plaza_de_mayo, teatro_colon, 11, 15).
camino(plaza_de_mayo, abasto_shopping, 19, 28).
camino(plaza_de_mayo, cementerio_recoleta, 26, 36).
camino(congreso, teatro_colon, 10, 11).
camino(congreso, cementerio_recoleta, 15, 16).
camino(teatro_colon, abasto_shopping, 13, 20).
camino(teatro_colon, cementerio_recoleta, 17, 24).
camino(abasto_shopping, cementerio_recoleta, 27, 32).

/**
 * mejorTour/2 relaciona un tiempo límite con un tour que se puede hacer dentro del mismo.
 * Debe ser inversible para el tour.
 * */
mejorTour(a, b).

/**
 * estaSitiado/1 se cumple (o no) para un gimnasio. 
 * Debe ser inversible. 
 * */
estaSitiado(a).