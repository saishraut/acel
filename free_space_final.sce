//Free Space Propogation Model

clc;
clear all;

//f=input('Enter the initial input frequency(in MHz)');
f1=input('Enter starting input frequency(in MHz)');
f2=input('Enter final input frequency(in MHz)');
n=input('Enter number of samples:');

dist=input('Enter distance(in Kms.)')
colours = ['r','g','b'];

f=f1;

if(dist<=100) then
    for i=1:n
        d = 1:1:100000;
        Lp=32.45+20*log10(d)+20*log10(f);
        plot(d,Lp,colours(i));
        disp(f);
        f=f1+i.*(f2-f1)/(n-1);
        xlabel('x-->         D (distance in Kms)'); 
        ylabel('y-->         Lp (path loss)'); 
        title('Free space model'); 
//        legend(['freq1','freq2','freq3','freq4','freq5','freq6','freq7','freq8','freq9','freq10']);
        legend(['Lp = f1','Lp = f2','Lp = f3'])
    //    legend([array(i)]);
    end
elif(dist>100)
    disp('Distance out of range');
end