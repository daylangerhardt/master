unit mFinCaixaMovimentarClieforn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, uPadraoMDI, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsdxStatusBarPainter, dxStatusBar,
  ExtCtrls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, cxLabel, cxTextEdit,
  dxSkinscxPCPainter, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDropDownEdit, cxCalendar, cxDBEdit, Menus, StdCtrls, cxButtons,
  cxCurrencyEdit, cxCheckBox;

type
  TMovFinCaixaMovimentarClieforn = class(TFrmPadraoMDI)
    PgcTitulo: TcxPageControl;
    TabReceber: TcxTabSheet;
    TabPagar: TcxTabSheet;
    GrdReceberView: TcxGridDBTableView;
    GrdReceberLevel: TcxGridLevel;
    GrdReceber: TcxGrid;
    StatusBarContainer7: TdxStatusBarContainerControl;
    StatusBarContainer8: TdxStatusBarContainerControl;
    BtnConfirmar: TcxButton;
    BtnCancelar: TcxButton;
    GrdReceberViewCD_CONTA: TcxGridDBColumn;
    GrdReceberViewSR_TITULO: TcxGridDBColumn;
    GrdReceberViewNR_TITULO: TcxGridDBColumn;
    GrdReceberViewNR_PARCELA: TcxGridDBColumn;
    GrdReceberViewDT_EMISSAO: TcxGridDBColumn;
    GrdReceberViewDT_VENCIMENTO: TcxGridDBColumn;
    GrdReceberViewVL_SALDO: TcxGridDBColumn;
    GrdReceberViewVL_LCTO_BAIXA: TcxGridDBColumn;
    GrdReceberViewFL_BAIXA: TcxGridDBColumn;
    GrdPagar: TcxGrid;
    GrdPagarView: TcxGridDBTableView;
    GrdPagarViewCD_CONTA: TcxGridDBColumn;
    GrdPagarViewSR_TITULO: TcxGridDBColumn;
    GrdPagarViewNR_TITULO: TcxGridDBColumn;
    GrdPagarViewNR_PARCELA: TcxGridDBColumn;
    GrdPagarViewDT_EMISSAO: TcxGridDBColumn;
    GrdPagarViewDT_VENCIMENTO: TcxGridDBColumn;
    GrdPagarViewVL_SALDO: TcxGridDBColumn;
    GrdPagarViewVL_LCTO_BAIXA: TcxGridDBColumn;
    GrdPagarViewFL_BAIXA: TcxGridDBColumn;
    GrdPagarLevel: TcxGridLevel;
    PnlFiltro: TPanel;
    EdtCD_FILIAL_CXA: TcxTextEdit;
    EdtDT_FECHAMENTO_CXA: TcxTextEdit;
    EdtFL_DC_CXA: TcxTextEdit;
    EdtCD_MOTORISTA: TcxTextEdit;
    EdtCD_MOEDA_CXA: TcxTextEdit;
    LblCD_CONTA: TcxLabel;
    LblCD_CLIEFORN: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    EdtCD_CONTACXA: TcxButtonEdit;
    EdtNM_CONTACXA: TcxTextEdit;
    EdtCD_CLIEFORN: TcxButtonEdit;
    EdtNM_CLIEFORN: TcxTextEdit;
    EdtCD_CONTADET: TcxButtonEdit;
    EdtNM_CONTADET: TcxTextEdit;
    EdtDT_MOVIMENTO: TcxDateEdit;
    EdtVL_DIFERENCA: TcxCurrencyEdit;
    StyCaixa: TcxStyleRepository;
    StyEntrada: TcxStyle;
    StySaida: TcxStyle;
    StyEven: TcxStyle;
    StyOdd: TcxStyle;
    StyInactive: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCalcularDiferencaClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure EdtCD_CONTACXAExit(Sender: TObject);
    procedure EdtCD_CONTACXAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtCD_CLIEFORNExit(Sender: TObject);
    procedure EdtCD_CLIEFORNPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtCD_CONTADETExit(Sender: TObject);
    procedure EdtCD_CONTADETPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtDT_MOVIMENTOEnter(Sender: TObject);
    procedure GrdReceberViewFL_BAIXAHeaderClick(Sender: TObject);
    procedure GrdReceberViewColumn9PropertiesEditValueChanged(Sender: TObject);
    procedure GrdPagarViewFL_BAIXAHeaderClick(Sender: TObject);
    procedure GrdPagarViewFL_BAIXAPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MovFinCaixaMovimentarClieforn: TMovFinCaixaMovimentarClieforn;

