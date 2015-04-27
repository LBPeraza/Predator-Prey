function [ vs ] = get_wheel_velocities ( current, desired )

kp = 4.0;

[tip, th, lx, ly] = get_tip(current);
th = -th;

err = kp * (desired - tip);

mult = [(cos(th)-sin(th)*ly/lx) (sin(th)+cos(th)*ly/lx);
        (-sin(th)/lx)           (cos(th)/lx)];
vomg = mult * err;

L = 6.5;
%R = 1.25;
R = 1.5;

mult = [(180/(pi*R)) (-90*L/(pi*R));
        (180/(pi*R)) (90*L/(pi*R))];
vs = mult * vomg;

end