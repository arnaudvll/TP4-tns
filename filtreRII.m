clear variables;
close all;

[s,nue]=audioread('signal11.wav');

fc=2800;
Wp=2*pi*fc;
Rp=1;
Rs=80;
[b,a]=ellip(7,Rp,Rs,Wp,'s');

f=0:8000;
[Ha,w]=freqs(b,a,2*pi*f);

subplot(2,1,1)
plot(w/(2*pi),20*log10(abs(Ha)))
title('Module du gain complexe (filtre analogique)')
ylabel('dB')

subplot(2,1,2)
plot(w/(2*pi),unwrap(angle(Ha)))
title('Phase du gain complexe (filtre analogique)')
ylabel('radians')

[num,den]=bilinear(b,a,fc);
[h,t]=impz(num,den);
[H,v]=freqz(h);

figure(2)
subplot(2,2,1)
stem(t,h)
title('Réponse impulsionnelle')

subplot(2,2,2)
zplane(roots(H))
title('Diagramme pôle-zéro')

subplot(2,2,3)
plot(v,20*log10(abs(H)))
title('Module du gain complexe')
ylabel('dB')

subplot(2,2,4)
plot(v,unwrap(angle(H)))
title('Phase du gain complexe')
ylabel('radians')
