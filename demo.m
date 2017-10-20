% Creation      : 19-Oct-2017 20:36
% Last Revision : 19-Oct-2017 20:36
% Author        : Xinyu Wang
% 
% This is the demo file of the buildNet project

%% Initialization
clc;
clear;
close all;

%% Init Environment
addpath('./utils/');
defaultParams = initEnvironment();
nodeData = parseData(defaultParams.data);
 
%% Construct Network
relationMap = constructStuRelationMap(nodeData, defaultParams.data.sheetName);
plotStuMap(relationMap, defaultParams.plot.figSize);