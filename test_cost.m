
HPS = HowiePositioningSystem();

[trans, xnt] = get_frame(HPS);

predatorId = 17;

pred = [30; 30];

res = 60;
costs = zeros(res+1);
for i = 0:res
    for j = 0:res
        costs(i+1, j+1) = get_cost([i;j], pred);
    end
end
s_old = surf(costs);
figure;
imshow(scale_to_im(costs));
%{
while true
    HPS.fetch();
    
    pred = frame_position(HPS, predatorId, trans, xnt);
    
    % generate costs
    for i = 0:res
        for j = 0:res
            costs(i+1, j+1) = get_cost([i;j], pred);
        end
    end
    delete(s_old);
    s_old = surf(costs);
    drawnow;
    
    pause(0.1);
end

%}