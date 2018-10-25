t = 0:63;
N = 32; //As 2^3
wt = 0:0.01:1;
bt = [1*ones(1,N) zeros(1,N)]; //Data signal
//ct = [0,0,1,1,1,0,1,0,0,1,1,1,0,0,1,1]; //Spreading code
ct_polar = grand(1,64, "bet", 35,40)
for i=1:length(ct_polar)
    if ct_polar(i)>0.45  then
        ct_polar(i)=1
    else
        ct_polar(i)=0
    end 
end

//mt=bt.*ct_polar; //Product signal
mt=bitxor(bt,ct_polar)
Carrier = 2*sin(wt*2*%pi+(%pi/2)); //cos signal with pi/2 phase
st = [];
for i = 1:length(mt)
    st = [st mt(i)*Carrier]; //DSSS Signal
end
figure
subplot(3,1,1)
a=gca();
a.x_location ="origin";
a.y_location ="origin";
a.data_bounds = [0,-2;20,2];
plot2d2([t],bt)
xlabel('t')
title('Data b(t)')
subplot(3,1,2)
a =gca();
a.x_location ="origin";
a.y_location ="origin";
a.data_bounds = [0,-2;20,2];
plot2d2(t,ct_polar ,5)
xlabel('t')
title('Spreading code c(t)')
subplot(3,1,3)
a =gca();
a.x_location ="origin";
a.y_location ="origin";
a.data_bounds = [0,-2;20,2];
plot2d2(t,mt ,5)
xlabel('t')
title('Product Signal m(t)')
figure
subplot(3,1,1)
a =gca();
a.x_location ="origin";
a.y_location ="origin";
a.data_bounds = [0,-2;20,2];
plot2d2(t,mt ,5)
xlabel('t')
title('Product Signal m(t)')
subplot(3,1,2)
a =gca();
a.x_location ="origin";
a.y_location ="origin";
a.data_bounds = [0,-2;20,2];
plot(Carrier)
xlabel('t')
title('Carrier Signal')
subplot(3,1,3)
a =gca();
a.x_location ="origin";
a.y_location ="origin";
a.data_bounds = [0,-2;20,2];
plot(st)
xlabel('t')
title('DS/BPSK signal s(t)')



