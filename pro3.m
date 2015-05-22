mapper = randi(2,1,100000)-1; %mapper
%BPSK
b=mapper;
for n = 1:length(mapper)
    if b(n)==0;
        b(n)=-1;
    end
end
%QPSK
q=mapper;
qs=linspace(1,50000);
i=1;
for n = 1 : 2 :length(mapper)
    if(q(n)==1 && q(n+1)==1)
        qs(i)=sqrt(2)*exp(j*pi/4);
    elseif (q(n)==1 && q(n+1)==0)
            qs(i)=sqrt(2)*exp(-j*pi/4);
    elseif (q(n)==0 && q(n+1)==0)
       qs(i)=sqrt(2)*exp(j*5*pi/4);     
    elseif (q(n)==0 && q(n+1)==1)
       qs(i)=sqrt(2)*exp(j*3*pi/4);
    end
        
        i=i+1;
        
end
%8PSK
p8=mapper;
p8s = linspace(1,33333);
i8=1;
for n=1:3:99999
    if(p8(n)==0 && p8(n+1) == 0 && p8(n+2)== 0)
        p8s(i8)=1*exp(j*0);
    elseif(p8(n)==0 && p8(n+1) == 0 && p8(n+2)== 1)
        p8s(i8)=1*exp(j*pi/4);
    elseif(p8(n)==0 && p8(n+1) == 1 && p8(n+2)== 1)
        p8s(i8)=1*exp(j*pi/2);
    elseif(p8(n)==0 && p8(n+1) == 1 && p8(n+2)== 0)
        p8s(i8)=1*exp(j*3*pi/4);
    elseif(p8(n)==1 && p8(n+1) == 1 && p8(n+2)== 0)
        p8s(i8)=1*exp(j*pi);
    elseif(p8(n)==1 && p8(n+1) == 1 && p8(n+2)== 1)
        p8s(i8)=1*exp(j*5*pi/4);
    elseif(p8(n)==1 && p8(n+1) == 0 && p8(n+2)== 1)
        p8s(i8)=1*exp(j*3*pi/2);
    elseif(p8(n)==1 && p8(n+1) == 0 && p8(n+2)== 0)
        p8s(i8)=1*exp(-j*pi/4);
    end
    i8=i8+1;
