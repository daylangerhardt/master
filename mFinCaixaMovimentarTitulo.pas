unit mFinCaixaMovimentarTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoMDI, cxGraphics, cxControls, dxStatusBar, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxMaskEdit, cxButtonEdit,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxDropDownEdit, cxCalc, cxPC,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxCalendar,
  cxLookAndFeels, dxSkinsCore, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter,
  dxSkinsDefaultPainters, cxPCdxBarPopupMenu;

type
  TMovFinCaixaMovimentarTitulo = class(TFrmPadraoMDI)
    StatusBarContainer1: TdxStatusBarContainerControl;
    StatusBarContainer2: TdxStatusBarContainerControl;
    BtnConfirmar: TcxButton;
    BtnCancelar: TcxButton;
    PgcTitulo: TcxPageControl;
    TabSimples: TcxTabSheet;
    TabMultiplas: TcxTabSheet;
    LblCD_CLIEFORN: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    EdtCD_CONTATIT: TcxButtonEdit;
    EdtNM_CONTATIT: TcxTextEdit;
    EdtCD_FILIAL_TIT: TcxTextEdit;
    EdtNR_TRANSACAO_TIT: TcxTextEdit;
    EdtVL_SALDO_TIT: TcxTextEdit;
    EdtFL_DC_TIT: TcxTextEdit;
    EdtCD_CLIEFORN: TcxButtonEdit;
    EdtNM_CLIEFORN: TcxTextEdit;
    EdtSR_TITULO: TcxButtonEdit;
    EdtNR_TITULO: TcxButtonEdit;
    EdtNR_PARCELA: TcxButtonEdit;
    EdtDT_EMISSAO: TcxTextEdit;
    EdtDT_VENCIMENTO: TcxTextEdit;
    EdtVL_NOMINAL: TcxCurrencyEdit;
    EdtVL_ACRESCIMOS: TcxCurrencyEdit;
    EdtVL_DESCONTOS: TcxCurrencyEdit;
    EdtVL_BAIXA: TcxCurrencyEdit;
    EdtCD_HISTORICO: TcxButtonEdit;
    EdtVL_LANCAMENTO: TcxCalcEdit;
    GrdConsulta: TcxGrid;
    GrdConsultaView: TcxGridDBTableView;
    GrdConsultaDBTableView1CD_FILIAL: TcxGridDBColumn;
    GrdConsultaDBTableView1NR_TRANSACAO: TcxGridDBColumn;
    GrdConsultaDBTableView1CD_CONTA: TcxGridDBColumn;
    GrdConsultaDBTableView1CD_CLIEFORN: TcxGridDBColumn;
    GrdConsultaDBTableView1NM_FANTASIA: TcxGridDBColumn;
    GrdConsultaDBTableView1SR_TITULO: TcxGridDBColumn;
    GrdConsultaDBTableView1NR_TITULO: TcxGridDBColumn;
    GrdConsultaDBTableView1NR_PARCELA: TcxGridDBColumn;
    GrdConsultaDBTableView1NR_NOSSO_NUMERO: TcxGridDBColumn;
    GrdConsultaDBTableView1DT_EMISSAO: TcxGridDBColumn;
    GrdConsultaDBTableView1DT_VENCIMENTO: TcxGridDBColumn;
    GrdConsultaDBTableView1VL_SALDO: TcxGridDBColumn;
    GrdConsultaDBTableView1VL_LCTO_BAIXA: TcxGridDBColumn;
    GrdConsultaDBTableView1VL_LCTO_ACRES_DESCTO: TcxGridDBColumn;
    GrdConsultaDBTableView1FL_BAIXA: TcxGridDBColumn;
    GrdConsultaLevel: TcxGridLevel;
    EdtTP_LANCAMENTO: TcxTextEdit;
    EdtFL_TITULO: TcxTextEdit;
    EdtFL_DC: TcxTextEdit;
    Bevel1: TBevel;
    cxLabel6: TcxLabel;
    EdtCD_CONTATIT2: TcxButtonEdit;
    EdtNM_CONTATIT2: TcxTextEdit;
    LblCD_CLIEFORN2: TcxLabel;
    EdtCD_CLIEFORN2: TcxButtonEdit;
    EdtNM_CLIEFORN2: TcxTextEdit;
    cxLabel10: TcxLabel;
    EdtDT_LIMITE: TcxDateEdit;
    EdtCD_FILIAL_TIT2: TcxTextEdit;
    EdtFL_DC_TIT2: TcxTextEdit;
    TabFatura: TcxTabSheet;
    Bevel2: TBevel;
    LblFatura: TcxLabel;
    LblClieforn3: TcxLabel;
    EdtNR_FATURA: TcxButtonEdit;
    EdtCD_FILIAL_TIT3: TcxTextEdit;
    EdtFL_DC_TIT3: TcxTextEdit;
    EdtCD_CLIEFORN3: TcxTextEdit;
    EdtNM_CLIEFORN3: TcxTextEdit;
    GrdTitFatura: TcxGrid;
    GrdTitFaturaView: TcxGridDBTableView;
    GrdTitFaturaViewCD_FILIAL: TcxGridDBColumn;
    GrdTitFaturaViewNR_TRANSACAO: TcxGridDBColumn;
    GrdTitFaturaViewCD_CONTA: TcxGridDBColumn;
    GrdTitFaturaViewCD_CLIEFORN: TcxGridDBColumn;
    GrdTitFaturaViewSR_TITULO: TcxGridDBColumn;
    GrdTitFaturaViewNR_TITULO: TcxGridDBColumn;
    GrdTitFaturaViewNR_PARCELA: TcxGridDBColumn;
    GrdTitFaturaViewDT_EMISSAO: TcxGridDBColumn;
    GrdTitFaturaViewDT_VENCIMENTO: TcxGridDBColumn;
    GrdTitFaturaViewVL_SALDO: TcxGridDBColumn;
    GrdTitFaturaViewVL_ACRESCIMOS: TcxGridDBColumn;
    GrdTitFaturaViewVL_DESCONTOS: TcxGridDBColumn;
    GrdTitFaturaViewFL_BAIXA: TcxGridDBColumn;
    GrdTitFaturaLevel: TcxGridLevel;
    GrdTitFaturaViewVL_NOMINAL: TcxGridDBColumn;
    EdtCD_MOEDA_TIT3: TcxTextEdit;
    GrdConsultaDBTableView1CD_MOEDA: TcxGridDBColumn;
    EdtCD_MOEDA: TcxTextEdit;
    TabCartaFrete: TcxTabSheet;
    cxbu: TBevel;
    EdtNR_CONHEC: TcxButtonEdit;
    GrdFinCartaFrete: TcxGrid;
    GrdFinCartaFreteView: TcxGridDBTableView;
    GrdFinCartaFreteLevel: TcxGridLevel;
    GrdFinCartaFreteSR_TITULO: TcxGridDBColumn;
    GrdFinCartaFreteNR_TITULO: TcxGridDBColumn;
    GrdFinCartaFreteNR_PARCELA: TcxGridDBColumn;
    GrdFinCartaFreteVL_SALDO: TcxGridDBColumn;
    GrdFinCartaFreteDT_EMISSAO: TcxGridDBColumn;
    GrdFinCartaFreteDT_VENCIMENTO: TcxGridDBColumn;
    GrdFinCartaFreteVL_BAIXA: TcxGridDBColumn;
    GrdFinCartaFreteFL_SELECIONADO: TcxGridDBColumn;
    GrdFinCartaFreteCD_MOEDA: TcxGridDBColumn;
    EdtSR_CONHEC: TcxButtonEdit;
    GrdFinCartaFreteViewColumn1: TcxGridDBColumn;
    Label2: TcxLabel;
    cxLabel115: TcxLabel;
    EdtCD_HIST: TcxTextEdit;
    GrdTitFaturaViewNM_FANTASIA: TcxGridDBColumn;
    GrdTitFaturaViewNR_NOSSO_NUMERO: TcxGridDBColumn;
    GrdTitFaturaViewVL_LCTO_BAIXA: TcxGridDBColumn;
    GrdTitFaturaViewCD_MOEDA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
		procedure BtnNovoClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
		procedure BtnConfirmarClick(Sender: TObject);
		procedure BtnCancelarClick(Sender: TObject);
		procedure EdtCD_CONTATITExit(Sender: TObject);
		procedure EdtCD_CONTATITPropertiesButtonClick(Sender: TObject;
			AButtonIndex: Integer);
		procedure EdtCD_CLIEFORNExit(Sender: TObject);
		procedure EdtCD_CLIEFORNPropertiesButtonClick(Sender: TObject;
			AButtonIndex: Integer);
		procedure EdtNR_PARCELAPropertiesButtonClick(Sender: TObject;
			AButtonIndex: Integer);
		procedure EdtNR_PARCELAExit(Sender: TObject);
		procedure EdtCD_HISTORICOEnter(Sender: TObject);
		procedure EdtCD_HISTORICOExit(Sender: TObject);
		procedure EdtVL_LANCAMENTOEnter(Sender: TObject);
		procedure GrdConsultaDBTableView1FL_BAIXAHeaderClick(Sender: TObject);
		procedure GrdConsultaDBTableView1FL_BAIXAPropertiesEditValueChanged(
			Sender: TObject);
		procedure GrdConsultaDBTableView1VL_LCTO_BAIXAPropertiesEditValueChanged(
			Sender: TObject);
		procedure TabMultiplasShow(Sender: TObject);
		procedure EdtCD_CONTATIT2Exit(Sender: TObject);
		procedure EdtCD_CONTATIT2PropertiesButtonClick(Sender: TObject;
			AButtonIndex: Integer);
		procedure EdtCD_CLIEFORN2Exit(Sender: TObject);
		procedure EdtCD_CLIEFORN2PropertiesButtonClick(Sender: TObject;
			AButtonIndex: Integer);
		procedure EdtDT_LIMITEExit(Sender: TObject);
		procedure TabFaturaShow(Sender: TObject);
		procedure EdtNR_FATURAExit(Sender: TObject);
		procedure EdtNR_FATURAPropertiesButtonClick(Sender: TObject;
			AButtonIndex: Integer);
		procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtNR_CONHECExit(Sender: TObject);
    procedure GrdFinCartaFreteFL_SELECIONADOHeaderClick(Sender: TObject);
    procedure GrdFinCartaFreteFL_SELECIONADOPropertiesEditValueChanged(
      Sender: TObject);
    procedure EdtNR_CONHECPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtSR_CONHECPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtSR_CONHECExit(Sender: TObject);
    procedure TabCartaFreteShow(Sender: TObject);
    procedure GrdFinCartaFreteVL_BAIXAPropertiesEditValueChanged(
      Sender: TObject);
    procedure EdtVL_LANCAMENTOExit(Sender: TObject);
    procedure GrdTitFaturaViewVL_LCTO_BAIXAPropertiesEditValueChanged(
      Sender: TObject);
    procedure GrdTitFaturaViewFL_BAIXAPropertiesEditValueChanged(
      Sender: TObject);
    procedure GrdTitFaturaViewFL_BAIXAHeaderClick(Sender: TObject);
	private
		{ Private declarations }
    ANrTransacao,ANrParcelaTit,ANrParcelaTitCon,FNrLancamentoTitCon : Integer;
    FVlCotacao,FVlMoeda,FVlNominal : Double;
		function ValidarTituloMoeda(ACdMoedaTitulo: integer): boolean;
    function GetHistorico(ACdFilial, ANrTransacao: integer): string;
	public
    { Public declarations }
  end;

