% Creation      : 19-Oct-2017 20:36
% Last Revision : 19-Oct-2017 20:36
% Author        : Xinyu Wang
% 

%% Initialization
clc;
clear;
close all;

%% Init Environment
addpath('./utils/');
defaultParams = initEnvironment();
nodeData = parseData(defaultParams.data);
 
%% Construct Network
constructNet(nodeData);