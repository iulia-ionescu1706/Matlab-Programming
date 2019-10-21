clear;


n=randi([5 10]);

m=0;

while(m<n+3)
    m=randi([8 15]);
end

for i=1:n
    for j=i:n
        a(i,j)=randi([4 9]);
    end
end

for i=1:n
    a(m-1,i)=randi([5 10]);
    a(m,i)=randi([5 10]);
end




p = min(m-1,n);
sum = 0;
tau = 0;
for k=1:p
    for i=k:m
        sum =sum + a(i,k)*a(i,k);
    end
    
        sigm= sign(a(k,k))*sqrt(sum);
        if(sigma==0)
            beta(k)=0;
        else
            u(k,k)=a(k,k)+sigma;
            for i=k+1:m
                u(i,k)=a(i,k);
            end
                beta(k)=sigma*u(k,k);
                R(k,k)=-sigma;
                a(k,k)=R(k,k);
                
                for(i=k+1:m)
                     a(i,k)=0;
                end;
                
                for j=k+1:n
                    for q=k:m
                        tau=tau+(u(q,k)*a(q,j))/beta(k);
                    end;
                    for i=k:m
                        a(i,j)= a(i,j)-tau*u(i,k);
                    end
                end
        end
end


b=randi([5 10],n);
for k=1:n
    teta=0;
    for i=k:m
        teta=teta+U(i,k)*b(i);
    end
    teta=teta/beta(k);
    for i=k:m
        b(i)=b(i)-teta*U(i,k);
    end
end
b
U

a

        
                    
                