function varargout = control(varargin)
% CONTROL MATLAB code for control.fig
%      CONTROL, by itself, creates a new CONTROL or raises the existing
%      singleton*.
%
%      H = CONTROL returns the handle to a new CONTROL or the handle to
%      the existing singleton*.
%
%      CONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL.M with the given input arguments.
%
%      CONTROL('Property','Value',...) creates a new CONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control

% Last Modified by GUIDE v2.5 02-Jul-2024 15:58:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_OpeningFcn, ...
                   'gui_OutputFcn',  @control_OutputFcn, ...
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


% --- Executes just before control is made visible.
function control_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control (see VARARGIN)

% Choose default command line output for control
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in GETDATA.
function GETDATA_Callback(hObject, eventdata, handles)
% hObject    handle to GETDATA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf(handles.COM_USER,'GETD');

% --- Executes on button press in PAUSE.
function PAUSE_Callback(hObject, eventdata, handles)
% hObject    handle to PAUSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in forward.
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
data_pr = 'CON_FW';
fprintf (handles.COM_USER, data_pr) ;
end

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
data_pr = 'CON_BK';
fprintf (handles.COM_USER, data_pr) ;
end

% --- Executes on button press in forward_left.
function forward_left_Callback(hObject, eventdata, handles)
% hObject    handle to forward_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
data_pr = 'F_LEFT';
fprintf (handles.COM_USER, data_pr) ;
end

% --- Executes on button press in forward_right.
function forward_right_Callback(hObject, eventdata, handles)
% hObject    handle to forward_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
data_pr = 'F_RIGHT';
fprintf (handles.COM_USER, data_pr) ;
end


% --- Executes on button press in back_left.
function back_left_Callback(hObject, eventdata, handles)
% hObject    handle to back_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
data_pr = 'B_LEFT';
fprintf (handles.COM_USER, data_pr) ;
end

% --- Executes on button press in back_right.
function back_right_Callback(hObject, eventdata, handles)
% hObject    handle to back_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
data_pr = 'B_RIGHT';
fprintf (handles.COM_USER, data_pr) ;
end

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')   
fprintf (handles.COM_USER,'p');
end

% --- Executes on button press in button_OPEN.
function button_OPEN_Callback(hObject, eventdata, handles)
% hObject    handle to button_OPEN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get (hObject,'value')
   set(hObject,'string','关闭');
   fprintf(handles.COM_USER,'p');
   set(handles.SIGN,'string','GO') ;
   set(handles.SIGN,'value',0);%弹起该按钮
% 弹起方向控制按键
set (handles.forward_left,'enable','on') ;
set (handles.forward,'enable','on') ;
set (handles.forward_right,'enable','on');
set (handles.back_left,'enable','on');
set (handles.back,'enable','on');
set (handles.back_right,'enable','on');
else
set (hObject,'string','开启');
fprintf (handles.COM_USER,'p') ;
%落下方向控制按键
set (handles.forward_left,'enable','off') ;
set (handles.forward,'enable','off');
set (handles.forward_right,'enable','off') ;
set (handles.back_left,'enable','off');
set (handles.back,'enable','off') ;
set(handles.back_right,'enable','off');
end

% --- Executes on button press in checkbox_leftEncoder.
function checkbox_leftEncoder_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_leftEncoder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_leftEncoder



function edit_leftEncoder_Callback(hObject, eventdata, handles)
% hObject    handle to edit_leftEncoder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_leftEncoder as text
%        str2double(get(hObject,'String')) returns contents of edit_leftEncoder as a double


% --- Executes during object creation, after setting all properties.
function edit_leftEncoder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_leftEncoder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_leftMotorControl.
function checkbox_leftMotorControl_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_leftMotorControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_leftMotorControl



function edit_leftMotorControl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_leftMotorControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_leftMotorControl as text
%        str2double(get(hObject,'String')) returns contents of edit_leftMotorControl as a double


% --- Executes during object creation, after setting all properties.
function edit_leftMotorControl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_leftMotorControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_leftMotorTarget.
function checkbox_leftMotorTarget_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_leftMotorTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_leftMotorTarget



function edit_leftMotorTarget_Callback(hObject, eventdata, handles)
% hObject    handle to edit_leftMotorTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_leftMotorTarget as text
%        str2double(get(hObject,'String')) returns contents of edit_leftMotorTarget as a double


% --- Executes during object creation, after setting all properties.
function edit_leftMotorTarget_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_leftMotorTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_steerControl.
function checkbox_steerControl_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_steerControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_steerControl



function edit_steerControl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_steerControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_steerControl as text
%        str2double(get(hObject,'String')) returns contents of edit_steerControl as a double


% --- Executes during object creation, after setting all properties.
function edit_steerControl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_steerControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_leftSensor.
function checkbox_leftSensor_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_leftSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_leftSensor



function edit_leftSensor_Callback(hObject, eventdata, handles)
% hObject    handle to edit_leftSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_leftSensor as text
%        str2double(get(hObject,'String')) returns contents of edit_leftSensor as a double


