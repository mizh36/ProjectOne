function InitializeSystemConfigurationPanel(parentWindow)
% InitializeSurfaceEditorPanel: Define and initialized the uicontrols of the
% System Configuration Panel
% Member of AODParentWindow class

aodHandles = parentWindow.AODParentHandles;
fontSize = aodHandles.FontSize;
fontName = aodHandles.FontName;

nMainTab = aodHandles.nMainTab;
aodHandles.systConfigurationTabGroup = uitabgroup(...
    'Parent', aodHandles.panelMainTab(3), ...
    'Units', 'Normalized', ...
    'Position', [0, 0, 1.0, 1.0]);
aodHandles.sysApertureDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','Aperture');
aodHandles.sysGeneralDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','General');
aodHandles.sysFieldPointsDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','Field Points');
aodHandles.sysWavelengthsDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','Wavelengths');
aodHandles.sysCoatingCatalogueDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','Coating Catalogue');
aodHandles.sysGlassCatalogueDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','Glass Catalogue');
aodHandles.sysPupilApodizationDataTab = ...
    uitab(aodHandles.systConfigurationTabGroup, 'title','Pupil Apodization');
%     aodHandles.lensCatalogueTab = ...
%         uitab(aodHandles.systConfigurationTabGroup, 'title','Lens Catalogue');

%---------------------------------------------------------------------
% All panels
aodHandles.panelSystemAperture = uipanel(...
    'Parent',aodHandles.sysApertureDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','System Aperture',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);

aodHandles.panelGeneral = uipanel(...
    'Parent',aodHandles.sysGeneralDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','General',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);

aodHandles.panelFieldPoints = uipanel(...
    'Parent',aodHandles.sysFieldPointsDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','Field Points',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);

aodHandles.panelWavelengths = uipanel(...
    'Parent',aodHandles.sysWavelengthsDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','Wavelengths',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);

aodHandles.panelCoatingCatalogue  = uipanel(...
    'Parent',aodHandles.sysCoatingCatalogueDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','Coating Catalogue',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);

aodHandles.panelGlassCatalogue = uipanel(...
    'Parent',aodHandles.sysGlassCatalogueDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','Glass Catalogue',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);

aodHandles.panelPupilApodization = uipanel(...
    'Parent',aodHandles.sysPupilApodizationDataTab,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','Glass Catalogue',...
    'units','normalized',...
    'Position',[0.25,0.25,0.50,0.60]);
%--------------------------------------------------------------------
% Put uicontrols in the panels
% System Aperture Panel
aodHandles.text5 = uicontrol( ...
    'Parent', aodHandles.panelSystemAperture, ...
    'Tag', 'text5', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.77 0.3 0.1], ...
    'String', 'Aperture Type');
aodHandles.popApertureType = uicontrol( ...
    'Parent', aodHandles.panelSystemAperture, ...
    'Tag', 'popApertureType', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Style', 'popupmenu', ...
    'Units', 'normalized', ...
    'Position', [0.35 0.8 0.5 0.08], ...
    'BackgroundColor', [1 1 1], ...
    'String', {'Enterance Pupil Diameter','Object Space NA'});

aodHandles.text11 = uicontrol( ...
    'Parent', aodHandles.panelSystemAperture, ...
    'Tag', 'text11', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.63 0.3 0.1], ...
    'String', 'Aperture Value');
aodHandles.txtApertureValue = uicontrol( ...
    'Parent', aodHandles.panelSystemAperture, ...
    'Tag', 'txtApertureValue', ...
    'Style', 'edit', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.35 0.65 0.5 0.08], ...
    'BackgroundColor', [1 1 1], ...
    'String', '10', ...
    'HorizontalAlignment', 'left');

%--------------------------------------------------------------------
% General Panel
aodHandles.text13 = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'text13', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.78 0.3 0.1], ...
    'String', 'Lens Name');

aodHandles.text20 = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'text20', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.63 0.3 0.1], ...
    'String', 'Additional Note');

aodHandles.text26 = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'text26', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.40 0.3 0.1], ...
    'String', 'Lens Units');

aodHandles.text27 = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'text27', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.25 0.3 0.1], ...
    'String', 'Wavelength Units');


aodHandles.txtLensName = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'txtLensName', ...
    'Style', 'edit', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.35 0.80 0.5 0.08], ...
    'BackgroundColor', [1 1 1], ...
    'String', 'Lens 1', ...
    'HorizontalAlignment', 'left');

