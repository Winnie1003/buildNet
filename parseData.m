% Creation      : 19-Oct-2017 20:37
% Last Revision : 19-Oct-2017 20:37
% Author        : Xinyu Wang
% 

function nodeData =  parseData(dataParams)
    for sheetIdx = 1:numel(dataParams.sheetName)
        [~, dataTxt, ~] = xlsread(dataParams.path, dataParams.sheetName{sheetIdx});
        dataTxt(1, :) = [];
        dataTxt(:, 1) = [];
        nodeData{sheetIdx} = dataTxt;
    end
end