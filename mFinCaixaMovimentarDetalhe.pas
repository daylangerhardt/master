unit mFinCaixaMovimentarDetalhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoMDI, cxGraphics, cxControls, dxStatusBar, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, cxCalc,
  cxImageComboBox, cxTextEdit, cxMaskEdit, cxButtonEdit, cxContainer, cxEdit,
  cxLabel, cxLookAndFeels, dxSkinsCore, dxSkinsdxStatusBarPainter;

type
  TMovFinCaixaMovimentarDetalhe = class(TFrmPadraoMDI)
    StatusBarContainer1: TdxStatusBarContainerControl;
    StatusBarContainer2: TdxStatusBarContainerControl;
    BtnConfirmar: TcxButton;
    BtnCancelar: TcxButton;
    cxLabel4: TcxLabel;
    EdtCD_CONTADET: TcxButtonEdit;
    EdtNM_CONTADET: TcxTextEdit;
    cxLabel5: TcxLabel;
    EdtFL_DC_DET: TcxImageComboBox;
    cxLabel11: TcxLabel;
    EdtCD_HISTORICO: TcxButtonEdit;
    EdtVL_LANCAMENTO: TcxCalcEdit;
    cxLabel27: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtCD_CONTADETExit(Sender: TObject);
    procedure EdtCD_CONTADETPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtCD_HISTORICOEnter(Sender: TObject);
    procedure EdtCD_HISTORICOExit(Sender: TObject);
    procedure EdtCD_HISTORICOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtVL_LANCAMENTOEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MovFinCaixaMovimentarDetalhe: TMovFinCaixaMovimentarDetalhe;

implementation

uses dPrincipal, qFinContadet, qFinHistorico, dFinanceiro, mFinCaixaMovimentar;

{$R *.dfm}

procedure TMovFinCaixaMovimentarDetalhe.FormCreate(Sender: TObject);
begin
  inherited;
  BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');
	EdtCD_CONTADET.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_HISTORICO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
  BtnNovoClick(Self);
end;

procedure TMovFinCaixaMovimentarDetalhe.EdtCD_CONTADETExit(Sender: TObject);
begin
  inherited;
  if not DataTranspApp.CreateFormSeek(TConFinContadet, Self, [EdtCD_CONTADET.EditValue],
    ['NM_CONTA', 'FL_DC'], [EdtNM_CONTADET, EdtFL_DC_DET]) then
      EdtCD_CONTADET.EditValue := Null;
end;

procedure TMovFinCaixaMovimentarDetalhe.EdtCD_CONTADETPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DataTranspApp.CreateFormMdi(TConFinContadet, Self, [EdtCD_CONTADET.EditValue],
    [EdtCD_CONTADET]);
end;

procedure TMovFinCaixaMovimentarDetalhe.EdtCD_HISTORICOEnter(Sender: TObject);
var
  ANmHistorico: string;
begin
  if (EdtCD_HISTORICO.Text = '') then
  begin
    ANmHistorico := '';
    if (EdtFL_DC_DET.EditValue = 'D') then
      ANmHistorico := ANmHistorico + 'PGT '
    else
      ANmHistorico := ANmHistorico + 'REC ';
    ANmHistorico := ANmHistorico + 'REF ' + EdtNM_CONTADET.Text;
    EdtCD_HISTORICO.Text := ANmHistorico;
    EdtCD_HISTORICO.SelectAll;
  end;
end;

procedure TMovFinCaixaMovimentarDetalhe.EdtCD_HISTORICOExit(Sender: TObject);
var
	ACdHistorico: integer;
begin
  if (EdtCD_HISTORICO.EditValue <> Null) then
  begin
    if TryStrToInt(EdtCD_HISTORICO.EditValue, ACdHistorico) then
    begin
      if DataTranspApp.CreateFormSeek(TConFinHistorico, Self, [EdtCD_HISTORICO.EditValue],
        ['NM_HISTORICO'], [EdtCD_HISTORICO]) then
      begin
        EdtCD_HISTORICO.SetFocus;
        EdtCD_HISTORICO.SelStart := Length(EdtCD_HISTORICO.Text);
      end;
    end;
  end;
end;

procedure TMovFinCaixaMovimentarDetalhe.EdtCD_HISTORICOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
	DataTranspApp.CreateFormMdi(TConFinHistorico, Self, [Null], [EdtCD_HISTORICO]);
