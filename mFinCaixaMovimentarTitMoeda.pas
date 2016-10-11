unit mFinCaixaMovimentarTitMoeda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
  Dialogs, uPadraoNormal, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxStatusBar, ExtCtrls, cxContainer, cxEdit,
  Menus, StdCtrls, cxButtons, cxCurrencyEdit, cxDBEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel;

type
  TMovFinCaixaMovimentarTitMoeda = class(TFrmPadraoNormal)
    Bevel1: TBevel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    BtnConfirmar: TcxButton;
    EdtVL_TOTAL: TcxCurrencyEdit;
    EdtCD_MOEDA: TcxCurrencyEdit;
    EdtVL_COTACAO: TcxCurrencyEdit;
    EdtTP_LANCAMENTO: TcxTextEdit;
    EdtFL_DC: TcxTextEdit;
    EdtFL_TITULO: TcxTextEdit;
    EdtNM_MOEDA: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtVL_COTACAOExit(Sender: TObject);
    procedure EdtVL_COTACAOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCdMoeda,
    FCdFilial,
    FNrParcelaTit,FNrLancamentoTit,FNrTransacao : Integer;
    FVlMoeda,FVlNominal,FVlDifer,FVlSaldo : Double;
    FNmHistor : string;
  public
    { Public declarations }
  end;

var
  MovFinCaixaMovimentarTitMoeda: TMovFinCaixaMovimentarTitMoeda;

implementation

uses dFinanceiro, dPrincipal, qFinFinTitOpe, mFinCaixaMovimentarTitulo,
  qFrtMoeda;

{$R *.dfm}


procedure TMovFinCaixaMovimentarTitMoeda.EdtVL_COTACAOExit(Sender: TObject);
begin
  inherited;
  // Transforma o valor do titulo em cotaçao "real - R$"
  EdtVL_TOTAL.EditValue := FVlMoeda * EdtVL_COTACAO.EditValue;
  EdtVL_COTACAO.SelectAll;

end;

procedure TMovFinCaixaMovimentarTitMoeda.EdtVL_COTACAOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN:
              ActiveControl := BtnConfirmar;
  end;
end;

procedure TMovFinCaixaMovimentarTitMoeda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DtmFinanceiro.CdsFinTitLct.Close;
  DtmFinanceiro.CdsFinTitCxaLct.Close;
  DtmFinanceiro.CdsFinTitulo.Close;
end;

procedure TMovFinCaixaMovimentarTitMoeda.FormCreate(Sender: TObject);
begin
	BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');

  FCdMoeda := DataTranspApp.ParamValues[0];
  FCdFilial := DataTranspApp.ParamValues[1];
  FNrTransacao := DataTranspApp.ParamValues[2];
  FVlMoeda := DataTranspApp.ParamValues[3];
  FNrParcelaTit := DataTranspApp.ParamValues[4];
  FVlNominal := DataTranspApp.ParamValues[5];

  FNrLancamentoTit := 0;

  inherited;
  EdtCD_MOEDA.EditValue := FCdMoeda;
  EdtVL_COTACAO.EditValue := DtmFinanceiro.BuscarCotacao(FCdMoeda,Date);
  ActiveControl := EdtVL_COTACAO;
  // Metodo para pegar o nome da moeda
  DataTranspApp.CreateFormSeek(TConFrtMoeda, Self, [EdtCD_MOEDA.EditValue],['CD_MOEDA', 'NM_MOEDA'],[EdtCD_MOEDA, EdtNM_MOEDA])

end;