implementation

uses dPrincipal, dFinanceiro, qFinContacxa, qFinClieforn, qFinContadet,
  dUsuario;

{$R *.dfm}

procedure TMovFinCaixaMovimentarClieforn.FormCreate(Sender: TObject);
begin

  inherited;

	EdtCD_CONTACXA.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_CLIEFORN.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_CONTADET.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');

  BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');

  BtnCancelarClick(Self);

end;

procedure TMovFinCaixaMovimentarClieforn.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if (Key in [VK_UP, VK_DOWN]) and not (GrdReceber.Focused) then Exit;
	if (Key in [VK_UP, VK_DOWN]) and not (GrdPagar.Focused) then Exit;
	inherited;
	if (Key = VK_F2) and (BtnConfirmar.Enabled) then BtnConfirmar.Click;
  if (Key = VK_F3) and (BtnCancelar.Enabled) then BtnCancelar.Click;
end;

procedure TMovFinCaixaMovimentarClieforn.EdtCD_CONTACXAExit(Sender: TObject);
begin
	if DataTranspApp.CreateFormSeek(TConFinContacxa, Self, [EdtCD_CONTACXA.EditValue],
		['NM_CONTA', 'CD_FILIAL', 'CD_MOEDA', 'DT_ULT_FECHAMENTO'],
			[EdtNM_CONTACXA, EdtCD_FILIAL_CXA, EdtCD_MOEDA_CXA, EdtDT_FECHAMENTO_CXA]) then
	begin
//		if (EdtCD_FILIAL_CXA.EditValue <> DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']) then
//		begin
//			ActiveControl := EdtCD_CONTACXA;
//			EdtCD_CONTACXA.EditValue := Null;
//			raise Exception.Create('Esta conta caixa pertence a outra filial.');
//		end;
		if not DtmUsuario.ValidarUsuarioCaixaAcesso(DataTranspApp.UserId,
			StrToInt(EdtCD_CONTACXA.Text)) then
		begin
			EdtCD_CONTACXA.Clear;
			EdtCD_CONTACXA.SetFocus;
			raise Exception.Create('Este usuário não tem permissão para utilizar este recurso deste caixa / conta corrente.');
		end;
		// -- Validar a moeda ...
//		if (TMovFinCaixaMovimentar(Self.Owner).FCdMoeda = -1) then
//			TMovFinCaixaMovimentar(Self.Owner).FCdMoeda := StrToIntDef(EdtCD_MOEDA_CXA.Text, 0); // -- Inicializar moeda ...
//		if (TMovFinCaixaMovimentar(Self.Owner).FCdMoeda <> StrToIntDef(EdtCD_MOEDA_CXA.Text, 0)) then
//		begin
//			EdtCD_CONTACXA.Clear;
//			EdtCD_CONTACXA.SetFocus;
//			raise Exception.Create('Esta conta caixa possui uma moeda diferente da utilizada na transação.');
//		end;
		// -- Habilitar os campos no caso de moeda extrangeira ...
//		LblVL_MOEDA.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
//		EdtVL_MOEDA.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
//		LblVL_COTACAO.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
//		EdtVL_COTACAO.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
		// -- Validar se é uma conta do motorista ...
		DtmFinanceiro.CdsFinCxaMot.Close;
		DtmFinanceiro.CdsFinCxaMot.Params.Clear;
		DtmFinanceiro.SqlFinCxaMot.ParamByName('CD_CONTACXA').AsInteger := StrToIntDef(EdtCD_CONTACXA.Text, 0);
		DtmFinanceiro.CdsFinCxaMot.Open;
		if (not DtmFinanceiro.CdsFinCxaMot.IsEmpty) then
			EdtCD_MOTORISTA.EditValue := DtmFinanceiro.CdsFinCxaMot.FieldByName('CD_MOTORISTA').AsString
		else
			EdtCD_MOTORISTA.Clear;
		DtmFinanceiro.CdsFinCxaMot.Close;
	end
  else
    EdtCD_CONTACXA.Editvalue := Null;
