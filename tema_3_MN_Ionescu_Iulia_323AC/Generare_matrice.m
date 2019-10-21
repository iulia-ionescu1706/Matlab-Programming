%Ionescu Iulia Cristina - 323AC

n=randi([1 15]);
A=zeros(n,n);
p=1;
diagonala=1;
col=2;
lin=1;
sens=0;

A(1,1)=0;

N= n*n;

while(p<=N/2)
    if(sens==0)
        k=p;
        i=1;
        for j=col:-1:1
            A(i,j)=k;
            k=k+1;
            i=i+1;
        end
        lin=i;
        p=p+(k-p);
        sens=1;
    else
        k=p;
        j=1;
        for i=lin:-1:1
            A(i,j)=k;
            k=k+1;
            j=j+1;
        end
        col=lin+1;
        p=p+(k-p);
        sens=0;
    end
end
if(sens==0)
    coloana=n;
    lin=2;
else
    coloana=2;
    lin=n;
 
end

while(p<=N-1)
     if(sens==0)
         k=p;
         j=n;
         for i=lin:n
             A(i,j)=k;
             k=k+1;
             j=j-1;
         end
         coloana=lin+1;
         sens=1;
         p=p+(k-p);
     else
         k=p;
         i=n;
         
         for j=coloana:n
             A(i,j)=k;
             i=i-1;
             k=k+1;
         end
      sens=0;
     p=p+(k-p);
   lin=coloana+1;
     end
end