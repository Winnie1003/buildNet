% Creation      : 20-Oct-2017 08:59
% Last Revision : 20-Oct-2017 08:59
% Author        : Xinyu Wang
% 
% This function is used to draw the network

function plotStuMap(stuMap, figSz)
    initFig(figSz);
    fprintf('Start to plot network, please wait...\n');
    for relationIdx = 1:numel(stuMap.relationName)
        subplot(1, numel(stuMap.relationName), relationIdx);
        netPlot(stuMap.nodeData{1}, stuMap.relationName{relationIdx});
    end
end

function initFig(figSz) % init figure
    figure();
    set(gcf, 'position', figSz);
end

function netPlot(relationMatrix, netName)
    A = relationMatrix;
    [m, n] = size(A);
    W = zeros(m, m);
    for i = 1 : n
        a = find(A(:,i) ~= 0);
        W(a(1), a(2)) = 1;
        W(a(2), a(1)) = 1;
    end

    [~, n] = size(A);
    w = floor(sqrt(n));       
    h = floor(n / w);        
    x = [];
    y = [];
    for i = 1 : h           % generate random point
        for j = 1 : w
            x = [x, 10 * rand(1) + (j-1) * 10];
            y = [y, 10 * rand(1) + (i-1) * 10];
        end
    end
    ed = n - h * w;
    for i = 1 : ed
       x = [x, 10 * rand(1) + (i-1) * 10]; 
       y = [y, 10 * rand(1) + h * 10];
    end
    plot(x, y, 'r*');    

    for i = 1:n
        for j = i:n
            if A(i,j) ~= 0
                weightStr = num2str(A(i,j));                                                % transfer weight (here default weight is 1) to string           
                text((x(i)+x(j)) / 2, (y(i) + y(j)) / 2,weightStr, 'Fontsize', 10);         % draw the weight
                line([x(i), x(j)],[y(i), y(j)]);                                            % draw the connection line
            end
            text(x(i), y(i), num2str(i), 'Fontsize', 14, 'color', 'r');                     % draw the id of each node           
            hold on;
        end
    end  
    
    title(netName);
    
end

