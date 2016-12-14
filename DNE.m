function [SNR,RMSE] = DNE(dn_s,s)
%De-Noise Evaluation
SNR = 10*log2(sum(s.^2)/sum((s-dn_s).^2));
RMSE = sqrt(mean((s-dn_s).^2));