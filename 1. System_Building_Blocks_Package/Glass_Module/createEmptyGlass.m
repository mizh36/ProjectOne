function emptyGlass = createEmptyGlass()
    % returns an empty struct or object of class
    if isstruct(Glass())
        emptyGlass = struct(...
            'Name',{},...
            'Type',{},...
            'Parameters',{},...
            'InternalTransmittance',{},...
            'ResistanceData',{},...
            'ThermalData',{},...
            'OtherData',{},...
            'WavelengthRange',{},...
            'Comment',{},...
            'ClassName',{});
    else
        emptyGlass = Glass.empty;
    end
end