 %xlabel('n ----->')
 Ts = 1 ; 
 p=[5 4 3 2 1]/sqrt(55); %given
 figure;
 plot(p)
 bits = randi(2,1,10)-1; %randam creation
f= 1/5; % sampling frequency 
for n = 1 : length(bits) % converting to 1 & -1 
    if bits(n) == 0 
        bits(n) = -1;
    end 
end
figure ; 
subplot(2,1,1) , stem(bits), title('pulse train')
signal=upsample (bits,1/f); % inserting 4 zeros in the sequance
%subplot(2,1,2) , stem(signal) ,title('signal')
y = conv(p , signal);%generating the transmeted signal
figure ;
subplot(2,1,1),stem (y), title('Data')
subplot(2,1,2),stem (fliplr(p))
%---------------------------------filter i -------------------%
mf1 = fliplr(p) ; 
out1 = conv(y , mf1); 
%out= conv(y ,p);
%figure;
%plot(out1), title('output of the matched filter')
%stem(out)
%-------------------------------filter ii --------------------%
%rect = linspace(0 , 1 );
%rect = downsample (rect ,10);
%recto = rectpuls(rect);
k= [1 1 1 1 1]/sqrt(5);
%x=-10:0.001:10;
%a= 1 ;
%rect=ones(1,numel(x)).*(abs(x)<a/2);
%figure;
%subplot(2,1,1), stem(k), title('second filter')
out2 = conv(y , k) ; 
%subplot(2,1,2) ,
%plot(out2) , title('output of the rect. filter')
%-------------------correlator-----------------------------------------%
cor= p ; 
cor= repmat(cor,1,length(bits));
corr= y(1:50) .* cor; 
for i = 1:10 
    cor_out(i) = sum(corr(5*i-4:5*i));
end
%plot(cor_out), title('output of the correlator')
%----------------------------------------------------------------------%
%-------------------Noise analysis-------------------------------------%

noise_seq = randi(2,1,10000)-1;
noise_seq1= noise_seq;
for n = 1 : length(noise_seq) % converting to 1 & -1 
    if noise_seq1(n) == 0 
        noise_seq1(n) = -1;
    end 
end
sent=upsample (noise_seq1,1/f);
Stream = conv(p,sent) ; %signal 
N =randn(size(Stream)); % N = mean + dev .* randn
N0=0.63;% -2 db
N1= (sqrt(N0/2))*N;
v = Stream + N1 ; % adding the noise to the signal 
%stem (N), title('noise after adding the variance')

v_out = conv(v, mf1); %matched filter
V = v_out(5:5:50000); %sampling every 5 ms
for r = 1: length(V) % start the demodulation 
    if V(r)>0 
V(r) = 1; 
    
    elseif V(r) <0 
        V(r) = 0 ; 
end
end
b = sum(xor(V, noise_seq)); 
ber = b / 10000;
n0 = 10.^(0.2:-.1:-.5); 
unmatched_filter = [5 5 5 5 5]/sqrt(125);
for h = 1:8    % changing the value of n0
   awgn = sqrt(n0(h)/2)* N ;
   S = Stream + awgn ; 
   S_matched = conv(S , mf1); % with matched filter
   S_unmatched = conv(S , unmatched_filter); % with the rect
   S_matched_sampled = S_matched (5:5:50000); %sampling
   S_unmatched_sampled = S_unmatched(5:5:50000); %sampling
   for a = 1 : length (S_matched_sampled) 
      if S_matched_sampled(a) >= 0 
          S_matched_sampled(a) = 1 ; 
      elseif S_matched_sampled(a) < 0 
          S_matched_sampled(a) = 0 ; 
      end
   end
   BER_matched(h) = sum (xor(S_matched_sampled , noise_seq));
   
    for a = 1 : length (S_matched_sampled) 
      if S_unmatched_sampled(a) >= 0 
          S_unmatched_sampled(a) = 1 ; 
      elseif S_unmatched_sampled(a) < 0 
          S_unmatched_sampled(a) = 0 ; 
      end
   end
   BER_unmatched(h) = sum (xor(S_unmatched_sampled , noise_seq));
   
   BER(h) = 0.5 * erfc(sqrt(1./n0(h)));
end

%------------------------bit error rate-------------------------%
BER_matched/10000
BER_unmatched/10000
BER
figure;
semilogy(10*log(1./n0),BER, 'r') ; hold on ; 
semilogy(10*log(1./n0),BER_matched/10000, 'g'); hold on ; 
semilogy(10*log(1./n0),BER_unmatched/10000);
title('BER vs EB/N0');
xlabel('Eb/N0');
ylabel ('BER');
grid on