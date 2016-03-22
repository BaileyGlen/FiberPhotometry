function mineDataMat( DataMat )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
plotBehaviorInit(DataMat,'sniffing');

    function plotBehaviorInit(DataMat, behaviorName)
        PRE_Sec=3;
        POST_Sec=3;
        idx=DataMat.behavior{1,1}(strcmp(behaviorName,DataMat.behavior{1,2}));
        xRange=PRE_Sec:1/DataMat.hz:POST_Sec;
        yRange(:,1) = ceil((idx-PRE_Sec)*DataMat.hz);
        yRange(:,2) = yRange(:,1) + length(xRange)-1;
        for x = 1:5
            floor((idx+POST_Sec)*DataMat.hz);
            plot (xRange,DataMat.signalNorm(yRange(x,1):yRange(x,2)));
            hold on;
        end
    end
end