var
  MovFinCaixaMovimentarTitulo: TMovFinCaixaMovimentarTitulo;

implementation

uses dPrincipal, dFinanceiro, qFinContatit, qFinClieforn, qFinFinTituloBaixa,
  qFinHistorico, mFinCaixaMovimentar, qFinFinTitOpe, mFinTituloMovimentar,
  qFinFinFatura, mFinCaixaMovimentarTitMoeda, mFinCotacao, qFrtMoeda, dUsuario,
  qFrtFilial, qFrtConhectoCTRBConsultaTitulo, qFrtConhecto, qFrtConhectoSR,
  qFrtConhectoCTRCCTRB, uFuncProc, SqlExpr, StrUtils, dAuditoriaFinanceiro;

{$R *.dfm}

procedure TMovFinCaixaMovimentarTitulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DtmFinanceiro.CdsCartaFreteCTRC.Close;
  DtmFinanceiro.CdsCartaFreteCTRCGrid.Close;
end;

procedure TMovFinCaixaMovimentarTitulo.FormCreate(Sender: TObject);
begin
  inherited;
  BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');
	EdtCD_CONTATIT.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_CLIEFORN.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_CONTATIT2.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_CLIEFORN2.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtSR_TITULO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtNR_TITULO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtNR_PARCELA.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_HISTORICO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtNR_FATURA.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtNR_CONHEC.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
  EdtSR_CONHEC.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');

  BtnNovoClick(Self);
  EdtTP_LANCAMENTO.EditValue := DataTranspApp.ReadConfigString(
  	DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'], 'TP_LANCAMENTO_BAIXA', '07');
  DataTranspApp.CreateFormSeek(TConFinFinTitOpe, Self, [EdtTP_LANCAMENTO.EditValue],
      ['FL_TITULO', 'FL_DC'], [EdtFL_TITULO, EdtFL_DC]);
end;

procedure TMovFinCaixaMovimentarTitulo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if GrdTitFatura.IsFocused then
    Exit;

  if GrdConsulta.IsFocused then
    Exit;

  inherited;

end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CONTATITExit(Sender: TObject);
begin
  if DataTranspApp.CreateFormSeek(TConFinContatit, Self, [EdtCD_CONTATIT.EditValue],
    ['NM_CONTA', 'CD_FILIAL', 'FL_DC'], [EdtNM_CONTATIT, EdtCD_FILIAL_TIT, EdtFL_DC_TIT]) then
  begin
    if (EdtCD_FILIAL_TIT.EditValue <> DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']) then
    begin
      ActiveControl := EdtCD_CONTATIT;
      EdtCD_CONTATIT.EditValue := Null;
      EdtNM_CONTATIT.EditValue := Null;
      raise Exception.Create('Esta conta título pertence a outra filial.');
    end;
    if (EdtFL_DC_TIT.EditValue = DtmFinanceiro.CdsFinCxaTrn['FL_DC']) then
    begin
      ActiveControl := EdtCD_CONTATIT;
      EdtCD_CONTATIT.EditValue := Null;
      EdtNM_CONTATIT.EditValue := Null;
      raise Exception.Create('Esta conta título é incompatível com natureza da transação.');
    end;
    if (EdtFL_DC_TIT.EditValue = 'C') then
      LblCD_CLIEFORN.Caption := 'Cliente:'
    else
      LblCD_CLIEFORN.Caption := 'Fornecedor:';
  end
  else
    EdtCD_CONTATIT.EditValue := Null;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CONTATITPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinContatit, Self, [EdtCD_CONTATIT.EditValue], [EdtCD_CONTATIT]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CLIEFORNExit(Sender: TObject);
begin
  if not DataTranspApp.CreateFormSeek(TConFinClieforn, Self, [EdtCD_CLIEFORN.EditValue],
    ['NM_FANTASIA'], [EdtNM_CLIEFORN]) then
      EdtCD_CLIEFORN.EditValue := Null;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CLIEFORNPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinClieforn, Self, [EdtCD_CLIEFORN.EditValue], [EdtCD_CLIEFORN]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtNR_PARCELAExit(Sender: TObject);
begin
  // -- Tarefa 807
  EdtNR_TITULO.Text := FmtStrDelSpecialChar(EdtNR_TITULO.Text);

	// -- Limpar dados do título antes de consultar ...

	EdtCD_FILIAL_TIT.EditValue := Null;
	EdtNR_TRANSACAO_TIT.EditValue := Null;
	EdtDT_EMISSAO.EditValue := Null;
	EdtDT_VENCIMENTO.EditValue := Null;
	EdtVL_NOMINAL.EditValue := Null;
	EdtVL_ACRESCIMOS.EditValue := Null;
	EdtVL_DESCONTOS.EditValue := Null;
	EdtVL_BAIXA.EditValue := Null;
	EdtVL_SALDO_TIT.EditValue := Null;

	// -- Utilizar consulta personalizada do titulo afim de aumentar a perfomance do lançamento do caixa ...

	if (EdtCD_CONTATIT.EditValue <> Null) and (EdtCD_CLIEFORN.EditValue <> Null)
		and (EdtSR_TITULO.EditValue <> Null) and (EdtNR_TITULO.EditValue <> Null)
			and (EdtNR_PARCELA.EditValue <> Null) then
	begin

    // -- Tarefa: 2685 - Inserido consulta para ver se o titulo é realizado ...
    DataTranspApp.CreateFormSeek(TConFinFinTituloBaixa, Self,
      [EdtCD_CONTATIT.EditValue, EdtCD_CLIEFORN.EditValue, EdtSR_TITULO.EditValue, EdtNR_TITULO.EditValue, EdtNR_PARCELA.EditValue],
      ['SR_TITULO', 'NR_TITULO', 'NR_PARCELA'],
      [EdtSR_TITULO, EdtNR_TITULO, EdtNR_PARCELA]);

    // -- Tarefa: 2685 - Caso o titulo não exista, não executa nada ...
    if ((EdtSR_TITULO.EditValue <> Null) and
        (EdtNR_TITULO.EditValue <> Null) and
        (EdtNR_PARCELA.EditValue <> Null)) then
    begin
      DtmFinanceiro.CdsFinCxaTitBxa.Close;
      DtmFinanceiro.CdsFinCxaTitBxa.Params.Clear;
      DtmFinanceiro.SqlFinCxaTitBxa.ParamByName('CD_CONTA').AsInteger    := EdtCD_CONTATIT.EditValue;
      DtmFinanceiro.SqlFinCxaTitBxa.ParamByName('CD_CLIEFORN').AsInteger := EdtCD_CLIEFORN.EditValue;
      DtmFinanceiro.SqlFinCxaTitBxa.ParamByName('SR_TITULO').AsString    := EdtSR_TITULO.EditValue;
      DtmFinanceiro.SqlFinCxaTitBxa.ParamByName('NR_TITULO').AsInteger   := EdtNR_TITULO.EditValue;
      DtmFinanceiro.SqlFinCxaTitBxa.ParamByName('NR_PARCELA').AsInteger  := EdtNR_PARCELA.EditValue;
      DtmFinanceiro.CdsFinCxaTitBxa.Open;

      if (not DtmFinanceiro.CdsFinCxaTitBxa.IsEmpty) then
      begin
        if ValidarTituloMoeda(StrtoIntDef(DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('CD_MOEDA').AsString, 1)) then
        begin
          EdtCD_FILIAL_TIT.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('CD_FILIAL').AsInteger;
          EdtNR_TRANSACAO_TIT.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('NR_TRANSACAO').AsInteger;
          EdtDT_EMISSAO.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('DT_EMISSAO').AsDateTime;
          EdtDT_VENCIMENTO.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('DT_VENCIMENTO').AsDateTime;
          EdtVL_NOMINAL.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_NOMINAL').AsFloat;
          EdtVL_ACRESCIMOS.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_ACRESCIMOS').AsFloat;
          EdtVL_DESCONTOS.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_DESCONTOS').AsFloat;
          EdtVL_BAIXA.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_BAIXA').AsFloat;
          EdtVL_SALDO_TIT.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_SALDO').AsFloat;
          EdtCD_MOEDA.EditValue := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('CD_MOEDA').Value;
          FVlMoeda := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_MOEDA').AsFloat;
          FVlNominal := DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('VL_NOMINAL').AsFloat;
          EdtCD_CONTATITExit(Self);
          EdtCD_CLIEFORNExit(Self);
          EdtVL_LANCAMENTO.EditValue := EdtVL_SALDO_TIT.EditValue;

          if (DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('CD_MOEDA').AsInteger <> 1) and
             (not DtmFinanceiro.CdsFinCxaTitBxa.FieldByName('CD_MOEDA').IsNull) then
          begin
            EdtVL_LANCAMENTO.Enabled := False;
            EdtVL_LANCAMENTO.Properties.ReadOnly := True;
          end;
        end;

      end;

      DtmFinanceiro.CdsFinCxaTitBxa.Close;

    end
    // -- Tarefa: 2685 - Caso o titulo não existir ou for previsto, setar o foco na série ...
    else
      if EdtSR_TITULO.CanFocus then
        EdtSR_TITULO.SetFocus;
	end;

end;

procedure TMovFinCaixaMovimentarTitulo.EdtNR_PARCELAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	// -- Consulta de títulos (para baixa de um titulo por vez) ...
  DataTranspApp.CreateFormMdi(TConFinFinTituloBaixa, Self, [EdtCD_CONTATIT.EditValue, EdtCD_CLIEFORN.EditValue],
    [EdtCD_CONTATIT, EdtCD_CLIEFORN, EdtSR_TITULO, EdtNR_TITULO, EdtNR_PARCELA]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtSR_CONHECExit(Sender: TObject);
begin
  inherited;
  //  --  Procedimento para trazer a serie do conhecimento
  if not DataTranspApp.CreateFormSeek(TConFrtConhectoSR, Self, [EdtSR_CONHEC.Text], ['SR_CONHEC'], [EdtSR_CONHEC]) then
    EdtSR_CONHEC.Clear;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtSR_CONHECPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  // -- Consultar tipos de conhecimentos ...
	DataTranspApp.CreateFormMdi(TConFrtConhectoSR, Self, [EdtSR_CONHEC.Text],	[EdtSR_CONHEC]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_HISTORICOEnter(Sender: TObject);
var
  ANmHistDet,
  ANmHistorico: string;
begin
  // -- Tarefa: 2685 - Caso não exista titulo, não faz nada ...
  if ((EdtSR_TITULO.EditValue <> Null) and
      (EdtNR_TITULO.EditValue <> Null) and
      (EdtNR_PARCELA.EditValue <> Null)) then
  begin
    ANmHistDet := '';
    if (EdtCD_HISTORICO.Text = '') then
    begin
      if EdtNR_TRANSACAO_TIT.EditValue <> Null then
        ANmHistDet := GetHistorico(EdtCD_FILIAL_TIT.EditValue, EdtNR_TRANSACAO_TIT.EditValue);
      ANmHistorico := '';
      if (EdtFL_DC_TIT.Text = 'D') then
        ANmHistorico := ANmHistorico + 'PGT '
      else
        ANmHistorico := ANmHistorico + 'REC ';
      ANmHistorico := ANmHistorico + 'TIT Nº ' + EdtSR_TITULO.Text + '.' +
        EdtNR_TITULO.Text + '.' + EdtNR_PARCELA.Text + ' DE ' + EdtNM_CLIEFORN.Text + IfThen(ANmHistDet <> EmptyStr, ' REF ' + ANmHistDet, '');
      EdtCD_HISTORICO.Text := ANmHistorico;
      EdtCD_HISTORICO.SelectAll;
    end;
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_HISTORICOExit(Sender: TObject);
var
	ACdHistorico: integer;
begin
  if (EdtCD_HISTORICO.EditValue <> Null) then
  begin
    if TryStrToInt(EdtCD_HISTORICO.EditValue, ACdHistorico) then
    begin
      // -- Tarefa: 3501 ...
      EdtCD_HIST.EditValue := EdtCD_HISTORICO.EditValue;

      if DataTranspApp.CreateFormSeek(TConFinHistorico, Self, [EdtCD_HISTORICO.EditValue],
        ['NM_HISTORICO'], [EdtCD_HISTORICO]) then
      begin
        EdtCD_HISTORICO.SetFocus;
        EdtCD_HISTORICO.SelStart := Length(EdtCD_HISTORICO.Text);
      end;
    end;
  end
  // -- Tarefa: 3501 ...
  else
    EdtCD_HIST.Clear;
end;


procedure TMovFinCaixaMovimentarTitulo.EdtVL_LANCAMENTOEnter(Sender: TObject);
begin
  // -- Tarefa: 2685 - Caso não exista titulo, não faz nada ...
  if ((EdtSR_TITULO.EditValue <> Null) and
      (EdtNR_TITULO.EditValue <> Null) and
      (EdtNR_PARCELA.EditValue <> Null)) then
  begin
    if (EdtVL_LANCAMENTO.Value = 0.00) and (TMovFinCaixaMovimentar(Self.Owner).EdtVL_DIFERENCA.Value <> 0) then
    begin
      EdtVL_LANCAMENTO.Value := TMovFinCaixaMovimentar(Self.Owner).EdtVL_DIFERENCA.Value;
      if (EdtVL_LANCAMENTO.Value < 0) then
        EdtVL_LANCAMENTO.Value := EdtVL_LANCAMENTO.Value * -1;
      EdtVL_LANCAMENTO.SelectAll;
    end;
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtVL_LANCAMENTOExit(Sender: TObject);
begin
  inherited;
  if (EdtVL_SALDO_TIT.EditValue < EdtVL_LANCAMENTO.EditValue) then
  begin
    EdtVL_LANCAMENTO.SetFocus;
    raise Exception.Create('O valor do lançamento não pode ser maior que o saldo.');
  end;

end;

procedure TMovFinCaixaMovimentarTitulo.TabCartaFreteShow(Sender: TObject);
begin
  inherited;
  if not DtmFinanceiro.CdsCartaFreteCTRCGrid.Active then
    DtmFinanceiro.CdsCartaFreteCTRCGrid.CreateDataSet;
end;

procedure TMovFinCaixaMovimentarTitulo.TabFaturaShow(Sender: TObject);
begin
  inherited;
  EdtNR_FATURA.Clear;
  EdtCD_FILIAL_TIT3.Clear;
  EdtCD_CLIEFORN3.Clear;
  EdtNM_CLIEFORN3.Clear;

  DtmFinanceiro.CdsFinTitFatura.Close;
end;

procedure TMovFinCaixaMovimentarTitulo.TabMultiplasShow(Sender: TObject);
begin
  inherited;
	EdtCD_CONTATIT2.EditValue := EdtCD_CONTATIT.EditValue;
	EdtNM_CONTATIT2.EditValue := EdtNM_CONTATIT.EditValue;
	EdtCD_CLIEFORN2.EditValue := EdtCD_CLIEFORN.EditValue;
	EdtNM_CLIEFORN2.EditValue := EdtNM_CLIEFORN.EditValue;
	EdtDT_LIMITE.EditValue := DataTranspApp.DtLancamento;
  DtmFinanceiro.CdsFinTituloCxa.Close;

  ActiveControl := EdtCD_CONTATIT2;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CONTATIT2Exit(Sender: TObject);
begin
  if DataTranspApp.CreateFormSeek(TConFinContatit, Self, [EdtCD_CONTATIT2.EditValue],
    ['NM_CONTA', 'CD_FILIAL', 'FL_DC'], [EdtNM_CONTATIT2, EdtCD_FILIAL_TIT2, EdtFL_DC_TIT2]) then
  begin
    if (EdtCD_FILIAL_TIT2.EditValue <> DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']) then
    begin
      ActiveControl := EdtCD_CONTATIT2;
      EdtCD_CONTATIT2.EditValue := Null;
      raise Exception.Create('Esta conta título pertence a outra filial.');
    end;
    if (EdtFL_DC_TIT2.EditValue = DtmFinanceiro.CdsFinCxaTrn['FL_DC']) then
    begin
      ActiveControl := EdtCD_CONTATIT2;
      EdtCD_CONTATIT2.EditValue := Null;
      raise Exception.Create('Esta conta título é imcompatível com natureza da transação.');
    end;
    if (EdtFL_DC_TIT2.EditValue = 'C') then
      LblCD_CLIEFORN2.Caption := 'Cliente:'
    else
      LblCD_CLIEFORN2.Caption := 'Fornecedor:';
  end
  else begin
    EdtCD_CONTATIT2.EditValue := '0';
    EdtNM_CONTATIT2.EditValue := '<INFORME>';
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CONTATIT2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinContatit, Self, [EdtCD_CONTATIT2.EditValue], [EdtCD_CONTATIT2]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CLIEFORN2Exit(Sender: TObject);
begin
  if not DataTranspApp.CreateFormSeek(TConFinClieforn, Self, [EdtCD_CLIEFORN2.EditValue],
    ['NM_FANTASIA'], [EdtNM_CLIEFORN2]) then
  begin
	  EdtCD_CLIEFORN2.EditValue := '0';
  	EdtNM_CLIEFORN2.EditValue := '<TODOS>';
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtCD_CLIEFORN2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinClieforn, Self, [EdtCD_CLIEFORN2.EditValue], [EdtCD_CLIEFORN2]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtDT_LIMITEExit(Sender: TObject);
var
	ACdContatit,
  ACdClieforn: integer;
  ADtLimite: TDateTime;
begin
  inherited;
  ACdContatit := StrToIntDef(EdtCD_CONTATIT2.Text, 0);
  ACdClieforn := StrToIntDef(EdtCD_CLIEFORN2.Text, 0);
  ADtLimite := StrToDateDef(EdtDT_LIMITE.Text, Date);
  DtmFinanceiro.CdsFinTituloCxa.Close;
  DtmFinanceiro.CdsFinTituloCxa.Params.Clear;
  DtmFinanceiro.SqlFinTituloCxa.ParamByName('CD_CONTA').AsInteger := ACdContatit;
  DtmFinanceiro.SqlFinTituloCxa.ParamByName('CD_CLIEFORN').AsInteger := ACdClieforn;
  DtmFinanceiro.SqlFinTituloCxa.ParamByName('CD_CLIEFORN_ALL').AsInteger := ACdClieforn;
  DtmFinanceiro.SqlFinTituloCxa.ParamByName('DT_LIMITE').AsDate := ADtLimite;
  DtmFinanceiro.CdsFinTituloCxa.Open;
end;

// -- tarefa 2351 -- //
// -- tarefa 2351 -- //
function TMovFinCaixaMovimentarTitulo.GetHistorico(ACdFilial, ANrTransacao: integer): string;
begin
  result := '';
  try
    DtmFinanceiro.SqlHistorico.Close;
    DtmFinanceiro.SqlHistorico.ParamByName('CD_FILIAL').AsInteger := ACdFilial;
    DtmFinanceiro.SqlHistorico.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacao;
    DtmFinanceiro.SqlHistorico.Open;

    if not DtmFinanceiro.SqlHistorico.IsEmpty then
      Result := DtmFinanceiro.SqlHistorico.FieldByName('NM_HISTORICO').AsString;
  finally
    DtmFinanceiro.SqlHistorico.Close;
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.GrdConsultaDBTableView1FL_BAIXAHeaderClick(
  Sender: TObject);
begin

  // -- Baixar o saldo de todos os títulos selecionados
  GrdConsultaView.DataController.GotoFirst;
  While Not GrdConsultaView.DataController.IsEOF Do
  Begin
		if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdConsultaDBTableView1CD_MOEDA.EditValue, '1'))) then // real default
		begin
			GrdConsultaDBTableView1FL_BAIXA.EditValue := 1;
			GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := GrdConsultaDBTableView1VL_SALDO.EditValue;
			GrdConsultaView.DataController.PostEditingData;
			GrdConsultaView.DataController.GotoNext;
		end
		else begin
			GrdConsultaDBTableView1FL_BAIXA.EditValue := 0;
			GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := 0;
		end;
	End;

	if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdConsultaDBTableView1CD_MOEDA.EditValue, '1'))) then // real default
	begin

		// -- Setar o último registro que não é atribuido pela rotina acima ...
		GrdConsultaDBTableView1FL_BAIXA.EditValue := 1;
		GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := GrdConsultaDBTableView1VL_SALDO.EditValue;
		GrdConsultaView.DataController.PostEditingData;

		// -- Vai e volta para gravar nos totais ...
		GrdConsultaView.DataController.GotoPrev;
		GrdConsultaView.DataController.GotoNext;

	end
	else begin
		GrdConsultaDBTableView1FL_BAIXA.EditValue := 0;
		GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := 0;
	end;

