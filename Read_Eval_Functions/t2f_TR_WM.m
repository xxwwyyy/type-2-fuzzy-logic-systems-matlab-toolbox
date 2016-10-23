function [yLeft,yRight,L,R]=t2f_TR_WM(F,Y)
%T2F_TR_EKM
%
% SYNTAX:
%     t2f_TR_KM(...)
%
% INPUTS:
%
% OUTPUTS:
%
% EXAMPLE :
%
% See also

% Copyright (c) Istanbul Technical University Control Engineering 2014
% $Revision: 1.10 $, $Date: 2014/02/19 10:20:06VET $ by $Author: Ahmet Taskin $

% Calls:
%% IASC Algorithm for Computing Y Left

% Sort Y matrix
lowerY = Y(:,1);
upperY = Y(:,2);
[~, ind] = sort(lowerY);
lowerY = lowerY(ind,:);
upperY = upperY(ind,:);
sortedF = F(ind,:);
lowerF = sortedF(:,1);
upperF = sortedF(:,2);


upperyl=min(sum(lowerY.*(lowerF))/sum(lowerF),sum(lowerY.*(upperF))/sum(upperF));

loweryr=min(sum(upperY.*(lowerF))/sum(lowerF),sum(upperY.*(upperF))/sum(upperF));

loweryl=upperyl-(sum(upperF-lowerF)/sum(upperF)*sum(lowerF))*sum(lowerF.*(lowerY-lowerY(1)))*sum(upperF.*(lowerY(end)-lowerY))/(sum(lowerF.*(lowerY-lowerY(1)))+sum(upperF.*(lowerY(end)-lowerY)));

upperyr=loweryr+(sum(upperF-lowerF)/sum(upperF)*sum(lowerF))*sum(upperF.*(upperY-upperY(1)))*sum(lowerF.*(upperY(end)-upperY))/(sum(upperF.*(upperY-upperY(1)))+sum(lowerF.*(upperY(end)-upperY)));

yLeft=(loweryl+upperyl)/2;
yRight=(loweryr+upperyr)/2;
L=0;
R=0;
