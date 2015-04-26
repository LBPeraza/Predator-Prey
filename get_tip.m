function [ tip, th, lx, ly ] = get_tip ( current )

lx = 4.75;
ly = 0.0;

th = -degtorad(current(3));
current = current(1:2);

tip = current + [lx * cos(th) - ly * sin(th);-lx * sin(th) + ly * cos(th)];

end