aodHandles.txtLensNote = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'txtLensNote', ...
    'Style', 'edit', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.35 0.57 0.5 0.15], ...
    'BackgroundColor', [1 1 1], ...
    'String', 'Note 1', ...
    'HorizontalAlignment', 'left', ...
    'Max', 2);

aodHandles.popLensUnit = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'popLensUnit', ...
    'Style', 'popupmenu', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.35 0.34 0.5 0.17], ...
    'BackgroundColor', [1 1 1], ...
    'String', {'milimeter(mm)','centimeter(cm)','meter(m)'},...
    'Value',1);

aodHandles.popWavelengthUnit = uicontrol( ...
    'Parent', aodHandles.panelGeneral, ...
    'Tag', 'popWavelengthUnit', ...
    'Style', 'popupmenu', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.35 0.19 0.5 0.17], ...
    'BackgroundColor', [1 1 1], ...
    'String', {'nanometer(nm)','micrometer(um)'},...
    'Value',2);
%--------------------------------------------------------------------
% Field Points Panel
% Field Types Selection
aodHandles.panelFeildType = uibuttongroup( ...
    'Parent', aodHandles.panelFieldPoints, ...
    'Tag', 'panelFeildType', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0 0.86 0.85 0.13], ...
    'Title', '');

aodHandles.radioObjectHeight = uicontrol( ...
    'Parent', aodHandles.panelFeildType, ...
    'Tag', 'radioObjectHeight', ...
    'UserData', zeros(1,0), ...
    'Style', 'radiobutton', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0 0 0.3 0.96], ...
    'String', 'Object Height');

aodHandles.radioImageHeight = uicontrol( ...
    'Parent', aodHandles.panelFeildType, ...
    'Tag', 'radioImageHeight', ...
    'UserData', zeros(1,0), ...
    'Style', 'radiobutton', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.3 0 0.3 0.96], ...
    'String', 'Image Height');

aodHandles.radioAngle = uicontrol( ...
    'Parent', aodHandles.panelFeildType, ...
    'Tag', 'radioAngle', ...
    'Style', 'radiobutton', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.6 0 0.35 0.96], ...
    'String', 'Angle in Degree');

aodHandles.txtTotalFieldPointsSelected = uicontrol( ...
    'Parent', aodHandles.panelFieldPoints, ...
    'Tag', 'txtTotalFieldPointsSelected', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.87 0.86 0.12 0.12], ...
    'String', '0', ...
    'Enable', 'off');

%-------------------------------------------------------------------
aodHandles.lblFieldNormalization = uicontrol( ...
    'Parent', aodHandles.panelFieldPoints, ...
    'Tag', 'lblFieldNormalization', ...
    'Style', 'text', ...
    'HorizontalAlignment','Left',...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.05 0.74 0.4 0.1], ...
    'String', 'Field Normalization');
aodHandles.popFieldNormalization = uicontrol( ...
    'Parent', aodHandles.panelFieldPoints, ...
    'Tag', 'popFieldNormalization', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Style', 'popupmenu', ...
    'Units', 'normalized', ...
    'Position', [0.55 0.76 0.4 0.09], ...
    'BackgroundColor', [1 1 1], ...
    'String', {'Rectangular','Radial'});
%--------------------------------------------------------------------

% Feild Value Entry
aodHandles.tblFieldPoints = uitable(...
    'Parent',aodHandles.panelFieldPoints,...
    'FontSize',fontSize,'FontName', fontName,...
    'units','normalized',...
    'Position',[0 0 1 0.75]);
set(aodHandles.tblFieldPoints, ...
    'CellEditCallback',{@tblFieldPoints_CellEditCallback,aodHandles});
%-------------------------------------------------------------------
% Wavelengths  Panel
% Field Types Selection
aodHandles.panelWavelengthSetting = uipanel( ...
    'Parent', aodHandles.panelWavelengths, ...
    'Tag', 'panelWavelengths', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0 0.86 0.85 0.13], ...
    'Title', '');

aodHandles.txtPredefinedWav = uicontrol( ...
    'Parent', aodHandles.panelWavelengthSetting, ...
    'Tag', 'txtPredefinedWav', ...
    'Style', 'text', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0 0 0.25 0.7], ...
    'String', 'Predefined');
