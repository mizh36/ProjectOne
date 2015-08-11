function [ parentWindow ] = saveMySystem(parentWindow)
    % saveMySystem: Save to previously saved filepath or if new call save as
    % Member of ParentWindow class
    
    % First compute all fast semi diameters
    % parentWindow.computeFastSemidiameters;
    
    aodHandles = parentWindow.ParentHandles;
    if aodHandles.OpticalSystem.IsSaved
        SavedOpticalSystem = getCurrentOpticalSystem(parentWindow);
        pathName = aodHandles.OpticalSystem.PathName;
        fileName = aodHandles.OpticalSystem.FileName;
        % check if pathName exists
        if exist(pathName,'dir')
            saveToMATFile(SavedOpticalSystem,pathName,fileName);
        else
            parentWindow = saveMySystemAs(parentWindow);
        end
    else
        parentWindow = saveMySystemAs(parentWindow);
    end
end

