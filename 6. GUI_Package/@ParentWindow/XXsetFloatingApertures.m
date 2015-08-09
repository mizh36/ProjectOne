function setFloatingApertures( parentWindow )
    % setFloatingApertures: Computes and sets the apertures values of
    % floating apertures of each surface by tracing cheif ray + top and bottom
    % mariginal rays of each field and each wavelength and taking the maximum
    % radial interesection of the rays with the surfaces.
    % Member of ParentWindow class
    
    aodHandles = parentWindow.ParentHandles;
    currentOpticalSystem = getCurrentOpticalSystem(parentWindow);
    nField = getNumberOfFieldPoints(currentOpticalSystem);
    nSurf = getNumberOfSurfaces(currentOpticalSystem);
    nWav = getNumberOfWavelengths(currentOpticalSystem);
    
    fieldPointMatrix = currentOpticalSystem.FieldPointMatrix;
    fieldPointXY = (fieldPointMatrix(:,1:2))';
    wavelengthMatrix = currentOpticalSystem.WavelengthMatrix;
    wavLen = (wavelengthMatrix(:,1))';
    
    % Repeat wavelegths for each field point and vice versa
    fieldPointXYAll = fieldPointXY*ones(1,nWav);%repmat(fieldPointXY,[1,nWav]);
    wavLenAll = cell2mat(arrayfun(@(x) x*ones(1,nField),wavLen,'UniformOutput',false));
        
    angleFromYinRad1 = 0;
    angleFromYinRad2 = pi;
    % Ignore current apertures in the computation of flaoting
    considerSurfAperture = 0;
    topMariginalRayTraceResult = traceMariginalRay(currentOpticalSystem,...
        fieldPointXYAll,wavLenAll,angleFromYinRad1,considerSurfAperture);
    bottomMariginalRayTraceResult = traceMariginalRay(currentOpticalSystem,...
        fieldPointXYAll,wavLenAll,angleFromYinRad2,considerSurfAperture);
    cheifRayTraceResult = traceCheifRay(currentOpticalSystem,...
        fieldPointXYAll,wavLenAll,considerSurfAperture);
    
    for kk = 1:nSurf
        topMariginalIntersection = [topMariginalRayTraceResult(kk,:).RayIntersectionPoint];
        bottomMariginalIntersection = [bottomMariginalRayTraceResult(kk,:).RayIntersectionPoint];
        cheifRayIntersection = [cheifRayTraceResult(kk,:).RayIntersectionPoint];
        
        surfaceVertex = currentOpticalSystem.SurfaceArray(kk).SurfaceCoordinateTM(1:3,4);
        
        vertexToTopMariginal = (topMariginalIntersection - repmat(surfaceVertex,[1,nField*nWav]));
        vertexToTopMariginalDist = computeNormOfMatrix(vertexToTopMariginal,1);
        vertexToBottomMariginal = (bottomMariginalIntersection - repmat(surfaceVertex,[1,nField*nWav]));
        vertexToBottomMariginalDist = computeNormOfMatrix(vertexToBottomMariginal,1);
        
        vertexTocheifRay = (cheifRayIntersection - repmat(surfaceVertex,[1,nField*nWav]));
        vertexTocheifRayDist = computeNormOfMatrix(vertexTocheifRay,1);
        
        
        maxRadToTopMariginalRay = max(vertexToTopMariginalDist);
        maxRadToBottomMariginalRay = max(vertexToBottomMariginalDist);
        
        maxRadTocheifRay = max(vertexTocheifRayDist);
        
        maxRadToMariginal_CheifRay(kk) = max([maxRadToTopMariginalRay,...
            maxRadToBottomMariginalRay,maxRadTocheifRay]);
        % Add 5% to the max radius of the furthest mariginal ray
        fastSemiDiameter(kk) = 1.05*maxRadToMariginal_CheifRay(kk);
        
        fastSemiDiameterStr = num2str(fastSemiDiameter(kk));
        % Set the fast semi diameters in the surface editor window
        % standard data if semi diameter is not user fixed 'U'
        tblData1 = get(aodHandles.tblStandardData,'data');
        if ~strcmpi(tblData1{kk,14},'U')
            tblData1{kk,13} = fastSemiDiameterStr;
            set(aodHandles.tblStandardData, 'Data', tblData1);
        end
        
        % update aperture table if it is Floating Aperture
        tblData2 = get(aodHandles.tblApertureData,'data');
        if strcmpi(tblData2{kk,3},'Floating')
            tblData2{kk,5} = fastSemiDiameterStr;
            tblData2{kk,7} = fastSemiDiameterStr;
            set(aodHandles.tblApertureData, 'Data', tblData2);
        end
    end
end

