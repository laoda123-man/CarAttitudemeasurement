function my_callback(obj,~,handles)

global XData Xlim;
global Encoder_Left Encoder_Right;
global Motor_A Motor_B Motor_A_Target Motor_B_Target;
global Steer Off_Center;
global Sensor_Left Sensor_Middle Sensor_Right;
global ACC_X ACC_Y ACC_Z;
global GYRO_X GYRO_Y GYRO_Z;
global MEG_X MEG_Y MEG_Z;
global Reservation1 Reservation2;


global filename_CGSJ filename_HCSJ;

XData=0; Xlim=0;
Encoder_Left=0; Encoder_Right=0;
Motor_A=0; Motor_B=0; Motor_A_Target=0; Motor_B_Target=0; Off_Center=0; Steer=0;
Sensor_Left=0; Sensor_Middle=0;Sensor_Right=0;
ACC_X=0; ACC_Y=0; ACC_Z=0;
GYRO_X=0; GYRO_Y=0; GYRO_Z=0;
MEG_X=0; MEG_Y=0;MEG_Z=0;
Reservation1=0; Reservation2=0;

indata = strtrim(fscanf (obj));%去掉从字符串数组或字符数组中删除前导和尾随空白
indata = strrep(indata,'<','');%去掉“<’符号
databuff = strsplit(indata,'*');%字符串分割
datasign = databuff {1};
dataneed = databuff {2};

%常规数据处理
if strcmp(datasign,'CGSJ')
    file_CGSJ = fopen(filename_CGSJ,'a');
    fprintf(file_CGSJ,'%s\n', dataneed) ;
    fclose(file_CGSJ);
end
%数据转发到云端
if handles.CONNECT.Value
Client_USER = handles.Client_USER;
fprintf(Client_USER, dataneed) ;
end

%定义存储数据的数组
Xlim = Xlim+1;
XData =[XData Xlim];

Ydata = str2num(dataneed);

Encoder_Left = [Encoder_Left Ydata(:,4)];Encoder_Right = [Encoder_Right Ydata(:,5)];
Motor_A = [Motor_A Ydata(:,6)];Motor_B = [Motor_B Ydata(:,7)];
Motor_A_Target = [Motor_A_Target Ydata(:,8)];Motor_B_Target = [Motor_B_Target Ydata(:,9)];
Steer = [Steer Ydata(:,10)];
Off_Center = [Off_Center Ydata(:,11)];
Sensor_Left = [Sensor_Left Ydata(:,12)];Sensor_Middle = [Sensor_Middle Ydata(:,13)];Sensor_Right = [Sensor_Right Ydata(:,14)];
ACC_X = [ACC_X Ydata(:,15)];ACC_Y = [ACC_Y Ydata(:,16)];ACC_Z = [ACC_Z Ydata(:,17)];
GYRO_X = [GYRO_X Ydata(:,18)]; GYRO_Y = [GYRO_Y Ydata(:,19)];GYRO_Z = [GYRO_Z Ydata(:,20)];
MEG_X = [MEG_X Ydata(:,21)];MEG_Y = [MEG_Y Ydata(:,22)];MEG_Z = [MEG_Z Ydata(:,23)];
Reservation1= [Reservation1 Ydata(:,31)]; Reservation2=[Reservation2 Ydata(:,32)];

%数组长度一日超过500就丢弃第1列的值
if (length(XData)) > 500
    XData = XData(:,2:end) ;
    Encoder_Left = Encoder_Left(:,2:end);Encoder_Right = Encoder_Right(:,2:end);
    Motor_A = Motor_A(:,2:end); Motor_B = Motor_B(:,2:end);
    Motor_A_Target = Motor_A_Target(:,2:end);Motor_B_Target = Motor_B_Target(:,2:end);
    Steer = Steer(:,2:end); Off_Center =Off_Center(:,2:end);
    Sensor_Left = Sensor_Left(:,2:end); Sensor_Middle = Sensor_Middle(:,2:end);Sensor_Right = Sensor_Right(:,2:end);
    ACC_X = ACC_X(:,2:end); ACC_Y = ACC_Y(:,2: end); ACC_Z = ACC_Z(:,2:end) ;
    GYRO_X = GYRO_X(:,2:end);GYRO_Y = GYRO_Y(:,2:end) ;GYRO_Z = GYRO_Z(:,2:end); 
    MEG_X = MEG_X(:,2:end) ; MEG_Y = MEG_Y(:,2:end) ; MEG_Z = MEG_Z(:,2:end) ;
    Reservation1= Reservation1(:,2:end) ; Reservation2= Reservation2(:,2:end) ;
end

