function [ surfaceRayIntersectionPoint ] = getAllSurfaceRayIntersectionPoint( allSurfaceRayTraceResult,...
        rayPupilIndices,rayFieldIndices,rayWavelengthIndices)
    %getAllSurfaceExitRayDirection: Returns the Ray Intersection Point of a specific
    % ray specified by (rayPupilIndex,rayFieldIndex,rayWavIndex) for all surfaces
    % Input:
    %   allSurfaceRayTraceResult: vector of raytrace result (size = nSurf)
    %   (rayPupilIndex,rayFieldIndex,rayWavIndex) : Indices specifying a given
    %   ray
    % Output:
    %   exitRayDirections: is (3 X nSurf X nPupilPointsRequested X nFieldRequested X nWavRequested)
    
    if nargin == 0
        disp(['Error: The function  getAllSurfaceRayIntersectionPoint requires ',...
            'atleast the surface trace result struct as argument.']);
        surfaceRayIntersectionPoint = NaN;
        return;
    elseif nargin == 1
        rayPupilIndices = 0; % All
        rayFieldIndices = 0; % All
        rayWavelengthIndices = 0; % All
    elseif nargin == 2
        rayFieldIndices = 0; % All
        rayWavelengthIndices = 0; % All
    elseif nargin == 3
        rayWavelengthIndices = 0; % All
    else
        
    end
    
    requestedResultFieldName = 'RayIntersectionPoint';
    requestedFieldFirstDim = 3;
    surfaceRayIntersectionPoint = getRayTraceResultFieldForAllSurfaces( ...
        allSurfaceRayTraceResult,requestedResultFieldName,requestedFieldFirstDim,...
        rayPupilIndices,rayFieldIndices,rayWavelengthIndices);
end


