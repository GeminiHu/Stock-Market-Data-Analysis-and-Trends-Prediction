p = 50;
for i = 1:4
    if i==1
        TPTP ='rigrsure';
        disp(['采用',TPTP,'法选择阀值']);
        [qs,hs1,ss1] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    elseif i == 2
        TPTP = 'heursure';
        disp(['采用',TPTP,'法选择阀值 ']);
        [qs,hs2,ss2] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    elseif i == 4
        TPTP = 'sqtwolog';
        disp(['采用',TPTP,'法选择阀值 ']);
        [qs,hs3,ss3] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    else
        TPTP = 'minimaxi';
        disp(['采用',TPTP,'法选择阀值 ']);
        [qs,hs4,ss4] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    end
end