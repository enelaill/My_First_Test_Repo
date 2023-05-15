program calc;
uses crt, hello;
type TRec = RECORD
a,b,e, x1, x2, n:real;
a2,b2: SmallInt;
c: real;
d, d1, d2: string;
a3: array [1..30,1..30] of real;
b3: array [1..30,1..30] of real;
c3: array [1..30,1..30] of real;
end;
var p, dis:real;
i,j,n,m,h,k:integer; d: string;
Rec:TRec;
f: file of TRec;
function fact(var n1:real):real;
begin
fact:=1;
while(n1>1) do begin
fact:=fact*n1*(n1-1);
n1:=n1-2;
end;
end;
begin
ClrScr;
assign(f, 'calc.database');
writeln('Do you want to load the history of calculation? (y/n)');
readln(d);

if (d='y') then
begin
reset(f);
read(f,Rec);
close(f);
writeln(Rec.a:3:2,Rec.d,Rec.b:3:2,'=',Rec.c:3:2);
end
else

begin
if (d='n') then
writeln('Ok')
else 
writeln('Uncorrect');
end;

   writeln('Eto calculator. On mozhet vypolnyuat sleduyushie deistviya: "+"-slozhenie,"-"-vychitanie,"*"-proizvedeniye,"/"-delenie,"sq"-kvadratniy korenb,"ln"-naturalbniy logarifm,"mat"-deistvya s matricami,"vec"-deistviya s vectorami, "kv"-reshaet kvadratnoe uravnenie.');
   writeln('Vvedite deistvie: ');
   readln(Rec.d);
   case Rec.d of
        '+': begin writeln('Vvedite 1-oe 4islo: '); readln(Rec.a); writeln('Vvedite 2-oe 4islo: '); readln(Rec.b); Rec.c:=Rec.a+Rec.b; p:=2; end;
        '-': begin writeln('Vvedite 1-oe 4islo: '); readln(Rec.a); writeln('Vvedite 2-oe 4islo: '); readln(Rec.b); Rec.c:=Rec.a-Rec.b; p:=2; end;
        '*': begin writeln('Vvedite 1-oe 4islo: '); readln(Rec.a); writeln('Vvedite 2-oe 4islo: '); readln(Rec.b); Rec.c:=Rec.a*Rec.b; p:=2; end;
        '/': begin writeln('Vvedite 1-oe 4islo: '); readln(Rec.a); writeln('Vvedite 2-oe 4islo: '); readln(Rec.b); Rec.c:=Rec.a/Rec.b; p:=2; end;
        'sq': begin writeln('Vvedite 4islo: '); readln(Rec.a); Rec.c:=sqrt(Rec.a); p:=3; end;
        'ln': begin writeln('Vvedite 4islo: '); readln(Rec.a); Rec.c:=ln(Rec.a); p:=3; end;
        'mat': begin
                write('Vvedite kol-vo strok 1-oy matrici: ');
                readln(n);
                write('Vvedite kol-vo stolbtsov 1-oy matrici i strok 2-oy matrici: ');
                read(m);
                write('Vvedite kol-vo stolbtsov 2-oy matrici: ');

	   readln(h);
                writeln('Vvedite deistvie(pri slozhenii/vychitanii matrici dolzhni bytb kvadratnimi, to estb m=n=h');
                readln(Rec.d1);
                for i:=1 to n do
                 for j:=1 to m do begin
                  write('a[',i,',',j,']=');
                  read(Rec.a3[i,j]);
                  end;
                for i:=1 to m do
                 for j:=1 to h do begin
                  write('b[',i,',',j,']=');
                  read(Rec.b3[i,j]);
                  end;
                writeln;
                for i:=1 to n do begin
                 for j:=1 to m do
                  write(Rec.a3[i,j],' ');
                  writeln;
                  end;
                writeln(Rec.d1);
                for i:=1 to m do begin
                 for j:=1 to h do
                  write(Rec.b3[i,j],' ');
                  writeln;
                  end;
                  writeln('=');
case (Rec.d1) of
'+': begin if (n=h) and (n=m) and (h=m) then begin
        for i:=1 to n do
         for j:=1 to m do begin
          Rec.c3[i,j]:=Rec.a3[i,j]+Rec.b3[i,j];
         end;
for i:=1 to n do begin
 for j:=1 to m do
  write(Rec.c3[i,j]:3:2,' ');
  writeln;
  end;
  end
  else writeln('Error');
 end;
