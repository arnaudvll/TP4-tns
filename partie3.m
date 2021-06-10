clear variables;
close all;

[s,nue]=audioread('signal11.wav');

sgram(s,nue,70,1);
M=45;

fc = 2800; %fréquence de coupure
nuc=fc/nue;

h=fir1(M-1,2*nuc,rectwin(M));
[H,f]=freqz(h,1,1024,nue);

figure(2)
subplot(2,2,1)
stem(h)
title('Réponse impulsionnelle')

subplot(2,2,2)
zplane(roots(h))
title('Diagramme pôle-zéro')

subplot(2,2,3)
plot(f,20*log10(abs(H)))
title('Module du gain complexe')
ylabel('dB')

subplot(2,2,4)
plot(f,unwrap(angle(H)))
title('Phase du gain complexe')
ylabel('radians')

h2=fir1(M-1,2*nuc,blackman(M));
[H2,f]=freqz(h2,1,1024,nue);

figure(3)
subplot(2,2,1)
stem(h2)
title('Réponse impulsionnelle')

subplot(2,2,2)
zplane(roots(h2))
title('Diagramme pôle-zéro')

subplot(2,2,3)
plot(f,20*log10(abs(H2)))
title('Module du gain complexe')
ylabel('dB')

subplot(2,2,4)
plot(f,unwrap(angle(H2)))
title('Phase du gain complexe')
ylabel('radians')

figure(4)
subplot(2,1,1)
plot(f,abs(H))
title('Gain complexe (fenêtre rectangulaire)')
xlabel('fréquence f')

subplot(2,1,2)
plot(f,abs(H2))
title('Gain complexe (fenêtre de Blackman)')
xlabel('fréquence f')

y=filter(h,1,s);
y2=filter(h2,1,s);
soundsc(y2)
sgram(y,nue,60,5)
sgram(y2,nue,60,6)