end;

procedure TMovFinCaixaMovimentarTitulo.GrdConsultaDBTableView1FL_BAIXAPropertiesEditValueChanged(
  Sender: TObject);
begin

	// -- Baixar / Estornar o saldo do título marcado pelo checkbox ...
	if (GrdConsultaDBTableView1FL_BAIXA.EditValue = 0) then
		GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := 0
	else begin

		if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdConsultaDBTableView1CD_MOEDA.EditValue, '1'))) then // real default
		begin
			GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := GrdConsultaDBTableView1VL_SALDO.EditValue;
		end
		else begin
			GrdConsultaDBTableView1FL_BAIXA.EditValue := 0;
			GrdConsultaDBTableView1VL_LCTO_BAIXA.EditValue := 0;
    end;

  end;

  // -- Vai e volta para gravar nos totais ...
  GrdConsultaView.DataController.GotoNext;
  GrdConsultaView.DataController.GotoPrev;

end;

procedure TMovFinCaixaMovimentarTitulo.GrdConsultaDBTableView1VL_LCTO_BAIXAPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;

  // -- Vai e volta para gravar nos totais ...
  GrdConsultaView.DataController.GotoNext;
  GrdConsultaView.DataController.GotoPrev;

end;

procedure TMovFinCaixaMovimentarTitulo.GrdFinCartaFreteFL_SELECIONADOHeaderClick(
  Sender: TObject);
