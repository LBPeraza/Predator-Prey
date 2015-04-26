
myId = 2;
predatorId = 1;

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
    vs = get_wheel_velocities(cur, des);
    set_motor_speed(vs);
    
    pause(0.1);
end
