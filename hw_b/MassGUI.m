function varargout = MassGUI(varargin)
% MASSGUI MATLAB code for MassGUI.fig
%      MASSGUI, by itself, creates a new MASSGUI or raises the existing
%      singleton*.
%
%      H = MASSGUI returns the handle to a new MASSGUI or the handle to
%      the existing singleton*.
%
%      MASSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MASSGUI.M with the given input arguments.
%
%      MASSGUI('Property','Value',...) creates a new MASSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MassGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MassGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MassGUI

% Last Modified by GUIDE v2.5 25-Sep-2017 18:55:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MassGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MassGUI_OutputFcn, ...
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


% --- Executes just before MassGUI is made visible.
function MassGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MassGUI (see VARARGIN)

% Choose default command line output for MassGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MassGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MassGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function force_slider_Callback(hObject, eventdata, handles)
% hObject    handle to force_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function force_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to force_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