end
%16 QAM first one 
p161 = mapper; 
p161s=linspace(1,25000);
p162s= linspace(1,25000);
i16=1;
for n=1:4:25000
    if (p161(n) == 0 && p161(n+1) == 0 && p161(n+2) == 0 && p161(n+3) == 0 )
        %0000
        p161s(i16) = -3-3j;
        p162s(i16) = -3+3j;
    elseif(p161(n) == 0 && p161(n+1) == 0 && p161(n+2) == 0 && p161(n+3) == 1 )
        %0001
        p161s(i16) = -3-j;
        p162s(i16) = -1+j;
        elseif(p161(n) == 0 && p161(n+1) == 1 && p161(n+2) == 0 && p161(n+3) == 0 )
            %0100
        p161s(i16) = -1-3j;
        p162s(i16) = 3-j;
        elseif(p161(n) == 0 && p161(n+1) == 1 && p161(n+2) == 0 && p161(n+3) == 1 )
            %0101
        p161s(i16) = -1-j;
        p162s(i16) = -1+3j;
        elseif(p161(n) == 1 && p161(n+1) == 1 && p161(n+2) == 0 && p161(n+3) == 0 )
            %1100
        p161s(i16) = 1-3j;
        p162s(i16) = -3-3j;
        elseif(p161(n) == 1 && p161(n+1) == 1 && p161(n+2) == 0 && p161(n+3) == 1 )
            %1101
        p161s(i16) = 1-j;
        p162s(i16) = -1-j;
        elseif(p161(n) == 1 && p161(n+1) == 0 && p161(n+2) == 0 && p161(n+3) == 1 )
            %1001
        p161s(i16) = 3-j;
        p162s(i16) = 1-3j;
        elseif(p161(n) == 1 && p161(n+1) == 0 && p161(n+2) == 0 && p161(n+3) == 0 )
            %1000
        p161s(i16) = 3-3j;
        p162s(i16) = 1+3j;
        elseif(p161(n) == 0 && p161(n+1) == 0 && p161(n+2) == 1 && p161(n+3) == 0 )
            %0010
        p161s(i16) = -3+3j;
        p162s(i16) = 1-j;
        elseif(p161(n) == 0 && p161(n+1) == 1 && p161(n+2) == 1 && p161(n+3) == 0 )
            %0110
        p161s(i16) = -1+3j;
        p162s(i16) = -3+j;
        elseif(p161(n) == 0 && p161(n+1) == 0 && p161(n+2) == 1 && p161(n+3) == 1 )
            %0011
        p161s(i16) = -3+j;
        p162s(i16) = 3-3j;
        elseif(p161(n) == 1 && p161(n+1) == 1 && p161(n+2) == 1 && p161(n+3) == 0 )
            %1110
        p161s(i16) = 1+3j;
        p162s(i16) = 1+j;
        elseif(p161(n) == 1 && p161(n+1) == 0 && p161(n+2) == 1 && p161(n+3) == 0 )
            %1010
        p161s(i16) = 3+3j;
        p162s(i16) = -3+j;
        elseif(p161(n) == 1 && p161(n+1) == 1 && p161(n+2) == 1 && p161(n+3) == 1 )
            %1111
        p161s(i16) = 1+j;
        p162s(i16) = -1-3j;
        elseif(p161(n) == 1 && p161(n+1) == 0 && p161(n+2) == 1 && p161(n+3) == 1 )
            %1011
        p161s(i16) = 3+j;
        p162s(i16) = 3+3j;
         elseif(p161(n) == 0 && p161(n+1) == 1 && p161(n+2) == 1 && p161(n+3) == 1 )
             %0111
        p161s(i16) = -1+j;
        p162s(i16) = 3+j;
    end
    i16 = i16+1;
end

%-----------------------------------------------------------------------%
%-------------------------channal---------------------------------------%
n0 = 10.^(0.2:-.1:-.5);
%noise for BPSK : 
nr = randn (size(b)); % N = mean + dev .* randn %channal
ni =  randn (size(b));
 bb =b ;

for h = 1 : 8 
    awgn = sqrt(n0(h)/2) * nr + j * sqrt(n0(h)/2) * ni;
    bb= b + awgn ; 
   for k =1 : length(bb)
       if(bb(k)>=0 ) 
           bb(k)=1;
       elseif (bb(k)< 0) 
           bb(k)=0;
       end
   end
       BPSKBER(h) = sum(xor(bb,mapper));
       BT(h) = 0.5* erfc(sqrt(1/n0(h)));
end
figure;
semilogy(10*log(1./n0),BPSKBER/100000, 'r') ; hold on ;
semilogy(10*log(1./n0),BT, 'g') ; hold on ;
title('BER vs EB/N0 < BPSK');
xlabel('Eb/N0');
ylabel ('BER');
grid on

qsn = qs;
nqr =randn(size(qs)); 
nqi = randn(size(qs));
for h = 1 : 8 
    awgn = sqrt(n0(h)/2) * nqr + j * sqrt(n0(h)/2) * nqi;
    qsn = qs + awgn;
    for k= 1 :length(qs)
        if(real(qsn(k))>= 0)
            q(2*k-1)= 1 ; 
        elseif (real(qsn(k)) <0 )
            q(2*k-1)= 0 ; 
        elseif (imag(qsn(k) >= 0 ))
            q(2*k)=1;
        elseif (imag(qsn(k) < 0 ))
            q(2*k)= 0 ;
        end
    end
    BERQPSK(h) = sum (xor ( q , mapper));
    QT(h) = 0.5* erfc(sqrt(1/n0(h)));
end
QT = QT./2 ; 
figure;
semilogy(10*log(1./n0),BERQPSK/100000, 'r') ; hold on ;
semilogy(10*log(1./n0),QT, 'g') ; hold on ;
title('BER vs EB/N0 , QPSK');
xlabel('Eb/N0');
ylabel ('BER');
grid on

