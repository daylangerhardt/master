unit mFinCobrancaRetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoMDI, cxGraphics, cxControls, dxStatusBar, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxProgressBar, cxListBox, cxMemo,
  cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, cxContainer, cxEdit, cxGroupBox,
  DB, FileCtrl, DBClient, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, FMTBcd, SqlExpr, gbCobranca, Provider,
  cxLookAndFeels;

type
  TMovFinCobrancaRetorno = class(TFrmPadraoMDI)
    Panel2: TPanel;
    BtnImportar: TcxButton;
    BtnSair: TcxButton;
    cxGroupBox1: TcxGroupBox;
    EdtNM_PASTA_IMPORT: TcxButtonEdit;
    cxLabel2: TcxLabel;
    Bevel3: TBevel;
    MmoArquivo: TcxMemo;
    LblAndamento: TcxLabel;
    Bevel2: TBevel;
    PrbProgresso: TcxProgressBar;
    SQLQuery: TSQLQuery;
    CdsRomaneioNota: TClientDataSet;
    DlgArquivo: TOpenDialog;
    gbCobranca: TgbCobranca;
    BtnRelCritica: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCaminhoArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnImportarClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);

  private
    { Private declarations }

    FContRegistro: Integer;

    FCidade : Integer;

    FFlag,
    FFlag2 : Boolean;

    procedure AtulizaProgresso;
    function CarregarArquivos(ADiretorio: String; AExtensao: String;
      MostrarLista: Boolean = False): TStringList;

  public
    { Public declarations }
  end;

var
  MovFinCobrancaRetorno: TMovFinCobrancaRetorno;

implementation

uses uFuncProc, dIntegracao, dPrincipal, dFaturamento, dViagem, dVeiculo,
  qFrtVeiculo, StrUtils;

{$R *.dfm}

// -------------------------------------------------------------------------- //
// --  Implementações Privadas ---------------------------------------------- //
// -------------------------------------------------------------------------- //

procedure TMovFinCobrancaRetorno.AtulizaProgresso;
begin
  PrbProgresso.Position := PrbProgresso.Position + 1;
  PrbProgresso.Refresh;
  Application.ProcessMessages;
  Inc(FContRegistro);
end;

function TMovFinCobrancaRetorno.CarregarArquivos(ADiretorio: String;
  AExtensao: String; MostrarLista: Boolean = False): TStringList;
var
  ACont,
  AContCopia: Integer;
  ALocAquivo: TSearchRec;
  AIniArquivo: String;
  AForm: TForm;
  ALabel: TLabel;
  AListBox: TcxListBox;
  ABtnOK,
  ABtnCancelar: TcxButton;
