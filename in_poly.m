function [ inP ] = in_poly ( corners, p )
% in_rect takes a matrix of corners (input as row vectors) and a point
% (also a row vector), and returns true if p is contained within the
% polygon defined by corners

numC = size(corners, 1);

cornerShift = [corners(2:end,:); corners(1,:)];
lineSegs = cat(3, corners, cornerShift);

intersections = 0;
for i = 1:numC
    this = ray_intersects([p; 1 0], lineSegs(i,:,:));
    intersections = intersections + this;
end

inP = mod(intersections,2);
    
end