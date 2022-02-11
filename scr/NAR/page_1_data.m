global y_1 y_2 t_span_1

Z = eye(12,12);

B1 = [-1  1  0  0  0  0  0  0  0  0 -1  1  0  0  0  0  0  0;  %B
       0  0  0  0  0  0 -1  1  0  0  1 -1  0  0  0  0  0  0;  %A
       0  0  0  0  0  0  0  0  0  0  0  0  0  0 -1  1  0  0;  %I
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;  %D
       1 -1 -1  1  0  0  0  0  0  0  0  0 -1  1  0  0  0  0;  %BL
       0  0  0  0  0  0  1 -1 -1  1  0  0  1 -1  0  0  0  0;  %AL
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 -1 -1  1;  %IL
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;  %DL
       0  0  1 -1 -1  1  0  0  0  0  0  0  0  0  0  0  0  0;  %BLL
       0  0  0  0  1 -1  0  0  1 -1  0  0  0  0  0  0  0  0;  %ALL
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 -1;  %ILL
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0]; %DLL

B2 = [ 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;  %B
      -1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0;  %A
       1 -1  0  0  0  0  0  0  0  0 -1  1  0  0  0  0;  %I
       0  0  0  0  0  0 -1  1  0  0  1 -1  0  0  0  0;  %D
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;  %BL
       0  0 -1  1  0  0  0  0  0  0  0  0  0  0  0  0;  %AL
       0  0  1 -1  0  0  0  0  0  0  0  0 -1  1  0  0;  %IL
       0  0  0  0  0  0  1 -1 -1  1  0  0  1 -1  0  0;  %DL
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;  %BLL
       0  0  0  0 -1  1  0  0  0  0  0  0  0  0  0  0;  %ALL
       0  0  0  0  1 -1  0  0  0  0  0  0  0  0 -1  1;  %ILL
       0  0  0  0  0  0  0  0  1 -1  0  0  0  0  1 -1]; %DLL           

B = [B1 B2];

k_0 = [3000.000; 8000.000; 1500.000; 16000.000; 30000.000;   700.000; 
       3000.000;    8.640; 1500.000;    17.280;     0.540; 10800.000; 
        130.000; 2740.000; 3000.000;     4.000;  1500.000;     8.000;    
         19.700;    3.740;   19.850;     1.740;    20.000;     0.810; 
       3000.000;    4.000; 1500.000;     8.000;     0.050;     0.001;    
          0.050;    0.001;    0.050;     0.001];

x_0 = [100; 0; 20; 0; 0; 8; 0; 4; 3; 0; 5; 9];

T = 0.99*10^(-2);

mu_1 = 9;

t_span_1 = 0:T/mu_1:T;

[t_1, x_1] = Concentrations (k_0, Z, B, x_0, t_span_1);

H = [1     0     0     0     0     0     0     0     0     0     0     0;
     0     1     0     0     0     0     0     0     0     0     0     0;
     0     0     1     0     0     0     0     0     0     0     0     0;
     0     0     0     1     0     0     0     0     0     0     0     0];

[s,c] = size(Z);

[n,~] = size(H);

[~,r] = size(B);

y_1 = H*x_1;

y_2 = Perturbation (y_1, 2*10^(-4));

figure(1)
for j = 1:n
    subplot(2,2,j)
    plot(t_1, y_1(j,:), 'x', 'color', 'r', 'linewidth', 1.5)
    hold on
    plot(t_1, y_2(j,:), 'x', 'color', 'b', 'linewidth', 1.5)
    grid on
    grid minor
    caption1 = sprintf('Experimental data');
    caption2 = sprintf('predicted values');
    caption3 = sprintf('Species %d', j);
    legend(caption1)%, caption2) 
    xlabel({'Time (min)'}, 'fontweight','bold', 'Fontsize', 11)
    ylabel(caption3, 'fontweight','bold', 'Fontsize', 12)
end
suptitle('Time-series experimental data for parameter estimation') 

 pp = Reduced_Parameters (k_0, B, [5:12])
