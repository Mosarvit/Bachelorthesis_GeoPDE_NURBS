%% MESH CLASS AND MESH PRECOMPUTATION

geometry = geo_load ('ring_refined.mat');
knots = geometry.nurbs.knots;

[qn, qw] = msh_set_quad_nodes (knots, msh_gauss_nodes (geometry.nurbs.order));
msh = msh_cartesian (knots, qn, qw, geometry);

msh_eval = msh_precompute (msh);