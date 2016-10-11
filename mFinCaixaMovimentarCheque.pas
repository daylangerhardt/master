unit mFinCaixaMovimentarCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoNormal, cxGraphics, cxControls, dxStatusBar, ExtCtrls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, ppEndUsr, ppModule, raCodMod, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, DBClient, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, cxLookAndFeels, ppParameter;

type
  TMovFinCaixaMovimentarCheque = class(TFrmPadraoNormal)
    cxLabel1: TcxLabel;
    Bevel1: TBevel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    EdtNR_BANCO: TcxMaskEdit;
    EdtNR_AGENCIA: TcxMaskEdit;
    EdtNR_CONTA: TcxMaskEdit;
    EdtNR_CHEQUE: TcxMaskEdit;
    EdtDS_EXTENSO1: TcxMaskEdit;
    EdtDS_EXTENSO2: TcxMaskEdit;
    EdtNM_NOMINAL: TcxMaskEdit;
    EdtNM_PRACA: TcxMaskEdit;
    EdtDT_CHEQUE: TcxDateEdit;
    BtnOK: TcxButton;
    BtnCancelar: TcxButton;
    BtnConfigurar: TcxButton;
    EdtVL_CHEQUE: TcxCurrencyEdit;
    EdtDT_BOM_PARA: TcxDateEdit;
    cxLabel11: TcxLabel;
    CdsCheque: TClientDataSet;
    DsrCheque: TDataSource;
    PpnConsulta: TppDBPipeline;
    RptCheque: TppReport;
    ppHeaderBand1: TppHeaderBand;
    LblNM_EMPRESA: TppLabel;
    ppLine1: TppLine;
    LblNM_RELATORIO: TppLabel;
    ppDetailBand1: TppDetailBand;
    LblDS_NOMINAL: TppDBText;
    LblNM_CIDADE: TppDBText;
    LblNM_MES: TppDBText;
    LblNM_ANO: TppDBText;
    LblDT_BOM_PARA: TppDBText;
    LblVL_CHEQUE: TppDBText;
    Linha1: TppDBText;
    Linha2: TppDBText;
    LblNR_CHEQUE: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    raCodeModule1: TraCodeModule;
    DsgCheque: TppDesigner;
    procedure FormCreate(Sender: TObject);
    procedure EdtVL_CHEQUEPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfigurarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtDT_CHEQUEEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MovFinCaixaMovimentarCheque: TMovFinCaixaMovimentarCheque;

implementation

uses dPrincipal, dFinanceiro, uFuncProc;

{$R *.dfm}

procedure TMovFinCaixaMovimentarCheque.FormCreate(Sender: TObject);
var
  ADirRel,
  ADirRelPadrao,
  ADirRelPessoal,
  AFileName: String;
  APosExe: Integer;
begin

  EdtNR_BANCO.EditValue := DataTranspApp.ParamValues[0];
  EdtNR_AGENCIA.EditValue := DataTranspApp.ParamValues[1];
  EdtNR_CONTA.EditValue := DataTranspApp.ParamValues[2];
  EdtNR_CHEQUE.EditValue := DataTranspApp.ParamValues[3];
  EdtVL_CHEQUE.EditValue := DataTranspApp.ParamValues[4];
  EdtNM_NOMINAL.EditValue := DataTranspApp.ParamValues[5];
  EdtNM_PRACA.EditValue := DataTranspApp.ParamValues[6];
  EdtDT_CHEQUE.EditValue := DataTranspApp.ParamValues[7];

  inherited;

  BtnOK.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');
	BtnConfigurar.Glyph.LoadFromResourceName(HInstance, 'PROPRIEDADE');

  CdsCheque.CreateDataset;

  // -- Carregar arquivo de layout dos cheques ...
  
  ADirRel := ExtractFilePath(Application.ExeName);

  APosExe := Pos('\EXE', AnsiUpperCase(ADirRel));
  if APosExe > 0 then
    Delete(ADirRel, APosExe + 1, Length(ADirRel));

  if ADirRel[Length(ADirRel)] <> '\' then
    ADirRel := ADirRel + '\';

  if DirectoryExists(ADirRel + 'Relatórios\')then
  begin
    ADirRel := ADirRel + 'Relatórios\';
    ADirRelPadrao := ADirRel + 'Padrão\';
    ADirRelPessoal := ADirRel + 'Pessoal\';

    if (FileExists(ADirRelPessoal + Hint + '.rtm')) then
      AFileName := ADirRelPessoal + Hint + '.rtm'
    else if (FileExists(ADirRelPadrao + Hint + '.rtm'))then
      AFileName := ADirRelPadrao + Hint + '.rtm';

  end
  else begin
    ADirRel := ADirRel + 'rtm\';
    AFileName := ADirRel + Self.Hint + '.rtm';
  end;

  if FileExists(AFileName) then
  begin
	  RptCheque.Template.FileName := AFileName;
  	RptCheque.Template.LoadFromFile;
	  RptCheque.Reset;
  end
  else
    raise Exception.Create('Layout de impressão do cheque não encontrado.');

end;

procedure TMovFinCaixaMovimentarCheque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) and (BtnOK.Enabled) then BtnOK.Click;
  if (Key = VK_F3) and (BtnCancelar.Enabled) then BtnCancelar.Click;
  if (Key = VK_F4) and (BtnConfigurar.Enabled) then BtnConfigurar.Click;
