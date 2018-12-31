**General**: - Wie hängen Basisfunktion und Quadraturregel zusammen? 
- für das Integral, also die eigentliche DGL wird nur die Quadraturregel ausgewertet oder?
- diese ist dann auf der durch die NURBS definierten Fläche definiert mit Quadraturpunkten in denen Gauss-Quadratur ausgeführt wird?
- daraus Koeffizienten für das Lösen des Problems Au = sum(aN) mit a Koeffizient und N irgendwie Basisfunktion des Gebiets?


**Birdsall_1985**: -


**Charged Particle Beams - S. Humphries**: -


**Cottrell_2009aa**: -


**Dimplomarbeit_Simulation_Geladener_Teilchen**: - allg. Plasmagleichungen?
- Teilchendynamik nicht relativistisch, aber gut beschrieben
- Alles auf FIT basierend (wirkt so)


**GeoPDEs_talk**:


**Gjonaj_2003**: - Vorteil von IGA wird das behandeln kurviger Ränder sein
- Behandlung von den particle-particle Interaktionen nicht ganz klar
- Von welcher Emission gehen wir aus, space-charge-limited?
- Bestimmen der Randbedingungen von phi und Initialbedingungen von ri und vi wichtig!
- IC mit Hilfe von Child-Langmuir?
- Magnetfeld erst am Ende einprägen, davor schlechte Näherung, weil Teilchen auch durch ihre Magnetfelder aufeinander einwirken
- IC: particle Positionen wählen und dann Ladung und Geschwindigkeit so bestimmen, dass Child-Langmuir erfüllt ist
- Algorithmus für die IC vorgeschlagen, wenn IC nicht alle stimmen, konvergiert die Feldlösung nicht
- Wie iteriere ich zwischen Feldlösung und Stromlösung, was verwende ich aus der Stromlösung für das Feld?
- nach dem ersten PIC-step sollten IC eigentlich immer stimmen oder? Nein!, in jedem Schritt werden neue Teilchen emittiert
- bei der Lösung der Teilchendynamik benötige ich das E-Feld, aus grad(phi) im Diskreten?


**Gjonaj_2004**: - Teilchendynamik mit FIT, Ladungserhaltung durch FIT berücksichtigt


**Hughes_2005aa**: - 


**Lewis**: - Optimierungsalgorithmen, Particle Pusher nur kurz erklärt mit Algorithmus


**Vazquez_2016**: - FEM, Galerkin discretization, NURBS
- variational form problem (Galerkin)
- Hilbert space
- mixed form problem (written in)
- multivariate B-splines
- hierarchical splines
- L^2: 2-mal integrierbare Funktionen
- push-forward: verallgemeinerte Richtungsableitung, soll das die Abbildung von diskret -> analytisch realisieren?
- tensor-product spline space
- **nrbmultipatch** in NURBS toolboxs

