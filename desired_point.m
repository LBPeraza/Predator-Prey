function [ pDes ] = desired_point ( p, pred )

currCost = get_cost(p, pred);

s = 1;

costs = zeros(8, 1);

for a = 0:7
    ar = -degtorad(a * 45);
    diff = s * [cos(ar); sin(ar)];
    p2 = p(1:2) + diff;
    costs(a+1) = get_cost(p2, pred);
    %disp(costs(a+1));
end

[M,I] = min(costs);
%disp([M I ((I-1)*45)]);
a = -degtorad((I-1) * 45);

dir = s * [cos(a); sin(a)];
%disp('dir');
%disp(dir);
diff = currCost - M;
scale = 0.2;
pDes = p(1:2) + scale * max(1, diff) * dir;

end