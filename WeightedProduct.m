opts = detectImportOptions('Dataset real estate.xlsx');
opts.SelectedVariableNames = [3 4 5 8];
% Mengambil data rating kecocokan dari dataset
DATA = readmatrix('Dataset real estate.xlsx',opts); 

%atribut dari setiap kriteria, nilai 1, yang berarti atrribut benefit, dan 0 berarti atribut cost
k = [0,0,1,0]; 

%Nilai bobot merupakan kriteria (1=sangat buruk, 2=buruk, 3=cukup, 4=tinggi, 5=sangat tinggi)
w = [3,5,4,1];

%membagi bobot setiap kriteria dengan jumlah(total) dari seluruh bobot
w = w./sum(w);

%perhitungan vektor(S) setiap baris (alternatif)
for b=1:4,
    if k(b)==0, w(b)=-1*w(b);
    end;
end;

for a=1:50,
    S(a)=prod(DATA(a,:).^w);
end;

%melakukan perangkingan 
V = S/sum(S);


[nilaiterbesar, letak]= max(V); %pencarian nilai terbesar dan indeks nilai tersebut

%membuat variabel 'hasil' untuk menampung hasil yang akan ditampilkan ke
%command window
hasil =  ['Nilai terbesarnya adalah ',num2str(nilaiterbesar),'. Nilai tersebut terletak di data ke '
    ,num2str(letak)];

%menampilkan hasil ke command window
disp (hasil);

