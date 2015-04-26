
myId = 2;
prey = 17;

HPS = HowiePositioningSystem();

[trans, xnt] = get_frame(HPS);

target = [30; 30];

while true
    HPS.fetch();
    
    targ = frame_position(HPS, prey, trans, xnt);
    target = targ(1:2);
    
    cur = frame_position(HPS, myId, trans, xnt);
    tip = get_tip(cur);
    diff = target - tip;
    disp(diff);
    
    diffNorm = diff / norm(diff);
    
    vs = get_wheel_velocities(cur, tip + diffNorm / 6);
    set_motor_speed(vs);
    pause(0.1);
end