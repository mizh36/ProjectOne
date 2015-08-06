function [ coatingJonesMatrix ] = computeCoatingJonesMatrix( coating,wavLen,...
    incidenceAngle,indexBefore,indexAfter,reflection )
%COMPUTECOATINGJONESMATRIX Returns the coating Jones matrix  for given
%incidence angle
    wavLenInUm = wavLen*10^6;    
    if reflection  
        [ampRs,ampRp,powRs,powRp,coatingJonesMatrix]=...
            getReflectionCoefficients(coating,...
            wavLenInUm,incidenceAngle,...
            indexBefore,indexAfter);                
    else
        [ampTs,ampTp,powTs,powTp,coatingJonesMatrix] = ...
        getTransmissionCoefficients(coating,...
        wavLenInUm,incidenceAngle,...
        indexBefore,indexAfter);
    end

end

