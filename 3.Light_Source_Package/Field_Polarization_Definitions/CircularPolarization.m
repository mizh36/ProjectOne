function [ returnDataStruct] = CircularPolarization(returnFlag,polarizationParameters,inputDataStruct)
    % CircularPolarization A user defined function for circularly polarized
    % The function returns differnt parameters when requested by the main program.
    % It follows the common format used for defining user defined polarization profiles.
    % powerSpectrumParameters = values of {'DirectionOfRotation'}
    % inputDataStruct : Struct of all additional inputs (not included in the surface parameters)
    % required for computing the return. (Vary depending on the returnFlag)
    % returnFlag : An integer indicating what is requested. Depending on it the
    % returnDataStruct will have different fields
    % 1: Return the field names and initial values of polarizationParameters
    % which could be used in the Source definition GUI
    %   inputDataStruct:
    %       empty
    %   Output Struct:
    %       returnDataStruct.UniqueParametersStructFieldNames
    %       returnDataStruct.UniqueParametersStructFieldDisplayNames
    %       returnDataStruct.UniqueParametersStructFieldFormats
    %       returnDataStruct.DefaultUniqueParametersStruct
    % 2: Return the Jones vector for the given polarization parameter
    %   inputDataStruct:
    %       inputDataStruct.xMesh
    %       inputDataStruct.yMesh
    %       inputDataStruct.BeamCenter 
    %   returnDataStruct:
    %       returnDataStruct.JonesVector
    %       returnDataStruct.PolarizationDistributionType
    %       returnDataStruct.CoordinateSystem
    
    % <<<<<<<<<<<<<<<<<<<<<<<<< Author Section >>>>>>>>>>>>>>>>>>>>>>>>>>>>
    %   Written By: Worku, Norman Girma
    %   Advisor: Prof. Herbert Gross
    %	Optical System Design and Simulation Research Group
    %   Institute of Applied Physics
    %   Friedrich-Schiller-University of Jena
    
    % <<<<<<<<<<<<<<<<<<< Change History Section >>>>>>>>>>>>>>>>>>>>>>>>>>
    % Date----------Modified By ---------Modification Detail--------Remark
    % Jun 19,2015   Worku, Norman G.     Original Version
    % Sep 09,2015   Worku, Norman G.     Edited to common user defined format
    
    %% Default input values
    if nargin < 1
        disp(['Error: The function CircularPolarization() needs atleast one argument',...
            'the return type.']);
        returnDataStruct = NaN;
        return;
    end
    if nargin < 2
        if returnFlag == 1
            % OK
        elseif returnFlag == 2
            % get the default parameters
            retF = 1;
            returnData = CircularPolarization(retF);
            polarizationParameters = returnData.DefaultUniqueParametersStruct;
            
            inputDataStruct = struct();
        else
            disp(['Error: The function CircularPolarization() needs all three ',...
                'arguments the compute the required return.']);
            returnDataStruct = NaN;
            return;
        end
    end
    
    switch returnFlag(1)
        case 1 % Return the field names and initial values of polarizationParameters
            returnData1 = {'DirectionOfRotation'};
            returnData1_Disp = {'Direction Of Rotation'};
            returnData2 = {{'Right','Left'}};
            polarizationParametersStruct = struct();
            polarizationParametersStruct.DirectionOfRotation = 1;%'Right';
            returnData3 = polarizationParametersStruct;
            
            returnDataStruct.UniqueParametersStructFieldNames = returnData1;
            returnDataStruct.UniqueParametersStructFieldDisplayNames = returnData1_Disp;
            returnDataStruct.UniqueParametersStructFieldFormats = returnData2;
            returnDataStruct.DefaultUniqueParametersStruct = returnData3;
        case 2 % Return the Jones vector for the given polarization parameter
            polDistributionType = 'Global';
            coordinate = 'SP';
            
            dirOfRot = (polarizationParameters.DirectionOfRotation);
            switch (dirOfRot)
                case 1 %lower('Left')
                    jonesVector = (1/sqrt(2))*[1;-1i];
                case 2 %lower('Right')
                    jonesVector = (1/sqrt(2))*[1;1i];
            end
            
            returnDataStruct.JonesVector = jonesVector;
            returnDataStruct.PolarizationDistributionType = polDistributionType;
            returnDataStruct.CoordinateSystem = coordinate;
    end
end