begin

	if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdFinCartaFreteCD_MOEDA.EditValue, '1'))) then // real default
	begin

    GrdFinCartaFreteView.DataController.GotoFirst;
    While Not GrdFinCartaFreteView.DataController.IsEOF Do
    begin
      GrdFinCartaFreteFL_SELECIONADO.EditValue := 1;
      GrdFinCartaFreteView.DataController.PostEditingData;

      if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdFinCartaFreteCD_MOEDA.EditValue, '1'))) then // real default
      begin
        GrdFinCartaFreteFL_SELECIONADO.EditValue := 1;
        GrdFinCartaFreteVL_BAIXA.EditValue := GrdFinCartaFreteVL_SALDO.EditValue;
        GrdFinCartaFreteView.DataController.PostEditingData;
        GrdFinCartaFreteView.DataController.GotoNext;
      end
      else
      begin
        GrdFinCartaFreteFL_SELECIONADO.EditValue := 0;
        GrdFinCartaFreteVL_BAIXA.EditValue := 0;
      end;
    end;
  end;

	if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdFinCartaFreteCD_MOEDA.EditValue, '1'))) then // real default
	begin
    // -- Setar o último registro que não é atribuido pela rotina acima ...
    GrdFinCartaFreteFL_SELECIONADO.EditValue := 1;
    GrdFinCartaFreteVL_BAIXA.EditValue := GrdFinCartaFreteVL_SALDO.EditValue;
    GrdFinCartaFreteView.DataController.PostEditingData;

    // -- Vai e volta para gravar nos totais ...
    GrdFinCartaFreteView.DataController.GotoPrev;
    GrdFinCartaFreteView.DataController.GotoNext;
    GrdFinCartaFreteView.DataController.GotoFirst;  // jogar para o primeiro p/ ñ ter problema no proximo while
  end
  else
  begin
    GrdFinCartaFreteFL_SELECIONADO.EditValue := 0;
    GrdFinCartaFreteVL_BAIXA.EditValue := 0;
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.GrdFinCartaFreteFL_SELECIONADOPropertiesEditValueChanged(
  Sender: TObject);