% --- Executes during object creation, after setting all properties.
function edit_leftSensor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_leftSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_middleSensor.
function checkbox_middleSensor_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_middleSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_middleSensor



function edit_middleSensor_Callback(hObject, eventdata, handles)
% hObject    handle to edit_middleSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_middleSensor as text
%        str2double(get(hObject,'String')) returns contents of edit_middleSensor as a double


% --- Executes during object creation, after setting all properties.
function edit_middleSensor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_middleSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_rightSensor.
function checkbox_rightSensor_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_rightSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_rightSensor



function edit_rightSensor_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rightSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rightSensor as text
%        str2double(get(hObject,'String')) returns contents of edit_rightSensor as a double


% --- Executes during object creation, after setting all properties.
function edit_rightSensor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rightSensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_accX.
function checkbox_accX_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_accX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_accX



function edit_accX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_accX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_accX as text
%        str2double(get(hObject,'String')) returns contents of edit_accX as a double


% --- Executes during object creation, after setting all properties.
function edit_accX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_accX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_accY.
function checkbox_accY_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_accY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_accY



function edit_accY_Callback(hObject, eventdata, handles)
% hObject    handle to edit_accY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_accY as text
%        str2double(get(hObject,'String')) returns contents of edit_accY as a double


% --- Executes during object creation, after setting all properties.
function edit_accY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_accY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_accz.
function checkbox_accz_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_accz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_accz



function edit_accZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_accZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_accZ as text
%        str2double(get(hObject,'String')) returns contents of edit_accZ as a double


% --- Executes during object creation, after setting all properties.
function edit_accZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_accZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_rightEncoder.
function checkbox_rightEncoder_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_rightEncoder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_rightEncoder



function edit_rightEncoder_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rightEncoder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rightEncoder as text
%        str2double(get(hObject,'String')) returns contents of edit_rightEncoder as a double


% --- Executes during object creation, after setting all properties.
function edit_rightEncoder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rightEncoder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_rightMotorControl.
function checkbox_rightMotorControl_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_rightMotorControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_rightMotorControl



function edit_rightMotorControl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rightMotorControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rightMotorControl as text
%        str2double(get(hObject,'String')) returns contents of edit_rightMotorControl as a double


% --- Executes during object creation, after setting all properties.
function edit_rightMotorControl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rightMotorControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_rightMotorTarget.
function checkbox_rightMotorTarget_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_rightMotorTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_rightMotorTarget



function edit_rightMotorTarget_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rightMotorTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rightMotorTarget as text
%        str2double(get(hObject,'String')) returns contents of edit_rightMotorTarget as a double


% --- Executes during object creation, after setting all properties.
function edit_rightMotorTarget_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rightMotorTarget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_offCenter.
function checkbox_offCenter_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_offCenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_offCenter



function edit_offCenter_Callback(hObject, eventdata, handles)
% hObject    handle to edit_offCenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_offCenter as text
%        str2double(get(hObject,'String')) returns contents of edit_offCenter as a double


% --- Executes during object creation, after setting all properties.
function edit_offCenter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_offCenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_gyrox.
function checkbox_gyrox_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_gyrox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_gyrox



function edit_gyrox_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gyrox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gyrox as text
%        str2double(get(hObject,'String')) returns contents of edit_gyrox as a double


% --- Executes during object creation, after setting all properties.
function edit_gyrox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gyrox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_gyroY.
function checkbox_gyroY_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_gyroY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_gyroY



function edit_gyroY_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gyroY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gyroY as text
%        str2double(get(hObject,'String')) returns contents of edit_gyroY as a double


% --- Executes during object creation, after setting all properties.
function edit_gyroY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gyroY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_gyroz.
function checkbox_gyroz_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_gyroz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_gyroz



function edit_gyroz_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gyroz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gyroz as text
%        str2double(get(hObject,'String')) returns contents of edit_gyroz as a double


% --- Executes during object creation, after setting all properties.
function edit_gyroz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gyroz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_megx.
function checkbox_megx_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_megx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_megx



function edit_megx_Callback(hObject, eventdata, handles)
% hObject    handle to edit_megx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_megx as text
%        str2double(get(hObject,'String')) returns contents of edit_megx as a double


% --- Executes during object creation, after setting all properties.
function edit_megx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_megx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_megY.
function checkbox_megY_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_megY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_megY



function edit_megY_Callback(hObject, eventdata, handles)
% hObject    handle to edit_megY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_megY as text
%        str2double(get(hObject,'String')) returns contents of edit_megY as a double


% --- Executes during object creation, after setting all properties.
function edit_megY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_megY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_megZ.
function checkbox_megZ_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_megZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_megZ



function edit_megz_Callback(hObject, eventdata, handles)
% hObject    handle to edit_megz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_megz as text
%        str2double(get(hObject,'String')) returns contents of edit_megz as a double


