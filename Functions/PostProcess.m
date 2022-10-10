function [MEAN,DEVSTD,WT,POSITIONS,FORCES] = PostProcess(TIME,AZIMUTH,BLADEPITCH,GENPWR,GENTRQ,GENSPD,SURGE,SWAY,...
    HEAVE,ROLL,PITCH,YAW,MOORINGFORCES,WAVEFORCES,WTFORCES,files)
WT.Azimuth=AZIMUTH; WT.BladePitch=BLADEPITCH; WT.GenPower=GENPWR; 
WT.GenTorque=GENTRQ; WT.GenSpeed=GENSPD; 
POSITIONS.Surge=SURGE; POSITIONS.Sway=SWAY; POSITIONS.Heave=HEAVE; 
POSITIONS.Roll=ROLL; POSITIONS.Pitch=PITCH; POSITIONS.Yaw=YAW;
FORCES.Moorings=MOORINGFORCES; FORCES.Waves=WAVEFORCES; FORCES.WindTurbine=WTFORCES;
MEAN.Azimuth=mean(WT.Azimuth); 
MEAN.BladePitch=mean(WT.BladePitch); 
MEAN.GenPower=mean(WT.GenPower); 
MEAN.GenTorque=mean(WT.GenTorque); 
MEAN.GenSpeed=mean(WT.GenSpeed); 
MEAN.Surge=mean(POSITIONS.Surge); 
MEAN.Sway=mean(POSITIONS.Sway); 
MEAN.Heave=mean(POSITIONS.Heave); 
MEAN.Roll=mean(POSITIONS.Roll); 
MEAN.Pitch=mean(POSITIONS.Pitch); 
MEAN.Yaw=mean(POSITIONS.Yaw);
MEAN.Moorings=mean(FORCES.Moorings); 
MEAN.Waves=mean(FORCES.Waves); 
MEAN.WindTurbine=mean(FORCES.WindTurbine);

DEVSTD.Azimuth=std(WT.Azimuth); 
DEVSTD.BladePitch=std(WT.BladePitch); 
DEVSTD.GenPower=std(WT.GenPower); 
DEVSTD.GenTorque=std(WT.GenTorque); 
DEVSTD.GenSpeed=std(WT.GenSpeed); 
DEVSTD.Surge=std(POSITIONS.Surge); 
DEVSTD.Sway=std(POSITIONS.Sway); 
DEVSTD.Heave=std(POSITIONS.Heave); 
DEVSTD.Roll=std(POSITIONS.Roll); 
DEVSTD.Pitch=std(POSITIONS.Pitch); 
DEVSTD.Yaw=std(POSITIONS.Yaw);
DEVSTD.Moorings=std(FORCES.Moorings); 
DEVSTD.Waves=std(FORCES.Waves); 
DEVSTD.WindTurbine=std(FORCES.WindTurbine);
Save_dir = num2str(which('Launcher.m'));
savename = strcat(Save_dir(1,1:end-10),['Results/Sim' ...
    '_Hs'], num2str(files.Hs,'%0.2f'), '_Tp', num2str(files.Tp,'%0.2f'), '_V', files.V0);
save([savename '.mat'],'WT','POSITIONS','FORCES','TIME','MEAN','DEVSTD')
end

