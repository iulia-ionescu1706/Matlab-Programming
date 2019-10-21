%Negru Ionut
%323AC
clear;
%generare n random ------------------------------------------------
n=randi([5 10],1,1);


%generare vectori -------------------------------------------------
u=randi([5 10],n,1);
v=randi([5 10],n,1);
v=v';

%generare matrice H------------------------------------------------
H=zeros(n,n);
for i=1:n-1
    for j=1:i
        H(i,j)=randi([5 10],1,1);
        H(i,j+1)=randi([5 10],1,1);
    end
end
for i=1:n
    H(n,i)=randi([5 10],1,1);
end

%Calculare C=H*u eficient -------------------------------------------
C=zeros(n,1);
for i=1:n-1
    for j=1:i
        C(i,1)=C(i,1)+H(i,j)*u(j,1);
    end
    C(i,1)=C(i,1)+H(i,j+1)*u(j+1,1);
end
for i=1:n
    C(n,1)=C(n,1)+H(n,i)*u(i,1);
end

%Calculare D=C*v' eficient ------------------------------
D=zeros(n,n);
for i=1:n
    for j=1:n
        D(i,j)=D(i,j)+C(i,1)*v(1,j);
    end
end
%Verificare D=H*u*v'  ----------------------------------------
H*u*v;
