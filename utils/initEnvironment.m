% Creation      : 19-Oct-2017 20:40
% Last Revision : 19-Oct-2017 20:40
% Author        : Xinyu Wang
% 
% This function is used to init the default params, you can change the default
% setting here to your own environments

function params = initEnvironment()
%% Data params
    params.data.path = './data/write.xls';
    params.data.sheetName = {'name', 'hometown', 'dialect'};

%% Plot params
    params.plot.figSize = [250, 300, 1600, 500];  % [x, y, w, h] from the bottom left corner of the screen, should be adjusted to fit different devices

%% Other params
    params.other.savePath = './results/';
end

