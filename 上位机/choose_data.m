function choose_data(~,~,handles)
global filename_CGSJ;
if handles.DATA_choose.Value
    FileName = filename_CGSJ;
else
   [FileName,~] = uigetfile('*,*','Select the Data file');
end
if ~FileName
    msgbox('δѡ���ļ�');
return;

end

if exist(FileName,'file')
    indata = dlmread(FileName,',');
else
    msgbox('��������������δ�ռ����ݣ���������С���ռ�����');
return;
end