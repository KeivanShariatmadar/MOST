%% RUN THIS SECTION ONLY BEFORE THE FIRST SIMULATION ON YOUR PC. THEN SAVE THE SIMULINK MODEL.

% Model_setting

%% UNCOMMENT THIS SECTION IF YOU WANT TO DO A SINGLE SIMULATION

consoleGUI

par = FUNC_Build_ParGUI(InputPar,files);
par.V0 = str2double(files.V0);
 variant_str = FUNC_Simulation_Variant(logical(files.Offshore),logical(files.Aero)...
     ,logical(files.SimScape),logical(files.YControl));
tic
sim(files.model)
toc
[MEAN,DEVSTD,WT,POSITIONS,FORCES] = PostProcess(TIME,AZIMUTH,BLADEPITCH,GENPWR,GENTRQ,GENSPD,SURGE,SWAY,...
     HEAVE,ROLL,PITCH,YAW,MOORINGFORCES,WAVEFORCES,WTFORCES,files);


%% UNCOMMENT THIS SECTION IF YOU WANT TO DO A MULTIPLE SIMULATIONS IN SEQUENCE
% 
% stop = false;
% while 1
% consoleGUI
% if stop==true
%     break;
% end
% par = FUNC_Build_ParGUI(InputPar,files);
% par.V0 = str2double(files.V0);
% 
% % Simulation variant
% variant_str = FUNC_Simulation_Variant(logical(files.Offshore),logical(files.Aero)...
%     ,logical(files.SimScape),logical(files.YControl));
% tic
% sim(files.model)
% toc
% 
% [MEAN,DEVSTD,WT,POSITIONS,FORCES] = PostProcess(TIME,AZIMUTH,BLADEPITCH,GENPWR,GENTRQ,GENSPD,SURGE,SWAY,...
%       HEAVE,ROLL,PITCH,YAW,MOORINGFORCES,WAVEFORCES,WTFORCES,files);
% 
% end




