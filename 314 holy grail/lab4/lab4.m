% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\josh9.DESKTOP-HLQ5OEN\Documents\CMPE314\lab4\partA.xlsx
%    Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2018/10/17 22:32:32

%% Import the data
[~, ~, raw] = xlsread('C:\Users\josh9.DESKTOP-HLQ5OEN\Documents\CMPE314\lab4\partA.xlsx','Sheet1','A3:P19');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,9);
raw = raw(:,[1,2,3,4,5,6,7,8,10,11,12,13,14,15,16]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names

Vb = data(:,2);
Var3 = data(:,3);
Var4 = data(:,4);
Var5 = data(:,5);
Var6 = data(:,6);
Var7 = data(:,7);
Var8 = data(:,8);

Var10 = data(:,9);
Var11 = data(:,10);
Var12 = data(:,11);
Var13 = data(:,12);
Var14 = data(:,13);
Var15 = data(:,14);
Var16 = data(:,15);

%% Clear temporary variables
clearvars data raw cellVectors R;
hold on
plot(Vb,Var10,'linewidth',2);
plot(Var3,Var11,'linewidth',2);
plot(Var4,Var12,'linewidth',2);
plot(Var5,Var13,'linewidth',2);
plot(Var6,Var14,'linewidth',2);
plot(Var7,Var15,'linewidth',2);
plot(Var8,Var16,'linewidth',2);
t = 9.0:0.01:10.2;
x = (-0.5084*t) + 5.023; 
plot(t,x,'linewidth',2);
ylim([0 4*10^-3]);
grid on 
title('Transistor Ic cs Vce with Loadline');
xlabel('Vce');
ylabel('Ic');
