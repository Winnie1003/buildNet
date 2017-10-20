% Creation      : 19-Oct-2017 20:36
% Last Revision : 20-Oct-2017 11:12
% Author        : Xinyu Wang
% 
% This function is used to calculate the degree for each node

function relationMap = calculateDegree(relationMap)
    for relationIdx = 1:numel(relationMap.nodeData)
        crtNet = relationMap.nodeData{relationIdx};
        degreeRow = sum(crtNet, 1);
        degreeCol = sum(crtNet, 2);
        assert(sum(degreeRow == degreeCol') == numel(degreeRow));  
        relationMap.degree{relationIdx} = degreeRow;
        relationMap.avgDegree(relationIdx) = mean(degreeRow);
    end
end