aodHandles.popPredefinedWavlens = uicontrol( ...
    'Parent', aodHandles.panelWavelengthSetting, ...
    'Tag', 'popPredefinedWavlens', ...
    'Style', 'popupmenu', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.27 0.11 0.28 0.8], ...
    'String', 'Green()');

aodHandles.txtPrimaryWavIndex = uicontrol( ...
    'Parent', aodHandles.panelWavelengthSetting, ...
    'Tag', 'txtPrimaryWavIndex', ...
    'Style', 'text', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.57 0 0.22 0.8], ...
    'String', 'Primary');
aodHandles.popPrimaryWavlenIndex = uicontrol( ...
    'Parent', aodHandles.panelWavelengthSetting, ...
    'Tag', 'popPrimaryWavlenIndex', ...
    'Style', 'popupmenu', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.82 0.11 0.15 0.8], ...
    'String', '');

aodHandles.txtTotalWavelengthsSelected = uicontrol( ...
    'Parent', aodHandles.panelWavelengths, ...
    'Tag', 'txtTotalWavelengthsSelected', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.87 0.86 0.12 0.13], ...
    'String', '0', ...
    'Enable', 'off');

% Wavelength Value Entry
aodHandles.tblWavelengths = uitable(...
    'Parent',aodHandles.panelWavelengths,...
    'FontSize',fontSize,'FontName', fontName,...
    'units','normalized',...
    'Position',[0 0 1 0.85]);

set(aodHandles.tblWavelengths, ...
    'CellEditCallback',{@tblWavelengths_CellEditCallback,aodHandles});

%--------------------------------------------------------------------
% Coating Catalogue Panel
aodHandles.cmdAddCoatingCatalogue = uicontrol( ...
    'Parent', aodHandles.panelCoatingCatalogue, ...
    'Tag', 'cmdAddCoatingCatalogue', ...
    'Style', 'pushbutton', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.02 0.91 0.20 0.08], ...
    'String', 'Add');

aodHandles.txtTotalCoatingCataloguesSelected = uicontrol( ...
    'Parent', aodHandles.panelCoatingCatalogue, ...
    'Tag', 'txtTotalFieldPointsSelected', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.78 0.91 0.20 0.08], ...
    'String', '0', ...
    'Enable', 'off');

% Coating Catalogues Entry
aodHandles.tblCoatingCatalogues = uitable(...
    'Parent',aodHandles.panelCoatingCatalogue,...
    'FontSize',fontSize,'FontName', fontName,...
    'units','normalized',...
    'Position',[0 0 1 0.90]);
set(aodHandles.tblCoatingCatalogues, ...
    'CellEditCallback',{@tblCoatingCatalogues_CellEditCallback,aodHandles});
set(aodHandles.cmdAddCoatingCatalogue,...
    'Callback',{@cmdAddCoatingCatalogue,aodHandles});
%---------------------------------------------------------------------
% Glass Catalogue Panel
aodHandles.cmdAddGlassCatalogue = uicontrol( ...
    'Parent', aodHandles.panelGlassCatalogue, ...
    'Tag', 'cmdAddGlassCatalogue', ...
    'Style', 'pushbutton', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.02 0.91 0.20 0.08], ...
    'String', 'Add');

aodHandles.txtTotalGlassCataloguesSelected = uicontrol( ...
    'Parent', aodHandles.panelGlassCatalogue, ...
    'Tag', 'txtTotalGlassCataloguesSelected', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.78 0.91 0.20 0.08], ...
    'String', '0', ...
    'Enable', 'off');

% Glass Catalogues Entry
aodHandles.tblGlassCatalogues = uitable(...
    'Parent',aodHandles.panelGlassCatalogue,...
    'FontSize',fontSize,'FontName', fontName,...
    'units','normalized',...
    'Position',[0 0 1 0.90],...
    'ColumnName', {'Select','Glass Catalogue Full Path'},...
    'ColumnWidth',{70,460});
set(aodHandles.tblGlassCatalogues, ...
    'CellEditCallback',{@tblGlassCatalogues_CellEditCallback,aodHandles});
set(aodHandles.cmdAddGlassCatalogue,...
    'Callback',{@cmdAddGlassCatalogue,aodHandles});
%--------------------------------------------------------------------
% Pupil Apodization

aodHandles.lblApodizationType = uicontrol( ...
    'Parent', aodHandles.panelPupilApodization, ...
    'Tag', 'lblApodizationType', ...
    'Style', 'text', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.1 0.8 0.35 0.1], ...
    'String', 'Apodization Type',...
    'HorizontalAlignment', 'left');
