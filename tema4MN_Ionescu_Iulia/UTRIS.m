function [x] = utris(A,n,b)

x=b;

for i=n:-1:1
    for j=i+1:n
        
        x(i)=x(i)-A(i,j)*x(j);
    end
    
    
    x(i)=x(i)/A(i,i);
end

x;
end

