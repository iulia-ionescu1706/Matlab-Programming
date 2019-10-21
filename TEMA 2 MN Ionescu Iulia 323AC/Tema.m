clear;
p=1;
y=length(100:100:3000);
y2=length(100:100:3000);
for n=100:100:3000
    A=randi([5 10],n,n);
    for i=1:n
        A(i,i)=0;
        for j=1:n
            if j~=i
                A(i,i)=A(i,j)+A(i,i);
            end
        end
    end
    A(i,i)=A(i,i)+1;
    tic 
    G(A,n);
    y(p)=toc;
    tic
    GPC(A,n);
    y2(p)=toc;
    p=p+1;
end
plot(100:100:3000,y,100:100:3000,y2);
legend('G','GPC');