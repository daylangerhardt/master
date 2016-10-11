unit mFinCaixaMovimentarCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoMDI, cxGraphics, cxControls, dxStatusBar, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, cxCalc,
  cxMaskEdit, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxCalendar, cxDBEdit, cxCheckBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, cxLookAndFeels;

type
  TMovFinCaixaMovimentarCaixa = class(TFrmPadraoMDI)
    StatusBarContainer1: TdxStatusBarContainerControl;
    StatusBarContainer2: TdxStatusBarContainerControl;
    BtnConfirmar: TcxButton;
    BtnCancelar: TcxButton;
    LblCD_CONTA: TcxLabel;
    cxLabel15: TcxLabel;
    LblNR_DOCUMENTO: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel27: TcxLabel;
    EdtCD_CONTACXA: TcxButtonEdit;
    EdtNM_CONTACXA: TcxTextEdit;
    EdtCD_FILIAL_CXA: TcxTextEdit;
    EdtDT_FECHAMENTO_CXA: TcxTextEdit;
    EdtFL_DC_CXA: TcxTextEdit;
    EdtTP_LANCAMENTO: TcxButtonEdit;
    EdtNM_LANCAMENTO: TcxTextEdit;
    EdtFL_CHEQUE: TcxTextEdit;
    EdtFL_TITULO: TcxTextEdit;
    EdtSR_DOCUMENTO: TcxButtonEdit;
    EdtNR_DOCUMENTO: TcxButtonEdit;
    EdtCD_HISTORICO: TcxButtonEdit;
    EdtVL_LANCAMENTO: TcxCalcEdit;
    PnlCheque: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel8: TcxLabel;
    LblNR_CONTA: TcxLabel;
    EdtDS_EXTENSO1: TcxMaskEdit;
    EdtDS_EXTENSO2: TcxMaskEdit;
    EdtNR_BANCO: TcxMaskEdit;
    EdtNR_AGENCIA: TcxMaskEdit;
    EdtNR_CONTA: TcxMaskEdit;
    EdtNR_CHEQUE: TcxMaskEdit;
    EdtNM_NOMINAL: TcxMaskEdit;
    EdtNM_PRACA: TcxMaskEdit;
    EdtDT_EMISSAO: TcxDateEdit;
    EdtDT_BOMPARA: TcxDateEdit;
    EdtCD_MOTORISTA: TcxTextEdit;
    EdtFL_IMPRIMIR_CHEQUE: TcxCheckBox;
    LblVL_MOEDA: TcxLabel;
    EdtVL_MOEDA: TcxCalcEdit;
    LblVL_COTACAO: TcxLabel;
    EdtVL_COTACAO: TcxCalcEdit;
    EdtCD_MOEDA_CXA: TcxTextEdit;
    EdtCD_HIST: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtCD_CONTACXAExit(Sender: TObject);
    procedure EdtCD_CONTACXAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtTP_LANCAMENTOExit(Sender: TObject);
    procedure EdtTP_LANCAMENTOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtCD_HISTORICOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtCD_HISTORICOEnter(Sender: TObject);
    procedure EdtCD_HISTORICOExit(Sender: TObject);
    procedure EdtVL_LANCAMENTOEnter(Sender: TObject);
    procedure EdtVL_LANCAMENTOExit(Sender: TObject);
    procedure BtnIntegrarChequeClick(Sender: TObject);
    procedure BtnIntegrarTituloClick(Sender: TObject);
    procedure BtnIntegrarFichamotClick(Sender: TObject);
    procedure EdtNM_PRACAEnter(Sender: TObject);
    procedure EdtNR_CHEQUEEnter(Sender: TObject);
    procedure EdtDT_EMISSAOEnter(Sender: TObject);
    procedure EdtNR_CHEQUEExit(Sender: TObject);
    procedure EdtNM_NOMINALExit(Sender: TObject);
    procedure EdtVL_COTACAOEnter(Sender: TObject);
    procedure EdtNM_PRACAExit(Sender: TObject);
    procedure EdtDT_EMISSAOExit(Sender: TObject);
    procedure EdtNR_DOCUMENTOExit(Sender: TObject);
    procedure EdtNM_NOMINALEnter(Sender: TObject);
  private
    { Private declarations }
    function SugerirNominal: string;
  public
    { Public declarations }
  end;

