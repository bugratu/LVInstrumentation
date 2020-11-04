function [h]=gaussCIR(a1,b1,c1,x)
h=  a1*exp(-((x-b1)/c1).^2);
end