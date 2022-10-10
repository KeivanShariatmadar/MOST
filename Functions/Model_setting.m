function  Model_setting
CAD_File = which('CAD_DataFile.m');
SM_Offshore_Windturbine
mdlWks = get_param('SM_Offshore_Windturbine','ModelWorkspace');
mdlWks.DataSource = 'MATLAB File';
mdlWks.FileName = CAD_File;
reload(mdlWks);
helpdlg('Save "SM_Offshore_Windturbine" Simulink model before running the matlab script "Launcher"');

end

