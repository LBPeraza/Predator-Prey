function [ v ] = potential ( p1, q1, p2, q2 )

r = p2 - p1;
v = - (q1 * q2) * r / norm(r)^3;

end