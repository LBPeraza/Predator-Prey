function [ cost ] = get_cost ( p, predator )
% get cost of a certain (x, y) position given a predator position

p = p(1:2)';
predator = predator(1:2)';
cost = 0;
d = sqrt(sum((p - predator) .^ 2));
if (d < 40)
    cost = (d - 40)^2 / 20;
end

corners = [60.1 -0.1 3; -0.1 -0.1 1; 60.1 60.1 1];
for r = 1:3
    cost = cost + 5 - corners(r,3) * log2(sqrt(sum((p - corners(r,1:2)) .^ 2)));
end

x = p(1);
y = p(2);

s = 0.03;
c = -3;
if (x < 20 || x > 40)
    cost = cost + s * (x - 30) ^ 2 + c;
end
if (y < 20 || y > 40)
    cost = cost + s * (y - 30) ^ 2 + c;
end
%{
border = 6;

if (x < border || x > 60 - border || y < border || y > 60 - border)
    cost = cost + 20
end
%}
end