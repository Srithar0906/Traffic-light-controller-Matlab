% TRAFF.M - Traffic Light Timing Transfer Function
% Represents the signal switching delay behaviour
% G(s) = 1 / (Ts + 1)
% Where T = Signal timing constant

clc;
clear;
close all;

T = 10;             % Signal timing constant (seconds)

num = 1;            % Numerator
den = [T 1];        % Denominator: Ts + 1

G = tf(num, den);   % Create transfer function

step(G)             % Plot step response
grid on
title('Traffic Light Timing Transfer Function')
xlabel('Time (seconds)')
ylabel('Amplitude')
