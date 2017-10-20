% Creation      : 19-Oct-2017 20:37
% Last Revision : 19-Oct-2017 20:37
% Author        : Xinyu Wang
% 
% This function is used to parse the node data from xls format files and
% transfer it to matlab matrix

function nodeData =  parseData(dataParams)
    for sheetIdx = 1:numel(dataParams.sheetName)
        [~, dataTxt, ~] = xlsread(dataParams.path, dataParams.sheetName{sheetIdx}); % read xls file
        dataTxt(1, :) = []; % delete first row
        dataTxt(:, 1) = []; % delete first colum
        nodeData{sheetIdx} = dataTxt;
    end
end