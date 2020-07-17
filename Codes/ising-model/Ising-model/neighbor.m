function [n,p]=neighbor(spin,k,N)
p=4;
%Creating Neighborhood based on Periodic BCs
        if k==1
            n=[spin(N) spin(k+1) spin(N*N-N) spin(k+N)];
        elseif k==N
            n=[spin(N-1) spin(1) spin(N*N) spin(k+N)];
        elseif k==N*N-N+1
            n=[spin(N*N) spin(k+1) spin(k-N) spin(1)];
        elseif k==N*N
            n=[spin(k-1) spin(k+1-N) spin(k-N) spin(N)];
        elseif rem(k,N)==1
            n=[spin(k+N-1) spin(k+1) spin(k-N) spin(k+N)];
        elseif rem(k,N)==0
            n=[spin(k-1) spin(k-N+1) spin(k-N) spin(k+N)];
        elseif fix(k/N)==0
            n=[spin(k-1) spin(k+1) spin(N*N-(N-rem(k,N))) spin(k+N)];
        elseif fix(k/N)==N-1
            n=[spin(k-1) spin(k+1) spin(k-N) spin(rem(k,N))];
        else
            n=[spin(k-1) spin(k+1) spin(k-N) spin(k+N)];
        end
end