end;

procedure TMovFinCaixaMovimentarCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CdsCheque.Close;
end;

procedure TMovFinCaixaMovimentarCheque.EdtVL_CHEQUEPropertiesEditValueChanged(
  Sender: TObject);
var
	ADsExtenso: String;
begin
  ADsExtenso := '';
	ValorExtenso(ADsExtenso, EdtVL_CHEQUE.Value, '', '', 1, 200, '#', 1);
  ADsExtenso := ADsExtenso + StringOfChar('#', 180 - Length(ADsExtenso));
  EdtDS_EXTENSO1.Text := Copy(ADsExtenso, 001, 080);
  EdtDS_EXTENSO2.Text := Copy(ADsExtenso, 101, 180)
end;

procedure TMovFinCaixaMovimentarCheque.EdtDT_CHEQUEEnter(Sender: TObject);
begin
  if (EdtDT_CHEQUE.Text = '') then
  begin
    EdtDT_CHEQUE.Date := DataTranspApp.DtLancamento;
    EdtDT_CHEQUE.SelectAll;
  end;
end;

procedure TMovFinCaixaMovimentarCheque.BtnOKClick(Sender: TObject);
begin

  CdsCheque.EmptyDataset;
  CdsCheque.Insert;
  CdsCheque['NR_BANCO'] := EdtNR_BANCO.EditValue;
  CdsCheque['NR_AGENCIA'] := EdtNR_AGENCIA.EditValue;
  CdsCheque['NR_CONTA'] := EdtNR_CONTA.EditValue;
  CdsCheque['NR_CHEQUE'] := EdtNR_CHEQUE.EditValue;
  CdsCheque['VL_CHEQUE'] := EdtVL_CHEQUE.EditValue;
  CdsCheque['DS_EXTENSO1'] := EdtDS_EXTENSO1.EditValue;
  CdsCheque['DS_EXTENSO2'] := EdtDS_EXTENSO2.EditValue;
  CdsCheque['NM_NOMINAL'] := EdtNM_NOMINAL.EditValue;
  CdsCheque['NM_PRACA'] := EdtNM_PRACA.EditValue;
  CdsCheque['DT_CHEQUE'] := EdtDT_CHEQUE.EditValue;
  CdsCheque['DT_BOM_PARA'] := EdtDT_BOM_PARA.EditValue;
  CdsCheque.Post;

  RptCheque.DeviceType := 'Printer';
  RptCheque.Print;
  SelectFirst;

end;

procedure TMovFinCaixaMovimentarCheque.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TMovFinCaixaMovimentarCheque.BtnConfigurarClick(Sender: TObject);
begin
  SelectFirst;
  DsgCheque.ShowModal;
end;

initialization
  RegisterClass(TMovFinCaixaMovimentarCheque);

end.
