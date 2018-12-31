%% PLOT CUBIC B-SPLINE BASIS FUNCTIONS

% Define Knot Vector
knt = [0 0 0 0 1/8 2/8 3/8 4/8 5/8 6/8 7/8 1 1 1 1];
p   = 3;
ncp = numel (knt) - p - 1;

x = linspace (0, 1, 100);

% Evaluate Basis Functions
iv   = findspan (ncp-1, p, x, knt);     % Find knot span
N    = basisfun (iv, x, p, knt);        % Evaluate non-zero functions
num = numbasisfun (iv, x, p, knt) + 1;  % Compute the global numbering

% Plot
Nplot = zeros (numel(x), ncp);
for ii = 1:numel (x)
  Nplot(ii, num(ii,:)) = N(ii,:);
end
plot (x, Nplot, 'LineWidth', 3);
xlabel ('\xi', 'FontSize', 24)
ylabel ('N_i^p(\xi)', 'FontSize', 24)
title  ('Cubic B-Spline Basis', 'FontSize', 24)

