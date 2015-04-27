function [ minima ] = local_minima ( grid )

[w, h] = size(grid);

dirs = [0 1; 1 0; 1 1; 1 -1; 0 -1; -1 1; -1 -1; -1 0];

minima = [];
for i = 2:h-1
    for j = 2:w-1
        cost = grid(i,j);
        m = true;
        for d = 1:8
            new = [i j] + dirs(d,:);
            if (grid(new(1),new(2)) < cost)
                m = false;
            end
        end
        if (m)
            minima = [minima; i j cost];
        end
    end
end

end