begin
  if DtmFinanceiro.CdsCartaFreteCTRCGrid['FL_SELECIONADO'] = 1 then
    DtmFinanceiro.CdsCartaFreteCTRCGrid['FL_SELECIONADO'] := 0
  else
    DtmFinanceiro.CdsCartaFreteCTRCGrid['FL_SELECIONADO'] := 1;

  // -- Baixar / Estornar o saldo do título marcado pelo checkbox ...
	if (GrdFinCartaFreteFL_SELECIONADO.EditValue = 0) then
		GrdFinCartaFreteVL_BAIXA.EditValue := 0
	else
		if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdFinCartaFreteCD_MOEDA.EditValue, '1'))) then // real default
			GrdFinCartaFreteVL_BAIXA.EditValue := GrdFinCartaFreteVL_SALDO.EditValue
    else
			GrdFinCartaFreteVL_BAIXA.EditValue := 0;

  // -- Vai e volta para gravar nos totais ...
  GrdFinCartaFreteView.DataController.GotoNext;
  GrdFinCartaFreteView.DataController.GotoPrev;
  inherited;
end;

procedure TMovFinCaixaMovimentarTitulo.GrdFinCartaFreteVL_BAIXAPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  // -- Vai e volta para gravar nos totais ...
  GrdFinCartaFreteView.DataController.GotoNext;
  GrdFinCartaFreteView.DataController.GotoPrev;
end;

procedure TMovFinCaixaMovimentarTitulo.GrdTitFaturaViewFL_BAIXAHeaderClick(
  Sender: TObject);
begin
  // -- Baixar o saldo de todos os títulos selecionados
  GrdTitFaturaView.DataController.GotoFirst;
  While Not GrdTitFaturaView.DataController.IsEOF Do
  Begin
		if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdTitFaturaViewCD_MOEDA.EditValue, '1'))) then // real default
		begin
			GrdTitFaturaViewFL_BAIXA.EditValue := 1;
			GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := GrdTitFaturaViewVL_SALDO.EditValue;
			GrdTitFaturaView.DataController.PostEditingData;
			GrdTitFaturaView.DataController.GotoNext;
		end
		else begin
			GrdTitFaturaViewFL_BAIXA.EditValue := 0;
			GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := 0;
		end;
	End;

	if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdTitFaturaViewCD_MOEDA.EditValue, '1'))) then // real default
	begin

		// -- Setar o último registro que não é atribuido pela rotina acima ...
		GrdTitFaturaViewFL_BAIXA.EditValue := 1;
		GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := GrdTitFaturaViewVL_SALDO.EditValue;
		GrdTitFaturaView.DataController.PostEditingData;

		// -- Vai e volta para gravar nos totais ...
		GrdTitFaturaView.DataController.GotoPrev;
		GrdTitFaturaView.DataController.GotoNext;

	end
	else begin
		GrdTitFaturaViewFL_BAIXA.EditValue := 0;
		GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := 0;
	end;
end;

procedure TMovFinCaixaMovimentarTitulo.GrdTitFaturaViewFL_BAIXAPropertiesEditValueChanged(
  Sender: TObject);
begin
	// -- Baixar / Estornar o saldo do título marcado pelo checkbox ...
	if (GrdTitFaturaViewFL_BAIXA.EditValue = 0) then
		GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := 0
	else begin

		if ValidarTituloMoeda(StrToInt(VarToStrDef(GrdTitFaturaViewCD_MOEDA.EditValue, '1'))) then // real default
		begin
			GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := GrdTitFaturaViewVL_SALDO.EditValue;
		end
		else begin
			GrdTitFaturaViewFL_BAIXA.EditValue := 0;
			GrdTitFaturaViewVL_LCTO_BAIXA.EditValue := 0;
    end;

  end;
  // -- para totalizar os totas e fazer a validação do saldo no beforepost
  if DtmFinanceiro.CdsFinTitFatura.State in [dsInsert, dsEdit] then
    DtmFinanceiro.CdsFinTitFatura.Post;
