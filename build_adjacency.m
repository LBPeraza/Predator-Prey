function [ G ] = build_adjacency ( points, pred )

n = size(points, 1);
G = zeros(n);

for i = 1:n
    for j = i+1:n
        p1 = points(i, 1:2)';
        p2 = points(j, 1:2)';
        G(i, j) = edge_length(p1, p2, pred);
        G(j, i) = G(i, j);
    end
end

end