var
  MovFinCaixaMovimentarCaixa: TMovFinCaixaMovimentarCaixa;
  
implementation

uses dPrincipal, dFinanceiro, qFinContacxa, qFinFinCxaOpe, qFinHistorico,
  mFinCaixaMovimentar, cFinFinCheque, mFinTituloIntegrar, mFrtViagemFichamot,
  dUsuario, uFuncProc, qFrtFilial;

{$R *.dfm}

procedure TMovFinCaixaMovimentarCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');
	EdtCD_CONTACXA.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtTP_LANCAMENTO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtCD_HISTORICO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
  BtnNovoClick(Self);
end;

// -- tarefa 2274 -- //
function TMovFinCaixaMovimentarCaixa.SugerirNominal: string;
begin
  Result := '';
  DtmFinanceiro.CdsFinCxaTrnExt.DisableControls;
  try
    if not DtmFinanceiro.CdsFinCxaTrnExt.IsEmpty then
    begin
      DtmFinanceiro.CdsFinCxaTrnExt.First;
      while not DtmFinanceiro.CdsFinCxaTrnExt.Eof do
      begin
        if DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 3 then
        begin
          Result := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NM_CONTA').AsString;
          Break;
        end;
        DtmFinanceiro.CdsFinCxaTrnExt.Next;
      end;
    end;
  finally
    DtmFinanceiro.CdsFinCxaTrnExt.EnableControls;
  end;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtCD_CONTACXAExit(Sender: TObject);
begin
	if DataTranspApp.CreateFormSeek(TConFinContacxa, Self, [EdtCD_CONTACXA.EditValue],
		['NM_CONTA', 'CD_FILIAL', 'CD_MOEDA', 'DT_ULT_FECHAMENTO', 'NR_BANCO', 'NR_AGENCIA', 'NR_CONTA'],
			[EdtNM_CONTACXA, EdtCD_FILIAL_CXA, EdtCD_MOEDA_CXA, EdtDT_FECHAMENTO_CXA, EdtNR_BANCO, EdtNR_AGENCIA, EdtNR_CONTA]) then
	begin
		if (EdtCD_FILIAL_CXA.EditValue <> DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']) then
		begin
			ActiveControl := EdtCD_CONTACXA;
			EdtCD_CONTACXA.EditValue := Null;
			raise Exception.Create('Esta Conta Caixa pertence a outra filial.');
		end;
		if not DtmUsuario.ValidarUsuarioCaixaAcesso(DataTranspApp.UserId,
			StrToInt(EdtCD_CONTACXA.Text)) then
		begin
			EdtCD_CONTACXA.Clear;
			EdtCD_CONTACXA.SetFocus;
			raise Exception.Create('Este usuário não tem permissão para utilizar este recurso deste caixa / conta corrente.');
		end;
		// -- Validar a moeda ...
		if (TMovFinCaixaMovimentar(Self.Owner).FCdMoeda = -1) then
			TMovFinCaixaMovimentar(Self.Owner).FCdMoeda := StrToIntDef(EdtCD_MOEDA_CXA.Text, 1); // -- Inicializar moeda setando "REAL" default...
		if (TMovFinCaixaMovimentar(Self.Owner).FCdMoeda <> StrToIntDef(EdtCD_MOEDA_CXA.Text, 1)) then
		begin
			EdtCD_CONTACXA.Clear;
			EdtCD_CONTACXA.SetFocus;
			raise Exception.Create('Esta Conta Caixa possui uma moeda diferente da utilizada na transação.');
		end;
		// -- Habilitar os campos no caso de moeda extrangeira ...
    if Trim(EdtCD_MOEDA_CXA.Text) = '' then
    begin
      LblVL_MOEDA.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
      EdtVL_MOEDA.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
      LblVL_COTACAO.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
      EdtVL_COTACAO.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '');
    end;
    if EdtCD_MOEDA_CXA.Text <> '' then
    begin
      LblVL_MOEDA.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '1');
      EdtVL_MOEDA.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '1');
      LblVL_COTACAO.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '1');
      EdtVL_COTACAO.Enabled := (Trim(EdtCD_MOEDA_CXA.Text) <> '1');
    end;
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

