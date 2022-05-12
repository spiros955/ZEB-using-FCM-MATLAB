%%
%������ ������� 

%������������� ������� ��������� ��������� ��������� 
%�� �� ����� ����������� ������ ��������� �������.


close all;
clear all;
clc;

%%
%��������� ��������

%������� A,B,C,D

A=[0 0 0 0 0 0 0 0 ;0 0 0 0 0 0 0 0 ;
   0 0 0 0 0 -0.3 0.3 0;0 0 0 0 0 0 0 -0.2;
   0 0 0 -0.5 0 0 0 0 ;0 0 0 0 0 0 -0.2 0 ;
   0 0 0 0 0 0 0 0;0 0 0 0 -0.3 0.01 -0.01 0];
   
B=[0 0.95 0 0 0 ;0 0 0.85 0 0 ;
    0 0 0 0 0 ;0 0 0 -0.05 0
    0 0 0 0 0 ;0 0.6 0 0 0 
    0 -0.2 0 0 0 ;0 0 0 0 0 ];
    
C=[0.8 0.2 0 0 0 0 0 0 ;0 0 0.1 0.15 0 0 0 0 ];
 
D=[0 0 0 0 0.2;0.3 0 0 0 0.05];

du=[0.9;0.2;0.6;0.1;0.8];





%������������

tmp=size(C);
NOuts=tmp(1);   %������� ������
Nstates=length(A); %������� �����������


x=zeros(Nstates,1);
dx=zeros(Nstates,1);

y=zeros(NOuts,1);
dy=zeros(NOuts,1);


%��  ������� SumWofState,SumWofExits  ������������� �� ���������� ��� �����
%��� ��������� ��� ���������� ����� ������� ����������� ��� ������
%����������.

SumWofState=[0.95 0.85 0.6 0.25 0.5 0.8 0.2 0.32];
SumWofExits=[1.2,0.6];


%����� ��������� ��� du=[0.9;0.2;0.6;0.1;0.8](� du=[0.6;0.8;0.5;0.8;0.8]-������� �) .�� ����� ���������� ��� ���
%��������


dxnew=A*dx +B*du;
dynew=C*dx+D*du;

dxtmp=dxnew;
dytmp=dynew;

for i=1:Nstates
    dxtmp(i)=dxnew(i)/SumWofState(i);
end

for i=NOuts
    dytmp(i)=dynew(i)/SumWofExits(i);
end

xnew=x+dxtmp;
ynew=y+dytmp;

x=xnew;
y=ynew;

dx=dxnew;
dy=dynew;


%�������� ��� ������.
%���� ������� ����������� � ������� ��� states �� ����� < 0.001 
%������ ��� ���������� �����������.


du=[0;0;0;0;0];

counter=0;
check=1;

while check
    counter=counter+1; %������ �����������
    %sprintf('\������� ���������� = %3.1d dB',counter);
    dxnew=A*dx+B*du;
    dynew=C*dx+D*du;
    
     dxtmp=dxnew;
     dytmp=dynew;
    
    for i=1:Nstates
         dxtmp(i)=dxnew(i)/SumWofState(i);
    end
    
    for i=NOuts
        dytmp(i)=dynew(i)/SumWofExits(i);
    end
    
    xnew=x+dxtmp;
    ynew=y+dytmp;
    
    check=0;
    
    for i=1:Nstates
        if abs(dxtmp(i))>= 0.001 
            %�� ���� ��� ���� ������ ���������� ���� ���������� >= 0.001
            %���� �� check ������� 1 ��� � while ���������������.
            check=1;
            break;
        end
    end
    
    x=xnew;
    y=ynew;
    
    dx=dxnew;
    dy=dynew;
end

%

%

%


%%




 %����������� ��������
              
              
close all;
clear all;
clc;


A=[0 0 0 0 0 0 0 0 ;0 0 0 0 0 0 0 0 ;
   0 0 0 0 0 -0.6 0.5 0;0 0 0 0 0 0 0 0.4;
   0 0 0 -0.5 0 0 0 0 ;0 0 0 0 0 0 -0.4 0 ;
   0 0 0 0 0 0 0 0;0 0 0 0 -0.1 0.07 -0.05 0];

B=[0 0.98 0 0 0 ;0 0 0.8 0 0 ;
    0 0 0 0 0 ;0 0 0 0.05 0
    0 0 0 0 0 ;0 0.8 0 0 0 
    0 -0.2 0 0 0 ;0 0 0 0 0 ];

C=[0.95 0.15 0 0 0 0 0 0 ;0 0 0.05 0.3 0 0 0 0 ];


D=[0 0 0 0 0.3;0.3 0 0 0 0.1];

du=[0.9;0.8;0.5;0.8;0.8];


%������������

tmp=size(C);
NOuts=tmp(1);   %������� ������
Nstates=length(A); %������� �����������


x=zeros(Nstates,1);
dx=zeros(Nstates,1);

y=zeros(NOuts,1);
dy=zeros(NOuts,1);


%��  ������� SumWofState,SumWofExits  ������������� �� ���������� ��� �����
%��� ��������� ��� ���������� ����� ������� ����������� ��� ������
%����������.

SumWofState=[0.95 0.85 0.6 0.25 0.5 0.8 0.2 0.32];
SumWofExits=[1.2,0.6];


%����� ��������� ��� du=[0.9;0.2;0.6;0.1;0.8](� du=[0.6;0.8;0.5;0.8;0.8]-������� �) .�� ����� ���������� ��� ���
%��������


dxnew=A*dx +B*du;
dynew=C*dx+D*du;

dxtmp=dxnew;
dytmp=dynew;

for i=1:Nstates
    dxtmp(i)=dxnew(i)/SumWofState(i);
end

for i=NOuts
    dytmp(i)=dynew(i)/SumWofExits(i);
end

xnew=x+dxtmp;
ynew=y+dytmp;

x=xnew;
y=ynew;

dx=dxnew;
dy=dynew;


%�������� ��� ������.
%���� ������� ����������� � ������� ��� states �� ����� < 0.001 
%������ ��� ���������� �����������.


du=[0;0;0;0;0];

counter=0;
check=1;

while check
    counter=counter+1; %������ �����������
    %sprintf('\������� ���������� = %3.1d dB',counter);
    dxnew=A*dx+B*du;
    dynew=C*dx+D*du;
    
     dxtmp=dxnew;
     dytmp=dynew;
    
    for i=1:Nstates
         dxtmp(i)=dxnew(i)/SumWofState(i);
    end
    
    for i=NOuts
        dytmp(i)=dynew(i)/SumWofExits(i);
    end
    
    xnew=x+dxtmp;
    ynew=y+dytmp;
    
    check=0;
    
    for i=1:Nstates
        if abs(dxtmp(i))>= 0.001 
            %�� ���� ��� ���� ������ ���������� ���� ���������� >= 0.001
            %���� �� check ������� 1 ��� � while ���������������.
            check=1;
            break;
        end
    end
    
    x=xnew;
    y=ynew;
    
    dx=dxnew;
    dy=dynew;
end