begin
  Result := TStringList.Create;
  
  AContCopia := Length(AExtensao) - Pos('.', AExtensao);

  AIniArquivo := Copy(AExtensao, 1, AContCopia);
  AIniArquivo := AnsiUpperCase(AIniArquivo);

  Delete(AExtensao, 1, AContCopia);
  ACont := FindFirst(ADiretorio + '*' + AExtensao, faAnyFile, ALocAquivo);

  while Acont = 0 do
  begin
    if AnsiUpperCase(Copy(ALocAquivo.Name, 1, AContCopia)) = AIniArquivo then
      Result.Add(ALocAquivo.Name);

    ACont := FindNext(ALocAquivo);
  end;

  // -- Mostrar formulario para escolher quais arquivos serao importados
  if MostrarLista then
  begin
    AForm := TForm.Create(Application);
    AForm.Caption := 'Arquivos Encontrados';
    AForm.Position := poDesktopCenter;
    AForm.BorderStyle := bsDialog;
    AForm.Height := 305;
    AForm.Width := 288;

    ALabel := TLabel.Create(AForm);
    ALabel.Parent := AForm;
    ALabel.Caption := 'Lista de Arquivos Encontrados';
    ALabel.Top := 10;
    ALabel.Left := 16;

    AListBox := TcxListBox.Create(AForm);
    AListBox.Parent := AForm;
    AListBox.SetBounds(15, 33, 250, 200);
    AListBox.MultiSelect := True;
    AListBox.Items.AddStrings(Result);

    // -- Selecionando todos os arquivos encontrados

    for ACont := 0 to AListBox.Items.Count - 1 do
      AListBox.Selected[ACont] := True;

    ABtnOK := TcxButton.Create(AForm);
    ABtnOK.Parent := AForm;
    ABtnOK.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
    ABtnOK.Caption := '&OK';
    ABtnOK.SetBounds(100, 245, 80, 25);
    ABtnOK.ModalResult := mrOk;

    ABtnCancelar := TcxButton.Create(AForm);
    ABtnCancelar.Parent := AForm;
    ABtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');
    ABtnCancelar.Caption := '&Cancelar';
    ABtnCancelar.SetBounds(185, 245, 80, 25);
    ABtnCancelar.ModalResult := mrCancel;

    case AForm.ShowModal of

      mrOk: begin
        Result.Clear;
        for ACont := 0 to AListBox.Items.Count - 1 do
        begin
          if AListBox.Selected[ACont] = True then
            Result.Add(AListBox.Items.Strings[ACont]);
        end;

      end;

      mrCancel: Result := nil;
    end;

  end; // Mostrar formulario

end;

procedure TMovFinCobrancaRetorno.DataSource1StateChange(Sender: TObject);
begin
  inherited;
end;

// -------------------------------------------------------------------------- //
// -- Eventos --------------------------------------------------------------- //
// -------------------------------------------------------------------------- //

procedure TMovFinCobrancaRetorno.FormCreate(Sender: TObject);
begin
  inherited;
  EdtNM_PASTA_IMPORT.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
  BtnImportar.Glyph.LoadFromResourceName(HInstance, 'IMPORTAR');
  BtnSair.Glyph.LoadFromResourceName(HInstance, 'SAIR');

  EdtNM_PASTA_IMPORT.Text := DataTranspApp.ReadConfigString(DataTranspApp.CdFilial,
    'NM_PASTA_IMPORT_COB', '');
end;

procedure TMovFinCobrancaRetorno.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TMovFinCobrancaRetorno.EdtCaminhoArquivoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ADiretorio: String;
begin
  inherited;
  if SelectDirectory('Selecionar o diretório de dados', '', ADiretorio) then
  begin
  	if ADiretorio[Length(ADiretorio)] <> '\' then
      ADiretorio := ADiretorio + '\';

    EdtNM_PASTA_IMPORT.Text := ADiretorio;
  end;
end;


procedure TMovFinCobrancaRetorno.BtnImportarClick(Sender: TObject);
var
  AListaAquivo : TstringList;

  ANmArquivo : String;

  AContArquivo : Integer;

begin
  inherited;
  // -- Validações
  if (EdtNM_PASTA_IMPORT.Text = '') then
    raise Exception.Create('Informe o caminho da pasta de retorno!');

  AListaAquivo := CarregarArquivos(EdtNM_PASTA_IMPORT.Text, 'CBR.ret', True);
  if AListaAquivo = nil then
    Exit;

  // -- Importação do(s) Arquivo(s)
  for AContArquivo := 0 to AListaAquivo.Count - 1 do
  begin
    Screen.Cursor := crHourGlass;
    PrbProgresso.Properties.Max := MmoArquivo.Lines.Count - 5;
    ANmArquivo := EdtNM_PASTA_IMPORT.Text + AListaAquivo.Strings[AContArquivo];

    gbCobranca.NomeArquivo := ANmArquivo;
    gbCobranca.LerRetorno;
    MmoArquivo.Lines := gbCobranca.GerarRelatorio;
  end;

  Application.MessageBox(PWideChar('Importação concluída com sucesso.'), PWideChar(Self.Caption), MB_ICONINFORMATION);
end;

initialization
  RegisterClass(TMovFinCobrancaRetorno);

end.
