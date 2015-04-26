
myId = 2;
predatorId = 17;

%HPS = HowiePositioningSystem();

%[trans, xnt] = get_frame(HPS);

target = [30; 30];

res = 60;
costs = zeros(res+1);

pred = [10; 40.5; 45];
% generate costs
    for i = 0:res
        for j = 0:res
            costs(i+1, j+1) = get_cost([i;j], pred);
        end
    end

surf(costs);
%{
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
    
    pause(0.1);
end

%}