function specOpen = specsOpen(filename)
%SPECSOPEN Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen(filename,"r");
datacel = textscan(fileID, '%s', 'CommentStyle', '%');
fclose(fileID);

specOpen = datacel{1};
end

