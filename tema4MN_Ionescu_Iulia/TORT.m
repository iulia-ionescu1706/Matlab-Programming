function [R,U,b] = TORT(A,m,n)

p=min(m-1,n);

for k=1:p
    s=0;
    for i=k:m
        s=s+A(i,k)*A(i,k);
    end
    sigm=sign(A(k,k))*sqrt(s);
    
   if sigm == 0 
        b(k)=0;
        else
        U(k,k)=A(k,k)+sigm;
        
        
     for i=k+1:m
            U(i,k)=A(i,k);
        end
        
        b(k)=sigm *U(k,k);
        R(k,k)= -sigm;
 
    for i=k+1:m
            A(i,k)=0;
    end
        for j=k+1:n
            s=0;
            for i=k:m
                s=s+U(i,k)*A(i,j);
            end
            
      tau=s/b(k);
      
            for i=k:m
                A(i,j)=A(i,j)-tau*U(i,k);
            end
        end
    end
end

R

U
b
end