% --- Executes during object creation, after setting all properties.
function edit_megz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_megz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MOTOR_RESPONSE.
function MOTOR_RESPONSE_Callback(hObject, eventdata, handles)
% hObject    handle to MOTOR_RESPONSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename_CGSJ;
if handles.DATA_choose.Value
    FileName = filename_CGSJ;
else
   [FileName,~] = uigetfile('*,*','Select the Data file');
end
if ~FileName
    msgbox('未选择文件');
return;

end

if exist(FileName,'file')
    indata = dlmread(FileName,',');
else
    msgbox('本次连接蓝牙后还未收集数据，请先运行小车收集数据');
return;
end
ind = length(indata);%获取数据的长度
seg_num = indata(:, 3) ;%发送数据时的控制周期编号
left_encoder = indata(:, 4) ;%左轮编码器脉冲数(一个控制周期)
right_encoder = indata(:,5);%右轮编码器脉冲数(一个控制周期)
target_left_motor = indata(:,8);%左轮目标脉冲数
target_right_motor = indata(:, 9);%右轮目标脉冲数
off_center = indata(:, 11) ;%偏离中心值

step = 5 ;%正常情况是间隔5个控制周期发送一次数据
dist = (left_encoder.*step+right_encoder.*step)./2.;%计算每一个发送周期间小车左右轮编码器总的脉冲数
difference = abs(left_encoder-right_encoder);%左右轮编码器脉冲数的差值
pulses = 512;%轮胎运行一圈编码器产生512个脉冲
girth = 22;%轮胎的周长，单位cm
distance = (cumsum(dist)./pulses)*girth; %计算每发送一个运行数据后，小车移动的距离，单位cm

set(figure(11),'unit','normalized','position',[0.2,0.1,0.4,0.6])
subplot (2,1,1);hold off;
scatter(off_center./max(abs(off_center)), (left_encoder+right_encoder)./2); %对偏离中心值先做归一化
xlabel(' off_center');ylabel('车速(脉冲数)');title(' 车速(脉冲数)随off center变化趋势');
subplot (2,1,2) ;hold off;
scatter(off_center/max(abs(off_center)), difference/max(abs(difference))); %对偏离中心值和差值先做归一化
xlabel(' off_center');ylabel( '差速(脉冲数)');title( '左右轮差速(脉冲数)随off center变化趋势');


set(figure(12),'unit','normalized','position',[0.3,0.1,0.4,0.6])
subplot(2,1,1) ;hold off;grid on;
plot(left_encoder,'r') ;hold on;plot(target_left_motor,'b:','linewidth',2);
title('左电机响应曲线');xlabel('控制周期');ylabel('电机编码脉冲');
legend('左电机实时速度(脉冲数)','左电机目标速度(脉冲数)');
subplot(2,1, 2) ;hold off;grid on;
plot(right_encoder,'r');hold on;plot(target_right_motor,'b:','linewidth',2);
title('右电机响应曲线');xlabel('控制周期');ylabel('电机编码脉冲');
legend('右电机实时速度(脉冲数)','右电机目标速度(脉冲数)');


set(figure(13),'unit','normalized','position',[0.4,0.1,0.4,0.6]);
hold off;
plot(distance,'b','linewidth',2);
grid on;
title('移动距离');xlabel('控制周期');ylabel('移动距离(厘米)');


% --- Executes on button press in STEER_RESPONSE.
function STEER_RESPONSE_Callback(hObject, eventdata, handles)
% hObject    handle to STEER_RESPONSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename_CGSJ;
if handles.DATA_choose.Value
    FileName = filename_CGSJ;
else
   [FileName,~] = uigetfile('*,*','Select the Data file');
end
if ~FileName
    msgbox('未选择文件');
return;

end

if exist(FileName,'file')
    indata = dlmread(FileName,',');
else
    msgbox('本次连接蓝牙后还未收集数据，请先运行小车收集数据');
return;

end

ind = length(indata) ; %获取数据的长度
off_center = indata(:,11) ; %偏离中心值
steering_pwm = indata(:,10); %舵机控制量，直走1500
gyroz_suboffset = indata(:, 20); %陀螺仪Z轴的值
w_Bias = gyroz_suboffset./4000.; %off_center./1000-gyroz_suboffset./4000.
steer_ul = 1500*ones(ind,1)-(621.*off_center./1000+10.*w_Bias);
lastoff_center = [0: off_center(1:end-1)];
T = 0.01;%控制周期的时间,单位s
w_sensor = (atan(off_center./1000)-atan(lastoff_center./1000))./T;
w_sensor_avg5 = filter(ones(5,1)./5,1,w_sensor) ;
w_gyroz = (gyroz_suboffset./16.4).*3.14./180;
w_error =w_sensor_avg5-w_gyroz; % *3.14/16.4/180，相当于/940.%w Bias =(off_center./1000-gyroz suboffset./4000)
steer_u2 = 1500*ones(ind,1)-(621.*off_center./1000+50.*w_error); %h+10,*(w error-w lastError)


