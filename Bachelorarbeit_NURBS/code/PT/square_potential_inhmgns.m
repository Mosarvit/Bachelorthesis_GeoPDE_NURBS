%Solves Poisson's equation to obtain the electrostatic potential
%drchlt on sides 1 and 2 and nmmn on sides 3 and 4

pkg load geopdes;
pkg load nurbs;

clear all;
close all;
clc;

drchlt_sides = [1 2];
nmnn_sides   = [3 4];

geometry = geo_load ('square_gmtry.mat');
knots = geometry.nurbs.knots;

[qn, qw] = msh_set_quad_nodes (knots, msh_gauss_nodes (geometry.nurbs.order));
msh = msh_cartesian (knots, qn, qw, geometry);

space  = sp_nurbs (geometry.nurbs, msh);

mat = op_gradu_gradv_tp (space, space, msh); 
rhs = zeros (space.ndof, 1);  %Poisson rhs

for iside = nmnn_sides
%  gside = @(x, y) 0*(-exp(x) .* cos(y));
  gside = @(x, y) zeros (size(x));
  dofs = space.boundary(iside).dofs;
  rhs(dofs) = rhs(dofs) + op_f_v_tp (space.boundary(iside), msh.boundary(iside), gside);
end

drchlt_dofs = [];
M_drchlt = spalloc (space.ndof, space.ndof, space.ndof);
rhs_drchlt = zeros (space.ndof, 1);
u = zeros (space.ndof, 1);
for iside = drchlt_sides
  dofs = space.boundary(iside).dofs;
  drchlt_dofs = union (drchlt_dofs, dofs);
  if(iside==1)
  hside = @(x,y) zeros (size(x));
  elseif(iside==2)
  hside = @(x,y) 10 * ones (size(x));
  endif
%  hside = @(x, y) exp(x) .* sin(y);
  M_side = op_u_v_tp (space.boundary(iside), space.boundary(iside), msh.boundary(iside));
  M_drchlt(dofs, dofs) = M_drchlt(dofs,dofs) + M_side;
  rhs_drchlt(dofs) = rhs_drchlt(dofs) + op_f_v_tp (space.boundary(iside), msh.boundary(iside), hside);
end
int_dofs = setdiff (1:space.ndof, drchlt_dofs);
u(drchlt_dofs) = M_drchlt(drchlt_dofs, drchlt_dofs) \ rhs_drchlt(drchlt_dofs);
rhs(int_dofs) = rhs(int_dofs) - mat(int_dofs, drchlt_dofs) * u(drchlt_dofs);

u(int_dofs) = mat(int_dofs, int_dofs) \ rhs(int_dofs);

sp_to_vtk (u, space, geometry, [20 20], 'square_potential_inhmgns.vts', 'u')
disp('done')