procedure TMovFinCaixaMovimentarCaixa.EdtCD_CONTACXAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	DataTranspApp.CreateFormMdi(TConFinContacxa, Self, [EdtCD_CONTACXA.EditValue],
 		[EdtCD_CONTACXA]);
end;

procedure TMovFinCaixaMovimentarCaixa.EdtCD_HISTORICOEnter(Sender: TObject);
var
  ANmHistorico: string;
begin
  if not (DataTranspApp.ReadConfigString(DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'],'FL_SUGERIR_HISTORICO', 'S') = 'N') then
  begin
    if (EdtCD_HISTORICO.Text = '') then
    begin
      ANmHistorico := '';
      if (EdtFL_DC_CXA.Text = 'D') then
        ANmHistorico := ANmHistorico + 'REC '
      else
        ANmHistorico := ANmHistorico + 'PGT ';
      ANmHistorico := ANmHistorico + 'DOC Nº ' + EdtSR_DOCUMENTO.Text + '/' +
        EdtNR_DOCUMENTO.Text;
      EdtCD_HISTORICO.Text := ANmHistorico;
      EdtCD_HISTORICO.SelectAll;
    end;
  end;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtCD_HISTORICOExit(Sender: TObject);
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

procedure TMovFinCaixaMovimentarCaixa.EdtCD_HISTORICOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	DataTranspApp.CreateFormMdi(TConFinHistorico, Self, [Null], [EdtCD_HISTORICO]);
end;

procedure TMovFinCaixaMovimentarCaixa.EdtTP_LANCAMENTOExit(Sender: TObject);
var
	i: integer;
begin
  if not DataTranspApp.CreateFormSeek(TConFinFincxaope, Self, [EdtTP_LANCAMENTO.EditValue],
    ['NM_LANCAMENTO', 'FL_DC', 'FL_CHEQUE', 'FL_TITULO'], [EdtNM_LANCAMENTO,
      EdtFL_DC_CXA, EdtFL_CHEQUE, EdtFL_TITULO]) then
  begin
    EdtTP_LANCAMENTO.EditValue := Null;
  end;
  // -- Controle de cheque ...
  for i := 0 to PnlCheque.ControlCount - 1 do
  	PnlCheque.Controls[i].Enabled := (EdtFL_CHEQUE.Text = 'S');
end;

procedure TMovFinCaixaMovimentarCaixa.EdtTP_LANCAMENTOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinFincxaope, Self, [EdtTP_LANCAMENTO.EditValue], [EdtTP_LANCAMENTO]);
end;

procedure TMovFinCaixaMovimentarCaixa.EdtVL_COTACAOEnter(Sender: TObject);
begin
	if (EdtVL_COTACAO.Value = 0.00) then
	begin
		EdtVL_COTACAO.Value := DtmFinanceiro.BuscarCotacao(StrToIntDef(EdtCD_MOEDA_CXA.Text, 1), Date);// Setar moeda real default
		EdtVL_COTACAO.SelectAll;
	end;                      
end;

procedure TMovFinCaixaMovimentarCaixa.EdtVL_LANCAMENTOEnter(Sender: TObject);
begin
	if (EdtVL_LANCAMENTO.Value = 0.00) then
	begin

		if ((EdtVL_MOEDA.Value > 0.00) and (EdtVL_COTACAO.Value > 0.00)) then
			EdtVL_LANCAMENTO.Value := EdtVL_MOEDA.Value * EdtVL_COTACAO.Value
		else
		if (TMovFinCaixaMovimentar(Self.Owner).EdtVL_DIFERENCA.Value <> 0) then
			EdtVL_LANCAMENTO.Value := TMovFinCaixaMovimentar(Self.Owner).EdtVL_DIFERENCA.Value;

		if (EdtVL_LANCAMENTO.Value < 0) then
			EdtVL_LANCAMENTO.Value := EdtVL_LANCAMENTO.Value * -1;

		EdtVL_LANCAMENTO.SelectAll;
	end;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtVL_LANCAMENTOExit(Sender: TObject);
var ADsExtenso: String;
begin
  if (EdtVL_LANCAMENTO.Value <> 0) and (EdtFL_CHEQUE.Text = 'S') then
  begin
    ADsExtenso := '';
    ValorExtenso(ADsExtenso, EdtVL_LANCAMENTO.Value, '', '', 1, 180, '#', 1);
    ADsExtenso := ADsExtenso + StringOfChar('#', 180 - Length(ADsExtenso));
    EdtDS_EXTENSO1.Text := Copy(ADsExtenso, 001, 080);
    EdtDS_EXTENSO2.Text := Copy(ADsExtenso, 81, 180);
  end
  else
  begin
    EdtDS_EXTENSO1.Text := '';
    EdtDS_EXTENSO2.Text := '';
  end;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtNR_CHEQUEEnter(Sender: TObject);
begin
  inherited;
	if (EdtNR_CHEQUE.Text = '') then
    EdtNR_CHEQUE.Text := EdtNR_DOCUMENTO.Text;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtNR_CHEQUEExit(Sender: TObject);
begin
  inherited;
  if (EdtNR_CHEQUE.Text = '') then
  begin
    ActiveControl := EdtNR_CHEQUE;
    raise Exception.Create('O campo Nº do Cheque é obrigatório.');
  end;
  DtmFinanceiro.CdsFinCheque.Close;
  DtmFinanceiro.CdsFinCheque.Params.Clear;
  DtmFinanceiro.SqlFinCheque.ParamByName('NR_BANCO').AsString := EdtNR_BANCO.Text;
  DtmFinanceiro.SqlFinCheque.ParamByName('NR_AGENCIA').AsString := EdtNR_AGENCIA.Text;
  DtmFinanceiro.SqlFinCheque.ParamByName('NR_CONTA').AsString := EdtNR_CONTA.Text;
  DtmFinanceiro.SqlFinCheque.ParamByName('NR_CHEQUE').AsString := EdtNR_CHEQUE.Text;
  DtmFinanceiro.CdsFinCheque.Open;

  if not (DtmFinanceiro.CdsFinCheque.IsEmpty) then
  begin
    ActiveControl := EdtNR_CHEQUE;
    raise Exception.Create('Existe um Cheque com esta mesma numeração.');
  end;
end;

// -- Tarefa 807
procedure TMovFinCaixaMovimentarCaixa.EdtNR_DOCUMENTOExit(Sender: TObject);
begin
  EdtNR_DOCUMENTO.Text := FmtStrDelSpecialChar(EdtNR_DOCUMENTO.Text);
end;

procedure TMovFinCaixaMovimentarCaixa.EdtDT_EMISSAOEnter(Sender: TObject);
begin
  inherited;
	if (EdtDT_EMISSAO.Text = '') then
  	EdtDT_EMISSAO.Date := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
end;

procedure TMovFinCaixaMovimentarCaixa.EdtDT_EMISSAOExit(Sender: TObject);
begin
  if (EdtDT_EMISSAO.Text = '') then
  begin
    ActiveControl := EdtDT_EMISSAO;
    raise Exception.Create('O campo Emissão é obrigatório.');
  end;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtNM_NOMINALEnter(Sender: TObject);
begin
  inherited;
  // -- tarefa: 2274 sugerir fornecedor do titulo -- //
  if EdtNM_NOMINAL.Text = EmptyStr then
    EdtNM_NOMINAL.Text := SugerirNominal;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtNM_NOMINALExit(Sender: TObject);
begin
  if (EdtNM_NOMINAL.Text = '') then
  begin
    ActiveControl := EdtNM_NOMINAL;
    raise Exception.Create('O campo Nominal à é obrigatório.');
  end;
end;

procedure TMovFinCaixaMovimentarCaixa.EdtNM_PRACAEnter(Sender: TObject);
begin
  inherited;
	if (EdtNM_PRACA.Text = '') then
    DataTranspApp.CreateFormSeek(TConFrtFilial, Self, [EdtCD_FILIAL_CXA.EditingValue],
    	['NM_CIDADE;CD_UF'], [EdtNM_PRACA]);
end;

procedure TMovFinCaixaMovimentarCaixa.EdtNM_PRACAExit(Sender: TObject);
begin
  if (EdtNM_PRACA.Text = '') then
  begin
    ActiveControl := EdtNM_PRACA;
    raise Exception.Create('O campo Praça é obrigatório.');
  end;
end;

procedure TMovFinCaixaMovimentarCaixa.BtnIntegrarChequeClick(Sender: TObject);
begin

  if (EdtFL_CHEQUE.Text = 'S') then
  begin

    DtmFinanceiro.CdsFinCheque.Close;
    DtmFinanceiro.CdsFinCheque.Params.Clear;
    DtmFinanceiro.SqlFinCheque.ParamByName('NR_BANCO').AsString := EdtNR_BANCO.Text;
    DtmFinanceiro.SqlFinCheque.ParamByName('NR_AGENCIA').AsString := EdtNR_AGENCIA.Text;
    DtmFinanceiro.SqlFinCheque.ParamByName('NR_CONTA').AsString := EdtNR_CONTA.Text;
    DtmFinanceiro.SqlFinCheque.ParamByName('NR_CHEQUE').AsString := EdtNR_CHEQUE.Text;
    DtmFinanceiro.CdsFinCheque.Open;

    if (DtmFinanceiro.CdsFinCheque.IsEmpty) then
    	DtmFinanceiro.CdsFinCheque.Insert
    else
	    DtmFinanceiro.CdsFinCheque.Edit;

    DtmFinanceiro.CdsFinCheque['NR_BANCO'] := EdtNR_BANCO.EditValue;
    DtmFinanceiro.CdsFinCheque['NR_AGENCIA'] := EdtNR_AGENCIA.EditValue;
    DtmFinanceiro.CdsFinCheque['NR_CONTA'] := EdtNR_CONTA.EditValue;
    DtmFinanceiro.CdsFinCheque['NR_CHEQUE'] := EdtNR_CHEQUE.EditValue;
    DtmFinanceiro.CdsFinCheque['VL_CHEQUE'] := EdtVL_LANCAMENTO.EditValue;
    DtmFinanceiro.CdsFinCheque['VL_CHEQUE_DESC'] := EdtDS_EXTENSO1.Text + #13#10 +EdtDS_EXTENSO2.Text;
    DtmFinanceiro.CdsFinCheque['NM_NOMINAL'] := EdtNM_NOMINAL.EditValue;
    DtmFinanceiro.CdsFinCheque['NM_LOCAL'] := EdtNM_PRACA.EditValue;
    DtmFinanceiro.CdsFinCheque['DT_EMISSAO'] := EdtDT_EMISSAO.EditValue;
    DtmFinanceiro.CdsFinCheque['DT_BOMPARA'] := EdtDT_BOMPARA.EditValue;
    DtmFinanceiro.CdsFinCheque['FL_CANCELADO'] := 'N';
    DtmFinanceiro.CdsFinCheque['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaLct['CD_FILIAL'];
    DtmFinanceiro.CdsFinCheque['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaLct['NR_TRANSACAO'];
    DtmFinanceiro.CdsFinCheque['NR_LANCAMENTO'] := DtmFinanceiro.CdsFinCxaLct['NR_LANCAMENTO'];
    DtmFinanceiro.CdsFinCheque['NM_HISTORICO'] := DtmFinanceiro.CdsFinCxaLct['NM_HISTORICO'];
    DtmFinanceiro.CdsFinCheque.Post;
    DtmFinanceiro.CdsFinCheque.ApplyUpdates(0);

    if (EdtFL_IMPRIMIR_CHEQUE.Checked) then
    begin

      DataTranspApp.CreateFormMdi(TCadFinFinCheque, Self.Owner, [
        DtmFinanceiro.CdsFinCheque['NR_BANCO'],
        DtmFinanceiro.CdsFinCheque['NR_AGENCIA'],
        DtmFinanceiro.CdsFinCheque['NR_CONTA'],
        DtmFinanceiro.CdsFinCheque['NR_CHEQUE']], [nil]);

    end;

  end;

end;

procedure TMovFinCaixaMovimentarCaixa.BtnIntegrarTituloClick(Sender: TObject);
const
  ACdCondpgto = 1; // -- A Prazo
  ACdContacxa = 0; // -- Não definir o caixa para baixa
  ACdClieforn = 0; // -- Não definir para quem é o título 
var
	ACdFilial: integer;
  AFlDocumento: string;
  ASrDocumento: string;
  ANrDocumento: integer;
  ADtLancamento: tdatetime;
  AVlLancamento: extended;
  AVlCotacao : Double;
begin

  if (EdtFL_TITULO.Text = 'S') then // esse "S" indica Sim, que deve gerar título
  begin

    if (EdtFL_DC_CXA.EditValue = 'D') then // Débito no caixa, isto é, um recebimento gera ao contrário no título como um contas a pagar, e vice-versa...
      AFlDocumento := 'E'
    else
      AFlDocumento := 'S';

    ACdFilial := DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'];
    ADtLancamento := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
    ASrDocumento := EdtSR_DOCUMENTO.Text;
    ANrDocumento := StrToIntDef(EdtNR_DOCUMENTO.Text, 0);
    AVlLancamento := EdtVL_LANCAMENTO.Value;
    AVlCotacao := EdtVL_COTACAO.Value;

    DataTranspApp.CreateFormNormal(TMovFinTituloIntegrar, Self.Owner, [AFlDocumento,
      ACdCondpgto, ADtLancamento, ACdFilial, ACdContacxa, ACdClieforn, ASrDocumento,
        ANrDocumento, ADtLancamento, AVlLancamento, AVlCotacao], [nil]);  //

  end;

end;

procedure TMovFinCaixaMovimentarCaixa.BtnIntegrarFichamotClick(Sender: TObject);
var
  ACdMotorista: integer;
  ADtEmissao: tdatetime;
  ANmHistorico: string;
  AVlLancamento: extended;
  AFlDC: string;
  ACdFilial: integer;
  ANrTransacao: integer;
  ANrLancamento: integer;
begin

	if (EdtCD_MOTORISTA.Text <> '') then
  begin

    ACdMotorista := StrToIntDef(EdtCD_MOTORISTA.Text, 0);
    ADtEmissao := DtmFinanceiro.CdsFinCxaLct.FieldByName('DT_MOVIMENTO').AsDateTime;
    ANmHistorico := DtmFinanceiro.CdsFinCxaLct.FieldByName('NM_HISTORICO').AsString;
    AVlLancamento := DtmFinanceiro.CdsFinCxaLct.FieldByName('VL_LANCAMENTO').AsCurrency;
    AFlDC := DtmFinanceiro.CdsFinCxaLct.FieldByName('FL_DC').AsString;
    ACdFilial := DtmFinanceiro.CdsFinCxaLct.FieldByName('CD_FILIAL').AsInteger;
    ANrTransacao := DtmFinanceiro.CdsFinCxaLct.FieldByName('NR_TRANSACAO').AsInteger;
    ANrLancamento := DtmFinanceiro.CdsFinCxaLct.FieldByName('NR_LANCAMENTO').AsInteger;

    DataTranspApp.CreateFormMdi(TMovFrtViagemFichamot, Self.Owner, [0, ADtEmissao, ACdMotorista,
      ANmHistorico, AVlLancamento, AFLDC, ACdFilial, ANrTransacao, ANrLancamento], [nil]);

  end;

end;

procedure TMovFinCaixaMovimentarCaixa.BtnNovoClick(Sender: TObject);
begin
  inherited;
  // -- Novo lançamento
  EdtCD_CONTACXA.Clear;
  EdtNM_CONTACXA.Clear;
  EdtCD_FILIAL_CXA.Clear;
  EdtCD_MOEDA_CXA.Clear;
	EdtDT_FECHAMENTO_CXA.Clear;
  EdtFL_DC_CXA.Clear;
  EdtCD_MOTORISTA.Clear;
  EdtTP_LANCAMENTO.Clear;
	EdtNM_LANCAMENTO.Clear;
  EdtFL_CHEQUE.Clear;
  EdtFL_TITULO.Clear;
  EdtSR_DOCUMENTO.Clear;
  EdtNR_DOCUMENTO.Clear;
  EdtCD_HISTORICO.Clear;
	LblVL_MOEDA.Enabled := False;
	EdtVL_MOEDA.Enabled := False;
	EdtVL_MOEDA.Value := 0;
	EdtVL_MOEDA.Clear;
	LblVL_COTACAO.Enabled := False;
	EdtVL_COTACAO.Enabled := False;
	EdtVL_COTACAO.Value := 0;
	EdtVL_COTACAO.Clear;
	EdtVL_LANCAMENTO.Value := 0;
  EdtVL_LANCAMENTO.Clear;
	EdtDS_EXTENSO1.Clear;
  EdtDS_EXTENSO2.Clear;
  EdtNR_BANCO.Clear;
  EdtNR_AGENCIA.Clear;
  EdtNR_CONTA.Clear;
  EdtNR_CHEQUE.Clear;
  EdtNM_NOMINAL.Clear;
  EdtNM_PRACA.Clear;
  EdtDT_EMISSAO.Clear;
  EdtDT_BOMPARA.Clear;

  // -- Tarefa: 3501 ...
  EdtCD_HIST.Clear;

	SelectFirst;
end;

procedure TMovFinCaixaMovimentarCaixa.BtnConfirmarClick(Sender: TObject);
begin
  inherited;

  // -- Confirmar

  // -- Tarefa 807
  if FmtVerificarStr(EdtNR_DOCUMENTO.Text) <> '' then
  begin
    ActiveControl := EdtNR_DOCUMENTO;
    raise Exception.Create('O campo número do documento não deve conter letras, apenas números.');
  end;

  if (EdtCD_CONTACXA.Text = '') then
  begin
    ActiveControl := EdtCD_CONTACXA;
    raise Exception.Create('O campo Conta Caixa é obrigatório.');
  end
  else
  begin
    if (StrToDateDef(EdtDT_FECHAMENTO_CXA.Text, 0) >= DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO']) then
    begin
      ActiveControl := EdtCD_CONTACXA;
      raise Exception.Create('O caixa informado já está fechado para esta data.');
    end;
  end;

  if (EdtTP_LANCAMENTO.Text = '') then
  begin
    ActiveControl := EdtTP_LANCAMENTO;
    raise Exception.Create('O campo tipo do lançamento é obrigatório.');
  end;

  if (EdtSR_DOCUMENTO.Text = '') then
  begin
    ActiveControl := EdtSR_DOCUMENTO;
    raise Exception.Create('O campo série do documento é obrigatório.');
  end;

  if (EdtNR_DOCUMENTO.Text = '') then
  begin
    ActiveControl := EdtNR_DOCUMENTO;
    raise Exception.Create('O campo número do documento é obrigatório.');
  end;

  // -- Histórico e valor do lançamento ...

  if (EdtCD_HISTORICO.Text = '') then
  begin
    ActiveControl := EdtCD_HISTORICO;
    raise Exception.Create('O campo Histórico do Lançamento é obrigatório.');
  end;

  if (EdtVL_LANCAMENTO.Value = 0) then
  begin
    ActiveControl := EdtVL_LANCAMENTO;
    raise Exception.Create('O campo Valor do Lançamento é obrigatório.');
  end;

  if ((EdtNM_NOMINAL.Enabled) and (EdtNM_NOMINAL.Text = '')) then
  begin
    ActiveControl := EdtNM_NOMINAL;
    raise Exception.Create('O campo Nominal à é obrigatório.');
  end;

  if ((EdtNM_PRACA.Enabled) and (EdtNM_PRACA.Text = '')) then
  begin
    ActiveControl := EdtNM_PRACA;
    raise Exception.Create('O campo Praça é obrigatório.');
  end;

  if ((EdtDT_EMISSAO.Enabled) and (EdtDT_EMISSAO.Text = '')) then
  begin
    ActiveControl := EdtDT_EMISSAO;
    raise Exception.Create('O campo Emissão é obrigatório.');
  end;

  if EdtNR_BANCO.Enabled then
    if EdtNR_BANCO.Text = EmptyStr then
    begin
      ActiveControl := EdtNR_BANCO;
      raise Exception.Create('O campo Banco é obrigatório.');
    end;

  if EdtNR_AGENCIA.Enabled then
    if EdtNR_AGENCIA.Text = EmptyStr then
    begin
      ActiveControl := EdtNR_AGENCIA;
      raise Exception.Create('O campo Agência é obrigatório.');
    end;

  if EdtNR_CONTA.Enabled then
    if EdtNR_CONTA.Text = EmptyStr then
    begin
      ActiveControl := EdtNR_CONTA;
      raise Exception.Create('O campo Cta. é obrigatório.');
    end;

  // -- Incluir lançamento no caixa ...
  Screen.Cursor := crSQLWait;
  try

    DtmFinanceiro.CdsFinCxaLct.Insert;
    DtmFinanceiro.CdsFinCxaLct['CD_FILIAL'] := DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'];
    DtmFinanceiro.CdsFinCxaLct['NR_TRANSACAO'] := DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaLct['NR_LANCAMENTO'] := 0;
    DtmFinanceiro.CdsFinCxaLct['CD_CONTA'] := EdtCD_CONTACXA.EditValue;
    DtmFinanceiro.CdsFinCxaLct['DT_LANCAMENTO'] := DataTranspApp.DtLancamento;
    DtmFinanceiro.CdsFinCxaLct['DT_MOVIMENTO'] := DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'];
    DtmFinanceiro.CdsFinCxaLct['DT_CONCILIADO'] := NULL;
    DtmFinanceiro.CdsFinCxaLct['NR_ORDEM_CONC'] := NULL;
    DtmFinanceiro.CdsFinCxaLct['SR_DOCUMENTO'] := EdtSR_DOCUMENTO.EditValue;
    DtmFinanceiro.CdsFinCxaLct['NR_DOCUMENTO'] := EdtNR_DOCUMENTO.EditValue;
    DtmFinanceiro.CdsFinCxaLct['NR_BANCO'] := EdtNR_BANCO.EditValue;
    DtmFinanceiro.CdsFinCxaLct['NR_AGENCIA'] := EdtNR_AGENCIA.EditValue;
    DtmFinanceiro.CdsFinCxaLct['NR_CONTA'] := EdtNR_CONTA.EditValue;

    // -- Tarefa: 3501 ...
    if EdtCD_HIST.Text <> EmptyStr then
      DtmFinanceiro.CdsFinCxaLct['CD_HISTORICO'] := EdtCD_HIST.EditValue;

		DtmFinanceiro.CdsFinCxaLct['NM_HISTORICO'] := EdtCD_HISTORICO.Text;
		DtmFinanceiro.CdsFinCxaLct['VL_LANCAMENTO'] := EdtVL_LANCAMENTO.Value;
		DtmFinanceiro.CdsFinCxaLct['TP_LANCAMENTO'] := EdtTP_LANCAMENTO.EditValue;
		DtmFinanceiro.CdsFinCxaLct['FL_DC'] := EdtFL_DC_CXA.Text;
		DtmFinanceiro.CdsFinCxaLct['FL_CONCILIADO'] := 'N';
		DtmFinanceiro.CdsFinCxaLct['FL_CONTABILIZADO'] := 'N';
		if (EdtVL_MOEDA.Value > 0) and (EdtVL_COTACAO.Value > 0) then
		begin
			DtmFinanceiro.CdsFinCxaLct['VL_MOEDA'] := EdtVL_MOEDA.Value;
			DtmFinanceiro.CdsFinCxaLct['VL_COTACAO'] := EdtVL_COTACAO.Value;
    end;
    DtmFinanceiro.CdsFinCxaLct.Post;
    DtmFinanceiro.CdsFinCxaLct.ApplyUpdates(0);

    DtmFinanceiro.CdsFinCxaLct.Close;
    DtmFinanceiro.CdsFinCxaLct.Open;
    DtmFinanceiro.CdsFinCxaLct.Last;

  finally
   	Screen.Cursor := crDefault;
  end;

  try
    // -- Verificar se o lançamento pede para imprimir um cheque ...

    BtnIntegrarChequeClick(Self);

    // -- Verificar se o lançamento deve integrar com o contas a receber / pagar ...

    BtnIntegrarTituloClick(Self);

    // -- Verificar se o lançamento integra com os lançamentos da ficha do motorista ...

    BtnIntegrarFichamotClick(Self);

    // -- Totalizar a transação ...
  finally
    Self.Close;
    TMovFinCaixaMovimentar(Self.Owner).BtnTotalizarTransacao;
  end;

end;

procedure TMovFinCaixaMovimentarCaixa.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  // -- Cancelar
  Self.Close;
end;

initialization
  RegisterClass(TMovFinCaixaMovimentarCaixa);

end.
