function choose_data(~,~,handles)
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