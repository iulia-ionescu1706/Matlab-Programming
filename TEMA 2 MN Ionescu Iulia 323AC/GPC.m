function [G] = GPC(a,n)
u=zeros(n,n);
p=zeros(n,1);
q=zeros(n,1);
for k=1:n-1
    max=a(k+1,k+1);
    p(k,1)=k+1;
    q(k,1)=k+1;
    for i=k+1:n
        for j=k+1:n
            if a(i,j)>max
                p(k,1)=i;
                q(k,1)=j;
            end
        end
    end
    for j=k:n
        m=a(k,j);
        a(k,j)=a(p(k,1),j);
        a(p(k,1),j)=m;
    end
    for i=1:n
        m=a(k,j);
        a(k,j)=a(i,q(k,1));
        a(i,q(k,1))=m;
    end
    for i=k+1:n
        u(i,k)=a(i,k)/a(k,k);
    end
    for i=k+1:n
        for j=k:n
            a(i,j)=a(i,j)-u(i,k)*a(k,j);
        end
    end
end

