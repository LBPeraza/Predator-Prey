function [ im ] = scale_to_im ( costs )

big = max(max(costs));
small = min(min(costs));

im = (costs - small) / (big - small);

end