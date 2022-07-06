clear all;
clc;

Ti = 230; //Temperatura Inicial
Tl = 90;  //Ponto de ebulição do último efeito
U1 = 2500; //coef. 1 unidade em Watt/(metro^2)*Celsius
U2 = 2000; //coef. 2
U3 = 1000; //coef. 3 

//queda total da temperatura:
delta_T = Ti - Tl;

//a temperatura cai em vários efeitos será
//aproximadamente inversamente proporcional aos coeficientes, logo:

delta_T1 = 1/U1/(1/U1+1/U2+1/U3)*delta_T; 
delta_T2 = 1/U2/(1/U1+1/U2+1/U3)*delta_T;
delta_T3 = 1/U3/(1/U1+1/U2+1/U3)*delta_T;

// Conseqüentemente os pontos de ebulição serão:

Te1 = Ti - delta_T1;
Te2 = Te1 - delta_T2;

//linha reta para demonstrar no gráfico
Temp1 = linspace (Ti,Te1) ;
Temp2 = linspace (Tl,Te2) ;

//plotagem gráfico
plot(Temp1, 'r')
//bar(Temp1, 'r')

plot(Temp2,'g')
//bar(Temp2, 'g')
xgrid()
xlabel('°C final')
ylabel('°C inicial')
legend('Temperatura 1','Temperatura 2')
title('Gráfico de Correção de Temperatura:')

disp('O ponto de ebulição no primeiro ponto é:',Te1,'°C ')
disp('O ponto de ebulição no segundo ponto é:',Te2,'°C ')