n8r = randn(size(p8s));
n8i = randn (size(p8s));
p8sn = p8s;
for h = 1:8
    awgn = sqrt((1/3)*n0(h)/2) * n8r + j * sqrt((1/3)*n0(h)/2) * n8i;
    p8sn = p8s + awgn;
    for k=1 : length (p8sn)
        if((angle(p8sn(k)) <= pi/8) && (angle(p8sn(k))>= -pi/8))
            p8(3*k-2 : 3*k)= [0 0 0];
        elseif(angle(p8sn(k)) >= pi/8 && angle(p8sn(k))<= 3*pi/8)
            p8(3*k-2 : 3*k)= [0 0 1];
        elseif(angle(p8sn(k)) > 3*pi/8 && angle(p8sn(k))<= 5*pi/8)
            p8(3*k-2 : 3*k)= [0 1 1];
        elseif(angle(p8sn(k)) > 5*pi/8 && angle(p8sn(k))<= 7*pi/8)
            p8(3*k-2 : 3*k)= [0 1 0];
        elseif(angle(p8sn(k)) > 7*pi/8 && angle(p8sn(k))<= 9*pi/8)
            p8(3*k-2 : 3*k)= [1 1 0];
        elseif(angle(p8sn(k)) > 9*pi/8 && angle(p8sn(k))<= 11*pi/8)
            p8(3*k-2 : 3*k)= [1 1 1];
        elseif (angle(p8sn(k)) > 11*pi/8 && angle(p8sn(k))<= 13*pi/8)
            p8(3*k-2 : 3*k)= [1 0 1];
        elseif(angle(p8sn(k)) > 13*pi/8 && angle(p8sn(k))<= 15*pi/8)
            p8(3*k-2 : 3*k)= [1 0 0];
        end 
    end
    BER8PSK(h)= sum ( xor ( p8 , mapper ) ) ;
    T8(h) = 0.5* erfc(sqrt((1/3)/n0(h)));
end
T8 = T8./3;
figure;
semilogy(10*log(1./n0),BER8PSK/100000, 'r') ; hold on ;
semilogy(10*log(1./n0),T8, 'g') ; hold on ;
title('BER vs EB/N0 ,8PSK');
xlabel('Eb/N0');
ylabel ('BER');
grid on
p161sn=p161s;
n16r = randn(size(p161s)); 
n16i = randn (size(p161s));
for h =1 : 8 
    awgn =  sqrt(2.5*n0(h)/2) * n16r + j * sqrt(2.5*n0(h)/2) * n16i;
    p161sn = p161s + awgn ; 
    for k =1:length(p161s)
        if(real(p161s(k)) >= 0 )
            p161(4*k-3)= 1;
        elseif(real(p161s(k)) < 0 )
            p161(4*k-3)= 0;
        end
       if (imag(p161sn(k)) >= 0)
            p161(4*k-1)= 1 ; 
        elseif(imag(p161sn(k)) < 0)
            p161(4*k-1)= 0 ;
       end
        if(abs(imag(p161sn(k))) < 3 )
            p161(4*k)= 1 ;
        elseif(abs(imag(p161sn(k))) >= 3 )
            p161(4*k)= 0 ;
        end
        if(abs(real(p161sn(k))) < 3 )
            p161(4*k-2) = 1 ; 
        elseif(abs(real(p161sn(k))) >= 3 )
            p161(4*k-2) = 0 ;
        end
    end
    BER161(h)= sum (xor ( p161 , mapper));
    T161(h) = 0.5 * erfc(sqrt(2.5/n0(h)));
