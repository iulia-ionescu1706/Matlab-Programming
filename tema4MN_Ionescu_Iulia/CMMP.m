function [X] = cmmp(A,m,n,b)
[R,U,beta]=TORT(A,m,n);

for k=1:n
    s=0;
    
   for i=k:m
        s = s+U(i,k)*beta(k);
    end
    teta=s/b(k);
    
    for i=k:m
        b(i)=b(i)-teta*U(i,k);
    end
end

X=utris(R(1:n,:),n,b(1:n));
end

