nx = 50;
ny = 50;

G = sparse(nx*ny,nx*ny)

for i = 1:nx
    for j = 1:ny
        n = j + (i-1) * ny; % mapping equation
        if i == 1 || j ==1 || i == nx || j == ny
            G(n,:)=0;
            G(n,n)=1;
        elseif i>10 && i<20 && j>10 && j<20
            G(n,n)=-2;
            G(n,n+ny)=1;
            G(n,n-ny)=1;
            G(n,n+1)=1;
            G(n,n-1)=1;
        else
            G(n,n)=-4;
            G(n,n+ny)=1;
            G(n,n-ny)=1;
            G(n,n+1)=1;
            G(n,n-1)=1;
        end 
    end
end
figure (1)
spy(G)
grid on

figure (2)
[E,D] = eigs(G,9,'SM');
eigenvalues = diag(D);
plot(eigenvalues)
grid on

for i = 1:nx
    for j = 1:ny
        n = j+(i-1)*ny;
        for x =1:9
            Emap(i,j,x) = E(n,x);
        end
    end
end

for x = 1:9
    figure(3)
    subplot(3,3,x)
    surf(Emap(:,:,x)) 
end

