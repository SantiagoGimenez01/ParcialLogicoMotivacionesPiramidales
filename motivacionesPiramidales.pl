% El punto de partida es que las necesidades humanas se jerarquizan en niveles:
% ● Respiración, alimentación, descanso y reproducción son necesidades del nivel más básico, llamado fisiológico.
% ● Integridad física, empleo, salud son necesidades del nivel seguridad.
% ● Amistad, afecto, intimidad son necesidades del nivel social.
% ● Confianza, respeto y éxito son necesidades del nivel reconocimiento.
% ● Hay un último nivel llamado de autorrealización, con sus correspondientes necesidades.

% Punto 1
% Agregar hechos para completar la información de las necesidades y niveles con algunos de los ejemplos mencionados e inventando nuevas necesidades 
% e incluso niveles. Se asume que los niveles son distintos y están ordenados jerárquicamente entre sí, que no hay niveles sin necesidades y que
% una misma necesidad no puede estar en dos niveles a la vez.

% necesidad(Necesidad, Nivel)
necesidad(respiracion, fisiologico).
necesidad(descanso, fisiologico).
necesidad(salud, seguridad).
necesidad(empleo, seguridad).
necesidad(amor, social).
necesidad(amistad, social).
necesidad(respeto, reconocimiento).
necesidad(confianza, reconocimiento).
necesidad(serExpertoEnAlgo, autorrealizacion).
necesidad(tenerExito, autorrealizacion).
% NivelSuperior(Superior, Inferior)
nivelSuperior(autorrealizacion, reconocimiento).
nivelSuperior(reconocimiento, social).
nivelSuperior(social, seguridad).
nivelSuperior(seguridad, fisiologico).

% Punto 2
% Permitir averiguar la separación de niveles que hay entre dos necesidades, es decir la cantidad de niveles que hay entre una y otra.
% Por ejemplo, con los ejemplos del texto de arriba, la separación entre empleo y salud es 0, y la separación entre respiración y confianza es 3.
% Nota: No agregar hechos de otros predicados, sino utilizar los ya definidos. El predicado nivelSuperior se refiere al nivel inmediatamente superior, 
% no agregar hechos como nivelSuperior(autorrealizacion,social).

separacionEntreNecesidades(UnaNecesidad, OtraNecesidad, Separacion):-
    necesidad(UnaNecesidad, NivelUna),
    necesidad(OtraNecesidad, NivelOtra),
    separacionEntreNiveles(NivelUna, NivelOtra, Separacion).

separacionEntreNiveles(UnNivel, OtroNivel, 0):-
    UnNivel = OtroNivel.
separacionEntreNiveles(UnNivel, OtroNivel, Separacion):-
    nivelSuperior(UnNivel, NivelMedio),
    separacionEntreNiveles(NivelMedio, OtroNivel, SeparacionParcial),
    Separacion is (SeparacionParcial + 1).
separacionEntreNiveles(UnNivel, OtroNivel, Separacion):-
    nivelSuperior(OtroNivel, NivelMedio),
    separacionEntreNiveles(NivelMedio, UnNivel, SeparacionParcial),
    Separacion is (SeparacionParcial + 1).