aodHandles.popApodizationType = uicontrol( ...
    'Parent', aodHandles.panelPupilApodization, ...
    'Tag', 'popApodizationType', ...
    'Style', 'popupmenu', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.5 0.8 0.3 0.1], ...
    'BackgroundColor', [1 1 1], ...
    'String', {'None','Super Gaussian'});

aodHandles.panelSuperGaussParameters = uipanel(...
    'Parent',aodHandles.panelPupilApodization,...
    'FontSize',fontSize,'FontName', fontName,...
    'Title','Super Gauss Parameters',...
    'units','normalized',...
    'Position',[0.1,0.1,0.80,0.7],...
    'Visible','off');

aodHandles.lblApodMaximumIntensity = uicontrol( ...
    'Parent', aodHandles.panelSuperGaussParameters, ...
    'Tag', 'lblApodMaximumIntensity', ...
    'Style', 'text', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.1 0.8 0.35 0.15], ...
    'String', 'Maximum Intensity', ...
    'Visible','off',...
    'HorizontalAlignment', 'left');
aodHandles.txtApodMaximumIntensity = uicontrol( ...
    'Parent', aodHandles.panelSuperGaussParameters, ...
    'Tag', 'txtApodMaximumIntensity', ...
    'Style', 'edit', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.5 0.8 0.3 0.15], ...
    'BackgroundColor', [1 1 1], ...
    'String', '1', ...
    'Visible','off',...
    'HorizontalAlignment', 'left');

aodHandles.lblApodOrder = uicontrol( ...
    'Parent', aodHandles.panelSuperGaussParameters, ...
    'Tag', 'lblApodOrder', ...
    'Style', 'text', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.1 0.6 0.35 0.15], ...
    'String', 'Order', ...
    'Visible','off',...
    'HorizontalAlignment', 'left');
aodHandles.txtApodOrder = uicontrol( ...
    'Parent', aodHandles.panelSuperGaussParameters, ...
    'Tag', 'txtApodOrder', ...
    'Style', 'edit', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.5 0.6 0.3 0.15], ...
    'BackgroundColor', [1 1 1], ...
    'String', '1', ...
    'Visible','off',...
    'HorizontalAlignment', 'left');
aodHandles.lblApodBeamRadius = uicontrol( ...
    'Parent', aodHandles.panelSuperGaussParameters, ...
    'Tag', 'lblApodBeamRadius', ...
    'Style', 'text', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.1 0.4 0.35 0.15], ...
    'String', 'Beam Radius', ...
    'Visible','off',...
    'HorizontalAlignment', 'left');
aodHandles.txtApodBeamRadius = uicontrol( ...
    'Parent', aodHandles.panelSuperGaussParameters, ...
    'Tag', 'txtApodBeamRadius', ...
    'Style', 'edit', ...
    'FontSize',fontSize,'FontName', fontName,...
    'Units', 'normalized', ...
    'Position', [0.5 0.4 0.3 0.15], ...
    'BackgroundColor', [1 1 1], ...
    'String', '1', ...
    'Visible','off',...
    'HorizontalAlignment', 'left');


set(aodHandles.popApodizationType, ...
    'Callback',{@popApodizationType_Callback,aodHandles});
%--------------------------------------------------------------------
parentWindow.AODParentHandles = aodHandles;
parentWindow.resetSystemConfigurationPanel;
end

% Call backs Implementation


% --- Executes when popApodizationType is changed in aodHandles.popApodizationType.
function popApodizationType_Callback(hObject, eventdata,aodHandles)
apodizationTypeList = cellstr (get(hObject,'String'));
apodizationTypeString = (apodizationTypeList{get(hObject,'Value')});
switch lower(apodizationTypeString)
    case lower('None')
        set(aodHandles.panelSuperGaussParameters,'Visible','off');
        set(get(aodHandles.panelSuperGaussParameters,'Children'),'Visible','off');
    case lower('Super Gaussian')
        set(aodHandles.panelSuperGaussParameters,'Visible','on');
        set(get(aodHandles.panelSuperGaussParameters,'Children'),'Visible','on');
