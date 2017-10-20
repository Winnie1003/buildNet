% Creation      : 19-Oct-2017 21:32
% Last Revision : 20-Oct-2017 08:56
% Author        : Xinyu Wang
% 
% This function is used to divide the node matrix to each student

function studentNode = constructStuRelationMap(nodeData, relationName)
    for relationIdx = 1:numel(nodeData)        
        crtNodeList = nodeData{relationIdx};
        crtNodeList = str2binary(crtNodeList);
        studentNode.nodeData{relationIdx} = crtNodeList;        
        studentNode.relationName{relationIdx}  = relationName{relationIdx};
    end
end

function nodeData = str2binary(nodeData)
    nodeData = strcmp(nodeData, 'y');
end
