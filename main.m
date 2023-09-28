%% This is the main file of the group project for Signal processing.
% All functions shall be put into separate function file for better
% transparency

clear all
close all
clc

% Opening specification file
specs = specsOpen('global_specs.txt');

if strcmp(specs{1}, 'wav')
    [y, fs_y] = audioread(specs{2});
elseif strcmp(specs{1}, 'generate')
    %Comming soon
end


    





