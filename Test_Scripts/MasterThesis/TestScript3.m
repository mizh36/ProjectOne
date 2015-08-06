%% Result 1: Dispersion calculation using raytrace (Group velocity dispersion and Third order diepersion)
% Following method described in "Group velocity dispersion using commercial optical
% design programs" Donald C. O�Shea
% clc
% fOpticalSystemName = which ('SinglePrism.mat');
% fOpticalSystemName = which ('SingleSurface.mat'); 
% fOpticalSystemName = which ('TestPrismPair.mat'); 
% fOpticalSystemName = which ('DoubleGauss28.mat');  
fOpticalSystemName = which ('TestGratingPair.mat'); 
% fOpticalSystemName = which ('SingleGrating.mat');  

opticalSystem = OpticalSystem(fOpticalSystemName);
[GDD,TOD] = opticalSystem.computeDispersion;
% TOD = opticalSystem.computeDispersion(3);
% Compute the kostenbauder matrix
format short e
[KostenbauderMatrix, interfaceKostenbauderMatrices,mediumKostenbauderMatrices]  = opticalSystem.computeKostenbauderMatrix
GDDfromKMatrix = KostenbauderMatrix(3,4)/(2*pi); % Factor of 1/2pi to convert from herzian freq to radian

GroupDelayDispersionFromRayTrace = GDD
GroupDelayDispersionFromKMatrix = GDDfromKMatrix
% ThirdOrderDispersionFromRayTrace = TOD


%% Result 7:  Ideal SSTF Pulse front tilt parameter near focus

% Take initial gaussian pulse 
% 70 fs temporal width
% 800 nm central wavelength
% 2mm beam diameter
wavLen = 800 * 10^-9;
t0 = 70 * 10^-15;
w0 = 1*10^-3;
Qin(1,1) = -1i*wavLen/(pi*w0^2);
Qin(2,2) = 1i*wavLen/(pi*t0^2);
Qin(1,2) = 0;
Qin(2,1) = 0;

QinInvers = inv(Qin);
% Use ideal K matrices to model ideal SSTF system
spacialChirp = 2*pi*7.5*10^-17;
idealDiffractive_K = [1,0,0,spacialChirp;...
                        0,1,0,0;...
                        0,0,1,0;...
                        0,0,0,1];
focalLength = 25*10^-3;
idelLens_K = [1,0,0,0;...
            -1/focalLength,1,0,0;...
            0,0,1,0;...
            0,0,0,1];
        
QInvAfterDiffractivePart = inv(([idealDiffractive_K(1,1),0;...
                    idealDiffractive_K(3,1),1]*QinInvers + ....
                    [idealDiffractive_K(1,2),idealDiffractive_K(1,4)/wavLen;...
                    idealDiffractive_K(3,2),idealDiffractive_K(3,4)/wavLen])...
                    /(([idealDiffractive_K(2,1),0;...
                           0,0]*QinInvers + ....
                          [idealDiffractive_K(2,2),idealDiffractive_K(2,4)/wavLen;...
                           0,1])));
                           
distance = linspace(24.5*10^-3,25.5*10^-3,50);
figure;
axes
for kk = 1:1:50
    propagation_K =  [1,distance(kk),0,0;...
                0,1,0,0;...
                0,0,1,0;...
                0,0,0,1];
    idealSSTF_K = propagation_K*idelLens_K*idealDiffractive_K;    
    QoutInverse = inv(([idealSSTF_K(1,1),0;...
                        idealSSTF_K(3,1),1]*QinInvers + ....
                        [idealSSTF_K(1,2),idealSSTF_K(1,4)/wavLen;...
                        idealSSTF_K(3,2),idealSSTF_K(3,4)/wavLen])...
                        /(([idealSSTF_K(2,1),0;...
                               0,0]*QinInvers + ....
                              [idealSSTF_K(2,2),idealSSTF_K(2,4)/wavLen;...
                               0,1])));
    % Pulse front tilt vs z
    PFT = imag(QoutInverse(1,2))/imag(QoutInverse(2,2));
    scatter(distance(kk),PFT,'*')
    hold on
%     % With some initial tilit
%     idealFocussing_K = propagation_K*idelLens_K;
%     % Add inital PFT
%     QInvAfterDiffractivePart(1,2) = QInvAfterDiffractivePart(1,2)-1i*2.67*10^-11;
%     QInvAfterDiffractivePart(2,1) = -QInvAfterDiffractivePart(1,2);
%     
%     QoutInverseWithInitialPFT = inv(([idealFocussing_K(1,1),0;...
%                         idealFocussing_K(3,1),1]*QInvAfterDiffractivePart + ....
%                         [idealFocussing_K(1,2),idealFocussing_K(1,4)/wavLen;...
%                         idealFocussing_K(3,2),idealFocussing_K(3,4)/wavLen])...
%                         /(([idealFocussing_K(2,1),0;...
%                                0,0]*QInvAfterDiffractivePart + ....
%                               [idealFocussing_K(2,2),idealFocussing_K(2,4)/wavLen;...
%                                0,1])));
%     PFTwithInitialPFT = imag(QoutInverse(1,2))/imag(QoutInverse(2,2));
%     scatter(distance(kk),PFTwithInitialPFT,'+')
%     hold on                        
end
