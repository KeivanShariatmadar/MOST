function par = FUNC_Build_Par(InputPar,files)

% Author: Nicola Pozzi
% Edited: Luigi Mutidieri, Lorenzo Cottura and Riccardo Caradonna
%
% ##### Input description:
% "InputPar" is a structure built in the "Launcher_SM_ISWEC_3DOF_IrrWaves.m"
% and it contains the following fields:
%
%   --> sym:      simulation paremeters
%       - model:  Simulink model name
%       - dt:     step time for data saving (s)
%       - Ttot:   stop time of the numerical simulation (s)
%       - dt_max: maximum step size for solver (s)
%       - solver: numerical solver type
%
%   --> files:    parameters structures names
%
% ##### Output description:
% "par" is a structure in which "InpuPar", "hull" and "moor" structures are
% allocated. The first level of the structure contains the following fields:
%
%   --> sym: numerical model parameters;
%   --> wave: wave parameters and time records;
%   --> wind: wind parameters and time records;
%   --> hull: hull parameters; 
%   --> moor: mooring parameters; 
%   --> ctrl: control parameters 
%   --> IC:        initial conditions 
%   --> WT: wind turbine LUT and parameters

%% SIMULATION PARAMETERS

% Sym structure
open_system(files.model)
par.sym.model = ['Models/' files.model];
par.sym.dt = InputPar.sym.dt;
par.sym.Ttot = InputPar.sym.Ttot;
par.sym.max_dt = InputPar.sym.max_dt;
par.sym.solver = InputPar.sym.solver;

%% HULL PARAMETERS STRUCTURE

% Hull structure
par.hull = load(strcat('Structure/Platform/',files.hull));

%% WAVE PARAMETERS STRUCTURE


load(strcat('Weather Conditions/Waves/Hs_Tp/',files.wave),'WAVE');
load(strcat('Weather Conditions/Waves/Directions/',files.wavedir), 'dir');
dirf = dir;
for i=24002:length(WAVE.TIME(1,:)) 
    dirf(i)=dir(24001); 
end
par.wave = WAVE;
par.wave.direction=dirf;


par.wave.forces = par.wave.forces{1,1}; 
par.wave.forces.TAU(:,1) = par.wave.forces.TAU(:,1) .* cos(dirf*pi/180) - par.wave.forces.TAU(:,2) .* sin(dirf*pi/180);
par.wave.forces.TAU(:,2) = par.wave.forces.TAU(:,1) .* sin(dirf*pi/180) + par.wave.forces.TAU(:,2) .* cos(dirf*pi/180);
par.wave.forces.TAU(:,4) = par.wave.forces.TAU(:,4) .* cos(dirf*pi/180) - par.wave.forces.TAU(:,5) .* sin(dirf*pi/180);
par.wave.forces.TAU(:,5) = par.wave.forces.TAU(:,4) .* sin(dirf*pi/180) + par.wave.forces.TAU(:,5) .* cos(dirf*pi/180);
par.wave.velocities=load(strcat('Weather Conditions/Waves/Velocity/',files.wavevel));
par.wave.velocities.VX = par.wave.velocities.VX .* cos(dir*pi/180);
par.wave.velocities.VY = par.wave.velocities.VX .* sin(dir*pi/180);
l=length(par.hull.drag.z);
par.wave.velocities.Zrot=[zeros(1,l);zeros(1,l);par.hull.drag.z];

%% MOORING

% Mooring structure
par.moor = load(strcat('Structure/Mooring/',files.moor));

%% WIND
load(strcat('Weather Conditions/Wind/Velocity/',files.wind), 'Wind');
load(strcat('Weather Conditions/Wind/Directions/',files.winddir), 'dir');
for i=24002:length(Wind.Time) 
    dir(i)=dir(24001); 
end
Wind.SpatialDiscrU = Wind.SpatialDiscrU .* cos(dir*pi/180) - Wind.SpatialDiscrV .* sin(dir*pi/180);
Wind.SpatialDiscrV = Wind.SpatialDiscrU .* sin(dir*pi/180) + Wind.SpatialDiscrV .* cos(dir*pi/180);
par.wind = Wind;

%% WIND TURBINE

% Wind turbine structure
par.WT =  load(strcat('Structure/Wind Turbine/Structure/',files.WT));

%% INITIAL CONDITIONS

% % ## Wind turbine
% % Load steady state values
 load('Structure/Wind Turbine/Steady State/SS.mat');
 par.SS = SS;
% % Blade pitch [rad] (extrapolated if out of par.IC.SS.WindSpeed interval)
 par.IC.BlPtc0 = interp1(par.SS.WINDSPEED, par.SS.BLADEPITCH, par.wind.MeanWind, 'pchip');

 par.IC.wr0 = 8.1334;

if files.Plot==true   
open_system('SM_Offshore_Windturbine/SCOPES/GUIScopes');
else
end
end