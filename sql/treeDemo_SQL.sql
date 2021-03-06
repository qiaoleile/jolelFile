CREATE SEQUENCE SEQ_QUSERS_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

create table Q_MENU  (
   ID                   VARCHAR2(50)                    not null,
   PID                  VARCHAR2(50),
   TEXT                 VARCHAR2(100),
   URL                  VARCHAR2(100),
   constraint PK_Q_MENU primary key (ID)
);

comment on table Q_MENU is
'菜单表';

comment on column Q_MENU.PID is
'父级ID';

comment on column Q_MENU.TEXT is
'内容';

comment on column Q_MENU.URL is
'对应地址';

create table Q_USERS  (
   ID                   NUMBER                          not null,
   LNAME                VARCHAR2(50),
   LPASS                VARCHAR2(32),
   RNAME                VARCHAR2(50),   
   constraint PK_Q_USERS primary key (ID)
);

comment on table Q_USERS is
'用户表也叫职员表';

comment on column Q_USERS.LNAME is
'登录名';

comment on column Q_USERS.LPASS is
'密码，MD5加密';

comment on column Q_USERS.RNAME is
'真实姓名';



--添加用户测试数据
INSERT INTO Q_USERS(ID,LNAME,LPASS,RNAME)
VALUES(SEQ_QUSERS_ID.nextval,
'admin',
'21232f297a57a5a743894a0e4a801fc3',
'超级管理员');
COMMIT;

INSERT INTO Q_USERS(ID,LNAME,LPASS,RNAME)
VALUES(SEQ_QUSERS_ID.nextval,'roy',
'd4c285227493531d0577140a1ed03964',
'郝敏一');
COMMIT;

INSERT INTO Q_USERS(ID,LNAME,LPASS,RNAME)
VALUES(SEQ_QUSERS_ID.nextval,'lily',
'89f288757f4d0693c99b007855fc075e','花花');
COMMIT;

--添加菜单测试数据

--根目录
INSERT into Q_MENU
VALUES('L1',null,'企业车辆管理系统',null);
COMMIT;

--一级菜单
INSERT INTO Q_MENU
VALUES('L101','L1','日常处理',null);
INSERT into Q_MENU
VALUES('L102','L1','车辆状态',null);
INSERT INTO Q_MENU
VALUES('L103','L1','到期提醒',null);
INSERT into Q_MENU
VALUES('L104','L1','报表中心',null);
INSERT into Q_MENU
VALUES('L105','L1','基础设置',null);
INSERT into Q_MENU
VALUES('L106','L1','系统设置',null);
COMMIT;

--二级菜单
INSERT INTO Q_MENU
VALUES('L10101','L101','出车记录','DailyHandle/CarOut_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10102','L101','加油记录','DailyHandle/Gas_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10103','L101','维修记录','DailyHandle/Repair_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10104','L101','规费记录','DailyHandle/Fees_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10105','L101','保养记录','DailyHandle/Maintain_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10106','L101','违章记录','DailyHandle/Peccancy_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10107','L101','事故记录','DailyHandle/Accident_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10108','L101','年检记录','DailyHandle/Inspection_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10109','L101','保险记录','DailyHandle/Insurance_Record.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10201','L102','车辆状态','CarState/CarState.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10301','L103','到期提醒','ExpirationReminder/Reminder.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10401','L104','车辆费用对比','Report/Report_1.jsp');
INSERT INTO Q_MENU
VALUES('L10402','L104','车辆费用分布','Report/Report_2.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10501','L105','系统字典','BasicSet/Sys_Dictionary.jsp');
INSERT INTO Q_MENU
VALUES('L10502','L105','驾驶员档案','BasicSet/Driver_INFO.jsp');
INSERT INTO Q_MENU
VALUES('L10503','L105','往来单位','BasicSet/Current_Unit.jsp');
INSERT INTO Q_MENU
VALUES('L10504','L105','车辆档案','BasicSet/Vehicle_File.jsp');
/*INSERT INTO Q_MENU
VALUES('L10505','L105','职员信息','BasicSet/Employees_INFO.jsp');*/
COMMIT;

INSERT INTO Q_MENU
VALUES('L10601','L106','角色管理','SysSet/Role_Management.jsp');
INSERT INTO Q_MENU
VALUES('L10602','L106','用户管理','SysSet/User_Management.jsp');
INSERT INTO Q_MENU
VALUES('L10603','L106','修改密码','SysSet/Modify_Password.jsp');
COMMIT;