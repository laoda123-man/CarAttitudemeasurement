
function GetMessage(obj,~,handles)
handles = guidata(handles.figure1);%更新handles数据
COM_USER = handles.COM_USER;
outdata = strtrim(fscanf (obj));%去掉从字符串数组或字符数组中删除前导和尾随空白
indata = strrep(outdata,'<','');%去掉<’符号
fprintf(COM_USER,indata);%数据转发，会自动添加结束符