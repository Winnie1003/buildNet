% Creation      : 20-Oct-2017 16:22
% Last Revision : 20-Oct-2017 19:52
% Author        : Xinyu Wang
% 
% This is function is used to calculate the distance from node to node

function relationMap = calculateDistance(relationMap)
    for relationIdx = 1:numel(relationMap.nodeData)
        crtNet = relationMap.nodeData{relationIdx};
        distanceMap = zeros(size(crtNet));
        for nodeI = 1:size(crtNet, 1)
            for nodeJ = nodeI + 1:size(crtNet, 2)
                if crtNet(nodeI, nodeJ) == 1
                    distanceMap(nodeI, nodeJ) = 1;
                else
                    distanceMap(nodeI, nodeJ) = searchPath(crtNet, nodeI, nodeJ);
                end
            end
        end
        relationMap.distanceMap{relationIdx} = distanceMap;
    end  
end

function distance = searchPath(net, nodeI, nodeJ)
    flag = 0;
    crtIter = 1;
    neighbourNum = 0;
    while(1)        
        if flag == 0,
            neighbours = find(net(nodeI, :) == 1);
            flag = 1;
            neighbourNum = numel(neighbours);
        else
            if ~isempty(find(neighbours==nodeJ))
                distance = crtIter;
                break;
            else
                tmpNeighbours = [];
                for i = 1:numel(neighbours)
                    tmpNeighbours = [tmpNeighbours, find(net(neighbours(i), :) == 1)];
                end
                neighbours = unique(tmpNeighbours);
                if ~isempty(find(neighbours==nodeJ)), distance = crtIter; break; end
            end
            
        end
        crtIter = crtIter + 1;
        if numel(neighbours) <= neighbourNum && crtIter > 2,
            distance = -1;                          % can not search a path to target node
            break;
        else
            neighbourNum = numel(neighbours);
        end
    end
end