function k2=gen57(k1,pr)
s = rand;
n=1;
while s>0
    s=s-pr(n);
    n=n+1;
end
k2=k1(n-1);
end