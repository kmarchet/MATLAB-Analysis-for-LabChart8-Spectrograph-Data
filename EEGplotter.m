clear all; close all; clc;
format long;
prompt = 'What sample do you want to analyze? include .xlsx:  ' ;
str = input(prompt,'s'); 
M = readmatrix(str);
figure(1)
hold on
x = M(:,1);
y = M(:,2);
plot(x,y);
hold off
figure(2)
%Identification of Alpha Waves
subplot(3,3,1);
hold on
title('Spectrogram Identification of Alpha Waves');
xlabel('Frequency(Hz)');
ylabel('EEG(V²)');
alphaRange = find (x < 13 & x > 8);
alphaX    = x(alphaRange);
alphaY    = y(alphaRange);
alphaMaxRange  = islocalmax(alphaY);
alphaXMax = alphaX(alphaMaxRange);
alphaYMax = alphaY(alphaMaxRange);
plot(alphaXMax, alphaYMax, 'or');
plot(alphaX, alphaY, '-b');
numOfAlphaWaves = numel(alphaXMax);
hold off
%identification of Beta Waves
subplot(3,3,2);
hold on
title('Spectrogram Identification of Beta Waves');
xlabel('Frequency(Hz)');
ylabel('EEG(V²)');
betaRange = find (x < 30 & x > 13);
betaX    = x(betaRange);
betaY    = y(betaRange);
betaMaxRange  = islocalmax(betaY);
betaXMax = betaX(betaMaxRange);
betaYMax = betaY(betaMaxRange);
plot(betaXMax, betaYMax, 'or');
plot(betaX, betaY, '-b');
numOfBetaWaves = numel(betaXMax);
hold off
% Identification of Theta waves
subplot(3,3,3);
hold on
title('Spectrogram Identification of Theta Waves');
xlabel('Frequency(Hz)');
ylabel('EEG(V²)');
thetaRange = find (x < 8 & x > 4);
thetaX    = x(thetaRange);
thetaY    = y(thetaRange);
thetaMaxRange  = islocalmax(thetaY);
thetaXMax = thetaX(thetaMaxRange);
thetaYMax = thetaY(thetaMaxRange);
plot(thetaXMax, thetaYMax, 'or');
plot(thetaX, thetaY, '-b');
numOfThetaWaves = numel(thetaXMax);
hold off
%Identification of Delta Waves
subplot(3,3,4);
hold on
title('Spectrogram Identification of Delta Waves');
xlabel('Frequency(Hz)');
ylabel('EEG(V²)');
deltaRange = find (x < 4 & x > 0.5);
deltaX    = x(deltaRange);
deltaY    = y(deltaRange);
deltaMaxRange  = islocalmax(deltaY);
deltaXMax = deltaX(deltaMaxRange);
deltaYMax = deltaY(deltaMaxRange);
plot(deltaXMax, deltaYMax, 'or');
plot(deltaX, deltaY, '-b');
numOfDeltaWaves = numel(deltaXMax);
hold off
%Identification of Gamma Waves
subplot(3,3,5);
hold on
title('Spectrogram Identification of Gamma Waves');
xlabel('Frequency(Hz)');
ylabel('EEG(V²)');
gammaRange = find (x < 50 & x > 30);
gammaX    = x(gammaRange);
gammaY    = y(gammaRange);
gammaMaxRange  = islocalmax(gammaY);
gammaXMax = gammaX(gammaMaxRange);
gammaYMax = gammaY(gammaMaxRange);
plot(gammaXMax, gammaYMax, 'or');
plot(gammaX, gammaY, '-b');
numOfGammaWaves = numel(gammaXMax);
hold off
%Wave Summary Print
WaveCountsAll = table({'Number of Alpha';'Number of Beta';'Number of Delta';'Number of Gamma';'Number of Theta'},[numOfAlphaWaves;numOfBetaWaves;numOfDeltaWaves;numOfGammaWaves;numOfThetaWaves]);
writetable(WaveCountsAll);
%type 'How many of each wave.txt';

%B = table({'Alpha Power';'Beta Power';'Delta Power';'Gamma Power';'Theta Power'},[alphaYMax;betaYMax;deltaYMax;gammaYMax;thetaYMax]);
%writetable(B);
%type 'WavePower.txt';
%totar = table(alphaYMax, betaYMax, deltaYMax, gammaYMax, thetaYMax);

%B = csvwrite({'Alpha Power','Beta Power','Delta Power','Gamma Power','Theta Power'},[alphaYMax],[betaYMax],[deltaYMax],[gammaYMax],[thetaYMax]);
%writetable(B);


%cellz = {'Alpha Power','Beta Power','Delta Power','Gamma Power','Theta Power'; alphaYMax,betaYMax,deltaYMax,gammaYMax,thetaYMax};
%B = cell2table(cellz);
%writetable(B,'Power Summary.csv')

%AlphaPower = transpose(alphaYMax);
%AlphaPowerTransposed = transpose(AlphaPower);
%writematrix(AlphaPower);
%AlphaPower = table({'Alpha Peak Power', [alphaYMax]});
AlphaPower = array2table(alphaYMax);
writetable(AlphaPower);

BetaPower = array2table(betaYMax);
writetable(BetaPower);

DeltaPower =array2table(deltaYMax);
writetable(DeltaPower);

GammaPower = array2table(gammaYMax);
writetable(GammaPower);

ThetaPower =  array2table(thetaYMax);
writetable(ThetaPower);

%complete = outerjoin(AlphaPower, BetaPower, DeltaPower, GammaPower, ThetaPower);
%writetable(complete);
%PowerSummary = join(AlphaPower, BetaPower, DeltaPower, GammaPower, ThetaPower);

