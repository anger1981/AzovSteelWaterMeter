unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP, ExtCtrls, DB, IBDatabase, StdCtrls, IBSQL, StrUtils, Math;

type
  TForm1 = class(TForm)
    ftp: TIdFTP;
    Timer_FTP: TTimer;
    IBDatabase1: TIBDatabase;
    Timer_BD: TTimer;
    IBTransaction1: TIBTransaction;
    Memo1: TMemo;
    NS3P_500: TIBSQL;
    NS3P_600: TIBSQL;
    NS2P_500: TIBSQL;
    NS2P_600: TIBSQL;
    Button1: TButton;
    IBTransaction2: TIBTransaction;
    ins_r500: TIBSQL;
    ins_r600: TIBSQL;
    upd_r500: TIBSQL;
    upd_r600: TIBSQL;
    procedure Timer_FTPTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer_BDTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    //function FileNameAsDateCmp(List: TStringList; Index1, Index2: Integer): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ms:  TMemoryStream;
  Path, Path_reserv: string;


implementation

{$R *.dfm}

function FileNameAsDateCmp(List: TStringList; Index1, Index2: Integer): Integer;
var
filename, filenameDT: string; //строка в файле
DT1, DT2: TDateTime;
begin
    //Result := 0;
    filename := copy(List[Index1],0,pos('.txt',List[Index1]) - 1);
    filenameDT := StringReplace(filename, '-', '.', [rfReplaceAll, rfIgnoreCase]);
    filenameDT := StringReplace(filenameDT, '_', ':', [rfReplaceAll, rfIgnoreCase]);
    DT1 := StrToDateTime(filenameDT);
    filename := '';
    filenameDT := '';

    filename := copy(List[Index2],0,pos('.txt',List[Index2]) - 1);
    filenameDT := StringReplace(filename, '-', '.', [rfReplaceAll, rfIgnoreCase]);
    filenameDT := StringReplace(filenameDT, '_', ':', [rfReplaceAll, rfIgnoreCase]);
    DT2 := StrToDateTime(filenameDT);
    filename := '';
    filenameDT := ''; 

    //if DT1 > DT2 then Result := 1
    //else  Result := -1;

    Result := CompareValue(DT1,DT2);

end;

procedure TForm1.Timer_FTPTimer(Sender: TObject);

var

  FileList :  TStringList;

  jj: Integer;

begin

 ms:=TMemoryStream.Create;

  try

    try

      ftp.Disconnect;

      ftp.Host:='62.221.58.140';// ftp адрес сервера

      ftp.Port:=21;

      ftp.Username:='extvodomer';//логин

      ftp.Password:='ohquaeD8Iepi8E';//Пароль

      ftp.Connect(true, 2000);

      ftp.Passive := true;

      ftp.Connected;

      //ftp.ChangeDir('/2');//Установить папку на сервере

      FileList := TStringList.Create;

     ftp.List(FileList,'*.txt',False);

     for jj := 0 to FileList.Count-1 do

     begin
       try
         ftp.Get(FileList[jj], Path + FileList[jj], false); //true
         ftp.Delete(FileList[jj]);
       except
         on E: Exception do
           ShowMessage(Format('Ошибка скачивания',[FileList[jj], E.ClassName, E.Message]));
       end;
     end;
      

    finally

      ms.Free;

    end;

  except

    //ShowMessage('Неудачная попытка отправки файла на сервер');

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Path := GetCurrentDir + '\copy\';
 Path_reserv := GetCurrentDir + '\reserv\';
end;

procedure TForm1.Timer_BDTimer(Sender: TObject);
var
List: TStringList;
sr: TSearchRec;
stf, stf1, stf2, filename, filenameDT: string; //строка в файле
F: Textfile;
DT: TDateTime;
p621, p622, p623, p624, p625, p1067, p228, p229, p230, p231 : Variant; //:Extended;
i, par_ind: integer;
begin

