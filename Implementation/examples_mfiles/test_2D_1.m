%% SIMPLE GEOMETRIC ENTITIES
close all;
clear all;
clc;

geometry = geo_load('ring_refined.mat') ;

figure; 
clf();
nrbplot(geometry.nurbs, [3, 3]);


knots = geometry.nurbs.knots ;
[qn, qw] = msh_set_quad_nodes(knots , msh_gauss_nodes(geometry.nurbs.order ) ) ;
msh = msh_cartesian(knots , qn, qw, geometry) ;
space = sp_nurbs(geometry.nurbs, msh) ;
mat = op_gradu_gradv_tp( space , space , msh) ;
rhs = op_f_v_tp( space , msh, @(x , y )(8-9*sqrt (x.^2+y .^2) ) .* sin(2*atan( y ./ x) ) ./ ( x.^2+y .^2) ) ;
drchlt_dofs = [ ] ;
for iside = 1:numel ( space.boundary)
    drchlt_dofs = union( drchlt_dofs , space.boundary( iside ).dofs ) ;
end
int_dofs = setdiff(1: space.ndof , drchlt_dofs ) ;
u = ones( space.ndof , 1) ;
u( int_dofs ) = mat( int_dofs , int_dofs ) \ rhs ( int_dofs ) ;

vtk_pts = 20*ones(1, msh.ndim);
vtk_pts1 = {linspace(0, 1, 21), linspace(0, 1, 21)};

sp_to_vtk(u , space , geometry , vtk_pts , 'laplace_solution.vts' , 'u' )

exact_sl = @(x , y ) (x.^2+y.^2-3*sqrt(x.^2+y .^2) +2) .* sin(2.* atan ( y ./ x) );


% 4.2) PLOT IN MATLAB. COMPARISON WITH THE EXACT SOLUTION

[eu, F] = sp_eval (u, space, geometry, vtk_pts);
[X, Y]  = deal (squeeze(F(1,:,:)), squeeze(F(2,:,:)));
subplot (1,2,1)
surf (X, Y, eu)
title ('Numerical solution'), axis tight
subplot (1,2,2)
surf (X, Y, exact_sl(X,Y))
title ('Exact solution'), axis tight

% 4.3) ERROR

err = sp_l2_error ( space , msh, u , @(x , y ) (x.^2+y.^2-3*sqrt(x.^2+y .^2) +2) .* sin(2.* atan ( y ./ x) ) )