end
T161 = T161 ./4;
figure;
semilogy(10*log(1./n0),BER161/100000, 'r') ; hold on ;
semilogy(10*log(1./n0),T161, 'g') ; hold on ;
title('BER vs EB/N0 , 16PSK I');
xlabel('Eb/N0');
ylabel ('BER');
grid on
p162sn=p162s;
for h=1:8
    awgn = sqrt(2.5*n0(h)/2) * n16r + j * sqrt(2.5*n0(h)/2) * n16i;
    p162sn = p162s + awgn;
    for k=1:length(p162s)
        if(angle(p162sn(k))>=0 && angle(p162sn(k))<= 0.55348 )
            p161(4*k-3 : 4*k) = [0 1 1 1];
        elseif(angle(p162sn(k))> 1.01722 && angle(p162sn(k))<= pi/2  )
            p161(4*k-3 : 4*k) = [1 0 0 0];
        elseif(angle(p162sn(k))> pi/2 && angle(p162sn(k))<=2.12428  )
            p161(4*k-3 : 4*k) = [0 1 0 1];
        elseif(angle(p162sn(k))> 2.5881 && angle(p162sn(k))<= pi  )
            p161(4*k-3 : 4*k) = [0 1 1 0];
        elseif (angle(p162sn(k))> pi && angle(p162sn(k))<= 3.6951  )
            p161(4*k-3 : 4*k) = [1 0 1 0];
        elseif(angle(p162sn(k))> 4.1588 && angle(p162sn(k))<= 3*pi/2  )
            p161(4*k-3 : 4*k) = [1 1 1 1];
        elseif(angle(p162sn(k))> 3*pi/2 && angle(p162sn(k))<= 5.2658  )
            p161(4*k-3 : 4*k) = [1 0 0 0];
        elseif(angle(p162sn(k))> 5.73 && angle(p162sn(k))<= 2*pi  )
            p161(4*k-3 : 4*k) = [0 1 0 0];
        elseif(angle(p162sn(k))>= 0.55348 && angle(p162sn(k))<= 1.01722 )
            if(abs(p162sn(k))> 0 && abs(p162sn(k))<=2.2882)
                p161(4*k-3 : 4*k) = [1 1 1 0];
            else(abs(p162sn(k))> 2.2882)
                p161(4*k-3 : 4*k) = [1 0 1 1];
            end
        elseif(angle(p162sn(k))>= 2.124 && angle(p162sn(k))<= 2.588 )
            if(abs(p162sn(k))> 0 && abs(p162sn(k))<=2.2882)
                p161(4*k-3 : 4*k) = [0 0 0 1];
            else(abs(p162sn(k))> 2.2882)
                p161(4*k-3 : 4*k) = [0 0 0 0];
            end
        elseif(angle(p162sn(k))>= 3.695 && angle(p162sn(k))<= 4.1588 )
            if(abs(p162sn(k))> 0 && abs(p162sn(k))<=2.2882)
                p161(4*k-3 : 4*k) = [1 1 0 1];
            else(abs(p162sn(k))> 2.2882)
                p161(4*k-3 : 4*k) = [1 1 0 0];
            end
        elseif(angle(p162sn(k))>= 5.2658 && angle(p162sn(k))<= 5.73 )
            if(abs(p162sn(k))> 0 && abs(p162sn(k))<=2.2882)
                p161(4*k-3 : 4*k) = [0 0 1 0];
            else(abs(p162sn(k))> 2.2882)
                p161(4*k-3 : 4*k) = [0 0 1 1];
            end
        end
    end
    BER162(h)= sum ( xor ( p161 , mapper ));
    T162(h) = 0.5*erfc(sqrt(2.5/n0(h)));
end 
T162 = T162 ./ 4 ; 
figure;
semilogy(10*log(1./n0),BER162/100000, 'r') ; hold on ;
semilogy(10*log(1./n0),T162, 'g') ; hold on ;
title('BER vs EB/N0 , 16 PSK II');
xlabel('Eb/N0');
ylabel ('BER');
grid on
%------------------------------------------------------------------%
figure;
semilogy(10*log(1./n0),BPSKBER/100000, 'r') ; hold on ; 
semilogy(10*log(1./n0),BERQPSK/100000, 'g'); hold on ; 
semilogy(10*log(1./n0),BER8PSK/100000, 'y'); hold on ;
semilogy(10*log(1./n0),BER161/100000, 'm'); hold on ;
semilogy(10*log(1./n0),BER162/100000, 'c'); hold on ;
title('BER vs EB/N0');
xlabel('Eb/N0');
ylabel ('BER');
grid on