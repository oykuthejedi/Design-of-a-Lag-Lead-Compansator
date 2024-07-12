K = 58.93; 
numG = [K];  
denG = [1 7 0];  
G = tf(numG, denG);  
%%
zero = -3;
pole = -9.626;
Kc = 206.34;  
numC = [1 -zero];
denC = [1 -pole];
C = Kc * tf(numC, denC);

Gc = series(C, G);
T = feedback(Gc, 1);  

figure;
rlocus(G);
title('Original System Root Locus');
grid on;

figure;
pzmap(G);
title('Original System pz-map');
grid on;

figure;
rlocus(Gc);
title('Compansated System Root Locus');
grid on;

figure;
pzmap(Gc);
title('Compansated System pz-map');
grid on;

figure;
step(G/s); % Ramp response
title('Ramp Response');
title(['Ramp Response']);
grid on;

figure;
step(Gc/s); % Ramp response
title('Ramp Response - Compensated');
title(['Ramp Response - Compensated']);
grid on;