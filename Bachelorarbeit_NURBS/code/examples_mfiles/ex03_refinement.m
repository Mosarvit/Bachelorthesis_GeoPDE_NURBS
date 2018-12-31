%% KNOT REFINEMENT

% Define Knot Vector
knts = [0 0 0 .2 .4 .6 .6 .8 1 1 1];
p = 2;
n = numel (knts) - p - 1;

% Define Control Points
pnts = [0 1 3 3 4 4 5 6;
        0 2 3 1 2 1 0 1];

% Create Curve
crv = nrbmak (pnts, knts);

% Data for plots
x = linspace (0, 1, 101);
% Evaluate Basis Functions
iv  = findspan (n-1, p, x, knts);       % Find knot span
N   = basisfun (iv, x, p, knts);        % Evaluate non-zero functions
num = numbasisfun (iv, x, p, knts) + 1; % Compute the global numbering
% Plot
Nplot = zeros (numel(x), n);
for ii = 1:numel (x)
  Nplot(ii, num(ii,:)) = N(ii,:);
end
subplot (3, 2, 1)
plot (x, Nplot, 'LineWidth', 3);
subplot (3, 2, 2)
nrbctrlplot (crv)

%% H-Refinement
crv_ref = nrbkntins (crv, [.1 .3 .5 .7 .9]);
iv  = findspan (crv_ref.number-1, p, x, crv_ref.knots);       % Find knot span
N   = basisfun (iv, x, p, crv_ref.knots);        % Evaluate non-zero functions
num = numbasisfun (iv, x, p, crv_ref.knots) + 1; % Compute the global numbering
% Plot
Nplot_ref = zeros (numel(x), crv_ref.number);
for ii = 1:numel (x)
  Nplot_ref(ii, num(ii,:)) = N(ii,:);
end
subplot (3, 2, 3)
plot (x, Nplot_ref, 'LineWidth', 3);
subplot (3, 2, 4)
nrbctrlplot (crv_ref)

%% P-Refinement
crv_elev = nrbdegelev (crv, 1);
iv  = findspan (crv_elev.number-1, p+1, x, crv_elev.knots);       % Find knot span
N   = basisfun (iv, x, p+1, crv_elev.knots);        % Evaluate non-zero functions
num = numbasisfun (iv, x, p+1, crv_elev.knots) + 1; % Compute the global numbering
% Plot
Nplot_elev = zeros (numel(x), crv_elev.number);
for ii = 1:numel (x)
  Nplot_elev(ii, num(ii,:)) = N(ii,:);
end
subplot (3, 2, 5)
plot (x, Nplot_elev, 'LineWidth', 3);
subplot (3, 2, 6)
nrbctrlplot (crv_elev)



% Save for PGFPLOTS
% save_csv('basis', 'x', x, 'N1', Nplot(:,1),
%                                'N2', Nplot(:,2),
%                                'N3', Nplot(:,3),
%                                'N4', Nplot(:,4),
%                                'N5', Nplot(:,5),
%                                'N6', Nplot(:,6),
%                                'N7', Nplot(:,7),
%                                'N8', Nplot(:,8));
% crv_eval = nrbeval (crv, x);
% save_csv('curve', 'x', crv_eval(1,:), 'y', crv_eval(2,:));
% save_csv('curve_ctrl', 'x', pnts(1,:), 'y', pnts(2,:));

% save_csv('basis_href', 'x', x, 'N1', Nplot_ref(:,1),
%                                     'N2', Nplot_ref(:,2),
%                                     'N3', Nplot_ref(:,3),
%                                     'N4', Nplot_ref(:,4),
%                                     'N5', Nplot_ref(:,5),
%                                     'N6', Nplot_ref(:,6),
%                                     'N7', Nplot_ref(:,7),
%                                     'N8', Nplot_ref(:,8),
%                                     'N9', Nplot_ref(:,9),
%                                     'N10', Nplot_ref(:,10),
%                                     'N11', Nplot_ref(:,11),
%                                     'N12', Nplot_ref(:,12),
%                                     'N13', Nplot_ref(:,13));
% crv_ref_eval = nrbeval (crv_ref, x);
% save_csv('curve_href', 'x', crv_ref_eval(1,:), 'y', crv_ref_eval(2,:));
% save_csv('curve_href_ctrl', 'x', crv_ref.coefs(1,:), 'y', crv_ref.coefs(2,:));

% save_csv('basis_pref', 'x', x, 'N1', Nplot_elev(:,1),
%                                     'N2', Nplot_elev(:,2),
%                                     'N3', Nplot_elev(:,3),
%                                     'N4', Nplot_elev(:,4),
%                                     'N5', Nplot_elev(:,5),
%                                     'N6', Nplot_elev(:,6),
%                                     'N7', Nplot_elev(:,7),
%                                     'N8', Nplot_elev(:,8),
%                                     'N9', Nplot_elev(:,9),
%                                     'N10', Nplot_elev(:,10),
%                                     'N11', Nplot_elev(:,11),
%                                     'N12', Nplot_elev(:,12),
%                                     'N13', Nplot_elev(:,13));
% crv_elev_eval = nrbeval (crv_elev, x);
% save_csv('curve_pref', 'x', crv_elev_eval(1,:), 'y', crv_elev_eval(2,:));
% save_csv('curve_pref_ctrl', 'x', crv_elev.coefs(1,:), 'y', crv_elev.coefs(2,:));