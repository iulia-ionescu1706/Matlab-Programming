%Ionescu Iulia Cristina - 323AC


function [G] = GPP(A,n)

p=zeros(n);
u=zeros(n,n);
for k=1:n-1
    max=A(k+1,k);
    p(k)=k;
    
    for j=k+1:n
        if(max<A(j,k))
            max=A(j,k);
            p(k)=j;
        end
    end
    
    for i=k:n
        x=A(k,i);
        A(k,i)=A(p(k),i);
        A(p(k),i)=x;
    end
    
     for i=k+1:n
        u(i,k)=A(i,k)/A(k,k);
     end
    
    for i=k+1:n
        for j=k:n
          A(i,j)=A(i,j)-u(i,k)*A(k,j);
        end
    end
end



G=A;
end