set(figure(21),'unit','normalized','position',[0.2,0.3,0.3,0.45]);
hold off;plot(w_gyroz,'r') ;
hold on;plot(w_sensor_avg5,'b') ;
hold on;plot(off_center./300,'g','linewidth',2);
legend('w_gyroz','w_sensor_avg5', 'off_center');
title('曲线区别');grid on;


set(figure(22),'unit','normalized','position', [0.4,0.3,0.3,0.45]);
hold off;plot(steer_ul,'g','linewidth',2);
hold on;plot(steer_u2,'b') ;
hold on;plot(steering_pwm,'r');
legend('steer_ul','steer_u2','current_control') ;
xlabel('控制周期');ylabel('舵机控制量');


set(figure(23),'unit','normalized','position',[0.6,0.3,0.3,0.45]);
subplot (2,1, 1) ;
hold off;plot(1500-off_center,'b') ;
hold on;plot(steering_pwm,'r');
grid on;
legend('1500-off_center','steering_pwm');
title('舵机控制量与off_center的关系');xlabel( '控制周期');ylabel( '舵机控制量');
subplot (2,1, 2) ;
scatter(off_center,steering_pwm,'r');
title('舵机控制量随off_center相关关系’);xlabel(’off_center');ylabel('舵机控制');



% --- Executes on button press in RECONSTRUCTION.
function RECONSTRUCTION_Callback(hObject, eventdata, handles)
% hObject    handle to RECONSTRUCTION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename_CGSJ;
if handles.DATA_choose.Value
    FileName = filename_CGSJ;
else
   [FileName,~] = uigetfile('*,*','Select the Data file');
end
if ~FileName
    msgbox('未选择文件');
return;

end

if exist(FileName,'file')
    indata = dlmread(FileName,',');
else
    msgbox('本次连接蓝牙后还未收集数据，请先运行小车收集数据');
return;

end

ind = length(indata) ;%获取数据的长度
pulses = 512; %轮胎运行一圈编码器产生512个脉冲
seq_num = indata(:, 3) ;%发送数据时的控制周期编号
step = 40 ;%正常情况是间隔2个控制周期发送一次数据
left_encoder = indata(:, 4); %左轮目标脉冲数
right_encoder = indata(: ,5); %右轮目标脉冲数 
gyro_x = indata(:,18) ; %陀螺仪x
gyxo_y = indata(:,19) ; %陀螺仪y
gyro_z = indata(:, 20) ; %陀螺仪z

%(gyro_z-mean(gyro z))消除零漂% -32768对应-2000度/秒角速度，32768对应2000度/秒角速度，32767/2000=16.4，即陀螺仪灵敏度系数
gyro_z_dps = gyro_z;
mega_x = indata(:,22);%磁力计x，由于磁力计安装方向的原因将x抽和v轴数据对调，并将y轴数据取反
mega_y = -indata(:,21);%磁力计y
mega_z = indata(:, 23);%磁力计z
dist = (left_encoder.*step+right_encoder.*step)./2; %计算每一个发送周期间小车左右轮编码器总的脉冲数

%利用磁力计{方向信息) 和编码器脉冲数{距离信息)推出轨迹坐标点
scale = 0.22/pulses; % m/pulse，车轮周长0.22米，转一圈有512个脉冲
mega_x_max = max(mega_x);
mega_x_min = min(mega_x);
mega_y_max = max(mega_y);
mega_y_min = min(mega_y);
mega_z_max = max(mega_z);
mega_z_min = min(mega_z);

%因为在运动过程中回到了起点，所以肯定绕了360度，因此可以把中值近似当作磁力计零点
offset_x = (mega_x_max+mega_x_min)/2;
offset_y = (mega_y_max+mega_y_min)/2;
origin_x = 0;
origin_y = 0;
origin_x_gyro = 0 ;%这是发车的起点坐标，每辆车发车起点不一样，请自己修改
origin_y_gyro = 0 ;%这是发车的起点坐标，每辆车发车起点不一样，请自己修改
position = []; angle = []; angle_2pi = []; position_gyro = [];
sample_period = 0.01; %10毫秒一个控制周期

for i = 1: ind% 从起点开始，逐个坐标点迭代更新，推出整条轨迹坐标点席列
%根据磁力计值计算角度重构轨迹
angle(i, 1) = atan2(mega_x(i)-offset_x,mega_y(i)-offset_y);
%dist(i,1)*scale 计算出来的是一个数据周期内小车移动的距离，近似认为是直线(因为时间周期很短)
position(i,1) =origin_x+dist(i,1)*scale*cos(angle(i,1));
position(i,2) =origin_y-dist(i,1)*scale*sin(angle(i,1));%移动的直线距离分解到x、y两个方向上
%迭代更新下一个坐标点
origin_x = position(i,1);
origin_y = position(i,2);
if(angle(i,1)<0)
    angle_2pi(i,1) = angle(i,1)+2*pi;
else
    angle_2pi(i,1) = angle(i,1);
end
%陀螺仪积分角度重构轨迹
if (i==1)
    gyro_angle(i,1) = gyro_z_dps(i,1).*step*sample_period;
