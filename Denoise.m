function [qs,hs,ss] = Denoise(s,TPTP,lev,p)
%=============================
%画出原始信号
subplot(2,2,1);
plot(s);
title('原始信号');
%=============================
%用db2小波对原始信号进行3层分解并提取系数
[c,l]=wavedec(s,3,'db2');
a3=appcoef(c,l,'db2',3);
d3=detcoef(c,l,3);
d2=detcoef(c,l,2);
d1=detcoef(c,l,1);
%=============================
%对信号进行强制性消噪处理并图示结果
dd3=zeros(1,length(d3));
dd2=zeros(1,length(d2));
dd1=zeros(1,length(d1));
c1=[a3 dd3 dd2 dd1];
qs=waverec(c1,l,'db2');
subplot(2,2,2);
plot(qs);grid;
title('强制消噪后的信号');
%硬阀值消噪
hs = wden(s,TPTP,'h','mln',lev,'db2');
subplot(2,2,3);
plot(hs);
grid on;
title('硬阈值消噪后的信号');
%软阀值消噪
ss = wden(s,TPTP,'s','mln',lev,'db2');
subplot(2,2,4);
plot(ss);
grid on;
title('软阈值消噪后的信号');
%输出噪声评估
% [qSNR,qRMSE] = DNE(qs,s);
[qme,qstde,qe] = compare(qs,p);
% [hSNR,hRMSE] = DNE(hs,s);
[hme,hstde,he] = compare(hs,p);
% [sSNR,sRMSE] = DNE(ss,s);
[sme,sstde,se] = compare(ss,p);
disp(['     ','   强制去噪   ','   硬阀值去噪   ','   软阀值去噪']);
% disp(['SNR','     ',num2str(qSNR),'      ',num2str(hSNR),'        ',num2str(sSNR)]);
% disp(['RMSE','    ',num2str(qRMSE),'       ',num2str(hRMSE),'         ',num2str(sRMSE)]);
disp(['ME  ','    ',num2str(qme),'    ',num2str(hme),'         ',num2str(sme)]);
disp(['MAX','     ',num2str(max(qe)),'       ',num2str(max(he)),'        ',num2str(max(se))]);
disp(['MIN ','    ',num2str(min(qe)),'   ',num2str(min(he)),'       ',num2str(min(se))]);
disp(['STDE','    ',num2str(qstde),'     ',num2str(hstde),'         ',num2str(sstde)]);

