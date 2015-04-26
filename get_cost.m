function [ cost ] = get_cost ( p, predator )
% get cost of a certain (x, y) position given a predator position

p = p(1:2)';
predator = predator(1:2)';
cost = 10 - 7 * log2( sqrt(sum((p - predator) .^ 2)));

corners = [60 0 3; 0 0 1; 60 60 1];
for r = 1:3
    cost = cost + 5 - corners(r,3) * log2(sqrt(sum((p - corners(r,1:2)) .^ 2)));
end

x = p(1);
y = p(2);
s = 0.00000003;
cost = cost + s * (x - 30)^6;
cost = cost + s * (y - 30)^6;

end