end
end
% --- Executes when selected cell(s) is changed in aodHandles.tblWavelengths.
function tblWavelengths_CellEditCallback(~, eventdata,aodHandles)
selCell = eventdata.Indices;
selCol = selCell(2);
selRow = selCell(1);
if ~isempty(selRow) && selCol == 1
    tblData = get(aodHandles.tblWavelengths,'data');
    chkBox = tblData{selRow,1};
    if chkBox
        % Add New wavelength Row
        tblData1 = get(aodHandles.tblWavelengths,'data');
        newRow1 =  {false,0.55,1};
        newTable1 = [tblData1; newRow1];
        set(aodHandles.tblWavelengths, 'Data', newTable1);
        set(aodHandles.txtTotalWavelengthsSelected, 'String',...
            str2double(get(aodHandles.txtTotalWavelengthsSelected, 'String'))+1);
    else
        if str2double(get(aodHandles.txtTotalWavelengthsSelected, 'String')) > 1
            % Remove the current field Row
            tblData1 = get(aodHandles.tblWavelengths,'data');
            totRow = size(tblData1,1);
            parta1 = tblData1(1:selRow-1,:);
            partb1 = tblData1(selRow+1:totRow ,:);
            newTable1 = [parta1; partb1];
            set(aodHandles.tblWavelengths, 'Data', newTable1);
            set(aodHandles.txtTotalWavelengthsSelected, 'String',...
                str2double(get(aodHandles.txtTotalWavelengthsSelected, 'String'))-1);
        else
            tblData1 = get(aodHandles.tblWavelengths,'data');
            tblData1{1,1} = true;
            set(aodHandles.tblWavelengths, 'Data', tblData1);
        end
    end
    nWav = str2double(get(aodHandles.txtTotalWavelengthsSelected, 'String'));
    defaultPrimaryWav = floor((nWav+1)/2);
    set(aodHandles.popPrimaryWavlenIndex,'String',num2cell(1:nWav),'Value',defaultPrimaryWav);
end
end

% Call backs Implementation
% --- Executes when selected cell(s) is changed in aodHandles.tblFieldPoints.
function tblFieldPoints_CellEditCallback(~, eventdata,aodHandles)
selCell = eventdata.Indices;
selCol = selCell(2);
selRow = selCell(1);
if ~isempty(selRow) && selCol == 1
    tblData = get(aodHandles.tblFieldPoints,'data');
    chkBox = tblData{selRow,1};
    if chkBox
        % Add New Field Row
        tblData1 = get(aodHandles.tblFieldPoints,'data');
        newRow1 =  {false,0,0,1};
        newTable1 = [tblData1; newRow1];
        set(aodHandles.tblFieldPoints, 'Data', newTable1);
        set(aodHandles.txtTotalFieldPointsSelected, 'String',...
            str2double(get(aodHandles.txtTotalFieldPointsSelected, 'String'))+1);
    else
        if str2double(get(aodHandles.txtTotalFieldPointsSelected, 'String')) > 1
            % Remove the current field Row
            tblData1 = get(aodHandles.tblFieldPoints,'data');
            totRow = size(tblData1,1);
            parta1 = tblData1(1:selRow-1,:);
            partb1 = tblData1(selRow+1:totRow ,:);
            newTable1 = [parta1; partb1];
            set(aodHandles.tblFieldPoints, 'Data', newTable1);
            set(aodHandles.txtTotalFieldPointsSelected, 'String',...
                str2double(get(aodHandles.txtTotalFieldPointsSelected, 'String'))-1);
        else
            tblData1 = get(aodHandles.tblFieldPoints,'data');
            tblData1{1,1} = true;
            set(aodHandles.tblFieldPoints, 'Data', tblData1);
        end
    end
end
end

% --- Executes when selected cell(s) is changed in aodHandles.tblCoatingCatalogues.
function tblCoatingCatalogues_CellEditCallback(~, eventdata,aodHandles)
selCell = eventdata.Indices;
selCol = selCell(2);
selRow = selCell(1);
if ~isempty(selRow) && selCol == 1
    tblData = get(aodHandles.tblCoatingCatalogues,'data');
    chkBox = tblData{selRow,1};
    if chkBox
        set(aodHandles.txtTotalCoatingCataloguesSelected, 'String',...
            str2double(get(aodHandles.txtTotalCoatingCataloguesSelected, 'String'))+1);
    else
        set(aodHandles.txtTotalCoatingCataloguesSelected, 'String',...
            str2double(get(aodHandles.txtTotalCoatingCataloguesSelected, 'String'))-1);
    end
end
end


