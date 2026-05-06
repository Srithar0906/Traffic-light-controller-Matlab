function y = smart_traffic(t, density)
% SMART_TRAFFIC - Adaptive Traffic Light Controller
% 
% Inputs:
%   t       - Current simulation time (from Clock block)
%   density - Vehicle density input (0 to 1 scale)
%
% Output:
%   y - Signal state: 1 = Green, 2 = Yellow, 3 = Red
%
% Logic:
%   If density > 0.5 (High Traffic) -> Green time = 20s
%   If density <= 0.5 (Low Traffic)  -> Green time = 10s
%   Yellow duration is fixed at 3s
%   Total cycle = 40s

cycle = mod(t, 40);

if density > 0.5
    green_time = 20;   % High traffic: longer green
else
    green_time = 10;   % Low traffic: normal green
end

if cycle < green_time
    y = 1;             % Green
elseif cycle < green_time + 3
    y = 2;             % Yellow
else
    y = 3;             % Red
end
