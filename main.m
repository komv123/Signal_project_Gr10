%% This is the main file of the group project for Signal processing.
% All functions shall be put into separate function file

clear all
close all
clc

% Opening specification file
specs=specOpenV2('global_specs.txt');

if strcmp(specs.task_type, 'wav')
    %Opening wav file
    [raw, fs_y] = audioread(specs.wav_filename);

    %If mono, copy to signal
    if size(raw,2) == 1
        signal = transpose(raw);
    %If stereo, average the chanels
    else
        signal = zeros(1,size(raw,1));
        for i = 1:length(signal)
            signal(i) = mean(abs(raw(i,:)));
        end
    end
    specs.fs = specs.wav_fs;
    clear raw
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

%FREQUENCY ANALYSIS
[X, frequencies] = frequency_analysis(signal, specs.fs, specs.spectral_resolution, ...
    specs.window_type, specs.stft_overlap, specs.x_lim_frequency, ...
    specs.y_lim_au,specs.x_axis_type,specs.y_axis_type);


%FILTERING AND PLOTTING OF INPUT SIGNAL AND FILTERED SIGNAL


[filtered_signal, B, A] = Filtering(signal,specs);

tvect = (1:length(signal))/specs.fs;
tvect2=(1:length(filtered_signal))/specs.fs;

figure('Name', "test signal and filtered signal")
plot(tvect,signal)
hold on
plot(tvect,filtered_signal(1:length(signal)))
legend('Original signal','Filtered signal')


xlim([0 specs.x_lim_time])
ylim([-specs.y_lim_amplitude specs.y_lim_amplitude])
saveas(gcf,'Input signal and filtered signal.pdf');

%Save to CSV
csv_matrix = nan(length(signal),6);
csv_matrix(1:length(signal),1)          = transpose(signal);
csv_matrix(1:length(frequencies),2)     = transpose(frequencies);
csv_matrix(1:length(X),3)               = transpose(X);
csv_matrix(1:length(filtered_signal),4) = transpose(filtered_signal);
csv_matrix(1:length(B),5)               = transpose(B);
csv_matrix(1:length(A),6)               = transpose(A);
csv_matrix = array2table(csv_matrix);
csv_matrix.Properties.VariableNames(1:6) = {'Signal', 'Frequencies', 'Magnitude', 'Filtered signal', 'Feedback coefficients', 'Feedforward coefficients'};
writetable(csv_matrix, 'out.csv');
clear csv_matrix

%Save to TXT
%T = table(transpose(signal), transpose(B), 'VariableNames', {'signal', 'B'});
%writetable(T, 'out.txt');







