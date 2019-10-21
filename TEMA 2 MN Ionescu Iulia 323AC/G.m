function [G] = G(a,n)
u=zeros(n,n);
for k=1:n-1
    for i=k+1:n
        u(i,k)=a(i,k)/a(k,k);
    end
    for i=k+1:n
        for j=k:n
            a(i,j)=a(i,j)-u(i,k)*a(k,j);
        end
    end
end
G=a;
end

