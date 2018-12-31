%Solves Poisson's equation to obtain the electrostatic potential
%drchlt on sides 1 and 2 and nmmn on sides 3 and 4

geometry = geo_load ('square_gmtry.mat');
knots = geometry.nurbs.knots;

[qn, qw] = msh_set_quad_nodes (knots, msh_gauss_nodes (geometry.nurbs.order));
msh = msh_cartesian (knots, qn, qw, geometry);

space  = sp_nurbs (geometry.nurbs, msh);

mat = op_gradu_gradv_tp (space, space, msh);
rhs = op_f_v_tp (space, msh, @(x, y) 0*(8-9*sqrt(x.^2+y.^2)).*sin(2*atan(y./x))./(x.^2+y.^2));

drchlt_dofs = [];
for iside = 1:4
  drchlt_dofs = union (drchlt_dofs, space.boundary(iside).dofs);
end
int_dofs = setdiff (1:space.ndof, drchlt_dofs);

u = zeros (space.ndof, 1);
u(int_dofs) = mat(int_dofs, int_dofs) \ rhs(int_dofs);

sp_to_vtk (u, space, geometry, [20 20], 'square_potential.vts', 'u')
%err = sp_l2_error (space, msh, u, @(x,y)(x.^2+y.^2-3*sqrt(x.^2+y.^2)+2).*sin(2.*atan(y./x)))