end;

procedure TMovFinCaixaMovimentarClieforn.EdtCD_CONTACXAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	DataTranspApp.CreateFormMdi(TConFinContacxa, Self, [EdtCD_CONTACXA.EditValue],
 		[EdtCD_CONTACXA]);
end;

procedure TMovFinCaixaMovimentarClieforn.EdtCD_CLIEFORNExit(Sender: TObject);
begin
  if not DataTranspApp.CreateFormSeek(TConFinClieforn, Self, [EdtCD_CLIEFORN.EditValue],
    ['NM_FANTASIA'], [EdtNM_CLIEFORN]) then
      EdtCD_CLIEFORN.EditValue := Null;
end;

procedure TMovFinCaixaMovimentarClieforn.EdtCD_CLIEFORNPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinClieforn, Self, [EdtCD_CLIEFORN.EditValue], [EdtCD_CLIEFORN]);
end;

procedure TMovFinCaixaMovimentarClieforn.EdtCD_CONTADETExit(Sender: TObject);
begin
  if not DataTranspApp.CreateFormSeek(TConFinContadet, Self, [EdtCD_CONTADET.EditValue],
    ['NM_CONTA'], [EdtNM_CONTADET]) then
      EdtCD_CONTADET.EditValue := Null;
end;

procedure TMovFinCaixaMovimentarClieforn.EdtCD_CONTADETPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinContadet, Self, [EdtCD_CONTADET.EditValue],
    [EdtCD_CONTADET]);
end;

procedure TMovFinCaixaMovimentarClieforn.EdtDT_MOVIMENTOEnter(Sender: TObject);
begin
  if EdtDT_MOVIMENTO.EditValue = Null then
  begin
    EdtDT_MOVIMENTO.Date := DataTranspApp.DtMovimento;
    EdtDT_MOVIMENTO.SelectAll;
  end;
end;

procedure TMovFinCaixaMovimentarClieforn.GrdReceberViewFL_BAIXAHeaderClick(
  Sender: TObject);
begin

  // -- Baixar o saldo de todos os títulos selecionados

  GrdReceberView.DataController.GotoFirst;
  While Not GrdReceberView.DataController.IsEOF Do
  Begin
    GrdReceberViewFL_BAIXA.EditValue := 1;
    GrdReceberViewVL_LCTO_BAIXA.EditValue := GrdReceberViewVL_SALDO.EditValue;
    GrdReceberView.DataController.GotoNext;
	End;
  if GrdReceberView.DataController.RecordCount > 0 then
  begin
    GrdReceberViewFL_BAIXA.EditValue := 1;
    GrdReceberViewVL_LCTO_BAIXA.EditValue := GrdReceberViewVL_SALDO.EditValue;
	end;
	GrdReceberView.DataController.Summary.Calculate;

  BtnCalcularDiferencaClick(Self);

end;

procedure TMovFinCaixaMovimentarClieforn.GrdReceberViewColumn9PropertiesEditValueChanged(
  Sender: TObject);
begin

  // -- Baixar o saldo do título selecionado, (mover acima e abaixo para atualizar o total) ...

	if (GrdReceberViewFL_BAIXA.EditValue = 0) then
		GrdReceberViewVL_LCTO_BAIXA.EditValue := 0
	else
		GrdReceberViewVL_LCTO_BAIXA.EditValue := GrdReceberViewVL_SALDO.EditValue;
	GrdReceberView.DataController.Summary.Calculate;

  BtnCalcularDiferencaClick(Self);

end;

procedure TMovFinCaixaMovimentarClieforn.GrdPagarViewFL_BAIXAHeaderClick(
  Sender: TObject);