end;

procedure TMovFinCaixaMovimentarTitulo.GrdTitFaturaViewVL_LCTO_BAIXAPropertiesEditValueChanged(
  Sender: TObject);
begin
  // -- para totalizar os totas e fazer a validação do saldo no beforepost
  if DtmFinanceiro.CdsFinTitFatura.State in [dsInsert, dsEdit] then
    DtmFinanceiro.CdsFinTitFatura.Post;
end;

procedure TMovFinCaixaMovimentarTitulo.EdtNR_FATURAExit(Sender: TObject);
begin

	if DataTranspApp.CreateFormSeek(TConFinFinFatura, Self, [EdtNR_FATURA.EditValue],
		['CD_FILIAL', 'FL_DC', 'CD_CLIEFORN', 'NM_CLIEFORN', 'CD_MOEDA'],
		[EdtCD_FILIAL_TIT3, EdtFL_DC_TIT3, EdtCD_CLIEFORN3, EdtNM_CLIEFORN3, EdtCD_MOEDA_TIT3]) then
	begin
		if (EdtCD_FILIAL_TIT3.EditValue <> DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']) then
		begin
			EdtNR_FATURA.Clear;
			EdtNR_FATURA.SetFocus;
			raise Exception.Create('Esta fatura possui uma conta título que pertence a outra filial.');
		end;
	end;

	if ValidarTituloMoeda(StrToIntDef(EdtCD_MOEDA_TIT3.Text, 1)) then // real default
	begin
		DtmFinanceiro.CdsFinTitFatura.Close;
		DtmFinanceiro.CdsFinTitFatura.Params.Clear;
		DtmFinanceiro.SqlFinTitFatura.ParamByName('NR_FATURA').AsInteger := StrToIntDef(EdtNR_FATURA.Text, 0);
		DtmFinanceiro.CdsFinTitFatura.Open;
	end
	else begin
		EdtNR_FATURA.Clear;
		EdtNR_FATURA.SetFocus;
  end;

end;

procedure TMovFinCaixaMovimentarTitulo.EdtNR_FATURAPropertiesButtonClick(
	Sender: TObject; AButtonIndex: Integer);
begin
	DataTranspApp.CreateFormMdi(TConFinFinFatura, Self, [EdtNR_FATURA.EditValue], [EdtNR_FATURA]);
end;

procedure TMovFinCaixaMovimentarTitulo.EdtNR_CONHECExit(Sender: TObject);
begin
  inherited;
  if EdtNR_CONHEC.Text <> '' then
  begin
    Screen.Cursor := crHourGlass;
    try

      DtmFinanceiro.CdsCartaFreteCTRC.Close;
      DtmFinanceiro.CdsCartaFreteCTRC.Params.Clear;
      DtmFinanceiro.SqlCartaFreteCTRC.Params.ParamByName('SR_CONHEC').AsString := EdtSR_CONHEC.Text;
      DtmFinanceiro.SqlCartaFreteCTRC.Params.ParamByName('NR_CONHEC').AsInteger := EdtNR_CONHEC.EditValue;
      DtmFinanceiro.CdsCartaFreteCTRC.Open;

      while not DtmFinanceiro.CdsCartaFreteCTRC.Eof do
      begin

        DtmFinanceiro.CdsCartaFreteCTRCGrid.IndexFieldNames := 'CD_FILIAL;NR_TRANSACAO;NR_PARCELA';

        if not DtmFinanceiro.CdsCartaFreteCTRCGrid.FindKey([DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('CD_FILIAL').AsInteger,
                                                             DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('NR_TRANSACAO').AsInteger,
                                                               DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('NR_PARCELA').AsInteger]) then
        begin
          DtmFinanceiro.CdsCartaFreteCTRCGrid.Insert;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('SR_TITULO').AsString       := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('SR_TITULO').AsString;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('NR_TITULO').AsInteger      := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('NR_TITULO').AsInteger;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('CD_FILIAL').AsInteger      := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('CD_FILIAL').AsInteger;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('NR_PARCELA').AsInteger     := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('NR_PARCELA').AsInteger;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('NR_TRANSACAO').AsInteger   := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('NR_TRANSACAO').AsInteger;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('DT_EMISSAO').AsDateTime    := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('DT_EMISSAO').AsDateTime;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('DT_VENCIMENTO').AsDateTime := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('DT_VENCIMENTO').AsDateTime;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('VL_SALDO').AsFloat         := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('VL_SALDO').AsFloat;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('VL_NOMINAL').AsFloat       := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('VL_NOMINAL').AsFloat;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('VL_ACRESCIMOS').AsFloat    := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('VL_ACRESCIMOS').AsFloat;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('VL_DESCONTOS').AsFloat     := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('VL_DESCONTOS').AsFloat;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('FL_SELECIONADO').AsInteger := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('FL_SELECIONADO').AsInteger;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('FL_DC').AsString           := DtmFinanceiro.CdsCartaFreteCTRC.FieldByName('FL_DC').AsString;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('VL_BAIXA').AsFloat         := 0.00;
          DtmFinanceiro.CdsCartaFreteCTRCGrid.Post;
        end;

        DtmFinanceiro.CdsCartaFreteCTRC.Next;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TMovFinCaixaMovimentarTitulo.EdtNR_CONHECPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  // -- Consultar conhecimentos de fretes para buscar sua carta frete...
  DataTranspApp.CreateFormMdi(TConFrtConhecto, Self, [EdtSR_CONHEC.EditValue, EdtNR_CONHEC.EditValue],
    [EdtSR_CONHEC, EdtNR_CONHEC]);
end;

function TMovFinCaixaMovimentarTitulo.ValidarTituloMoeda(ACdMoedaTitulo: integer): boolean;
begin

	if (TMovFinCaixaMovimentar(Self.Owner).FCdMoeda = -1) then
		TMovFinCaixaMovimentar(Self.Owner).FCdMoeda := ACdMoedaTitulo; // -- Inicializar moeda ...
                                                                           // Validar Moeda somente qunado for diferente de real
	if ((TMovFinCaixaMovimentar(Self.Owner).FCdMoeda <> ACdMoedaTitulo) and (ACdMoedaTitulo <> 1)) then
	begin
		Result := False;
		Application.MessageBox('Este TÍTULO possui uma moeda diferente da utilizada na transação.', PChar(Self.Caption), MB_ICONERROR); // -- Validar moeda com a informada ...
	end
	else
		Result := True;
                                                      
end;

procedure TMovFinCaixaMovimentarTitulo.BtnNovoClick(Sender: TObject);
begin

	// -- Novo lançamento
	PgcTitulo.ActivePage := TabSimples;
	EdtCD_CONTATIT.Clear;
  EdtNM_CONTATIT.Clear;
  EdtCD_FILIAL_TIT.Clear;
  EdtNR_TRANSACAO_TIT.Clear;
  EdtVL_SALDO_TIT.Clear;
  EdtFL_DC_TIT.Clear;
  EdtTP_LANCAMENTO.Clear;
  EdtCD_CLIEFORN.Clear;
  EdtNM_CLIEFORN.Clear;
  EdtSR_TITULO.Clear;
  EdtNR_TITULO.Clear;
  EdtNR_PARCELA.Clear;
  EdtDT_EMISSAO.Clear;
  EdtDT_VENCIMENTO.Clear;
  EdtVL_NOMINAL.Clear;
  EdtVL_ACRESCIMOS.Clear;
  EdtVL_DESCONTOS.Clear;
  EdtVL_BAIXA.Clear;
  EdtCD_HISTORICO.Clear;
  EdtVL_LANCAMENTO.Value := 0;
  EdtVL_LANCAMENTO.Clear;
  EdtNR_FATURA.Clear;
  EdtCD_FILIAL_TIT3.Clear;
  EdtCD_CLIEFORN3.Clear;
  EdtNM_CLIEFORN3.Clear;
  EdtNR_CONHEC.Clear;

  // -- Tarefa: 3501 ...
  EdtCD_HIST.Clear;

	SelectFirst;
end;

procedure TMovFinCaixaMovimentarTitulo.BtnSelecionarClick(Sender: TObject);
begin
  if not (DtmFinanceiro.CdsFinTituloCxa.IsEmpty) then
  begin
		DataTranspApp.CreateFormMdi(TMovFinTituloMovimentar, Self, [DtmFinanceiro.CdsFinTituloCxa['CD_FILIAL'],
			DtmFinanceiro.CdsFinTituloCxa['NR_TRANSACAO'], DtmFinanceiro.CdsFinTituloCxa['NR_PARCELA']], []);
  end;
end;

procedure TMovFinCaixaMovimentarTitulo.BtnConfirmarClick(Sender: TObject);
var
  ANmHistDet,
  ANmHistorico: string;
  procedure IncluirBaixa(ACdFilialTit, ANrTransacaoTit, ANrParcelaTit: integer;
  	ANmHistorico: string; AVlLancamento: Extended; ATpLancamento, AFlTitulo, AFlDC: string);
  begin

		Screen.Cursor := crSQLWait;
		try

      DtmFinanceiro.CdsFinTitCxaLct.Close;
      DtmFinanceiro.CdsFinTitCxaLct.Params.Clear;
      DtmFinanceiro.SqlFinTitCxaLct.ParamByName('CD_FILIAL').AsInteger := ACdFilialTit;
      DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacaoTit;
      DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_PARCELA').AsInteger := ANrParcelaTit;
      DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_LANCAMENTO').AsInteger := 0; // -- Todos os lançamentos
      DtmFinanceiro.CdsFinTitCxaLct.Open;

      DtmFinanceiro.CdsFinTitCxaLct.Insert;
      DtmFinanceiro.CdsFinTitCxaLct['CD_FILIAL'] := ACdFilialTit;
      DtmFinanceiro.CdsFinTitCxaLct['NR_TRANSACAO'] := ANrTransacaoTit;
      DtmFinanceiro.CdsFinTitCxaLct['NR_PARCELA'] := ANrParcelaTit;
      DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO'] := 0;
      DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO_EST'] := 0;
      DtmFinanceiro.CdsFinTitCxaLct['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
      DtmFinanceiro.CdsFinTitCxaLct['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];

      // -- Tarefa: 3501 ...
      if EdtCD_HIST.Text <> EmptyStr then
        DtmFinanceiro.CdsFinTitCxaLct['CD_HISTORICO'] := EdtCD_HIST.EditValue;

      DtmFinanceiro.CdsFinTitCxaLct['NM_HISTORICO'] := ANmHistorico;
      DtmFinanceiro.CdsFinTitCxaLct['VL_LANCAMENTO'] := AVlLancamento;
      DtmFinanceiro.CdsFinTitCxaLct['TP_LANCAMENTO'] := ATpLancamento;
      DtmFinanceiro.CdsFinTitCxaLct['FL_TITULO'] := AFlTitulo; // 'B'; // Baixa ...
      DtmFinanceiro.CdsFinTitCxaLct['FL_DC'] := AFlDC; // 'C'; // Inclusão de baixa (trigger atualiza campo cfe lançamento) ...
      DtmFinanceiro.CdsFinTitCxaLct['FL_CONCILIADO'] := 'N';
      DtmFinanceiro.CdsFinTitCxaLct['FL_CONTABILIZADO'] := 'N';
      DtmFinanceiro.CdsFinTitCxaLct.Post;
      DtmFinanceiro.CdsFinTitCxaLct.ApplyUpdates(0);

      DtmFinanceiro.CdsFinTitCxaLct.Close;
      DtmFinanceiro.CdsFinTitCxaLct.Open;
      DtmFinanceiro.CdsFinTitCxaLct.Last;

      DtmFinanceiro.CdsFinTitCxa.Insert;
      DtmFinanceiro.CdsFinTitCxa['CD_FILIAL'] := DtmFinanceiro.CdsFinTitCxaLct['CD_FILIAL']; // Titulo, Caixa
      DtmFinanceiro.CdsFinTitCxa['NR_TRANSACAO'] := DtmFinanceiro.CdsFinTitCxaLct['NR_TRANSACAO']; // Titulo
      DtmFinanceiro.CdsFinTitCxa['NR_PARCELA'] := DtmFinanceiro.CdsFinTitCxaLct['NR_PARCELA']; // Titulo
      DtmFinanceiro.CdsFinTitCxa['NR_LANCAMENTO'] := DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO']; // Titulo
      DtmFinanceiro.CdsFinTitCxa['NR_TRANSACAO_CXA'] := DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO']; // Caixa

      DtmFinanceiro.CdsFinTitCxa.Post;
      DtmFinanceiro.CdsFinTitCxa.ApplyUpdates(0);
      DtmFinanceiro.CdsFinTitCxa.Close;
      DtmFinanceiro.CdsFinTitCxa.Open;

    finally
      Screen.Cursor := crDefault;
    end;

  end;

begin

  if (PgcTitulo.ActivePage = TabSimples) then // -- Apenas uma baixa por vez ...
  begin

    // -- Validar ...

	// -- Tarefa 807
    if FmtVerificarStr(EdtNR_TITULO.Text) <> '' then
    begin
      ActiveControl := EdtNR_TITULO;
      raise Exception.Create('O campo número do título não deve conter letras, apenas números.');
    end;

    if (EdtCD_CONTATIT.Text = '') then
    begin
      ActiveControl := EdtCD_CONTATIT;
      raise Exception.Create('O campo conta título é obrigatório.');
    end;

    if (EdtCD_CLIEFORN.Text = '') then
    begin
      ActiveControl := EdtCD_CLIEFORN;
      raise Exception.Create('O campo '+LblCD_CLIEFORN.Caption+' é obrigatório.');
    end;

    if (EdtSR_TITULO.Text = '') then
    begin
      ActiveControl := EdtSR_TITULO;
      raise Exception.Create('O campo série do título é obrigatório.');
    end;

    if (EdtNR_TITULO.Text = '') then
    begin
      ActiveControl := EdtNR_TITULO;
      raise Exception.Create('O campo número do título é obrigatório.');
    end;

    if (EdtNR_PARCELA.Text = '') then
    begin
      ActiveControl := EdtNR_PARCELA;
      raise Exception.Create('O campo parcela do título é obrigatório.');
    end;

    if (EdtNR_TRANSACAO_TIT.Text = '') then
    begin
      ActiveControl := EdtNR_PARCELA;
      raise Exception.Create('Título não encontrado.');
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
    // Ajustar valor de acordo com o Cambio de baixa
    FVlNominal := EdtVL_LANCAMENTO.EditValue;
    if EdtCD_MOEDA.EditValue > 1 then
    begin
      DataTranspApp.CreateFormNormal(TMovFinCaixaMovimentarTitMoeda,Self, [EdtCD_MOEDA.EditValue,
        EdtCD_FILIAL_TIT.EditValue, EdtNR_TRANSACAO_TIT.EditValue,FVlMoeda,EdtNR_PARCELA.EditValue,
        FVlNominal],[EdtCD_MOEDA]);
    end;

  	// -- Executar a baixa ...

    IncluirBaixa(EdtCD_FILIAL_TIT.EditValue, EdtNR_TRANSACAO_TIT.EditValue, EdtNR_PARCELA.EditValue,
    	EdtCD_HISTORICO.Text, {}EdtVL_LANCAMENTO.Value{}, EdtTP_LANCAMENTO.Text, EdtFL_TITULO.Text, EdtFL_DC.Text);

  end;

	if (PgcTitulo.ActivePage = TabMultiplas) then // -- Várias baixas ...
  begin

    DtmFinanceiro.CdsFinTituloCxa.DisableControls;

    DtmFinanceiro.CdsFinTituloCxa.First;
    while Not DtmFinanceiro.CdsFinTituloCxa.Eof do
    begin

      if (DtmFinanceiro.CdsFinTituloCxa.FieldByName('VL_LCTO_BAIXA').AsFloat > 0) then
      begin
        ANmHistDet := GetHistorico(DtmFinanceiro.CdsFinTituloCxa.FieldByName('CD_FILIAL').AsInteger,
                                   DtmFinanceiro.CdsFinTituloCxa.FieldByName('NR_TRANSACAO').AsInteger);

        ANmHistorico := '';
        if (DtmFinanceiro.CdsFinTituloCxa['FL_DC'] = 'C') then
          ANmHistorico := ANmHistorico + 'REC TIT Nº '
        else
          ANmHistorico := ANmHistorico + 'PGT TIT Nº ';
        ANmHistorico := ANmHistorico + VarToStr(DtmFinanceiro.CdsFinTituloCxa['SR_TITULO']) + '.' + VarToStr(DtmFinanceiro.CdsFinTituloCxa['NR_TITULO']) +
          '.' + VarToStr(DtmFinanceiro.CdsFinTituloCxa['NR_PARCELA']) + ' DE ' + VarToStr(DtmFinanceiro.CdsFinTituloCxa['NM_FANTASIA']) + IfThen(ANmHistDet <> EmptyStr, ' REF ' + ANmHistDet, '');

        IncluirBaixa(DtmFinanceiro.CdsFinTituloCxa['CD_FILIAL'], DtmFinanceiro.CdsFinTituloCxa['NR_TRANSACAO'],
          DtmFinanceiro.CdsFinTituloCxa['NR_PARCELA'], ANmHistorico, DtmFinanceiro.CdsFinTituloCxa['VL_LCTO_BAIXA'],
            EdtTP_LANCAMENTO.Text, EdtFL_TITULO.Text, EdtFL_DC.Text);

      end;

      DtmFinanceiro.CdsFinTituloCxa.Next;
    end;

    // -- NÃO PRECISA POIS FECHA O FORMULÁRIO ABAIXO ...
    //DtmFinanceiro.CdsFinTituloCxa.Close; // -- Atualizar para calcular os totais corretamente ...
    //DtmFinanceiro.CdsFinTituloCxa.Open;

    DtmFinanceiro.CdsFinTituloCxa.EnableControls;

  end;

	if (PgcTitulo.ActivePage = TabFatura) then // -- Várias baixas ...
  begin

    DtmFinanceiro.CdsFinTitFatura.DisableControls;

    DtmFinanceiro.CdsFinTitFatura.First;
    while Not DtmFinanceiro.CdsFinTitFatura.Eof do
    begin

      if (DtmFinanceiro.CdsFinTitFatura.FieldByName('FL_BAIXA').AsInteger = 1) then
      begin
        if (DtmFinanceiro.CdsFinTitFatura.FieldByName('VL_LCTO_BAIXA').AsFloat > 0) then
        begin
          ANmHistDet := GetHistorico(DtmFinanceiro.CdsFinTitFatura.FieldByName('CD_FILIAL').AsInteger,
                                DtmFinanceiro.CdsFinTitFatura.FieldByName('NR_TRANSACAO').AsInteger);

          ANmHistorico := '';
          if (DtmFinanceiro.CdsFinTitFatura['FL_DC'] = 'C') then
            ANmHistorico := ANmHistorico + 'REC TIT Nº '
          else
            ANmHistorico := ANmHistorico + 'PGT TIT Nº ';
          ANmHistorico := ANmHistorico + VarToStr(DtmFinanceiro.CdsFinTitFatura['SR_TITULO']) + '.' + VarToStr(DtmFinanceiro.CdsFinTitFatura['NR_TITULO']) +
            '.' + VarToStr(DtmFinanceiro.CdsFinTitFatura['NR_PARCELA']) + ' DE ' + VarToStr(DtmFinanceiro.CdsFinTitFatura['NM_FANTASIA']) + IfThen(ANmHistDet <> EmptyStr, ' REF ' + ANmHistDet, '');

          IncluirBaixa(DtmFinanceiro.CdsFinTitFatura['CD_FILIAL'], DtmFinanceiro.CdsFinTitFatura['NR_TRANSACAO'],
            DtmFinanceiro.CdsFinTitFatura['NR_PARCELA'], ANmHistorico, DtmFinanceiro.CdsFinTitFatura['VL_LCTO_BAIXA'],
              EdtTP_LANCAMENTO.Text, EdtFL_TITULO.Text, EdtFL_DC.Text);

        end;
      end;
      DtmFinanceiro.CdsFinTitFatura.Next;
    end;

    // -- NÃO PRECISA POIS FECHA O FORMULÁRIO ABAIXO ...
    //DtmFinanceiro.CdsFinTituloCxa.Close; // -- Atualizar para calcular os totais corretamente ...
    //DtmFinanceiro.CdsFinTituloCxa.Open;

    DtmFinanceiro.CdsFinTitFatura.EnableControls;

  end;

  if (PgcTitulo.ActivePage = TabCartaFrete) then // -- Várias baixas ...
  begin

    DtmFinanceiro.CdsCartaFreteCTRCGrid.DisableControls;

    DtmFinanceiro.CdsCartaFreteCTRCGrid.First;
    while Not DtmFinanceiro.CdsCartaFreteCTRCGrid.Eof do
    begin

      if (DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('VL_BAIXA').AsFloat > 0) then
      begin
        ANmHistDet := GetHistorico(DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('CD_FILIAL').AsInteger,
                              DtmFinanceiro.CdsCartaFreteCTRCGrid.FieldByName('NR_TRANSACAO').AsInteger);

        ANmHistorico := '';
        if (DtmFinanceiro.CdsCartaFreteCTRCGrid['FL_DC'] = 'C') then
          ANmHistorico := ANmHistorico + 'REC TIT Nº '
        else
          ANmHistorico := ANmHistorico + 'PGT TIT Nº ';
        ANmHistorico := ANmHistorico + VarToStr(DtmFinanceiro.CdsCartaFreteCTRCGrid['SR_TITULO']) + '.' + VarToStr(DtmFinanceiro.CdsCartaFreteCTRCGrid['NR_TITULO']) +
          '.' + VarToStr(DtmFinanceiro.CdsCartaFreteCTRCGrid['NR_PARCELA']) + IfThen(ANmHistDet <> EmptyStr, ' REF ' + ANmHistDet, '') ;

        if DtmFinanceiro.CdsCartaFreteCTRCGrid['FL_SELECIONADO'] = 1 then
          IncluirBaixa(DtmFinanceiro.CdsCartaFreteCTRCGrid['CD_FILIAL'], DtmFinanceiro.CdsCartaFreteCTRCGrid['NR_TRANSACAO'],
            DtmFinanceiro.CdsCartaFreteCTRCGrid['NR_PARCELA'], ANmHistorico, DtmFinanceiro.CdsCartaFreteCTRCGrid['VL_BAIXA'],
              EdtTP_LANCAMENTO.Text, EdtFL_TITULO.Text, EdtFL_DC.Text);
      end;

      DtmFinanceiro.CdsCartaFreteCTRCGrid.Next;
    end;

    // -- NÃO PRECISA POIS FECHA O FORMULÁRIO ABAIXO ...
    //DtmFinanceiro.CdsFinTituloCxa.Close; // -- Atualizar para calcular os totais corretamente ...
    //DtmFinanceiro.CdsFinTituloCxa.Open;

    DtmFinanceiro.CdsCartaFreteCTRCGrid.EnableControls;

  end;

  // -- Totalizar a transação ...

  Self.Close;
  TMovFinCaixaMovimentar(Self.Owner).BtnTotalizarTransacao;

end;

procedure TMovFinCaixaMovimentarTitulo.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  // -- Cancelar
  Self.Close;
end;

initialization
  RegisterClass(TMovFinCaixaMovimentarTitulo);

end.
