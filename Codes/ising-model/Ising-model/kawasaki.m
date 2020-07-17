function [kawa,rand_neaigh]=kawasaki (spin,k,N,p)
  %Performing Kawasaki Dynamics
        n=randi(p); %Selecting random neighbor for site swap
        temp=spin(k);
        switch(n)
            case 1 
                if rem(k,N)==1
                        spin(k)=spin(k+N-1);
                        spin(k+N-1)=temp;
                else
                    spin(k)=spin(k-1);
                    spin(k-1)=temp;
                end
                
                
            case 2
                if rem(k,N)==0
                        spin(k)=spin(k-N+1);
                        spin(k-N+1)=temp;
                else
                    spin(k) = spin(k+1);
                    spin(k+1)=temp;
                end
              
                
            case 3 
                if fix(k/N)==0
                        spin(k)=spin(N*N-(N-rem(k,N)));
                        spin(N*N-(N-rem(k,N)))=temp;
                elseif fix(k/N)==1
                            spin(k)=spin(N*N);
                            spin(N*N)=temp;
                else
                    spin(k)=spin(k-N);
                    spin(k-N)=temp;
                end
               
                
            case 4 
                if fix(k/N)==N-1
                    if rem(k,N)==0
                        spin(k)=spin(k+N);
                        spin(k+N)=temp;
                    else
                        spin(k)=spin(rem(k,N));
                        spin(rem(k,N))=temp;
                    end
                elseif fix(k/N)==N
                     spin(k)=spin(N);
                    spin(N)=temp;
                else
                    spin(k)=spin(k+N);
                    spin(k+N)=temp;
                end
                
            case 5
                if rem(k,N)==1
                        spin(k)=spin(k+N-1);
                        spin(k+N-1)=temp;
                else
                    spin(k)=spin(k-1);
                    spin(k-1)=temp;
                end
                if fix(k/N)==0
                        spin(k)=spin(N*N-(N-rem(k,N)));
                        spin(N*N-(N-rem(k,N)))=temp;
                elseif fix(k/N)==1
                            spin(k)=spin(N*N);
                            spin(N*N)=temp;
                else
                    spin(k)=spin(k-N);
                    spin(k-N)=temp;
                end
            case 6
                if rem(k,N)==1
                        spin(k)=spin(k+N-1);
                        spin(k+N-1)=temp;
                else
                    spin(k)=spin(k-1);
                    spin(k-1)=temp;
                end
                if fix(k/N)==0
                        spin(k)=spin(N*N-(N-rem(k,N)));
                        spin(N*N-(N-rem(k,N)))=temp;
                elseif fix(k/N)==1
                            spin(k)=spin(N*N);
                            spin(N*N)=temp;
                else
                    spin(k)=spin(k-N);
                    spin(k-N)=temp;
                end
            case 7
                if rem(k,N)==0
                        spin(k)=spin(k-N+1);
                        spin(k-N+1)=temp;
                else
                    spin(k) = spin(k+1);
                    spin(k+1)=temp;
                end
                if fix(k/N)==N-1
                    if rem(k,N)==0
                        spin(k)=spin(k+N);
                        spin(k+N)=temp;
                    else
                        spin(k)=spin(rem(k,N));
                        spin(rem(k,N))=temp;
                    end
                elseif fix(k/N)==N
                     spin(k)=spin(N);
                    spin(N)=temp;
                else
                    spin(k)=spin(k+N);
                    spin(k+N)=temp;
                end
            case 8
                if fix(k/N)==N-1
                    if rem(k,N)==0
                        spin(k)=spin(k+N);
                        spin(k+N)=temp;
                    else
                        spin(k)=spin(rem(k,N));
                        spin(rem(k,N))=temp;
                    end
                elseif fix(k/N)==N
                     spin(k)=spin(N);
                    spin(N)=temp;
                else
                    spin(k)=spin(k+N);
                    spin(k+N)=temp;
                end
                if rem(k,N)==1
                        spin(k)=spin(k+N-1);
                        spin(k+N-1)=temp;
                else
                    spin(k)=spin(k-1);
                    spin(k-1)=temp;
                end
                
        end
        
        kawa=spin;
        rand_neaigh=n;
end
