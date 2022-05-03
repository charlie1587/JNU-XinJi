function s=connect_sets(a,b,sets)
posa=0;
posb=0;
lena=0;
lenb=0;
[len,s]=size(sets);
%找a\b
for i=1:len
    for j=1:s
        if sets(i,j)==a
            posa=i;
        end
    end
end
for i=1:len
    for j=1:s
        if sets(i,j)==b
            posb=i;
        end
    end
end

if posa==posb
    s=sets;
    return;
end

%计算lena\lenb
for i=1:s
    if sets(posa,i)>0
        lena=lena+1;
    end
end
for i=1:s
    if sets(posb,i)>0
        lenb=lenb+1;
    end
end
sets(posa,:)=[sets(posa,1:lena),sets(posb,1:lenb),zeros(1,s-lena-lenb)];
sets(posa,:)=[sort(sets(posa,1:lena+lenb)),zeros(1,s-lena-lenb)];
sets(posb,:)=[];
s=sets;
end