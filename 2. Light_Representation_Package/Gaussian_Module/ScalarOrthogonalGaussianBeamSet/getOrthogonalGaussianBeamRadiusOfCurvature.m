function [ radiusOfCurvatureInX,radiusOfCurvatureInY ] = getOrthogonalGaussianBeamRadiusOfCurvature( orthogonalGaussianBeamSet )
    %GETRADIUSOFCURVATURE Returns the radius of curvature of the beam at
    % z = DistanceFromWaist
    % The code is also vectorized. Multiple inputs and outputs are possible.
    
    % <<<<<<<<<<<<<<<<<<<<<<<<< Author Section >>>>>>>>>>>>>>>>>>>>>>>>>>>>
    %   Written By: Worku, Norman Girma
    %   Advisor: Prof. Herbert Gross
    %   Part of the RAYTRACE_TOOLBOX
    %	Optical System Design and Simulation Research Group
    %   Institute of Applied Physics
    %   Friedrich-Schiller-University of Jena
    
    % <<<<<<<<<<<<<<<<<<< Change History Section >>>>>>>>>>>>>>>>>>>>>>>>>>
    % Date----------Modified By ---------Modification Detail--------Remark
    % Nov 07,2014   Worku, Norman G.     Original Version
    
    
    % <<<<<<<<<<<<<<<<<<<<< Main Code Section >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    [ rayleighRangeInX,rayleighRangeInY ] = getOrthogonalGaussianBeamRayleighRange(orthogonalGaussianBeamSet);
    radiusOfCurvatureInX = [orthogonalGaussianBeamSet.DistanceFromWaistInX] + ...
        (rayleighRangeInX.^2)./[orthogonalGaussianBeamSet.DistanceFromWaistInX];
    radiusOfCurvatureInY = [orthogonalGaussianBeamSet.DistanceFromWaistInY] + ...
        (rayleighRangeInY.^2)./[orthogonalGaussianBeamSet.DistanceFromWaistInY];
end

