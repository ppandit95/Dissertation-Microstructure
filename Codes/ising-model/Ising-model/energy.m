function e=energy(spin,k,Neighbor,n)
e=0;
for i=1:n
    if spin(k)==Neighbor(i)
        e=e+1;
    else
        e=e+0.5;
    end
end