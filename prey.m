
myId = 2;
predatorId = 17;

HPS = HowiePositioningSystem();

[trans, xnt] = get_frame(HPS);

target = [30; 30];

res = 60;
costs = zeros(res+1);
for i = 0:res
    for j = 0:res
        costs(i+1, j+1) = get_cost([i;j], pred);
    end
end
s_old = surf(costs);

while true
    HPS.fetch();
    
    pred = frame_position(HPS, predatorId, trans, xnt);
    
    cur = frame_position(HPS, myId, trans, xnt);
    if (isnan(cur(1)))
        stop_motors;
    else
        tip = get_tip(cur);
    
        % generate costs
        for i = 0:res
            for j = 0:res
                costs(i+1, j+1) = get_cost([i;j], pred);
            end
        end
        delete(s_old);
        s_old = surf(costs);
        drawnow;
    
        des = desired_point(tip, pred);
        disp('  ');
        disp(tip);
        disp(des);
        vs = get_wheel_velocities(cur, des);
        set_motor_speed(vs);
    end
    pause(0.1);
end
