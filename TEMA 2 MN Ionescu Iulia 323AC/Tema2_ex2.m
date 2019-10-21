%Ionescu Iulia Cristina 323AC


clear;
n=1500;
A=randi([5 10],n,n);
    for i=1:n
        A(i,i)=0;
        for j=1:n
            if j~=i
                A(i,i)=A(i,j)+A(i,i);
            end
        end
    end
B=randi([5 10],n,n);
    for i=1:n
            B(i,i)=B(i,i)\10^-4;
    end
tic;
G(A,n);
a1=toc;
tic;
GPC(A,n);
a2=toc;
tic;
G(B,n);
b1=toc;
tic;
GPC(B,n);
g2=toc;

%Concluzii=======================================
%Timpul necesar aplicarii G asupa ambelor matrici este aproximativ egal
%Timpul necesar aplicarii GPC este mai bun la matricea A deoarece acesta
%schimba doar linii doar la unele elemente , in timp ce pentru matricea B
%la fiecare linia trebuie schimbata linia si coloana
%Memoria necesara este mai mare atunci cand folosim GPC din cauza celor doi
%vectori ce retin permutarii
%Atunci cand aplicam cei doi algoritmi , B va fi mai putin stabil din cauza
%ordinului de marime redus
