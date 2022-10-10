function varargout = consoleGUI(varargin)
% CONSOLEGUI MATLAB code for consoleGUI.fig
%      CONSOLEGUI, by itself, creates a new CONSOLEGUI or raises the existing
%      singleton*.
%
%      H = CONSOLEGUI returns the handle to a new CONSOLEGUI or the handle to
%      the existing singleton*.
%
%      CONSOLEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONSOLEGUI.M with the given input arguments.
%
%      CONSOLEGUI('Property','Value',...) creates a new CONSOLEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before consoleGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to consoleGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help consoleGUI

% Last Modified by GUIDE v2.5 09-Dec-2021 18:35:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @consoleGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @consoleGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before consoleGUI is made visible.
function consoleGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to consoleGUI (see VARARGIN)

% Choose default command line output for consoleGUI
handles.output = hObject;
axes(handles.axes1);
A=imread('Functions/GUI interface/LOGO console.png');
imshow(A);
axis image;
axes(handles.axes3);
B=imread('Functions/GUI interface/MORE Logo.png');
imshow(B);
axis image;
% Update handles structure

guidata(hObject, handles);
uiwait;




% --- Outputs from this function are returned to the command line.
function varargout = consoleGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Hs_Callback(hObject, eventdata, handles)
% hObject    handle to Hs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hs as text
%        str2double(get(hObject,'String')) returns contents of Hs as a double

NewStrVal = get(handles.Hs,'String');
NewVal = str2double(NewStrVal);
if NewVal>5
    NewVal=5;
elseif NewVal<0.5
    NewVal=0.5;
end
    
Mol = round(NewVal/0.50,0);
NewData = Mol*0.50;
set(handles.Hs,'string',NewData);

% --- Executes during object creation, after setting all properties.
function Hs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tp_Callback(hObject, eventdata, handles)
% hObject    handle to Tp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tp as text
%        str2double(get(hObject,'String')) returns contents of Tp as a double
NewStrVal = get(handles.Tp,'String');
NewVal = str2double(NewStrVal);
if NewVal>7.5
    NewVal=7.5;
elseif NewVal<1.5
    NewVal=1.5;
end
    
Mol = round((NewVal-0.50)/1.00);
NewData = Mol*1.00+0.50;
set(handles.Tp,'string',NewData);

% --- Executes during object creation, after setting all properties.
function Tp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WaveDir_Callback(hObject, eventdata, handles)
% hObject    handle to WaveDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaveDir as text
%        str2double(get(hObject,'String')) returns contents of WaveDir as a double
NewStrVal = get(handles.WaveDir,'String');
NewVal = str2double(NewStrVal);
if NewVal>20
    NewVal=20;
elseif NewVal<-20
    NewVal=-20;
end
    
Mol = round(NewVal/5,0);
NewData = Mol*5;
set(handles.WaveDir,'string',NewData);

% --- Executes during object creation, after setting all properties.
function WaveDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaveDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V0_Callback(hObject, eventdata, handles)
% hObject    handle to V0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V0 as text
%        str2double(get(hObject,'String')) returns contents of V0 as a double
NewStrVal = get(handles.V0,'String');
NewVal = str2double(NewStrVal);
if NewVal>24.5
    NewVal=24.5;
elseif NewVal<5.5
    NewVal=5.5;
end
    
Mol = round((NewVal-0.5)/1,0);
NewData = Mol*1+0.5;
set(handles.V0,'string',NewData);

% --- Executes during object creation, after setting all properties.
function V0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WindDir_Callback(hObject, eventdata, handles)
% hObject    handle to WindDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindDir as text
%        str2double(get(hObject,'String')) returns contents of WindDir as a double
NewStrVal = get(handles.WindDir,'String');
NewVal = str2double(NewStrVal);
if NewVal>20
    NewVal=20;
elseif NewVal<-20
    NewVal=-20;
end
    
Mol = round(NewVal/5,0);
NewData = Mol*5;
set(handles.WindDir,'string',NewData);

% --- Executes during object creation, after setting all properties.
function WindDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SimType.
function SimType_Callback(hObject, eventdata, handles)
% hObject    handle to SimType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function SimType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SimType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Aero.
function Aero_Callback(hObject, eventdata, handles)
% hObject    handle to Aero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Aero


% --- Executes on slider movement.
function TimeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to TimeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
data=get(handles.TimeSlider,'value');
NewData=round(data,0);
set(handles.TimeSlider,'Value',NewData)
set(handles.TIME,'string',NewData);