begin

  // -- Baixar o saldo de todos os títulos selecionados

  GrdPagarView.DataController.GotoFirst;
  While Not GrdPagarView.DataController.IsEOF Do
  Begin
    GrdPagarViewFL_BAIXA.EditValue := 1;
    GrdPagarViewVL_LCTO_BAIXA.EditValue := GrdPagarViewVL_SALDO.EditValue;
    GrdPagarView.DataController.GotoNext;
	End;
  if GrdPagarView.DataController.RecordCount > 0 then
  begin
    GrdPagarViewFL_BAIXA.EditValue := 1;
    GrdPagarViewVL_LCTO_BAIXA.EditValue := GrdPagarViewVL_SALDO.EditValue;
  end;
	GrdPagarView.DataController.Summary.Calculate;

  BtnCalcularDiferencaClick(Self);

end;

procedure TMovFinCaixaMovimentarClieforn.GrdPagarViewFL_BAIXAPropertiesEditValueChanged(
  Sender: TObject);
begin

  // -- Baixar o saldo do título selecionado, (mover acima e abaixo para atualizar o total) ...

	if (GrdPagarViewFL_BAIXA.EditValue = 0) then
		GrdPagarViewVL_LCTO_BAIXA.EditValue := 0
	else
		GrdPagarViewVL_LCTO_BAIXA.EditValue := GrdPagarViewVL_SALDO.EditValue;
	GrdPagarView.DataController.Summary.Calculate;

	BtnCalcularDiferencaClick(Self);

end;

procedure TMovFinCaixaMovimentarClieforn.BtnCalcularDiferencaClick(
  Sender: TObject);
var
  AVlReceber, AVlPagar: Double;
begin

  // -- Calcular a diferença e exibir no campo de diferença a detalhar

  if (GrdReceberView.DataController.Summary.FooterSummaryValues[1] <> Null) then
    AVlReceber := GrdReceberView.DataController.Summary.FooterSummaryValues[1]
  else
    AVlReceber := 0.00;

  if (GrdPagarView.DataController.Summary.FooterSummaryValues[1] <> Null) then
    AVlPagar := GrdPagarView.DataController.Summary.FooterSummaryValues[1]
  else
    AVlPagar := 0.00;

	EdtVL_DIFERENCA.Value := AVlReceber - AVlPagar;
	GrdPagarView.DataController.Refresh;
	GrdReceberView.DataController.Refresh;

end;

procedure TMovFinCaixaMovimentarClieforn.BtnAtualizarClick(Sender: TObject);
begin

  // -- Atualizar as consultas

  Screen.Cursor := crHourGlass;
  try

    DtmFinanceiro.CdsFinCxaRec.Close;
    DtmFinanceiro.CdsFinCxaRec.Params.Clear;
    DtmFinanceiro.SqlFinCxaRec.ParamByName('CD_FILIAL').AsInteger := StrToIntDef(EdtCD_FILIAL_CXA.Text, 0);
    DtmFinanceiro.SqlFinCxaRec.ParamByName('CD_CLIEFORN').AsInteger := StrToIntDef(EdtCD_CLIEFORN.Text, 0);
    DtmFinanceiro.CdsFinCxaRec.Open;

    DtmFinanceiro.CdsFinCxaPag.Close;
    DtmFinanceiro.CdsFinCxaPag.Params.Clear;
    DtmFinanceiro.SqlFinCxaPag.ParamByName('CD_FILIAL').AsInteger := StrToIntDef(EdtCD_FILIAL_CXA.Text, 0);
    DtmFinanceiro.SqlFinCxaPag.ParamByName('CD_CLIEFORN').AsInteger := StrToIntDef(EdtCD_CLIEFORN.Text, 0);
    DtmFinanceiro.CdsFinCxaPag.Open;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TMovFinCaixaMovimentarClieforn.BtnConfirmarClick(Sender: TObject);
