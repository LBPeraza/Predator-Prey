function [ intersect ] = ray_intersects( r, ps )

x00 = r(1,1);
y00 = r(1,2);
x10 = ps(1,1,1);
y10 = ps(1,1,2);
x01 = r(2,1) - x00;
y01 = r(2,2) - y00;
x11 = ps(1,2,1) - x10;
y11 = ps(1,2,2) - y10;

det = x11*y01 - x01*y11;
if (det == 0)
    intersect = 0;
else
    m = 1/det;
    s = m * ((x00-x10)*y01 - (y00-y10)*x01);
    t = m * -(-(x00-x10)*y11 + (y00-y10)*x11);
    
    intersect = (s >= 0) & (t >= 0) & (t <= 1);
end

end