function cmdAddCoatingCatalogue (~, eventdata,aodHandles)
[FileNameExt,PathName] = uigetfile({'*.mat'},'Select Coating Catalogue File');
% take the extension out of file name
if (FileNameExt~=0) % FileNameExt=0 when no file is selected
    [~,FileName,ext] = fileparts(FileNameExt);
else
    FileName = 0;
    ext = 0;
end

if (FileName~=0) % FileName=0 when no file is selected
    fullFileName = [PathName FileNameExt];
    tblData1 = get(aodHandles.tblCoatingCatalogues,'data');
    alreadyExsist = 0;
    if ~isempty(tblData1)
        alreadyExsist = sum(cell2mat(cellfun(@(x) strcmpi(x,fullFileName),...
            tblData1(:,3), 'UniformOutput', false)));
        if alreadyExsist
            disp('The selected coating catalogue already exists.');
            return;
        end
    end
    [ valid, fileInfoStruct, dispMsg] = ...
        isValidAODObjectCatalogue('coating', fullFileName );
    if valid
        if ~strcmpi([pwd,'\Catalogue_Files\'],PathName)
            % Add the catlaogue to ...\Catalogue_Files folder
            copyfile(fullFileName,[pwd,'\Catalogue_Files\',FileNameExt])
        end
        fullFileName = [pwd,'\Catalogue_Files\',FileNameExt];
        
        % Add a row with the new coating catalogue
        newRow1 =  {[true],[FileName],[fullFileName]};
        newTable1 = [tblData1; newRow1];
        set(aodHandles.tblCoatingCatalogues, 'Data', newTable1);
        set(aodHandles.txtTotalCoatingCataloguesSelected, 'String',...
            str2double(get(aodHandles.txtTotalCoatingCataloguesSelected, 'String'))+1);
    else
        disp(dispMsg);
    end
else
end
end


function cmdAddGlassCatalogue (~, eventdata,aodHandles)
[FileNameExt,PathName] = uigetfile({'*.mat'},'Select Glass Catalogue File');
% take the extension out of file name
if (FileNameExt~=0) % FileNameExt=0 when no file is selected
    [~,FileName,ext] = fileparts(FileNameExt);
else
    FileName = 0;
    ext = 0;
end

if (FileName~=0) % FileName=0 when no file is selected
    fullFileName = [PathName FileNameExt];
    tblData1 = get(aodHandles.tblGlassCatalogues,'data');
    alreadyExsist = 0;
    if ~isempty(tblData1)
        alreadyExsist = sum(cell2mat(cellfun(@(x) strcmpi(x,fullFileName),...
            tblData1(:,3), 'UniformOutput', false)));
        if alreadyExsist
            disp('The selected glass catalogue already exists.');
            return;
        end
    end
    [ valid, fileInfoStruct, dispMsg] = ...
        isValidAODObjectCatalogue('glass', fullFileName );
    if valid
        if ~strcmpi([pwd,'\Catalogue_Files\'],PathName)
            % Add the catlaogue to ...\Catalogue_Files folder
            copyfile(fullFileName,[pwd,'\Catalogue_Files\',FileNameExt])
        end
        fullFileName = [pwd,'\Catalogue_Files\',FileNameExt];
        % Add a row with the new glass catalogue
        newRow1 =  {[true],[FileName],[fullFileName]};
        newTable1 = [tblData1; newRow1];
        set(aodHandles.tblGlassCatalogues, 'Data', newTable1);
        set(aodHandles.txtTotalGlassCataloguesSelected, 'String',...
            str2double(get(aodHandles.txtTotalGlassCataloguesSelected, 'String'))+1);
    else
        disp( dispMsg);
    end
else
end
end

% --- Executes when selected cell(s) is changed in aodHandles.tblGlassCatalogues.
function tblGlassCatalogues_CellEditCallback(~, eventdata,aodHandles)
selCell = eventdata.Indices;
selCol = selCell(2);
selRow = selCell(1);
if ~isempty(selRow) && selCol == 1
    tblData = get(aodHandles.tblGlassCatalogues,'data');
    chkBox = tblData{selRow,1};
    if chkBox
        set(aodHandles.txtTotalGlassCataloguesSelected, 'String',...
            str2double(get(aodHandles.txtTotalGlassCataloguesSelected, 'String'))+1);
    else
        set(aodHandles.txtTotalGlassCataloguesSelected, 'String',...
            str2double(get(aodHandles.txtTotalGlassCataloguesSelected, 'String'))-1);
    end
end
end