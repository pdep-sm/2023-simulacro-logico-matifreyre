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
% mejorTour(a, b).
mejorTour(Limite, Tour):-
    secuenciaEnTiempo(Tour, Limite, Paradas),
    not((secuenciaEnTiempo(_, Limite, Paradas2), Paradas2 > Paradas)).

caminoNoDirigido(GymA, GymB, Duracion, Cantidad):-
    camino(GymA, GymB, Duracion, Cantidad).    
caminoNoDirigido(GymA, GymB, Duracion, Cantidad):-
    camino(GymB, GymA, Duracion, Cantidad).    

secuenciaEnTiempo(Gimnasios, TiempoTotal, PokeparadasEncontradas):-
    findall(Gym, gimnasio(Gym), Gyms),
    permutation(Gyms, Gimnasios),
    tour(Gimnasios, TiempoTranscurrido, PokeparadasEncontradas),
    TiempoTranscurrido =< TiempoTotal.

gimnasio(Gym):-
    distinct(Gym, caminoNoDirigido(Gym,_,_,_)).

tour([_], 0, 0).
tour([GymA, GymB | Gyms], TiempoTour, ParadasTour):-
    caminoNoDirigido(GymA, GymB, Tiempo, Paradas),
    tour([GymB | Gyms], TiempoResto, ParadasResto),
    TiempoTour is Tiempo + TiempoResto,
    ParadasTour is Paradas + ParadasResto.

/**
 * estaSitiado/1 se cumple (o no) para un gimnasio. 
 * Debe ser inversible. 
 * */
color(abasto_shopping, rojo).
color(congreso, azul).
color(cementerio_recoleta, amarillo).
color(teatro_colon, amarillo).
color(plaza_de_mayo, amarillo).

estaSitiado(Gym):-
    color(Gym, Color),
    vecino(Gym, Vecino),
    color(Vecino, ColorVecino),
    Color \= ColorVecino,
    forall(vecino(Gym, Vecino2), color(Vecino2, ColorVecino)).

vecino(Gym, Vecino):-
    caminoNoDirigido(Gym, Vecino, _ , _ ).
