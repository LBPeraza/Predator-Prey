% Example HowiePositioningSystem Usage
% Example team's tag id is 1, their opponent's tag id is 40

myId = 2; % CHANGE ME: We will tell you what your tag's id is

HPS = HowiePositioningSystem;

ids = HPS.getVisibleIds();
% ids => [1; 40] (for example)

% Your main loop
while true
    myPosition = HPS.getPosition(myId);
    
    % Do something with myPosition
    % You can access the x, y, and theta values like this:
    
    myX = myPosition.x;
    myY = myPosition.y;
    myTh = myPosition.th;
    
    % Here we'll just print the position out
    disp('My position');
    disp(myPosition);
end
    