else
    gyro_angle(i,1) = gyro_angle(i-1,1)+gyro_z_dps(i,1).*step*sample_period;
end
%dist(i,1)*scale 计算出来的是一个数据周期内小车移动的距离，近似认为是直线(因为时间周期很短)
position_gyro(i,1) =origin_x_gyro+dist(i,1)*scale*cos(gyro_angle(i,1)*pi/180);
position_gyro(i,2) =origin_y_gyro-dist(i,1)*scale*sin(gyro_angle(i,1)*pi/180);%移动的直线距离分解到x、y两个方向上
%迭代更新下一个坐标点
origin_x_gyro = position_gyro(i,1);
origin_y_gyro = position_gyro(i,2);
end
section_end = ind;
figure(31);clf; hold off;scatter(position_gyro(1:section_end,1),position_gyro(1:section_end,2));grid on;title('陀螺仪重构轨迹');

% --- Executes on button press in SIGN.
function SIGN_Callback(hObject, eventdata, handles)
% hObject    handle to SIGN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get (hObject,'value')
   set (hObject,'string','STOP') ;
   fprintf (handles.COM_USER,'x') ;
% 落下方向控制按键
   set (handles.forward_left,'enable','off') ;
   set (handles.forward,'enable','off') ;set (handles.forward_right,'enable','off') 
   set (handles.back_left,'enable','off');set (handles.back,'enable','off') ;
   set (handles.back_right,'enable','off');set (handles.button_OPEN,'string','开启');
   set(handles.button_OPEN,'value',0);%弹起该按钮
else
set (hObject,'string','GO') ;
fprintf(handles.COM_USER,'STOP') ;
end

% --- Executes on slider movement.
function slider_servo_P_Callback(hObject, eventdata, handles)
% hObject    handle to slider_servo_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get(hObject,'value')) ;
set(handles.edit_servo_P,'string',a);
data_pr = strcat ('P=',num2str(a)) ;
fprintf(handles.COM_USER, data_pr);


% --- Executes during object creation, after setting all properties.
function slider_servo_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_servo_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_servo_I_Callback(hObject, eventdata, handles)
% hObject    handle to slider_servo_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get (hObject,'value')) ;
set(handles.edit_servo_I,'string',a);
data_pr = strcat ('I=',num2str(a)) ;
fprintf(handles.COM_USER, data_pr);

% --- Executes during object creation, after setting all properties.
function slider_servo_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_servo_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_servo_D_Callback(hObject, eventdata, handles)
% hObject    handle to slider_servo_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get (hObject,'value')) ;
set(handles.edit_servo_D,'string',a);
data_pr = strcat ('D=',num2str(a)) ;
fprintf(handles.COM_USER, data_pr);

% --- Executes during object creation, after setting all properties.
function slider_servo_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_servo_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_motor_P_Callback(hObject, eventdata, handles)
% hObject    handle to slider_motor_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get (hObject,'value')) ;
set(handles.edit_motor_P,'string',a);
data_pr = strcat ('MP=',num2str(a)) ;
fprintf(handles.COM_USER, data_pr);

% --- Executes during object creation, after setting all properties.
function slider_motor_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_motor_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_motor_I_Callback(hObject, eventdata, handles)
% hObject    handle to slider_motor_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
b = round(get (hObject,'value')) ;
set(handles.edit_motor_I,'string',b);
data_pr = strcat ('MI=',num2str(b)) ;
fprintf(handles.COM_USER, data_pr);

% --- Executes during object creation, after setting all properties.
function slider_motor_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_motor_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_motor_D_Callback(hObject, eventdata, handles)
% hObject    handle to slider_motor_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get (hObject,'value')) ;
set(handles.edit_motor_D,'string',a);
data_pr = strcat ('MD=',num2str(a)) ;
fprintf(handles.COM_USER, data_pr);

% --- Executes during object creation, after setting all properties.
function slider_motor_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_motor_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_Speed_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = round(get (hObject,'value')) ;
set(handles.edit_Speed,'string',a);
data_pr = strcat ('SP=',num2str(a)) ;
fprintf(handles.COM_USER, data_pr);

% --- Executes during object creation, after setting all properties.
function slider_Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_servo_P_Callback(hObject, eventdata, handles)
% hObject    handle to edit_servo_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_servo_P as text
%        str2double(get(hObject,'String')) returns contents of edit_servo_P as a double
a= round(str2double(get(hObject,'string')));
if(isnan(a))
    a=0;
    set (hObject,'string', a) ;
    set(handles.slider_servo_P,'value',a);
else
if a<0
   a=0;
end
if a>100
   a = 100;
