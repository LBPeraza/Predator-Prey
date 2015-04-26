function [ frame ] = frame_position ( hps, id, trans, xnt )

ids = hps.getVisibleIds();
if (any(id == ids))
    position = hps.getPosition(id);
    world = [position.x; position.y; 1];
    frame = trans * world * 60;
    frame(3) = radtodeg(position.th - xnt);
else
    frame = [ NaN; NaN; NaN ];
end

end