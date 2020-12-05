%sc50 -1st Line of script sc50
clc
clear all
N = 100;
kr = 16;
k1=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
pr=[0.3028 0.21 0.147 0.1029 0.072 0.0504 0.0352 0.0247 0.0172 0.0121 0.0084 0.0059 0.0041 0.0029 0.002 0.0014];
xd(1:N)=0;
for k=1:N
    xd(k)=gen57(k1,pr);
end

%матожидание заданной СВ
m = 0;
for i=1:kr
    m = m + k1(i)*pr(i);
end
m

%дисперсия заданной СВ
d = 0;
for i=1:kr
    d = d + k1(i)*k1(i)*pr(i);
end
d = d - m*m


figure(1)
hist(xd,kr)
title('N=100, pr= 0.35 0.15 0.35 0.15')
%xi2
[v,xv]=hist(xd,kr)

%матожидание по сгенерированной выборке
m1 = 0;
for i=1:kr
    m1 = m1 + xv(i)*(v(i)/100);
end
m1

%дисперсия сгенерированной СВ
d1 = 0;
for i=1:kr
    d1 = d1 + xv(i)*xv(i)*(v(i)/100);
end
d1 = d1 - m1*m1

np=N*pr;
er=v-np;
er2=er.^2./np;
xi2=sum(er2)

figure(2)
vn=v/N;
plot(xv, vn,'r*')
hold on
plot(xv, pr)
title('* - vyborka, -- np - theory')

