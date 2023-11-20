%% This is the main file of the group project for Signal processing.
% All functions shall be put into separate function file

clear all
close all
clc

% Opening specification file
specs=specOpenV2('global_specs.txt');

if strcmp(specs.task_type, 'wav')
    %Opening wav file
    [signal, fs_y] = audioread(specs.wav_filename);
elseif strcmp(specs.task_type, 'generate')
    %Choosing signal generator
    if strcmp(specs.signal_type, 'rect')
        %Rectangle generator (samp_freq(Hz), periodicity(s), duration(s))
        signal = generate_square(specs.fs, specs.periodicity_s, specs.signal_duration_s);
    elseif strcmp(specs.signal_type, 'tone')
        %Tone generator (samp_freq(Hz), freq(Hz), duration(s))
        signal = generate_tone(specs.fs, specs.frequencies(1), specs.signal_duration_s);
    elseif strcmp(specs.signal_type, 'tone-complex')
        %Complex-tone generator (samp_freq(Hz), freq(Hz) duration(s))
        signal = generate_tone_complex(specs.fs, specs.frequencies, specs.signal_duration_s);
    elseif strcmp(specs.signal_type, 'noise')
        %Noise generator (samp_freq(Hz), duration(s))
        signal = generate_noise(specs.fs, specs.signal_duration_s);
    else
        error('SignalGenError:WrongType', ...
            ['Error while choosing signal type.\n' ...
            'Possible: rect, tone, tone-complex, noise\n' ...
            'Found: %s'], specs.signal_type)
    end
else
    %error('ErrorTests:convertTest', ...
      %'In this case, the newline \n is converted.')
    error('InputError:WrongType', ...
        ['Error while choosing input signal.\nPossible: wav, generate\n' ...
        'Found: %s'], specs.task_type)
end

frequency_analyzer(signal, specs.fs, specs.spectral_resolution, specs.window_type, specs.stft_overlap);
%FILTERING AND PLOTTING OF INPUT SIGNAL AND FILTERED SIGNAL
tvect = (1:length(signal))/specs.fs;

filtered_signal=Filtering(signal,specs);

figure('Name', "test signal")
plot(tvect,signal)
hold on
tvect2=(1:length(filtered_signal))/specs.fs;
plot(tvect,filtered_signal(1:length(signal)))


xlim([tvect(1000) tvect(2000)])