try
IBTransaction1.Active := true;

    List := TStringList.Create;

    if FindFirst(path + '*.*', faAnyFile, sr) = 0
    then begin
      repeat
        if ((sr.Name<>'.') And (sr.Name<>'..'))
        then begin
          List.Add(sr.Name);
        end;
      until FindNext(sr) <> 0;
    end;

    List.CustomSort(FileNameAsDateCmp);





  if list.Count = 0 then exit;

  For I:=0 To List.Count - 1 Do
  begin
    AssignFile(f, Path + List[I]);
    filename := copy(List[I],0,pos('.txt',List[I]) - 1);
    filenameDT := StringReplace(filename, '-', '.', [rfReplaceAll, rfIgnoreCase]);
    filenameDT := StringReplace(filenameDT, '_', ':', [rfReplaceAll, rfIgnoreCase]);
    DT := StrToDateTime(filenameDT);
    memo1.Lines.Add('');
    memo1.Lines.Add(DateTimeToStr(DT));
    Reset(f); 
    
      p621 := null;
      p622 := null;
      p623 := null;
      p624 := null;
      p625 := null;
      p1067:= null;
      p228 := null;
      p229 := null;
      p230 := null;
      p231 := null;

    While not EOF(f) do // пока не конец файла делать цикл:
      begin

      ReadLn(f,stf); // читать из файла строку
      //memo1.Lines.Add(stf);
      stf :=  StringReplace(stf, ' ', chr(9), [rfReplaceAll, rfIgnoreCase]);
      //memo1.Lines.Add(stf);
      stf1 := copy(stf,0,pos(chr(9), stf) - 1);
      stf2 := copy(stf,pos(chr(9),stf),length(stf));
      while copy(stf2, 1, 1) = chr(9) do stf2 := copy(stf2, 2, length(stf2));
      par_ind := AnsiIndexStr(stf1, ['621', '622', '623', '624', '625', '1067', '228', '229', '230', '231']);
      case par_ind of
      0 :  p621 := stf2; // StrToFloat(stf2);
      1 :  p622 := stf2; // StrToFloat(stf2);
      2 :  p623 := stf2; // StrToFloat(stf2);
      3 :  p624 := stf2; // StrToFloat(stf2);
      4 :  p625 := stf2; // StrToFloat(stf2);
      5 :  p1067:= stf2; // StrToFloat(stf2);
      6 :  p228 := stf2; // StrToFloat(stf2);
      7 :  p229 := stf2; // StrToFloat(stf2);
      8 :  p230 := stf2; // StrToFloat(stf2);
      9 :  p231 := stf2; // StrToFloat(stf2);
      end;

      

      stf1 := '';
      stf2 := '';
      stf := '';
      //ShowMessage(st); // выводить строку пользователю
      end;


        NS3P_500.ParamByName('DT').AsDateTime := DT;
        NS3P_500.ParamByName('p621').Value := p621;
        NS3P_500.ParamByName('p622').Value := p622;
        NS3P_500.ParamByName('p623').Value := p623;
        NS3P_500.ExecQuery;



        NS3P_600.ParamByName('DT').AsDateTime := DT;
        NS3P_600.ParamByName('p624').Value := p624;
        NS3P_600.ParamByName('p625').Value := p625;
        NS3P_600.ParamByName('p1067').Value := p1067;
        NS3P_600.ExecQuery;



        NS2P_500.ParamByName('DT').AsDateTime := DT;
        NS2P_500.ParamByName('p228').Value := p228;
        NS2P_500.ParamByName('p229').Value := p229;
        NS2P_500.ExecQuery;



        NS2P_600.ParamByName('DT').AsDateTime := DT;
        NS2P_600.ParamByName('p230').Value := p230;
        NS2P_600.ParamByName('p231').Value := p231;
        NS2P_600.ExecQuery;




      {if (p621 <> 0) or (p622 <> 0) or (p623 <> 0) then
      begin
        NS3P_500.ParamByName('DT').AsDateTime := DT;
        NS3P_500.ParamByName('p621').AsFloat := p621;
        NS3P_500.ParamByName('p622').AsFloat := p622;
        NS3P_500.ParamByName('p623').AsFloat := p623;
        NS3P_500.ExecQuery;
      end;

      if (p624 <> 0) or (p625 <> 0) or (p1067 <> 0) then
      begin
        NS3P_600.ParamByName('DT').AsDateTime := DT;
        NS3P_600.ParamByName('p624').AsFloat := p624;
        NS3P_600.ParamByName('p625').AsFloat := p625;
        NS3P_600.ParamByName('p1067').AsFloat := p1067;
        NS3P_600.ExecQuery;
      end;

      if (p228 <> 0) or (p229 <> 0) then
      begin
        NS2P_500.ParamByName('DT').AsDateTime := DT;
        NS2P_500.ParamByName('p228').AsFloat := p228;
        NS2P_500.ParamByName('p229').AsFloat := p229;
        NS2P_500.ExecQuery;
      end;

      if (p230 <> 0) or (p231 <> 0) then
      begin
        NS2P_600.ParamByName('DT').AsDateTime := DT;
        NS2P_600.ParamByName('p230').AsFloat := p230;
        NS2P_600.ParamByName('p231').AsFloat := p231;
        NS2P_600.ExecQuery;
      end; }

      CloseFile(f);
      CopyFile(pchar(Path + List[I]), pchar(Path_reserv + List[I]), true);
      DeleteFile(Path + List[I]);
  end;    

except
List.Free;
end;

List.Destroy;

IBTransaction1.Commit;

IBTransaction2.Active := true;

ins_r500.ExecQuery;
ins_r600.ExecQuery;

IBTransaction2.Commit;

IBTransaction2.Active := true;

upd_r500.ExecQuery;
upd_r600.ExecQuery;

IBTransaction2.Commit;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Timer_FTP.Enabled := false;
Timer_BD.Enabled := false; 
end;

end.
