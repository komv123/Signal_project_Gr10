%% This is the main file of the group project for Signal processing.
% All functions shall be put into separate function file for better
% transparency

clear all
close all
clc

% Opening specification file
specs = specsOpen('global_specs.txt');

if strcmp(specs{1}, 'wav')
    %Opening wav file
    [y, fs_y] = audioread(specs{2});
elseif strcmp(specs{1}, 'generate')
    %Choosing signal generator

    if strcmp(specs{4}, 'rect')
        %Rectangle generator (samp_freq(Hz), duration(s), period(s))
    elseif strcmp(specs{4}, 'tone')
        %Tone generator (samp_freq(Hz), duration(s))
    elseif strcmp(specs{4}, 'tone-complex')
        %Complex-tone generator (samp_freq(Hz), duration(s))
    elseif strcmp(specs{4}, 'noise')
        %Noise generator (samp_freq(Hz), duration(s))
    else
        error('SignalGenError:WrongType', ...
            ['Error while choosing signal type.\n' ...
            'Possible: rect, tone, tone-complex, noise\n' ...
            'Found: %s'], specs{4})
    end
else
    %error('ErrorTests:convertTest', ...
      %'In this case, the newline \n is converted.')
    error('InputError:WrongType', ...
        ['Error while choosing input signal.\nPossible: wav, generate\n' ...
        'Found: %s'], specs{1})
end


    