% --- Executes during object creation, after setting all properties.
function TimeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TimeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function TIME_Callback(hObject, eventdata, handles)
% hObject    handle to TIME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TIME as text
%        str2double(get(hObject,'String')) returns contents of TIME as a double
NewStrVal = get(handles.TIME,'String');
NewVal = str2double(NewStrVal);
NewData=round(NewVal,0);
set(handles.TimeSlider,'Value',NewData)
set(handles.TIME,'string',NewData);



% --- Executes during object creation, after setting all properties.
function TIME_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TIME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WindTurbine.
function WindTurbine_Callback(hObject, eventdata, handles)
% hObject    handle to WindTurbine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function WindTurbine_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindTurbine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Platform.
function Platform_Callback(hObject, eventdata, handles)
% hObject    handle to Platform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Platform_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Platform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Mooring.
function Mooring_Callback(hObject, eventdata, handles)
% hObject    handle to Mooring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Mooring contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Mooring


% --- Executes during object creation, after setting all properties.
function Mooring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mooring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop = true;
assignin('base','stop',stop)
uiresume;
% Hint: get(hObject,'Value') returns toggle state of PowerControl


% --- Executes on button press in PowerControl.
function PowerControl_Callback(hObject, eventdata, handles)
% hObject    handle to PowerControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in YawControl.
function YawControl_Callback(hObject, eventdata, handles)
% hObject    handle to YawControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of YawControl


% --- Executes on button press in Plot.
function Plot_Callback(hObject, eventdata, handles)
% hObject    handle to Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PlotFlag = get(handles.Plot,'value');
assignin('base','PlotFlag',PlotFlag)
% Hint: get(hObject,'Value') returns toggle state of Plot


% --- Executes on button press in Simscape.
function Simscape_Callback(hObject, eventdata, handles)
% hObject    handle to Simscape (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume;
ParametersUpdate(handles,hObject)



% Hint: get(hObject,'Value') returns toggle state of Simscape
function ParametersUpdate(handles,hObject)

ParametersData = Parameters(handles,hObject);
Upload(ParametersData);

function ParametersData = Parameters(handles,hObject)

Hs = str2double(get(handles.Hs,'string'));
Tp = str2double(get(handles.Tp,'string'));
V0 =get(handles.V0,'string');

ParametersData.Hs=Hs;
ParametersData.Tp=Tp;
ParametersData.V0=V0;
ParametersData.wave = ['Hs' num2str(Hs,'%0.2f') 'Tp' num2str(Tp,'%0.2f') 'wave.mat'];
ParametersData.wavevel =['Hs' num2str(Hs,'%0.2f') '_Tp' num2str(Tp,'%0.2f') 'wavevel.mat'];
ParametersData.wind = ['Wind_NTM_B_' V0 '.mat'];
site = double(get(handles.SimType,'value'));
if site==1
    ParametersData.Offshore=true;
else
    ParametersData.Offshore=false;
end
Turbine = get(handles.WindTurbine,'string');
ParametersData.Turbine = string(Turbine(get(handles.WindTurbine,'value')));
Platform = get(handles.Platform,'string');
ParametersData.hull = strcat(string(Platform(get(handles.Platform,'value'))),'.mat');
Moorings = get(handles.Mooring,'string');
ParametersData.moor = strcat(string(Moorings(get(handles.Mooring,'value'))), '.mat');
ParametersData.Aero = true;
ParametersData.powercontrol = get(handles.PowerControl,'value');
ParametersData.YControl = get(handles.YawControl,'value');
ParametersData.SimScape = get(handles.Simscape,'value');
ParametersData.WT = 'WT_constP_mod.mat'; 
ParametersData.model = 'SM_Offshore_Windturbine.slx';
Wave_dir = get(handles.WaveDir,'string');
Wind_dir = get(handles.WindDir,'string');
ParametersData.winddir = ['Wind_dir_' Wind_dir '.mat'];
ParametersData.wavedir = ['Wave_dir_' Wave_dir '.mat'];
ParametersData.Time=double(get(handles.TimeSlider,'value'));
ParametersData.Plot= get(handles.Plot,'value');


function Upload(ParametersData)
files = ParametersData;
InputPar.sym.Ttot = ParametersData.Time;
InputPar.sym.max_dt = 0.05;
InputPar.sym.dt = 0.05;
InputPar.sym.solver='ode45';
assignin('base','files',files)
assignin('base','InputPar',InputPar)
