function [ DataMat ] = initializeDataMat( FileTEV,startIDX)
%initializeMatData This function will convert TEV into MAT
%   Current TEV Versions
%   Mix of contents including
%       -Sampling Rate
%       -Amplitude 1 - primary signal, with LOCKIN amp and light filtering
%       -Amplitude 2 - secondary signal, LOCK and filtering (missing?)
%       -May containt Lever Press Data

%% Some basic tests
% Make sure we can import TEV and tsq
assert(exist('opentev.m','file') && exist('opentev.m','file'), ...
    'The TDT Importer is not on the path. Add the folder to the path ');

%% Read in TEV_File
S=open(FileTEV); % creates S struct
DataMat.hz = S(1).sampling_rate;
DataMat.timeSec = (length(S(1).dataC1)-startIDX+1)/DataMat.hz;
DataMat.x  = 1/DataMat.hz : 1/DataMat.hz : DataMat.timeSec;
DataMat.signalRaw = S(1).dataC1(startIDX:end);
DataMat.referenceRaw = S(1).dataC2(startIDX:end); 
[DataMat.referenceNorm, DataMat.signalNorm] = KimScaling ...
    (DataMat.signalRaw, DataMat.referenceRaw);
%% Hard Coded Behavior
DataMat.behavior{1,1}(:,1)=[1;122;127;132;138;141;170;175;180;187;194;196;237;238;241;252;255;265;268];
DataMat.behavior{1,2}{1,1}='behavior';
DataMat.behavior{1,2}{2,1}='begin';
DataMat.behavior{1,2}{3,1}='sniffing';
DataMat.behavior{1,2}{4,1}='disengage';
DataMat.behavior{1,2}{6,1}='disengage';
DataMat.behavior{1,2}{8,1}='disengage';
DataMat.behavior{1,2}{10,1}='disengage';
DataMat.behavior{1,2}{12,1}='disengage';
DataMat.behavior{1,2}{14,1}='disengage';
DataMat.behavior{1,2}{14,1}='retreat';
DataMat.behavior{1,2}{16,1}='retreat';
DataMat.behavior{1,2}{18,1}='retreat';
DataMat.behavior{1,2}{19,1}='disengage';
DataMat.behavior{1,2}{17,1}='disengage';
DataMat.behavior{1,2}{15,1}='disengage';
DataMat.behavior{1,2}{5,1}='sniffing';
DataMat.behavior{1,2}{7,1}='sniffing';
DataMat.behavior{1,2}{9,1}='sniffing';
DataMat.behavior{1,2}{11,1}='sniffing';
DataMat.behavior{1,2}{13,1}='sniffing';

%% Convert Behavior in masks
% Get the start of each sniffing, and the start of the next event
% for each sniffing, need to get the idx
end

