
myId = 2;
predatorId = 17;

HPS = HowiePositioningSystem();

[trans, xnt] = get_frame(HPS);

target = [30; 30];

res = 60;
costs = zeros(res+1);
for i = 0:res
    for j = 0:res
        costs(i+1, j+1) = get_cost([i;j], target);
    end
end

cur = [50; 10];

mins = local_minima(costs);
[~,endPoint] = min(mins(:,3));
mins = [cur(1) cur(2) get_cost(cur, pred); mins];
G = build_adjacency(mins, target);

[cost, route] = dijkstra(G, endPoint+1, 1);
disp(mins);
disp(mins(route, :));
surf(costs);

update = 10;

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
        %{
        if (update >= 10)
            mins = local_minima(costs);
            [~,endPoint] = min(mins(:,3));
            mins = [tip(1) tip(2) get_cost(cur, pred); mins];
            G = build_adjacency(mins, pred);
            [~, route] = dijkstra(G, endPoint + 1, 1);
        
            targetIndex = route(2);
            target = mins(targetIndex, 1:2);
            update = 0;
        end
        %}
        target = get_target(cur, pred);
        diff = target' - tip;
    
        diffNorm = diff / norm(diff);
        v = diffNorm * max(1, min(5, norm(diff)));
        vs = get_wheel_velocities(cur, tip + v / 20);
        set_motor_speed(vs);
    end
    update = update + 1;
    pause(0.1);
end
