
myId = 2;
preyId = 1;

HPS = HowiePositioningSystem();

[trans, xnt] = get_frame(HPS);

target = [30; 30];

OpenSwitch(SENSOR_1);

while true
    HPS.fetch();
    
    targ = frame_position(HPS, preyId, trans, xnt);
    if (isnan(targ(1)))
        target = [30; 30];
    else
        target = targ(1:2);
        %target = [30; 30];
    end
    
    cur = frame_position(HPS, myId, trans, xnt);
    if (isnan(cur(1)))
        stop_motors;
    else
        tip = get_tip(cur);
        diff = target - tip;
    
        diffNorm = diff / norm(diff);
        v = diffNorm * max(1, min(5, norm(diff)));
    
        vs = get_wheel_velocities(cur, tip + v / 20);
        disp(vs);
        set_motor_speed(vs);
        pause(0.1);
    end
    if (GetSwitch(SENSOR_1))
        NXT_PlayTone(400, 500);
    end
end