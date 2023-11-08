%% This is the main file of the group project for Signal processing.
% All functions shall be put into separate function file

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
        %Rectangle generator (samp_freq(Hz), periodicity(s), duration(s))
        signal = generate_square(str2double(specs{5}), str2double(specs{7}), str2double(specs{6}));
    elseif strcmp(specs{4}, 'tone')
        %Tone generator (samp_freq(Hz), freq(Hz), duration(s))
        signal = generate_tone(str2double(specs{5}), str2double(specs{8}), str2double(specs{6}));
    elseif strcmp(specs{4}, 'tone-complex')
        %Complex-tone generator (samp_freq(Hz), freq(Hz) duration(s))
        for i = 8:100
            if strcmp(specs{i}, 'END')
                break
            end
            freqs(i-7) = str2double(specs{i});
        end
        signal = generate_tone_complex(str2double(specs{5}), freqs, str2double(specs{6}));
    elseif strcmp(specs{4}, 'noise')
        %Noise generator (samp_freq(Hz), duration(s))
        signal = generate_noise(str2double(specs{5}), str2double(specs{6}));
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


%FILTERING AND PLOTTING OF INPUT SIGNAL AND FILTERED SIGNAL


tvect = (1:length(signal))/str2double(specs{5});

specs=specOpenV2('global_specs.txt');
filtered_signal=Filtering(signal,specs);

figure('Name', "test signal")
plot(tvect,signal)
hold on
tvect2=(1:length(filtered_signal))/specs.fs;
plot(tvect,filtered_signal(1:length(signal)))


xlim([tvect(100) tvect(200)])








