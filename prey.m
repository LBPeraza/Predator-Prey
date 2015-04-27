
myId = 2;
predatorId = 17;

HPS = HowiePositioningSystem();
%disp('here');
[trans, xnt] = get_frame(HPS);
%disp('now here');
target = [20; 30];
cur = [20; 20; 0];

res = 60;
costs = zeros(res+1);
for i = 0:res
    for j = 0:res
        costs(i+1, j+1) = get_cost([i;j], target);
    end
end


cur = [50; 10];

s_old = surf(costs);

while true
    HPS.fetch();
    
    pred = frame_position(HPS, predatorId, trans, xnt);
    
    cur = frame_position(HPS, myId, trans, xnt);
    %disp(cur(3));
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
        %{
        mins = local_minima(costs);
        [~,endPoint] = min(mins(:,3));
        mins = [tip(1) tip(2) get_cost(cur, pred); mins];
        G = build_adjacency(mins, pred);
        [~, route] = dijkstra(G, endPoint + 1, 1);
        targetIndex = route(2);
        
        target = mins(targetIndex, 1:2);
        %}
        target = desired_point(cur, pred);
        diff = target - tip;
    
        diffNorm = diff / norm(diff);
        %disp(diffNorm);
        v = diffNorm * 3; %max(1, min(5, norm(diff)));
        disp(v);
        die;
        
        vs = get_wheel_velocities(cur, tip + v / 20);
        %disp(vs);
        %set_motor_speed(vs);
    end
    pause(0.1);
end
