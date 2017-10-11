function varargout = msd_gui(varargin)
% MSD_GUI MATLAB code for msd_gui.fig
%      MSD_GUI, by itself, creates a new MSD_GUI or raises the existing
%      singleton*.
%
%      H = MSD_GUI returns the handle to a new MSD_GUI or the handle to
%      the existing singleton*.
%
%      MSD_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MSD_GUI.M with the given input arguments.
%
%      MSD_GUI('Property','Value',...) creates a new MSD_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before msd_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to msd_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help msd_gui

% Last Modified by GUIDE v2.5 11-Oct-2017 17:48:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @msd_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @msd_gui_OutputFcn, ...
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


% --- Executes just before msd_gui is made visible.
function msd_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to msd_gui (see VARARGIN)

% Choose default command line output for msd_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes msd_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = msd_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function z_ref_slider_Callback(hObject, eventdata, handles)
% hObject    handle to z_ref_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function z_ref_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_ref_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
