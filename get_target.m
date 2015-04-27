function [ target ] = get_target ( cur, pred )

corners = [ 15 15; 15 45; 45 45; 45 15 ];

cur = cur(1:2);
dists = zeros(4, 1);
for i = 1:4
   corner = corners(i, :)';
   dists(i) = edge_length(cur, corner, pred);
end

[~, ind] = min(dists);
target = corners(ind)';

end