end;

procedure TMovFinCaixaMovimentarDetalhe.EdtVL_LANCAMENTOEnter(Sender: TObject);
begin
  if (EdtVL_LANCAMENTO.Value = 0.00) and (TMovFinCaixaMovimentar(Self.Owner).EdtVL_DIFERENCA.Value <> 0) then
  begin
    EdtVL_LANCAMENTO.Value := TMovFinCaixaMovimentar(Self.Owner).EdtVL_DIFERENCA.Value;
    if (EdtVL_LANCAMENTO.Value < 0) then
      EdtVL_LANCAMENTO.Value := EdtVL_LANCAMENTO.Value * -1;
    EdtVL_LANCAMENTO.SelectAll;
  end;
end;

procedure TMovFinCaixaMovimentarDetalhe.BtnNovoClick(Sender: TObject);
begin
  inherited;
  // -- Novo lançamento
  EdtCD_CONTADET.Clear;
  EdtNM_CONTADET.Clear;
  EdtFL_DC_DET.Clear;
  EdtCD_HISTORICO.Clear;
  EdtVL_LANCAMENTO.Value := 0;
  EdtVL_LANCAMENTO.Clear;
  SelectFirst;
end;

procedure TMovFinCaixaMovimentarDetalhe.BtnConfirmarClick(Sender: TObject);
begin
  inherited;

  // -- Confirmar

  if (EdtCD_CONTADET.Text = '') then
  begin
    ActiveControl := EdtCD_CONTADET;
    raise Exception.Create('O campo conta detalhe é obrigatório.');
  end;

  if (EdtFL_DC_DET.Text = '') then
  begin
    ActiveControl := EdtFL_DC_DET;
    raise Exception.Create('O campo natureza do detalhamento é obrigatório.');
  end;

  // -- Histórico e valor do lançamento ...

  if (EdtCD_HISTORICO.Text = '') then
  begin
    ActiveControl := EdtCD_HISTORICO;
    raise Exception.Create('O campo histórico do lançamento é obrigatório.');
  end;

  if (EdtVL_LANCAMENTO.Value = 0) then
  begin
    ActiveControl := EdtVL_LANCAMENTO;
    raise Exception.Create('O campo valor do lançamento é obrigatório.');
  end;

  // -- Incluir lançamento de detalhe ...
  Screen.Cursor := crSQLWait;
  try

    DtmFinanceiro.CdsFinCxaDet.Insert;
    DtmFinanceiro.CdsFinCxaDet['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'];
    DtmFinanceiro.CdsFinCxaDet['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaDet['NR_LANCAMENTO'] := 0;
    DtmFinanceiro.CdsFinCxaDet['CD_CONTA'] := EdtCD_CONTADET.EditValue;
    DtmFinanceiro.CdsFinCxaDet['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
    DtmFinanceiro.CdsFinCxaDet['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaDet['NM_HISTORICO'] := EdtCD_HISTORICO.Text;
    DtmFinanceiro.CdsFinCxaDet['VL_LANCAMENTO'] := EdtVL_LANCAMENTO.Value;
    DtmFinanceiro.CdsFinCxaDet['FL_DC'] := EdtFL_DC_DET.EditValue;
    DtmFinanceiro.CdsFinCxaDet['FL_CONCILIADO'] := 'N';
    DtmFinanceiro.CdsFinCxaDet['FL_CONTABILIZADO'] := 'N';
    DtmFinanceiro.CdsFinCxaDet.Post;
    DtmFinanceiro.CdsFinCxaDet.ApplyUpdates(0);

    DtmFinanceiro.CdsFinCxaDet.Close;
    DtmFinanceiro.CdsFinCxaDet.Open;
    DtmFinanceiro.CdsFinCxaDet.Last;

  finally
 		Screen.Cursor := crDefault;
  end;

  // -- Totalizar a transação ...

  Self.Close;
  TMovFinCaixaMovimentar(Self.Owner).BtnTotalizarTransacao;

end;

procedure TMovFinCaixaMovimentarDetalhe.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  // -- Cancelar
  Self.Close;
end;

initialization
  RegisterClass(TMovFinCaixaMovimentarDetalhe);

end.
