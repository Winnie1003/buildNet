% Creation      : 19-Oct-2017 20:36
% Last Revision : 20-Oct-2017 10:42
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
% plotStuMap(relationMap, defaultParams.plot.figSize, defaultParams.other.savePath);

%% Problem I     Calculate Degree and Display Degree Distribution
relationMap = calculateDegree(relationMap);
plotDegreeDistribution(relationMap, defaultParams.plot.figSize);