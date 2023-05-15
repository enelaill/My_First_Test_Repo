unit hello;
interface
function vsum(var a1,b1	: integer):real;
function vras(var a1,b1	: integer):real;
function vpro(var a1,b1	: integer):real;
function vdel(var a1,b1	: integer):real;
ImPLEMENTATION
function vsum(var a1,b1	: integer):real;
begin
   vsum:=sqrt(a1*a1+b1*b1);
end; { vsum }
function vras(var a1,b1	: integer):real;
begin
   vras:=sqrt(a1*a1-b1*b1);
end; { vras }
function vpro(var a1,b1	: integer):real;
begin
   vpro:=a1*b1*cos(0);
end; { vpro }
function vdel(var a1,b1	: integer):real;
begin
vdel:=a1*(1/b1)*cos(0);
end; { vdel }
begin
   writeln('shalom');
end.