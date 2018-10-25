clc ;
clear all ;
hb =30; // Height of BS antenna in metres
hm =2; // height of mobile antenna in metres
hr =30;
fc=input('enter the operating frequency(MHz):');
dis= input('enter the distance in Km:');
if (dis>100) then
	disp("None of the model can be used")
end


if (dis<=10) then
	for i=1:5
    	d= 0.1:0.1:dis;
    	Lu=(69.55 + 26.16*log10(fc)-13.82*log10(hb)+ (44.9-6.55*log10(hb))*log10(d));
    	figure(1);
    	if (i==1) then
        	plot(d,Lu,'b');
    	end
    	if (i==2) then
        	plot(d,Lu,'r');
    	end
    	if (i==3) then
        	plot(d,Lu,'g');
    	end
    	if (i==4) then
        	plot(d,Lu,'y');
    	end
    	if (i==5) then
        	plot(d,Lu,'black');
    	end
    	fc=fc+50;
    	xlabel("Distance between BS and MS(Km)");
    	ylabel("Path loss(dB)");
    	title("Hata Propagation Model")
	end
	hl=legend(['150MHz';'200MHz';'250MHz';'300MHz';'350MHz']);
    	//disp(Lu);
elseif (dis<=100 & dis>10)
	for i=1:5
    	d=10:0.1:dis;
    	Lo=(32.45+ 20*log10(d)+20*log10(fc))-((1.1* log10( fc ) -0.7) * hm -(1.56* log10 ( fc ) -0.8));
    	figure(2);
    	if (i==1) then
        	plot(d,Lo,'b');
    	end
    	if (i==2) then
        	plot(d,Lo,'r');
    	end
    	if (i==3) then
        	plot(d,Lo,'g');
    	end
    	if (i==4) then
        	plot(d,Lo,'y');
    	end
    	if (i==5) then
        	plot(d,Lo,'black');
    	end
    	fc=fc+50;
    	xlabel("Distance between BS and MS(Km)");
    	ylabel("Path loss(dB)");
    	title("Okumura Propagation Model")
    	//disp(Lo);
end
hl=legend(['150MHz';'200MHz';'250MHz';'300MHz';'350MHz']);
end


