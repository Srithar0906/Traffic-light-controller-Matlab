% TRAFFICSIMULATION.M - Simulation Runner Script
% Run this script to simulate the traffic light controller
% without opening Simulink manually.
%
% Two modes:
%   Mode 1: Step-based density  -> clean state transitions
%   Mode 2: Random density      -> rapid adaptive switching
%
% Signal states in Scope output:
%   1 = Green
%   2 = Yellow
%   3 = Red

clc;
clear;
close all;

%% --- PARAMETERS ---
sim_time    = 100;      % Total simulation time (seconds)
threshold   = 0.5;      % Density threshold for high/low traffic
green_high  = 20;       % Green duration for high traffic (seconds)
green_low   = 10;       % Green duration for low traffic (seconds)
yellow_time = 3;        % Yellow duration (fixed)
cycle_time  = 40;       % Total signal cycle duration

%% --- TIME VECTOR ---
t = 0:0.1:sim_time;

%% --- MODE 1: STEP INPUT (controlled density change) ---
density_step = zeros(size(t));
density_step(t >= 20 & t < 60) = 0.8;   % High traffic between t=20 and t=60
density_step(t < 20 | t >= 60) = 0.2;   % Low traffic otherwise

signal_step = zeros(size(t));
for i = 1:length(t)
    signal_step(i) = smart_traffic(t(i), density_step(i));
end

figure;
subplot(2,1,1);
plot(t, density_step, 'c', 'LineWidth', 1.5);
title('Step Input: Vehicle Density');
xlabel('Time (seconds)'); ylabel('Density'); ylim([-0.1 1.1]); grid on;

subplot(2,1,2);
plot(t, signal_step, 'y', 'LineWidth', 1.5);
title('Step Input: Traffic Signal Output (1=Green, 2=Yellow, 3=Red)');
xlabel('Time (seconds)'); ylabel('Signal State'); ylim([0.5 3.5]); grid on;
yticks([1 2 3]); yticklabels({'Green','Yellow','Red'});
sgtitle('Smart Traffic Light Controller — Step Input Simulation');

%% --- MODE 2: RANDOM INPUT (dynamic traffic simulation) ---
rng(42);   % Seed for reproducibility
density_random = rand(size(t));

signal_random = zeros(size(t));
for i = 1:length(t)
    signal_random(i) = smart_traffic(t(i), density_random(i));
end

figure;
subplot(2,1,1);
plot(t, density_random, 'm', 'LineWidth', 1);
title('Random Input: Vehicle Density');
xlabel('Time (seconds)'); ylabel('Density'); ylim([-0.1 1.1]); grid on;

subplot(2,1,2);
plot(t, signal_random, 'y', 'LineWidth', 1.5);
title('Random Input: Traffic Signal Output (1=Green, 2=Yellow, 3=Red)');
xlabel('Time (seconds)'); ylabel('Signal State'); ylim([0.5 3.5]); grid on;
yticks([1 2 3]); yticklabels({'Green','Yellow','Red'});
sgtitle('Smart Traffic Light Controller — Random Density Simulation');

fprintf('Simulation complete.\n');
fprintf('Step input   -> clean periodic transitions\n');
fprintf('Random input -> rapid adaptive switching\n');
