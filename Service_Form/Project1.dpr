program Project1;

uses
  SvcMgr,
  Unit1 in 'Unit1.pas' {Service1: TService},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TService1, Service1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