var
  ADsTransacao: string;

  procedure ValidarCampos;
  begin

    if (EdtCD_CONTACXA.EditValue = NULL) then
    begin
      EdtCD_CONTACXA.SetFocus;
      raise Exception.Create('O campo conta caixa é obrigatório.');
    end;

    if (EdtCD_CLIEFORN.EditValue = NULL) then
    begin
      EdtCD_CLIEFORN.SetFocus;
      raise Exception.Create('O campo cliente / fornecedor é obrigatório.');
    end;

    if (EdtCD_CONTADET.EditValue = NULL) then
    begin
      EdtCD_CONTADET.SetFocus;
      raise Exception.Create('O campo conta detalhe é obrigatório.');
    end;

    if (EdtDT_MOVIMENTO.EditValue = NULL) then
    begin
      EdtDT_MOVIMENTO.SetFocus;
      raise Exception.Create('O campo data de movimento é obrigatório.');
    end;

    if (GrdReceberView.DataController.Summary.FooterSummaryValues[1] = NULL) then
    begin
      PgcTitulo.ActivePage := TabReceber;
      TabReceber.SetFocus;
      raise Exception.Create('O campo total a receber é obrigatório.');
    end
    else
    if (GrdReceberView.DataController.Summary.FooterSummaryValues[1] = 0) then
    begin
      PgcTitulo.ActivePage := TabReceber;
      TabReceber.SetFocus;
      raise Exception.Create('O campo total a receber deve ser maior que zero.');
    end;

    if (GrdPagarView.DataController.Summary.FooterSummaryValues[1] = NULL) then
    begin
      PgcTitulo.ActivePage := TabPagar;
      TabPagar.SetFocus;
      raise Exception.Create('O campo total a pagar é obrigatório.');
    end
    else
    if (GrdPagarView.DataController.Summary.FooterSummaryValues[1] = 0) then
    begin
      PgcTitulo.ActivePage := TabPagar;
      TabPagar.SetFocus;
      raise Exception.Create('O campo total a pagar deve ser maior que zero.');
    end;

  end;

  procedure IniciarTransacao(AVlTransacao: Double; AFlDC: string);
  var
    ACdFilial,
    ANrTransacao: integer;
    ADtTransacao: TDateTime;
  begin

    // -- Validar transacao com valor zerado ...
    if (AVlTransacao <= 0.00) then
      Exit;

    // -- Inicializar variáveis temporárias ...
    ACdFilial := StrToIntDef(EdtCD_FILIAL_CXA.Text, 0);
    ANrTransacao := DtmFinanceiro.GetTransacao(ACdFilial);
    ADtTransacao := EdtDT_MOVIMENTO.Date;
    ADsTransacao := ADsTransacao + ' ' + IntToStr(ANrTransacao);

    // -- Abrir a transação ...
    DtmFinanceiro.CdsFinCxaTrn.Close;
    DtmFinanceiro.CdsFinCxaTrn.Params.Clear;
    DtmFinanceiro.SqlFinCxaTrn.ParamByName('CD_FILIAL').AsInteger := ACdFilial;
    DtmFinanceiro.SqlFinCxaTrn.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacao;
    DtmFinanceiro.CdsFinCxaTrn.Open;

    // -- Salvar no banco de dados a transação ...
    if DtmFinanceiro.CdsFinCxaTrn.IsEmpty then
    begin
      DtmFinanceiro.CdsFinCxaTrn.Insert;
      DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'] := ACdFilial;
      DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'] := ANrTransacao;
      DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'] := ADtTransacao;
      DtmFinanceiro.CdsFinCxaTrn['VL_TRANSACAO'] := AVlTransacao;
      DtmFinanceiro.CdsFinCxaTrn['FL_DC'] := AFlDC;
      DtmFinanceiro.CdsFinCxaTrn.Post;
      DtmFinanceiro.CdsFinCxaTrn.ApplyUpdates(0);
    end;

    // -- Abrir as tabelas auxiliares de lançamento ...
    DtmFinanceiro.CdsFinCxaLct.Close;
    DtmFinanceiro.CdsFinCxaLct.Params.Clear;
    DtmFinanceiro.SqlFinCxaLct.ParamByName('CD_FILIAL').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
    DtmFinanceiro.SqlFinCxaLct.ParamByName('NR_TRANSACAO').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger;
    DtmFinanceiro.CdsFinCxaLct.Open;

    DtmFinanceiro.CdsFinCxaDet.Close;
    DtmFinanceiro.CdsFinCxaDet.Params.Clear;
    DtmFinanceiro.SqlFinCxaDet.ParamByName('CD_FILIAL').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
    DtmFinanceiro.SqlFinCxaDet.ParamByName('NR_TRANSACAO').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger;
    DtmFinanceiro.CdsFinCxaDet.Open;

    DtmFinanceiro.CdsFinTitCxa.Close;
    DtmFinanceiro.CdsFinTitCxa.Params.Clear;
    DtmFinanceiro.SqlFinTitCxa.ParamByName('CD_FILIAL').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
    DtmFinanceiro.SqlFinTitCxa.ParamByName('NR_TRANSACAO').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger;
    DtmFinanceiro.CdsFinTitCxa.Open;

    // -- Efetuar o lançamento do caixa ...
    DtmFinanceiro.CdsFinCxaLct.Insert;
    DtmFinanceiro.CdsFinCxaLct['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'];
    DtmFinanceiro.CdsFinCxaLct['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaLct['NR_LANCAMENTO'] := 0;
    DtmFinanceiro.CdsFinCxaLct['CD_CONTA'] := EdtCD_CONTACXA.EditValue;
    DtmFinanceiro.CdsFinCxaLct['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
    DtmFinanceiro.CdsFinCxaLct['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaLct['DT_CONCILIADO'] := NULL;
    DtmFinanceiro.CdsFinCxaLct['NR_ORDEM_CONC'] := NULL;
    DtmFinanceiro.CdsFinCxaLct['SR_DOCUMENTO'] := IfThen(AFlDC = 'D', 'REC', 'PAG');
    DtmFinanceiro.CdsFinCxaLct['NR_DOCUMENTO'] := EdtCD_CLIEFORN.EditValue;
		DtmFinanceiro.CdsFinCxaLct['NM_HISTORICO'] := IfThen(AFlDC = 'D', 'RECEBIMENTO', 'PAGAMENTO') + ' DE ' + EdtNM_CLIEFORN.Text;
		DtmFinanceiro.CdsFinCxaLct['VL_LANCAMENTO'] := DtmFinanceiro.CdsFinCxaTrn['VL_TRANSACAO'];
		DtmFinanceiro.CdsFinCxaLct['TP_LANCAMENTO'] := IfThen(AFlDC = 'D', '31', '21');
		DtmFinanceiro.CdsFinCxaLct['FL_DC'] := AFlDC;
		DtmFinanceiro.CdsFinCxaLct['FL_CONCILIADO'] := 'N';
		DtmFinanceiro.CdsFinCxaLct['FL_CONTABILIZADO'] := 'N';
    DtmFinanceiro.CdsFinCxaLct.Post;
    DtmFinanceiro.CdsFinCxaLct.ApplyUpdates(0);

  end;

  procedure ExecutarTransacaoReceber;
  begin

    DtmFinanceiro.CdsFinCxaRec.DisableControls;
    try

      DtmFinanceiro.CdsFinCxaRec.First;
      while not DtmFinanceiro.CdsFinCxaRec.Eof do
      begin

        if DtmFinanceiro.CdsFinCxaRec.FieldByName('FL_BAIXA').AsInteger = 1 then
        begin

          DtmFinanceiro.CdsFinTitCxaLct.Close;
          DtmFinanceiro.CdsFinTitCxaLct.Params.Clear;
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('CD_FILIAL').AsInteger := DtmFinanceiro.CdsFinCxaRec['CD_FILIAL'];
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_TRANSACAO').AsInteger := DtmFinanceiro.CdsFinCxaRec['NR_TRANSACAO'];
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_PARCELA').AsInteger := DtmFinanceiro.CdsFinCxaRec['NR_PARCELA'];
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_LANCAMENTO').AsInteger := 0; // -- Todos os lançamentos
          DtmFinanceiro.CdsFinTitCxaLct.Open;

          DtmFinanceiro.CdsFinTitCxaLct.Insert;
          DtmFinanceiro.CdsFinTitCxaLct['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaRec['CD_FILIAL'];
          DtmFinanceiro.CdsFinTitCxaLct['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaRec['NR_TRANSACAO'];
          DtmFinanceiro.CdsFinTitCxaLct['NR_PARCELA'] := DtmFinanceiro.CdsFinCxaRec['NR_PARCELA'];
          DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO'] := 0;
          DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO_EST'] := 0;
          DtmFinanceiro.CdsFinTitCxaLct['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
          DtmFinanceiro.CdsFinTitCxaLct['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
          DtmFinanceiro.CdsFinTitCxaLct['NM_HISTORICO'] := 'RECEBIDO NO CAIXA ' + EdtNM_CONTACXA.Text;
          DtmFinanceiro.CdsFinTitCxaLct['VL_LANCAMENTO'] := DtmFinanceiro.CdsFinCxaRec['VL_LCTO_BAIXA'];
          DtmFinanceiro.CdsFinTitCxaLct['TP_LANCAMENTO'] := '07'; // Inclusão de Baixa ...
          DtmFinanceiro.CdsFinTitCxaLct['FL_TITULO'] := 'B'; // Baixa ...
          DtmFinanceiro.CdsFinTitCxaLct['FL_DC'] := 'C'; // Inclusão de baixa (trigger atualiza campo cfe lançamento) ...
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

        end;

        DtmFinanceiro.CdsFinCxaRec.Next;
      end;

    finally
      DtmFinanceiro.CdsFinCxaRec.EnableControls;
    end;

  end;

  procedure ExecutarTransacaoPagar;
  begin

    DtmFinanceiro.CdsFinCxaPag.DisableControls;
    try

      DtmFinanceiro.CdsFinCxaPag.First;
      while not DtmFinanceiro.CdsFinCxaPag.Eof do
      begin

        if DtmFinanceiro.CdsFinCxaPag.FieldByName('FL_BAIXA').AsInteger = 1 then
        begin

          DtmFinanceiro.CdsFinTitCxaLct.Close;
          DtmFinanceiro.CdsFinTitCxaLct.Params.Clear;
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('CD_FILIAL').AsInteger := DtmFinanceiro.CdsFinCxaPag['CD_FILIAL'];
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_TRANSACAO').AsInteger := DtmFinanceiro.CdsFinCxaPag['NR_TRANSACAO'];
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_PARCELA').AsInteger := DtmFinanceiro.CdsFinCxaPag['NR_PARCELA'];
          DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_LANCAMENTO').AsInteger := 0; // -- Todos os lançamentos
          DtmFinanceiro.CdsFinTitCxaLct.Open;

          DtmFinanceiro.CdsFinTitCxaLct.Insert;
          DtmFinanceiro.CdsFinTitCxaLct['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaPag['CD_FILIAL'];
          DtmFinanceiro.CdsFinTitCxaLct['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaPag['NR_TRANSACAO'];
          DtmFinanceiro.CdsFinTitCxaLct['NR_PARCELA'] := DtmFinanceiro.CdsFinCxaPag['NR_PARCELA'];
          DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO'] := 0;
          DtmFinanceiro.CdsFinTitCxaLct['NR_LANCAMENTO_EST'] := 0;
          DtmFinanceiro.CdsFinTitCxaLct['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
          DtmFinanceiro.CdsFinTitCxaLct['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
          DtmFinanceiro.CdsFinTitCxaLct['NM_HISTORICO'] := 'PAGO NO CAIXA ' + EdtNM_CONTACXA.Text;
          DtmFinanceiro.CdsFinTitCxaLct['VL_LANCAMENTO'] := DtmFinanceiro.CdsFinCxaPag['VL_LCTO_BAIXA'];
          DtmFinanceiro.CdsFinTitCxaLct['TP_LANCAMENTO'] := '07'; // Inclusão de Baixa ...
          DtmFinanceiro.CdsFinTitCxaLct['FL_TITULO'] := 'B'; // Baixa ...
          DtmFinanceiro.CdsFinTitCxaLct['FL_DC'] := 'C'; // Inclusão de baixa (trigger atualiza campo cfe lançamento) ...
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

        end;

        DtmFinanceiro.CdsFinCxaPag.Next;
      end;

    finally
      DtmFinanceiro.CdsFinCxaPag.EnableControls;
    end;

  end;

  procedure ExecutarTransacaoDetalheDiferenca;
  begin

    if EdtVL_DIFERENCA.Value = 0.00 then
      Exit;
      
    DtmFinanceiro.CdsFinCxaDet.Insert;
    DtmFinanceiro.CdsFinCxaDet['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'];
    DtmFinanceiro.CdsFinCxaDet['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaDet['NR_LANCAMENTO'] := 0;
    DtmFinanceiro.CdsFinCxaDet['CD_CONTA'] := EdtCD_CONTADET.EditValue;
    DtmFinanceiro.CdsFinCxaDet['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
    DtmFinanceiro.CdsFinCxaDet['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaDet['NM_HISTORICO'] := IfThen(EdtVL_DIFERENCA.Value > 0, 'PAGAMENTO', 'RECEBIMENTO') + ' DE ' + EdtNM_CLIEFORN.Text;
    DtmFinanceiro.CdsFinCxaDet['VL_LANCAMENTO'] := Abs(EdtVL_DIFERENCA.Value);
    DtmFinanceiro.CdsFinCxaDet['FL_DC'] := IfThen(EdtVL_DIFERENCA.Value > 0, 'D', 'C');
    DtmFinanceiro.CdsFinCxaDet['FL_CONCILIADO'] := 'N';
    DtmFinanceiro.CdsFinCxaDet['FL_CONTABILIZADO'] := 'N';
    DtmFinanceiro.CdsFinCxaDet.Post;
    DtmFinanceiro.CdsFinCxaDet.ApplyUpdates(0);

  end;

  procedure FinalizarTransacao;
  begin
    DtmFinanceiro.CdsFinCxaDet.Close;
    DtmFinanceiro.CdsFinTitCxa.Close;
    DtmFinanceiro.CdsFinTitCxaLct.Close;
    DtmFinanceiro.CdsFinCxaLct.Close;
    DtmFinanceiro.CdsFinCxaTrn.Close;
  end;

begin

  // -- Validar os campos

  ValidarCampos;

  // -- Confirmar a transação

  if (Application.MessageBox('Confirma a baixa dos títulos a receber e a pagar e a transação no caixa?',
    PChar(Self.Caption), MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin

    ADsTransacao := '';
    IniciarTransacao(GrdReceberView.DataController.Summary.FooterSummaryValues[1], 'D');
    ExecutarTransacaoReceber;
    IniciarTransacao(GrdPagarView.DataController.Summary.FooterSummaryValues[1], 'C');
    ExecutarTransacaoPagar;
    IniciarTransacao(Abs(EdtVL_DIFERENCA.Value), IfThen(EdtVL_DIFERENCA.Value > 0, 'C', 'D'));
    ExecutarTransacaoDetalheDiferenca;
    FinalizarTransacao;

    ShowMessage('Operação concluída com sucesso! Transações geradas: ' + ADsTransacao + '.');

    BtnCancelarClick(Self);

  end;

end;

procedure TMovFinCaixaMovimentarClieforn.BtnCancelarClick(Sender: TObject);
begin

  // -- Limpar todoso os campos e reiniciar

  EdtCD_CONTACXA.Clear;
  EdtNM_CONTACXA.Clear;
  EdtCD_FILIAL_CXA.Clear;
  EdtDT_FECHAMENTO_CXA.Clear;
  EdtFL_DC_CXA.Clear;
  EdtCD_MOEDA_CXA.Clear;
  EdtCD_MOTORISTA.Clear;
  EdtCD_CLIEFORN.Clear;
  EdtNM_CLIEFORN.Clear;
  EdtCD_CONTADET.Clear;
  EdtNM_CONTADET.Clear;
  EdtDT_MOVIMENTO.Clear;
  EdtVL_DIFERENCA.Clear;

  DtmFinanceiro.CdsFinCxaRec.Close;
  DtmFinanceiro.CdsFinCxaPag.Close;

  PgcTitulo.ActivePage := TabReceber;
  SelectFirst;

end;

initialization
  RegisterClass(TMovFinCaixaMovimentarClieforn);

end.
