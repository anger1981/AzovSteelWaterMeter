unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs;

type
  TService1 = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  Service1: TService1;
  hListWM_srv: THandle;

implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  Service1.Controller(CtrlCode);
end;

function TService1.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TService1.ServiceStart(Sender: TService; var Started: Boolean);
var
 SI : TStartupInfo;
 PI : TProcessInformation;
begin
ZeroMemory(@si,SizeOf(si));
si.cb := SizeOf(si);
si.dwFlags := STARTF_USESHOWWINDOW;
si.wShowWindow := SW_SHOWNORMAL;
//ShowMessage('Start_Service');
CreateProcess(nil, 'F:\Base\azovstal\Listing_WM_srv.exe', nil, nil, false,
 CREATE_NEW_CONSOLE, nil, 'F:\Base\azovstal\', SI, PI);
 hListWM_srv := PI.hProcess;
end;

procedure TService1.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
   TerminateProcess(hListWM_srv, 555);
end;

end.
