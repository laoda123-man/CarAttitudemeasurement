
function GetMessage(obj,~,handles)
handles = guidata(handles.figure1);%����handles����
COM_USER = handles.COM_USER;
outdata = strtrim(fscanf (obj));%ȥ�����ַ���������ַ�������ɾ��ǰ����β��հ�
indata = strrep(outdata,'<','');%ȥ��<������
fprintf(COM_USER,indata);%����ת�������Զ���ӽ�����