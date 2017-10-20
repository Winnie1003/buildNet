% Creation      : 19-Oct-2017 11:25
% Last Revision : 20-Oct-2017 11:25
% Author        : Xinyu Wang
% 
% This is function is used to draw the histogram of degree distribution

function plotDegreeDistribution(stuMap, figSz)
    initFig(figSz);
    fprintf('Start to plot degree distribution, please wait...\n');
    for relationIdx = 1:numel(stuMap.relationName)
        subplot(1, numel(stuMap.relationName), relationIdx);
        distributionPlot(stuMap.degree{relationIdx}, stuMap.avgDegree(relationIdx), stuMap.relationName{relationIdx});
    end
end

function initFig(figSz) % init figure
    figure();
    set(gcf, 'position', figSz);
end

function distributionPlot(degreeData, avgDegree, netName)
    bar(degreeData);
    title([netName, ' Average Degree:', num2str(avgDegree)]);
end