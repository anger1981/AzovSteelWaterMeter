unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit1, DB, IBCustomDataSet, IBQuery, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, DbChart, StdCtrls, IBDatabase;

type
  TForm2 = class(TForm)
    DBChart1: TDBChart;
    Series1: TLineSeries;
    NS3P_500: TIBQuery;
    NS3P_600: TIBQuery;
    NS2P_600: TIBQuery;
    NS2P_500: TIBQuery;
    Series4: TLineSeries;
    DBChart2: TDBChart;
    LineSeries1: TLineSeries;
    DBChart3: TDBChart;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    Button1: TButton;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    IBTransaction1: TIBTransaction;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation



{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
NS2P_500.Active := false;
NS2P_600.Active := false;
NS3P_500.Active := false;
NS3P_600.Active := false;

IBTransaction1.Commit;

Form2.Hide;
end;

end.
