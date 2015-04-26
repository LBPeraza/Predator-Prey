function [ x, y ] = get_center( corners )

s = sum(corners);
l = size(corners, 1);
p = s / l;
x = p(1);
y = p(2);

end