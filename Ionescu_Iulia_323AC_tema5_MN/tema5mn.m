
A=[4 -4 0;-4 8 -4; 0 -4 8]
[v , d]= eig (A) ; %Extragem v a l o r i s i v e c t o r i p r o p r i i .
wn=sqrt ( diag (d) )/ 2 / pi ; %Extragem f r e c v e n t a
t = 0 : 0.2 : 20 ; %1xM Vec tor de timp ( pen t ru p l o t a r e )
x=v * sin (wn * t ) ; %O s c i l a t i a
% A f i s a r e d a te d e s p r e si s t em
disp ( 'M a t rice a s i s t e m u l u i' ) ;
disp (A)
disp ( 'V al o ri p r o p r i i ') ; 
disp(diag(d)')
disp ( 'V e c t o ri p r o p r i i ( f i e c a r e  c ol o a n a    e s t e un  v e c t or p r o p ri u )  ') ;
disp (v)
disp(' F r e c v e n t el e , omega=' )
sprintf ( ' %4.2 f ,',wn)

%Cod pen t ru a f i s a r e a l e g e n d e i l a p l o t a r e
N=size (A, 1 ) ;
outLeg=' ' ;
modLeg=' ' ;
for i =1:N,
outLeg=strvcat(outLeg, strcat ( 'Out', int2str(i) ) ) ;
mstr=sprintf ( 'Mode %d ', i ) ;
modLeg=strvcat (modLeg , mstr) ;
end




%Pl o t a r e a o s c i l a t i i l o r
subplot( 2 , 1 , 1 ) ;
plot (t , x )
xlabel ( 'Timp ' ) ; ylabel (  'Amplitudine ') ;
title ( 'O s c i l a t i i ' ) ;
legend ( outLeg ) ;
%Plotare moduri
subplot( 2 , 1 , 2 )
plot(v , ': ' , 'LineWidth ' , 2 ) ;
xlabel ( ' Elements ' ) ; ylabel ( 'Mode amplitude' ) ;
title ( 'Mode shapes , \omega=');
sprintf(' %4.2 f ,' ,wn) ;
axis ([0.5 N*1.5  -1  1]) ;
set ( gca , ' XTick ', [ 1 :N] ) ;
legend (modLeg ) ;
hold on
stem ( v ) ;
hold off