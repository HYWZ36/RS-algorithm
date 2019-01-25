function [R,S,U,R1,S1,U1] = RSU(A,bufsize)
R = 0;
S = 0;
U = 0;
R1 = 0;
S1 = 0;
U1 = 0;
for n = 1: bufsize/4
    for m = 1: 4
        x(m) = A(4*(n-1) + m);
    end
    fG = f(x);%紧挨着的4个像素块算相关性
    G(1) = F0(x(1));             
	G(2) = F1(x(2));  
	G(3) = F1(x(3));  
	G(4) = F0(x(4));  
    FsG = f(G);
    if FsG>fG 
        R = R + 1;
    elseif FsG < fG 
        S = S + 1;
    else 
        U = U + 1;
    end
    
    H(1) = F0(x(1));             
	H(2) = Fne(x(2));  
	H(3) = Fne(x(3));  
	H(4) = F0(x(4));  
    FsH = f(H);
    if FsH>fG 
        R1 = R1 + 1;
    elseif FsH < fG 
        S1 = S1 + 1;
    else 
        U1 = U1 + 1;
    end
end
