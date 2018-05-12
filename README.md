# Bachelorthesis_GeoPDE_NURBS

## Questions and Answers

**Q:** What are internal degrees of freedom?<br/>
**A:** no Answer yet

**Q:** What is the aim of the optimization, when is the field considered "ideal"?<br/>
**A:** no Answer yet

**Q:** What are the mathematical details, that are relevant for the optimization problem?<br/>
**Considerations:** moving the knots<br/>
**A**: no Answer yet

**Q:** Why does the multiplicity of the knot vector lower the level of continuity at this point?<br/>
**A**: no Answer yet

**Q:** The provided pierce_gun_complete.igs is just a cartesian mesh and not a nurbs mesh, is that right?<br/>
**Considerations:** The ParameterData array extracted by the igesToolBox has some cells, that are nurbs, with fields, of which some could be interpreted as as nurbs and therefore converted<br/>
**A**: no Answer yet

**Q:** Will I be provided with a particle tracker?<br/>
**A**: no Answer yet

**Q:** So far I have no way to validate my solutions, since an anlytic solution cannot be obtained. Shozld I possibly calidate against an existing simulation?<br/>
**A**: no Answer yet

**Q:** Will the geometry be constructed as multi  or single patch?<br/>
**A**: no Answer yet

**Q:** ?<br/>
**A**: no Answer yet

### Classes
 
**msh** = msh_cartesian (knots , qn, qw, **geometry**) % quadrature rule : the points where we want to evaluate the function. qn, qw could be gauss nodes, for instance

**space** = sp_nurbs (**geometry**.nurbs, **msh**) % information to compute the basis functions of the descrete space V_h

**geometry** : information to evaluate **F** and its derivatives

### Functions

function 
 
## Timescedule

#### 16.05. after 14:00 - Meeting with Peter and Jack at Dolivostr. 
Status: need to confirm time with Peter

#### End of May - delivering the Proseminar
Status: need to set an appointment with Jack

