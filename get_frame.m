function [ trans, xnt ] = get_frame ( hps )

hps.fetch();

ids = hps.getVisibleIds();

corners = [-1 -1; -1 -1; -1 -1; -1 -1];
for id = 20:23
    if (any(id == ids))
        i = id - 19;
        position = hps.getPosition(id);
        corners(i,1) = position.x;
        corners(i,2) = position.y;
    end
end

X = [0 0];
Y = [0 0];
Xn = [0 0];
if (~(any(corners(1) < 0) || any(corners(2) < 0)))
    X = corners(2,:) - corners(1,:);
    d = 1/norm(X);
    Xn = X * d;
end
if (~(any(corners(4) < 0) || any(corners(1) < 0)))
    Y = corners(4,:) - corners(1,:);
end

trans = [X(1) X(2) -corners(1,1); Y(1) Y(2) -corners(1,2); 0 0 1];
xnt = atan2(Xn(2), Xn(1));

end