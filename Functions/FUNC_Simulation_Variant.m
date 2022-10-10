function [variant_str] = FUNC_Simulation_Variant(offshore,aerodynamics,simscape,yawcontrol)
% ### SIMULATION VARIANT
% -> Offshore, wind
if offshore == true && aerodynamics == true
    variant_str = '';
    set_param('SM_Offshore_Windturbine/HULL','commented','off')
    set_param('SM_Offshore_Windturbine/MOORINGS','commented','off')
    set_param('SM_Offshore_Windturbine/WIND TURBINE','commented','off')
    set_param('SM_Offshore_Windturbine/TOTAL LOADS TO POSITIONS','commented','off')
    set_param('SM_Offshore_Windturbine/TOTAL LOADS TO POSITIONS/Gravity & Restoring moment/Manual Switch', 'sw', '1')
end
% -> Offshore, no wind
if offshore == true && aerodynamics == false
    variant_str = '_noWind';
    set_param('SM_Offshore_Windturbine/HULL','commented','off')
    set_param('SM_Offshore_Windturbine/MOORINGS','commented','off')
    set_param('SM_Offshore_Windturbine/WIND TURBINE','commented','on')
    set_param('SM_Offshore_Windturbine/TOTAL LOADS TO POSITIONS','commented','off')
    set_param('SM_Offshore_Windturbine/TOTAL LOADS TO POSITIONS/Gravity & Restoring moment/Manual Switch', 'sw', '0')
end
% -> Onshore, wind
if offshore == false && aerodynamics == true
    variant_str = '_ON';
    set_param('SM_Offshore_Windturbine/HULL','commented','on')
    set_param('SM_Offshore_Windturbine/MOORINGS','commented','on')
    set_param('SM_Offshore_Windturbine/WIND TURBINE','commented','off')
    set_param('SM_Offshore_Windturbine/TOTAL LOADS TO POSITIONS','commented','on')
end
% -> Onshore, no wind
if offshore == false && aerodynamics == false
    error('Impossible combination')
end
if simscape == true
    set_param('SM_Offshore_Windturbine/WIND TURBINE/BODIES MOTIONS/Simscape','commented','off')
else
    set_param('SM_Offshore_Windturbine/WIND TURBINE/BODIES MOTIONS/Simscape','commented','on')
end
if yawcontrol == true
    set_param('SM_Offshore_Windturbine/WIND TURBINE/CONTROL SYSTEM/Manual Switch', 'sw', '1')
    set_param('SM_Offshore_Windturbine/WIND TURBINE/CONTROL SYSTEM/YAW CONTROL', 'commented','off')
else
    set_param('SM_Offshore_Windturbine/WIND TURBINE/CONTROL SYSTEM/Manual Switch', 'sw', '0')
    set_param('SM_Offshore_Windturbine/WIND TURBINE/CONTROL SYSTEM/YAW CONTROL', 'commented','on')
end
end

