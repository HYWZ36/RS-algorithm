I=imread('lena.bmp');
[M,N]=size(I);
P=0;%隐写率
mH=round(M*P);
p=mH /M;

SI=I;
SI(1:mH, :)=bitset(I(1:mH, :),1, randsrc(mH, N, [0 1;0.5 0.5]));
[R,S,U,R1,S1,U1]=RSU(SI, M*N);%求隐写图的各翻转参数数量
SI=bitset(SI, 1, xor(bitget(SI,1),1));%翻转
[R2,S2,U2,R3,S3,U3]=RSU(SI, M*N);%求翻转后隐写图的各翻转参数数量
d0= (R-S)/(M*N);
d1= (R2-S2)/(M*N);
dn0=(R1-S1)/(M*N);
dn1=(R3-S3)/(M*N);
x=roots([2*(d0+d1),(dn0-dn1-d1-3*d0),(d0-dn0)]);
[~,idx]=min(abs(x));
extP=x(idx) /(x(idx)-0.5);%计算得的期望隐写率
fprintf(1, 'real rate:%f, expectation rate:%f, diff:%f \n',p, extP,P-extP);