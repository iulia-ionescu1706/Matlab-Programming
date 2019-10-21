%Ionescu Iulia- Cristina
%323AC,   tema 1
clear;
%se genereaza in urm linie un n la intamplare, intre 5 si 10

n=randi([5 10],1,1);

u=randi([5 10],n,1);
v=randi([5 10],n,1);
v=v';


H=zeros(n,n);
for i=1:n
    H(1,i)=randi([5 10],1,1);
end

for i=2:n
    H(i,i-1)=randi([5 10],1,1);
    for j=i:n
        H(i,j)=randi([5 10],1,1);
    end
    
end
%mai sus se genereaza matricea Hessenberg



C=zeros(n,1);
for i=1:n
    C(1,1)=C(1,1)+H(1,i)*u(i,1);
end

for i=2:n
   for j=i-1:n
        C(i,1)=C(i,1)+H(i,j)*u(j,1);
    end
end



D=zeros(n,n);
for i=1:n
    for j=1:n
        D(i,j)=D(i,j)+C(i,1)*v(1,j);
    end
end



H*u*v;
%testam algoritmul