%勾选复选框，在表格内显示数据
if ~handles.PAUSE.Value
if handles.checkbox_leftEncoder.Value
plot(handles.axes,XData,Encoder_Left/100,'Color','[0.5 0 0]','MarkerSize',5);
end
if handles.checkbox_rightEncoder.Value
plot(handles.axes,XData,Encoder_Right/100,'Color','[1 0.5 0]','MarkerSize',5);
end
if handles.checkbox_leftMotorControl.Value
plot(handles.axes,XData,Motor_A/3600,'Color', [0.2000 0.4000 1.00001],'MarkerSize',5);
end
if handles.checkbox_rightMotorControl.Value
plot(handles.axes,XData,Motor_B/3600,'Color',[1.0000 0.1020 0.3020],'MarkerSize',5);
end
if handles.checkbox_leftMotorTarget.Value
plot(handles.axes,XData,Motor_A_Target/100,'Color',[0.5000 0.4000 1.00001],'llarkerSize',5);
end
if handles.checkbox_rightMotorTarget.Value
plot(handles.axes,XData,Motor_B_Target/100,'Color',[1.0000 0.1020 0.60201],'MarkerSize',5);
end
if handles.checkbox_offCenter.Value
plot(handles.axes,XData,Off_Center/400,'c','MarkerSize',5);%0ff Center最大值不确定
end
if handles.checkbox_steerControl.Value
plot(handles.axes,XData,(Steer-1500)/400,'m','MarkerSize',5);
end
if handles.checkbox_leftSensor.Value
plot(handles.axes,XData,Sensor_Left/3600,'r','MarkerSize',5);
end
if handles.checkbox_middleSensor.Value
plot(handles.axes,XData,Sensor_Middle/3600,'g','MarkerSize',5);
end
if handles.checkbox_rightSensor.Value
plot (handles.axes,XData,Sensor_Right/3600,'b','MarkerSize',5);
end
if handles.checkbox_accX.Value
plot(handles.axes,XData,ACC_X/16384,'r','MarkerSize',5);
end
if handles.checkbox_accY.Value
    plot (handles.axes,XData,ACC_Y/16384,'g','MarkerSize',5);
end
if handles.checkbox_accz.Value
plot(handles.axes,XData,ACC_Z/16384,'b','MarkerSize',5);
end
if handles.checkbox_gyrox.Value
plot (handles.axes,XData,GYRO_X/16384,'r','MarkerSize',5);
end
if handles.checkbox_gyroY.Value
plot(handles.axes,XData,GYRO_Y/16384,'g','MarkerSize',5);
end
if handles.checkbox_gyroz.Value
plot(handles.axes,XData,GYRO_Z/16384,'b','MarkerSize',5);
end
if handles.checkbox_megx.Value
plot(handles.axes,XData,MEG_X/16384,'r','MarkerSize',5)
end
if handles.checkbox_megY.Value
plot(handles.axes, XData, MEG_Y/16384,'g','MarkerSize',5);
end
if handles.checkbox_megZ.Value
plot(handles.axes, XData, MEG_Z/16384,'g','MarkerSize',5);
end
end

%显示数据
if ~handles.PAUSE.Value
set (handles.text_CarNum,'string',num2str(Ydata(1))) ;
set (handles.edit_RunNum,'string',num2str(Ydata(2))) ;
set (handles.edit_Sequence,'string',num2str(Ydata(3))) ;
set (handles.edit_leftEncoder,'string',num2str(Ydata(4))) ;
set (handles.edit_rightEncoder,'string',num2str(Ydata(5)));
set (handles.edit_leftMotorControl,'string',num2str(Ydata(6)));
set (handles.edit_rightMotorControl,'string',num2str(Ydata(7)));
set (handles.edit_leftMotorTarget,'string',num2str(Ydata(8)));
set (handles.edit_rightMotorTarget,'string',num2str(Ydata(9)));
set (handles.edit_steerControl,'string',num2str(Ydata(10)));
set (handles.edit_offCenter,'string',num2str(Ydata(11))) ;
set (handles.edit_leftSensor,'string',num2str(Ydata(12)));
set (handles.edit_middleSensor,'string',num2str(Ydata(13)));
set (handles.edit_rightSensor,'string',num2str(Ydata(14)));
set (handles.edit_accX,'string',num2str(Ydata(15))) ;
set (handles.edit_accY,'string',num2str(Ydata(16))) ;
set (handles.edit_accZ,'string',num2str(Ydata(17))) ;
set (handles.edit_gyrox,'string',num2str(Ydata(18)));
set (handles.edit_gyroY,'string',num2str(Ydata(19))) ;
set (handles.edit_gyroz,'string',num2str(Ydata(20)));
set (handles.edit_megx,'string',num2str(Ydata(21)));
set (handles.edit_megY,'string',num2str(Ydata(22)));
set (handles.edit_megz,'string',num2str(Ydata(23)));
set (handles.show_Servo_P,'string',num2str(Ydata(24)));
set (handles.show_Servo_I,'string',num2str(Ydata(25)));
set (handles.show_Servo_D,'string',num2str(Ydata(26)));
set (handles.show_Motor_P,'string',num2str(Ydata(27)));
set (handles.show_Motor_I,'string',num2str(Ydata(28)));
set (handles.show_Motor_D,'string',num2str(Ydata(29)));
set (handles.show_Speed,'string',num2str(Ydata(30)));
set (handles.edit_Reservation1,'string',num2str(Ydata(31)));
set (handles.edit_Reservation2,'string',num2str(Ydata(32)));
end

%回传数据处理
if strcmp(datasign,'HCSJ')
    file_HCSJ = fopen(filename_HCSJ,'a');
    fprintf(file_HCSJ,'%s n', dataneed);
    fclose(file_HCSJ);
end
%状态数据处理
if strcmp(datasign,'ZTSJ')
    file_HCSJ = fopen(filename_HCSJ,'a');
    fprintf(file_HCSJ,'%s\n', dataneed);
    fclose(file_HCSJ);
end