procedure TMovFinCaixaMovimentarTitMoeda.BtnConfirmarClick(Sender: TObject);
begin
  DtmFinanceiro.CdsFinTitulo.Close;
  DtmFinanceiro.CdsFinTitulo.Params.Clear;
  DtmFinanceiro.SqlFinTitulo.ParamByName('CD_FILIAL').AsInteger := FCdFilial;
  DtmFinanceiro.SqlFinTitulo.ParamByName('NR_TRANSACAO').AsInteger := FNrTransacao;
  DtmFinanceiro.CdsFinTitulo.Open;

  if not DtmFinanceiro.CdsFinTitulo.IsEmpty then
  begin
    DtmFinanceiro.CdsFinTitulo.Edit;
    DtmFinanceiro.CdsFinTitulo.FieldByName('VL_COTACAO_BAIXA').AsFloat := EdtVL_COTACAO.EditValue;
    DtmFinanceiro.CdsFinTitulo.FieldByName('DT_BAIXA').AsDateTime :=  Date;
    FVlSaldo := DtmFinanceiro.CdsFinTitulo.FieldByName('VL_SALDO').AsFloat;
    DtmFinanceiro.CdsFinTitulo.FieldByName('VL_SALDO').AsFloat := EdtVL_TOTAL.EditValue;

    DtmFinanceiro.CdsFinTitulo.Post;
    DtmFinanceiro.CdsFinTitulo.ApplyUpdates(0);
    DtmFinanceiro.CdsFinTitulo.Close;
  end;

  // confere se é desconto ou acrescimo
  if EdtVL_TOTAL.EditValue > FVlSaldo then
  begin
    FVlDifer := EdtVL_TOTAL.EditValue - FVlSaldo;
    EdtTP_LANCAMENTO.EditValue := DataTranspApp.ReadConfigString(
      DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'], 'TP_LANCAMENTO_ACRESCIMO', '03');
    FNmHistor := 'ACRESCIMO P/ AJUSTE DE COTACAO - MOEDA INTERNACIONAL';
    DataTranspApp.CreateFormSeek(TConFinFinTitOpe, Self, [EdtTP_LANCAMENTO.EditValue],
      ['FL_TITULO', 'FL_DC'], [EdtFL_TITULO, EdtFL_DC]);
  end
  else if EdtVL_TOTAL.EditValue < FVlSaldo then
  begin
    FVlDifer := (FVlSaldo - EdtVL_TOTAL.EditValue);
    EdtTP_LANCAMENTO.EditValue := DataTranspApp.ReadConfigString(
   	  DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'], 'TP_LANCAMENTO_DESCONTO', '04');
    FNmHistor := 'DESCONTO P/ AJUSTE DE COTACAO - MOEDA INTERNACIONAL';
    DataTranspApp.CreateFormSeek(TConFinFinTitOpe, Self, [EdtTP_LANCAMENTO.EditValue],
      ['FL_TITULO', 'FL_DC'], [EdtFL_TITULO, EdtFL_DC]);
  end
  else
    FVlDifer := 0;

  // rotina para gerar a operação de crescimo ou desconto no fintitlct
  if FVlDifer <> 0 then
  begin
    DtmFinanceiro.CdsFinTitLct.Close;
    DtmFinanceiro.CdsFinTitLct.Params.Clear;
    DtmFinanceiro.SqlFinTitLct.ParamByName('CD_FILIAL').AsInteger := FCdFilial;
    DtmFinanceiro.SqlFinTitLct.ParamByName('NR_TRANSACAO').AsInteger := FNrTransacao;
    DtmFinanceiro.SqlFinTitLct.ParamByName('NR_PARCELA').AsInteger := FNrParcelaTit;
    DtmFinanceiro.CdsFinTitLct.Open;

    DtmFinanceiro.CdsFinTitLct.Insert;
    DtmFinanceiro.CdsFinTitLct.FieldByName('CD_FILIAL').AsInteger := FCdFilial;
    DtmFinanceiro.CdsFinTitLct.FieldByName('NR_TRANSACAO').AsInteger := FNrTransacao;
    DtmFinanceiro.CdsFinTitLct.FieldByName('NR_PARCELA').AsInteger := FNrParcelaTit;
    DtmFinanceiro.CdsFinTitLct.FieldByName('NR_LANCAMENTO').AsInteger := 0;
    DtmFinanceiro.CdsFinTitLct.FieldByName('NR_LANCAMENTO_EST').Value := 0;
    DtmFinanceiro.CdsFinTitLct.FieldByName('DT_LANCAMENTO').AsDateTime := Date;
    DtmFinanceiro.CdsFinTitLct.FieldByName('DT_MOVIMENTO').AsDateTime := Date;
    DtmFinanceiro.CdsFinTitLct.FieldByName('NM_HISTORICO').AsString := FNmHistor;
    DtmFinanceiro.CdsFinTitLct.FieldByName('VL_LANCAMENTO').AsFloat := FVlDifer;
    DtmFinanceiro.CdsFinTitLct.FieldByName('TP_LANCAMENTO').AsString := EdtTP_LANCAMENTO.EditValue;
    DtmFinanceiro.CdsFinTitLct.FieldByName('FL_DC').AsString := EdtFL_DC.EditValue;
    DtmFinanceiro.CdsFinTitLct.FieldByName('FL_TITULO').AsString := EdtFL_TITULO.EditValue;
    DtmFinanceiro.CdsFinTitLct.FieldByName('FL_CONCILIADO').AsString := 'N';
    DtmFinanceiro.CdsFinTitLct.FieldByName('FL_CONTABILIZADO').AsString := 'N';

    DtmFinanceiro.CdsFinTitLct.Post;
    DtmFinanceiro.CdsFinTitLct.ApplyUpdates(0);
    DtmFinanceiro.CdsFinTitLct.Open;
  end;

  TMovFinCaixaMovimentarTitulo(Self.Owner).EdtVL_LANCAMENTO.Value := EdtVL_TOTAL.EditValue;

  Self.Close;
end;

procedure TMovFinCaixaMovimentarTitMoeda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if (Key = VK_ESCAPE) then Self.Close;
end;


initialization
  RegisterClass(TMovFinCaixaMovimentarTitMoeda);

end.
