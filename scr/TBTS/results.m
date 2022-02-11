global y_1 t_1 Z B H x_0 T y_2
[n,~] = size(H);
[s,~] = size(Z);
t_interval = 0:T/1000:T;
Lambda_1 = y_1;
Lambda_2 = y_2;
t_span_1 = t_1;
k_hat = [44.1001812369965;16.7530728136686;8.71104028856596;16.4577558972536;58.5546254924188;62.8530810586355;13.8147563474858;52.2815504355572;1.82733969910924;11.7958827122932;85.8926178394226;54.9414534251805;86.3749425451507;74.2372703137494;51.5885008229849;89.7100849193782;85.8912304083146;101.020302844855;2.91129938228609;93.7565884425309;52.6466457444956;106.583013346364;29.7197987151476;53.8979406308700;67.2479074187253;0.00555889555347222;24.7438808186125;100.829278500441;18.1013806461810;1.73967812023928;4.13342227357129;5.01412400692883;1.15044215329305;56.1956864452353;21.4817468570098;60.6396880020459;68.2010509318223;71.0124486686355;90.1294316973645;97.8240881731874;77.2769679603293;55.6608223477451;94.6713475712381;55.9308735661437;5.81163717754815;10.3061415093679;87.7271851923759;48.0844167739113;84.9189855744526;1.77201581726746;51.0507154575059;62.8506869452450;2.25725167194580;1.60547233033573;1.35025692881560;2.43551574724021;5.64374784443062;0.472182406890229;0.968113876154672];
[t_2, x_2] = Concentrations (k_hat, Z, B, x_0, t_interval);
z_2 = H*x_2;
[~,r] = size(B);
k = sym('k', [r 1]);
I_del = Deleted_Complexes (H, Z);
phi_k =  Reduced_Parameters (k, B, I_del);
L_red = Schur (k_hat, B, I_del);
B_red = Reduced_Incidence (L_red);
Z_red = Reduced_Complex_Composition(Z, I_del);
X = sym('X',[s 1]);
X_red = X([1:8,22]);
C = simplify(exp(Z'*log(X)));
reactions = -B'*C;
C_red = simplify(exp(Z_red'*log(X_red)));
reactions_red = -B_red'*C_red;
p_hat = [2.29473446957270;4.62001356740665;8.51191785561307;0.0409425024892612;7.85248854675425;2.97761905114328;3.26434515234032;9.02297548915860;2.52133072391536;4.94303038439022;0.836175440033110;5.45798333290886;3.11722146360337;8.86805406985797;2.33872279060858];
Order = [14 15 4 12 2 5 3 6 9 13 7 10 8 11 1];
reactions_red = reactions_red(Order);
P_hat = p_hat(Order);
y_0 = x_0;
y_0(I_del) = [];

[t_3, x_3] = Concentrations (p_hat, Z_red, B_red, y_0, t_interval);
z_3 = x_3;

syms P S XQ XQB XQR XC XCB XCR E
X = [P; S; XQ; XQB; XQR; XC; XCB; XCR; E];

figure(1)
for i = 1:n
    subplot(3,3,i)
    y_i = Lambda_2(i,:);
    z_i = z_3(i,:);
    plot(t_span_1, y_i, 'x', 'color', 'k', 'linewidth', 1)
    hold on
    plot(t_interval, z_i, 'color', 'k', 'linewidth', 1)
    caption1 = sprintf('Experimental data');
    caption2 = sprintf('Predicted values');
    X_i = char(X(i));
    caption4 = sprintf('Concentration');
    caption3 = sprintf('Reduced model');
    legend(caption1, caption2) 
    xlabel({'Time (sec)'}, 'fontweight','bold', 'Fontsize', 11)
    ylabel(caption4, 'fontweight','bold', 'Fontsize', 12)
    title(X_i, 'fontweight','bold', 'Fontsize', 12)
end

figure(2)
for i = 1:n
    subplot(3,3,i)
    y_i = Lambda_2(i,:);
    z_i = z_2(i,:);
    plot(t_span_1, y_i, 'x', 'color', 'k', 'linewidth', 1)
    hold on
    plot(t_interval, z_i, 'color', 'k', 'linewidth', 1)
    caption1 = sprintf('Experimental data');
    caption2 = sprintf('Predicted values');
    X_i = char(X(i));
    caption4 = sprintf('Concentration');
    caption3 = sprintf('Reduced model');
    legend(caption1, caption2) 
    xlabel({'Time (sec)'}, 'fontweight','bold', 'Fontsize', 11)
    ylabel(caption4, 'fontweight','bold', 'Fontsize', 12)
    title(X_i, 'fontweight','bold', 'Fontsize', 12)
end
%suptitle('Parameter estimation')