end
set (hObject,'string', a) ;
set(handles.slider_servo_P,'value', a) ;
end
data_pr = strcat ('P=', num2str(a));
fprintf(handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_servo_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_servo_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sevro_I_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sevro_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sevro_I as text
%        str2double(get(hObject,'String')) returns contents of edit_sevro_I as a double
a= round(str2double(get(hObject,'string')));
if(isnan(a))
    a=0;
    set (hObject,'string', a) ;
    set(handles.slider_servo_I,'value',a);
else
if a<0
   a=0;
end
if a>100
   a = 100;
end
set (hObject,'string', a) ;
set(handles.slider_servo_I,'value', a) ;
end
data_pr = strcat ('I=', num2str(a));
fprintf (handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_sevro_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sevro_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sevro_D_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sevro_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sevro_D as text
%        str2double(get(hObject,'String')) returns contents of edit_sevro_D as a double
a= round(str2double(get(hObject,'string')));
if(isnan(a))
    a=0;
    set (hObject,'string', a) ;
    set(handles.slider_servo_D,'value',a);
else
if a<0
   a=0;
end
if a>100
   a = 100;
end
set (hObject,'string', a) ;
set(handles.slider_servo_D,'value', a) ;
end
data_pr = strcat ('D=', num2str(a));
fprintf (handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_sevro_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sevro_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_motor_P_Callback(hObject, eventdata, handles)
% hObject    handle to edit_motor_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_motor_P as text
%        str2double(get(hObject,'String')) returns contents of edit_motor_P as a double

a= round(str2double(get(hObject,'string')));
if(isnan(a))
    a=0;
    set (hObject,'string', a) ;
    set(handles.slider_motor_P,'value',a);
else
if a<0
   a=0;
end
if a>100
   a = 100;
end
set (hObject,'string', a) ;
set(handles.slider_motor_P,'value', a) ;
end
data_pr = strcat ('MP=', num2str(a));
fprintf (handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_motor_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_motor_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_motor_I_Callback(hObject, eventdata, handles)
% hObject    handle to edit_motor_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_motor_I as text
%        str2double(get(hObject,'String')) returns contents of edit_motor_I as a double
b= round(str2double(get(hObject,'string')));
if(isnan(b))
    b=0;
    set (hObject,'string', b) ;
    set(handles.slider_motor_I,'value',b);
else
if b<0
   b=0;
end
if b>100
   b = 100;
end
set (hObject,'string', b) ;
set(handles.slider_motor_I,'value', b) ;
end
data_pr = strcat ('MP=', num2str(b));
fprintf (handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_motor_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_motor_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_motor_D_Callback(hObject, eventdata, handles)
% hObject    handle to edit_motor_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_motor_D as text
%        str2double(get(hObject,'String')) returns contents of edit_motor_D as a double
a= round(str2double(get(hObject,'string')));
if(isnan(a))
    a=0;
    set (hObject,'string', a) ;
    set(handles.slider_motor_D,'value',a);
else
if a<0
   a=0;
end
if a>100
   a = 100;
end
set (hObject,'string', a) ;
set(handles.slider_motor_D,'value', a) ;
end
data_pr = strcat ('MD=', num2str(a));
fprintf (handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_motor_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_motor_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Speed_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Speed as text
%        str2double(get(hObject,'String')) returns contents of edit_Speed as a double
a= round(str2double(get(hObject,'string')));
if(isnan(a))
    a=0;
    set (hObject,'string', a) ;
    set(handles.slider_Speed,'value',a);
else
if a<0
   a=0;
end
if a>100
   a = 100;
end
set (hObject,'string', a) ;
set(handles.slider_Speed,'value', a) ;
end
data_pr = strcat ('SP=', num2str(a));
fprintf (handles.COM_USER, data_pr) ;

% --- Executes during object creation, after setting all properties.
function edit_Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Servo_P_Callback(hObject, eventdata, handles)
% hObject    handle to show_Servo_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Servo_P as text
%        str2double(get(hObject,'String')) returns contents of show_Servo_P as a double


% --- Executes during object creation, after setting all properties.
function show_Servo_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Servo_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Servo_I_Callback(hObject, eventdata, handles)
% hObject    handle to show_Servo_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Servo_I as text
%        str2double(get(hObject,'String')) returns contents of show_Servo_I as a double


% --- Executes during object creation, after setting all properties.
function show_Servo_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Servo_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Servo_D_Callback(hObject, eventdata, handles)
% hObject    handle to show_Servo_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Servo_D as text
%        str2double(get(hObject,'String')) returns contents of show_Servo_D as a double


% --- Executes during object creation, after setting all properties.
function show_Servo_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Servo_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Motor_P_Callback(hObject, eventdata, handles)
% hObject    handle to show_Motor_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Motor_P as text
%        str2double(get(hObject,'String')) returns contents of show_Motor_P as a double


% --- Executes during object creation, after setting all properties.
function show_Motor_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Motor_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Motor_I_Callback(hObject, eventdata, handles)
% hObject    handle to show_Motor_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Motor_I as text
%        str2double(get(hObject,'String')) returns contents of show_Motor_I as a double


% --- Executes during object creation, after setting all properties.
function show_Motor_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Motor_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Motor_D_Callback(hObject, eventdata, handles)
% hObject    handle to show_Motor_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Motor_D as text
%        str2double(get(hObject,'String')) returns contents of show_Motor_D as a double


% --- Executes during object creation, after setting all properties.
function show_Motor_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Motor_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function show_Speed_Callback(hObject, eventdata, handles)
% hObject    handle to show_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of show_Speed as text
%        str2double(get(hObject,'String')) returns contents of show_Speed as a double


% --- Executes during object creation, after setting all properties.
function show_Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in BAUD.
function BAUD_Callback(hObject, eventdata, handles)
% hObject    handle to BAUD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns BAUD contents as cell array
%        contents{get(hObject,'Value')} returns selected item from BAUD


% --- Executes during object creation, after setting all properties.
function BAUD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BAUD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
a = { 4800 9600 38400 115200};
set(hObject,'string',a);
set(hObject,'value',4);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DATABIT.
function DATABIT_Callback(hObject, eventdata, handles)
% hObject    handle to DATABIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DATABIT contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DATABIT


% --- Executes during object creation, after setting all properties.
function DATABIT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DATABIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
a = [ 8 16 ];
set(hObject,'string',a);
set(hObject,'value',1);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in STOPBIT.
function STOPBIT_Callback(hObject, eventdata, handles)
% hObject    handle to STOPBIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns STOPBIT contents as cell array
%        contents{get(hObject,'Value')} returns selected item from STOPBIT


% --- Executes during object creation, after setting all properties.
function STOPBIT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STOPBIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
a = [ 1 2 ];
set(hObject,'string',a);
set(hObject,'value',1);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CHECKBIT.
function CHECKBIT_Callback(hObject, eventdata, handles)
% hObject    handle to CHECKBIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CHECKBIT contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CHECKBIT


% --- Executes during object creation, after setting all properties.
function CHECKBIT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CHECKBIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
a='none';
set(hObject,'string',a);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in openserial.
function openserial_Callback(hObject, eventdata, handles)
% hObject    handle to openserial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global XData Xlim;
global Encoder_Left Encoder_Right;
global Motor_A Motor_B Motor_A_Target Motor_B_Target;
global Steer Off_Center;
global Sensor_Left Sensor_Middle Sensor_Right;
global ACC_X ACC_Y ACC_Z;
global GYRO_X GYRO_Y GYRO_Z;
global MEG_X MEG_Y MEG_Z;



global filename_CGSJ filename_HCSJ;

XData=0; Xlim=0;
Encoder_Left=0; Encoder_Right=0;
Motor_A=0; Motor_B=0; Motor_A_Target=0; Motor_B_Target=0; Off_Center=0; Steer=0;
Sensor_Left=0; Sensor_Middle=0;Sensor_Right=0;
ACC_X=0; ACC_Y=0; ACC_Z=0;
GYRO_X=0; GYRO_Y=0; GYRO_Z=0;
MEG_X=0; MEG_Y=0;MEG_Z=0;

if get(hObject,'value')    
%获取当前选择的串口
Port_buff = get (handles.PORT,'string');
Port_num = get  (handles.PORT,'value');
Port = Port_buff{Port_num};

%获取当前选择的波特率
Baud_buff = get(handles.BAUD,'string');
Baud_num = get (handles.BAUD,'value');
Baud = str2double(Baud_buff {Baud_num});
%Baud = str2num (Baud buff fBaud num)) 

set(handles.PORT,'enable','off');
set (handles.BAUD,'enable','off');
pause(0.1);

% 设置串口属性
COM_USER=serial(Port,'parity','none','databits',8,'stopbits',1,'terminator','<');
COM_USER.BaudRate = Baud;
COM_USER.InputBufferSize = 1024;
COM_USER.OutputBufferSize = 1024;
COM_USER.BytesAvailableFcn = {@my_callback, handles};

%打开串口
try
fopen(COM_USER);
msgbox('串口打开成功!' );
catch                         
    msgbox('串口不可获得!' );  %若串口打开失败，提示“串口不可获得!
    set (hObject,'value', 0) ;%弹起本按钮
    set (handles.PORT,'enable','on') 
    set (handles.BAUD,'enable','on') 
    return;
end

handles.COM_USER = COM_USER;
guidata(hObject,handles);% 将串口对象的句柄保存
set(hObject,'string','关闭串口');
else  
COM_USER = handles.COM_USER;
fclose(COM_USER);
delete(COM_USER);
set(hObject,'string','打开串口');
set(handles.openserial,'enable','on');
msgbox('串口关闭成功!' );
end

%按照打开时间创建文本文件名称
timename = datestr(now, 30);
filename_CGSJ = strcat(timename,'_CGSJ.txt');
filename_HCSJ = strcat(timename,'_HCSJ.txt');

%断开蓝牙时，如有连接服务将服务断掉
if handles.CONNECT.Value
Client_USER = handles.Client_USER;
fclose(Client_USER);
delete(Client_USER);
set(handles.CONNECT,'string','连接');
set (handles.CONNECT,'value',0);
set(handles.tcpip_ip,'enable','on');
set(handles.tcpip_port,'enable','on') ;
end




% --- Executes on selection change in PORT.
function PORT_Callback(hObject, eventdata, handles)
% hObject    handle to PORT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PORT contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PORT


% --- Executes during object creation, after setting all properties.
function PORT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PORT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
command='wmic path win32_pnpentity get caption /format:list | find "COM"';
[~,cmdout]=system(command);
strs= {'COM4','COM3','COM5','COM10'};
out = textscan(cmdout,'%s','delimiter',')');
a=out{:};
b=strfind(a,'(COM)');
c={};
k=1;
for i=1:length(b)
    if ~isempty(b{i})
        c{k,1}=a{i};
        k=k+1;
    end
end
d=extractAfter(c,'(');
set(hObject,'string',d);
set(hObject,'value', length(strs), 'string', strs);

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function openserial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to openserial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function tcpip_ip_Callback(hObject, eventdata, handles)
% hObject    handle to tcpip_ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tcpip_ip as text
%        str2double(get(hObject,'String')) returns contents of tcpip_ip as a double


% --- Executes during object creation, after setting all properties.
function tcpip_ip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tcpip_ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tcpip_port_Callback(hObject, eventdata, handles)
% hObject    handle to tcpip_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tcpip_port as text
%        str2double(get(hObject,'String')) returns contents of tcpip_port as a double


% --- Executes during object creation, after setting all properties.
function tcpip_port_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tcpip_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CONNECT.
function CONNECT_Callback(hObject, eventdata, handles)
% hObject    handle to CONNECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if  get(hObject,'value') 
    tcpip_ip_addr = get (handles.tcpip_ip,'string');% 获取当前输入的地址
    tcpip_ip_port = str2double(get(handles.tcpip_port,'string'));% 获取当前输入的端口
    set(handles.tcpip_ip,'enable','off');
    set(handles.tcpip_port,'enable','off') ;
% 配置客户端属性
Client_USER=tcpip(tcpip_ip_addr,tcpip_ip_port,'terminator','<','BytesAvailableFcn', {@GetMessage,handles},'NetworkRole','client');
Client_USER.OutputBufferSize=800*300;
Client_USER.InputBufferSize=800*300;
try
fopen(Client_USER); %与一个服务器建立连接，直到建立完成返回，否则报错。
catch % 若打开失败，提示“连接服务器失败!”
msgbox( '连接服务器失败!');
set(hObject,'value',0); %弹起本按钮
set (handles.tcpip_ip,'enable','on');
set (handles.tcpip_port,'enable','on');
delete(Client_USER); 
return;
end

handles.Client_USER = Client_USER;
guidata(hObject,handles);% 将客户端对象的句柄保存
set(hObject,'string','断开');
else  
Client_USER = handles.Client_USER;
fclose(Client_USER);
delete(Client_USER);
set(hObject,'string','连接');
set(handles.tcpip_ip,'enable','on');
set (handles.tcpip_port,'enable','on') ;
end



% --- Executes on button press in CREATE.
function CREATE_Callback(hObject, eventdata, handles)
% hObject    handle to CREATE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename_CGSJ filename_HCSJ
BUTTON=questdlg('是否以当前时间为名，新建文件保存数据?','新建文件','Yes','No','Yes');
if strcmp(BUTTON,'Yes')
timename = datestr(now, 30);
filename_CGSJ = strcat(timename,'CGsJ.txt');
filename_HCSJ = strcat(timename,'HCsJ.txt');
end

% --- Executes on button press in DATA_choose.
function DATA_choose_Callback(hObject, eventdata, handles)
% hObject    handle to DATA_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DATA_choose
if (~handles.openserial.Value)%判断串口是否连接
    if (~handles.DATA_choose.Value)% 弹起功能选择按键
    set (handles.MOTOR_RESPONSE,'enable','on');
    set (handles.STEER_RESPONSE,'enable','on');
    set(handles.RECONSTRUCTION,'enable','on');
else
% 落下功能选择按键
set (handles.MOTOR_RESPONSE,'enable','off') ;
set (handles.STEER_RESPONSE,'enable','off') ;
set (handles.RECONSTRUCTION,'enable','off');
    end
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24



function edit_RunNum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RunNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RunNum as text
%        str2double(get(hObject,'String')) returns contents of edit_RunNum as a double


% --- Executes during object creation, after setting all properties.
function edit_RunNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RunNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox25



function edit_Sequence_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Sequence as text
%        str2double(get(hObject,'String')) returns contents of edit_Sequence as a double


% --- Executes during object creation, after setting all properties.
function edit_Sequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26



function edit_Reservation1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Reservation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Reservation1 as text
%        str2double(get(hObject,'String')) returns contents of edit_Reservation1 as a double


% --- Executes during object creation, after setting all properties.
function edit_Reservation1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Reservation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27



function edit_Reservation2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Reservation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Reservation2 as text
%        str2double(get(hObject,'String')) returns contents of edit_Reservation2 as a double


% --- Executes during object creation, after setting all properties.
function edit_Reservation2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Reservation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
