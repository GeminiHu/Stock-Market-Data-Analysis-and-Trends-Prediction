p = 50;
for i = 1:4
    if i==1
        TPTP ='rigrsure';
        disp(['����',TPTP,'��ѡ��ֵ']);
        [qs,hs1,ss1] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    elseif i == 2
        TPTP = 'heursure';
        disp(['����',TPTP,'��ѡ��ֵ ']);
        [qs,hs2,ss2] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    elseif i == 4
        TPTP = 'sqtwolog';
        disp(['����',TPTP,'��ѡ��ֵ ']);
        [qs,hs3,ss3] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    else
        TPTP = 'minimaxi';
        disp(['����',TPTP,'��ѡ��ֵ ']);
        [qs,hs4,ss4] = Denoise(LPGK,TPTP,3,p);
        disp(' ');
    end
end