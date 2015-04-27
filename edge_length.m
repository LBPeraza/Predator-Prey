function [ len ] = edge_length( p1, p2, pred )

d = p2 - p1;
l = norm(d);
d = d / l;

len = 0;

for i = 0:floor(l)
    p = p1 + d*i;
    len = len + get_cost(p, pred)^2;
end

end