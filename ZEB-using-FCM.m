%%
%ΕΥΦΥΗΣ ΕΛΕΓΧΟΣ 

%Μοντελοποίηση Κτιρίου Μηδενικού Ισοζυγίου Ενέργειας 
%με τη χρήση Εξελιγμένων Ασαφών Γνωστικών Δικτύων.


close all;
clear all;
clc;

%%
%Χειμερινή περίοδος

%Πίνακες A,B,C,D

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





%Αρχικοποίηση

tmp=size(C);
NOuts=tmp(1);   %Αριθμός εξόδων
Nstates=length(A); %Αριθμός καταστάσεων


x=zeros(Nstates,1);
dx=zeros(Nstates,1);

y=zeros(NOuts,1);
dy=zeros(NOuts,1);


%Οι  πίνακες SumWofState,SumWofExits  περιλαμβάνουν τα άθροισματα των βαρών
%των συνδέσεων που καταλήγουν στους κόμβους καταστάσεως και εξόδου
%αντίστοιχα.

SumWofState=[0.95 0.85 0.6 0.25 0.5 0.8 0.2 0.32];
SumWofExits=[1.2,0.6];


%Πρώτη επανάληψη για du=[0.9;0.2;0.6;0.1;0.8](ή du=[0.6;0.8;0.5;0.8;0.8]-Ερώτημα Γ) .Οι τιμές προκύπτουν απο την
%εκφώνηση


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


%Μηδενίζω την είσοδο.
%Θέτω κατώφλι τερματισμού η διαφορά στα states να είναι < 0.001 
%μεταξύ δύο διαδοχικών επαναλήψεων.


du=[0;0;0;0;0];

counter=0;
check=1;

while check
    counter=counter+1; %Πλήθος επαναλήψεων
    %sprintf('\Αριθμός επανάληψης = %3.1d dB',counter);
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
            %Αν έστω και ένας κόμβος κατάστασης έχει μεταβληθεί >= 0.001
            %τότε το check γίνεται 1 και η while επαναλαμβάνεται.
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




 %Καλοκαιρινή περίοδος
              
              
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


%Αρχικοποίηση

tmp=size(C);
NOuts=tmp(1);   %Αριθμός εξόδων
Nstates=length(A); %Αριθμός καταστάσεων


x=zeros(Nstates,1);
dx=zeros(Nstates,1);

y=zeros(NOuts,1);
dy=zeros(NOuts,1);


%Οι  πίνακες SumWofState,SumWofExits  περιλαμβάνουν τα άθροισματα των βαρών
%των συνδέσεων που καταλήγουν στους κόμβους καταστάσεως και εξόδου
%αντίστοιχα.

SumWofState=[0.95 0.85 0.6 0.25 0.5 0.8 0.2 0.32];
SumWofExits=[1.2,0.6];


%Πρώτη επανάληψη για du=[0.9;0.2;0.6;0.1;0.8](ή du=[0.6;0.8;0.5;0.8;0.8]-Ερώτημα Γ) .Οι τιμές προκύπτουν απο την
%εκφώνηση


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


%Μηδενίζω την είσοδο.
%Θέτω κατώφλι τερματισμού η διαφορά στα states να είναι < 0.001 
%μεταξύ δύο διαδοχικών επαναλήψεων.


du=[0;0;0;0;0];

counter=0;
check=1;

while check
    counter=counter+1; %Πλήθος επαναλήψεων
    %sprintf('\Αριθμός επανάληψης = %3.1d dB',counter);
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
            %Αν έστω και ένας κόμβος κατάστασης έχει μεταβληθεί >= 0.001
            %τότε το check γίνεται 1 και η while επαναλαμβάνεται.
            check=1;
            break;
        end
    end
    
    x=xnew;
    y=ynew;
    
    dx=dxnew;
    dy=dynew;
end