'-': begin if (n=h) and (n=m) and (h=m) then begin
        for i:=1 to n do
         for j:=1 to m do begin
          Rec.c3[i,j]:=Rec.a3[i,j]-Rec.b3[i,j];
         end;
for i:=1 to n do begin
 for j:=1 to m do
  write(Rec.c3[i,j]:3:2,' ');
  writeln;
  end;
  end;
 end;
'*':  begin
        for i:=1 to n do
         for j:=1 to m do begin
          Rec.c3[i,j]:=0;
          for k:=1 to m do
          Rec.c3[i,j]:=Rec.a3[i,j]+Rec.b3[i,j];
         end;
for i:=1 to n do begin
 for j:=1 to m do
  write(Rec.c3[i,j]:3:2,' ');
  writeln;
  end;
  end;
  end;
  p:=5;
  end;
'vec': begin writeln('Vvedite 1-iy vektor'); readln(Rec.a2); writeln('Vvedite 2-oy vektor'); readln(Rec.b2); writeln('Vvedite deistvie: '); readln(Rec.d2);
case Rec.d2 of
  '+': begin Rec.c:=vsum(Rec.a2,Rec.b2); p:=6; end;
  '-': begin Rec.c:=vras(Rec.a2,Rec.b2); p:=6; end;
  '*': begin Rec.c:=vpro(Rec.a2,Rec.b2); p:=6; end;
  '/': begin Rec.c:=vdel(Rec.a2,Rec.b2); p:=6; end;
end;
end;
'!': begin writeln('Vvedite 4islo: '); readln(Rec.a); Rec.c:=fact(Rec.a); p:=4; end;
'kv':  begin writeln('Vvedite 1-iy koefficient: '); readln(Rec.a);writeln('Vvedite 2-iy koefficient: '); readln(Rec.b); writeln('Vvedite 3-iy koefficient: '); readln(Rec.e); dis:=Rec.b*Rec.b-4*Rec.a*Rec.e;
if (dis>=0) then begin Rec.x1:=(-Rec.b+sqrt(dis))/(2*Rec.a); Rec.x2:=(-Rec.b-sqrt(dis))/(2*Rec.a); p:=0; end else p:=1; end;
end;
if(p=2) or (p=3) or (p=4) or (p=5) then
writeln('Resultat:  ', Rec.c:3:1);
if(p=0) then begin
writeln('Korni ravni: ');
writeln('x1= ', Rec.x1:3:1);
writeln('x2= ', Rec.x2:3:1);
end;
if(p=1) then
writeln('Korney net :(');
writeln;






writeln('');
if(p=2) then begin
writeln('4isla: : ', Rec.a:3:1,', ',Rec.b:3:1);
writeln('Result: ', Rec.c:3:1);
writeln('Deistvie: : ', Rec.d);
end;
if(p=3) or (p=4) then begin
writeln('4islo: ', Rec.a:3:1);
writeln('Result: ', Rec.c:3:1);
writeln('Deistvie: ', Rec.d);
end;
if(p=1)or(p=0) then begin
writeln('Koefficients:', Rec.a:3:1,', ',Rec.b:3:1,', ',Rec.e:3:1);
writeln('Korni',Rec.x1:3:1,', ',Rec.x2:3:1);
writeln('Deistvie', Rec.d);
end;
if (p=5) then begin
writeln('Matrica 1: ');
for i:=1 to n do begin
 for j:=1 to m do
  write(Rec.a3[i,j]:3:1,' ');
  writeln;
end;
writeln('Matrica 2: ');
for i:=1 to n do begin
 for j:=1 to m do
  write(Rec.b3[i,j]:3:1,' ');
  writeln;
end;
writeln('Resultiruyushaya matrica: ');
for i:=1 to n do begin
 for j:=1 to m do
  write(Rec.c3[i,j]:3:1,' ');
  writeln;
end;
writeln('Deistvie: ',Rec.d2);
end;
if (p=6) then
begin
   writeln('Vektora: ', Rec.a2,', ',Rec.b2);
   writeln('Result: ', Rec.c);
   writeln('Deistvie: ', Rec.d2);
end;

writeln('Do you want to save the history of calculation? (y/n)');
readln(d);
if (d='y') then
begin
rewrite(f);
write(f,Rec);
close(f);
end
else
begin
if (d='n') then
writeln('Ok')
else 
writeln('Uncorrect');
end;




end.

































