function [n,p]=neighbor8(spin,k,N)
p=8;
%Creating Neighborhood based on Periodic BCs
        if k==1
            n=[spin(N) spin(k+1) spin(N*N-N) spin(k+N) spin(N*N) ...
                spin(N*N-(N-k-1)) spin(k+1+N) spin(N+N)];
        elseif k==N
            n=[spin(N-1) spin(1) spin(N*N) spin(k+N) spin(N*N-1) ...
                spin(N*N-N+1) spin(N+1) spin(N+N-1)];
        elseif k==N*N-N+1
            n=[spin(N*N) spin(k+1) spin(k-N) spin(1) spin(k-1) ...
                spin(k-N+1) spin(rem(k+1,N)) spin(N)];
        elseif k==N*N
            n=[spin(k-1) spin(k+1-N) spin(k-N) spin(N) spin(N*N-N-1) ...
                spin(k-N-fix((k-N)/N)) spin(1) spin(rem(k-1,N))];
        elseif rem(k,N)==1
            n=[spin(k+N-1) spin(k+1) spin(k-N) spin(k+N) spin(k-1) ...
                spin(k-N+1) spin(k+N+1) spin(k+N+N-1)];
        elseif rem(k,N)==0
            n=[spin(k-1) spin(k-N+1) spin(k-N) spin(k+N) spin(k-N-1) ...
                spin(k-N-N+1) spin(k+1) spin(k+N-1)];
        elseif fix(k/N)==0
            n=[spin(k-1) spin(k+1) spin(N*N-(N-rem(k,N))) spin(k+N) spin(N*N-N+rem(k-1,N)) ...
                spin(N*N-N+rem(k,N)+1) spin(k+N+1) spin(k-1+N)];
        elseif fix(k/N)==N-1
            if k+1==N*N
                n=[spin(k-1) spin(k+1) spin(k-N) spin(rem(k,N)) spin(k-1-N) ...
                spin(k+1-N) spin(rem(k,N)+1) spin(rem(k-1,N))];
            else
            n=[spin(k-1) spin(k+1) spin(k-N) spin(rem(k,N)) spin(k-1-N) ...
                spin(k+1-N) spin(rem(k+1,N)) spin(rem(k-1,N))];
            end
        else
            n=[spin(k-1) spin(k+1) spin(k-N) spin(k+N) spin(k-1-N) ...
                spin(k+1-N) spin(k+1+N) spin(k-1+N)];
        end
end