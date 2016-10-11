unit mFinCaixaMovimentar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, uPadraoMDI, cxGraphics, cxControls, dxStatusBar, ExtCtrls,
  cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxSpinEdit, cxCalc,
  cxDropDownEdit, cxCalendar, cxPC, cxCurrencyEdit, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Menus, cxImageComboBox, cxRadioGroup,
  cxCheckBox, dUsuario, StrUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, uPadrao, dxBarExtItems,
  cxLookAndFeels, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TMovFinCaixaMovimentar = class(TFrmPadraoMDI)
    Panel2: TPanel;
    BtnConfirmar: TcxButton;
    BtnExcluirTrn: TcxButton;
    BtnSair: TcxButton;
    StyCaixa: TcxStyleRepository;
    StyEntrada: TcxStyle;
    StySaida: TcxStyle;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    EdtCD_FILIAL: TcxDBButtonEdit;
    EdtNM_FILIAL: TcxTextEdit;
    EdtNR_TRANSACAO: TcxDBButtonEdit;
    EdtFL_DC: TcxDBImageComboBox;
    EdtDT_TRANSACAO: TcxDBDateEdit;
    EdtVL_TRANSACAO: TcxDBCurrencyEdit;
    StyEven: TcxStyle;
    StyOdd: TcxStyle;
    PopFinCxaTrn: TPopupMenu;
    BtnIncluirLancamentoCaixa: TMenuItem;
    BtnExcluirLancamento: TMenuItem;
    Bevel1: TBevel;
    BtnMovimentarCaixa: TcxButton;
    BtnMovimentarTitulo: TcxButton;
    BtnMovimentarDetalhe: TcxButton;
    GrdFinCxaTrn: TcxGrid;
    GrdFinCxaTrnView: TcxGridDBTableView;
    GrdFinCxaTrnLevel: TcxGridLevel;
    GrdFinCxaTrnViewColumn1: TcxGridDBColumn;
    GrdFinCxaTrnViewColumn2: TcxGridDBColumn;
    GrdFinCxaTrnViewColumn3: TcxGridDBColumn;
    GrdFinCxaTrnViewColumn4: TcxGridDBColumn;
    GrdFinCxaTrnViewColumn5: TcxGridDBColumn;
    GrdFinCxaTrnViewColumn6: TcxGridDBColumn;
    cxLabel16: TcxLabel;
    BtnIncluirLancamentoTitulo: TMenuItem;
    BtnIncluirLancamentoDetalhe: TMenuItem;
    N1: TMenuItem;
    BtnExcluirLct: TcxButton;
    BtnSalvarTransacao: TMenuItem;
    N2: TMenuItem;
    StyInactive: TcxStyle;
    EdtVL_DIFERENCA: TcxCurrencyEdit;
    BtnAlterarLancamento: TMenuItem;
    ExcluirTrn1: TMenuItem;
    N3: TMenuItem;
    BtnConciliar: TcxButton;
    EdtDT_CONCILIADO: TcxDateEdit;
    EdtDT_ULT_FECHAMENTO: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnProcurarChaveClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnExcluirTrnClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCD_FILIALPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtCD_FILIALExit(Sender: TObject);
    procedure EdtNR_TRANSACAOExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtDT_TRANSACAOExit(Sender: TObject);
    procedure BtnExcluirLctClick(Sender: TObject);
    procedure EdtCD_FILIALEnter(Sender: TObject);
    procedure EdtNR_TRANSACAOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnMovimentarCaixaClick(Sender: TObject);
    procedure BtnMovimentarTituloClick(Sender: TObject);
    procedure BtnMovimentarDetalheClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnAlterarLancamentoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnConciliarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
		FCdFilial: integer;
		FCdMoeda: integer;
    FCdOper: TTipoOper;
    function BtnIniciarTransacao: boolean;
    function BtnTotalizarTransacao: extended;
  end;

var
  MovFinCaixaMovimentar: TMovFinCaixaMovimentar;

implementation

uses uFuncProc, dPrincipal, dFinanceiro, qPadrao, qFrtFilial, qFinFinCxaTrn,
 	mFinCaixaMovimentarCaixa, mFinCaixaMovimentarDetalhe, mFinCaixaMovimentarTitulo,
  mFinTituloMovimentar, dViagem, mFrtViagemComissao, dAuditoriaFinanceiro, mFinConciliarLancamentos, qFinContacxa;

{$R *.dfm}

// ------------------------------------------------------------------------- //
// -- FORMULÁRIO ----------------------------------------------------------- //
// ------------------------------------------------------------------------- //

procedure TMovFinCaixaMovimentar.FormCreate(Sender: TObject);
var
  ANrTransacao: integer;
begin

  if (DataTranspApp.ParamValues[0] <> Null) then
    FCdFilial := DataTranspApp.ParamValues[0]
  else
    FCdFilial := 0;

  if (DataTranspApp.ParamValues[1] <> Null) then
    ANrTransacao := DataTranspApp.ParamValues[1]
  else
    ANrTransacao := 0;

  inherited;

	EdtCD_FILIAL.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
	EdtNR_TRANSACAO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');

  BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnExcluirLct.Glyph.LoadFromResourceName(HInstance, 'EXCLUIR');
  BtnExcluirTrn.Glyph.LoadFromResourceName(HInstance, 'EXCLUIR');
  //BtnConsultar.Glyph.LoadFromResourceName(HInstance, 'CONSULTAR');
  BtnSair.Glyph.LoadFromResourceName(HInstance, 'SAIR');
  BtnMovimentarCaixa.Glyph.LoadFromResourceName(HInstance, 'INCLUIR');
  BtnMovimentarTitulo.Glyph.LoadFromResourceName(HInstance, 'INCLUIR');
  BtnMovimentarDetalhe.Glyph.LoadFromResourceName(HInstance, 'INCLUIR');

  // -- Tarefa: 3660 ...
  BtnConciliar.Glyph.LoadFromResourceName(HInstance, 'SALVAR');

  DtmFinanceiro.CdsFinCxaTrn.Close;
  DtmFinanceiro.CdsFinCxaTrn.Params.Clear;
  DtmFinanceiro.SqlFinCxaTrn.ParamByName('CD_FILIAL').AsInteger := FCdFilial;
  DtmFinanceiro.SqlFinCxaTrn.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacao;

  BtnNovoClick(Self);

	if (FCdFilial > 0) and (ANrTransacao > 0) then
  begin
  	DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'] := FCdFilial;
  	DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'] := ANrTransacao;
    BtnProcurarChaveClick(Self); // -- Chamou transação por outra tela
  end;

end;

procedure TMovFinCaixaMovimentar.FormDestroy(Sender: TObject);
var
  i: Integer;
  aFechar: Boolean;
begin
  inherited;
  // -- Tarefa: 2896 - Fechando os clients ...
  aFechar := True;

  for i:= 0 to Screen.FormCount - 1 do
    if ((Screen.Forms[i].Name = 'MovFinTituloMovimentar') or
        (Screen.Forms[i].Name = 'MovFinTituloIntegrar') or
        (Screen.Forms[i].Name = 'MovIntImportarXMLCTE') or
        (Screen.Forms[i].Name = 'MovIntIntegradorCTe') or
        (Screen.Forms[i].Name = 'MovFinCaixaConsultarConta') or
        (Screen.Forms[i].Name = 'CadFinFinFatura') or
        (Screen.Forms[i].Name = 'MovFinTituloRealizar') or
        (Screen.Forms[i].Name = 'MovFrtPagamentoTerceiroPF')) then
      aFechar := False;

  if aFechar then
  begin
   DtmAuditoriaFinanceiro.CdsFinCxaLctAud.Close;
   DtmAuditoriaFinanceiro.CdsFinCxaDetAud.Close;
   DtmAuditoriaFinanceiro.CdsFinTituloAud.Close;
   DtmAuditoriaFinanceiro.CdsFinTitDetAud.Close;
   DtmAuditoriaFinanceiro.CdsFinTitLctAud.Close;
   DtmAuditoriaFinanceiro.CdsFinTitCxaAud.Close;
  end;

  DtmFinanceiro.CdsFinTitCxaLct.Close;
  DtmFinanceiro.CdsFinTitCxa.Close;
  DtmFinanceiro.CdsFinCxaDet.Close;
  DtmFinanceiro.CdsFinCheque.Close;
  DtmFinanceiro.CdsFinCxaLct.Close;
  DtmFinanceiro.CdsFinCxaTrn.Close;

  DtmFinanceiro.CdsFinCxaTrnExt.Close;
end;

procedure TMovFinCaixaMovimentar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN]) and (GrdFinCxaTrn.Focused) then Exit;
  inherited;
  if (Key = VK_F2) and (BtnConfirmar.Enabled) then BtnConfirmar.Click;
  if (Key = VK_F3) and (BtnExcluirLct.Enabled) then BtnExcluirLct.Click;
  if (Key = VK_F4) and (BtnExcluirTrn.Enabled) then BtnExcluirTrn.Click;
	if (Key = VK_F5) then BtnProcurarChaveClick(Self);
  if (Key = VK_F6) and (BtnMovimentarCaixa.Enabled) then BtnMovimentarCaixa.Click;
  if (Key = VK_F7) and (BtnMovimentarTitulo.Enabled) then BtnMovimentarTitulo.Click;
  if (Key = VK_F8) and (BtnMovimentarDetalhe.Enabled) then BtnMovimentarDetalhe.Click;
end;

procedure TMovFinCaixaMovimentar.FormActivate(Sender: TObject);
begin
  inherited;
	SetTabPadraoShow('Caixa', ftFormulario, True);
  SetTabPadraoFormularioAction(BtnConfirmarClick, BtnExcluirLctClick, BtnExcluirTrnClick);
//  SetTabPadraoCustomAction(TdxBarLargeButton, 'Lançar Caixa', 67, BtnMovimentarCaixaClick);
//  SetTabPadraoCustomAction(TdxBarLargeButton, 'Lançar Título', 67, BtnMovimentarTituloClick);
//  SetTabPadraoCustomAction(TdxBarLargeButton, 'Lançar Detalhe', 67, BtnMovimentarDetalheClick);
end;

procedure TMovFinCaixaMovimentar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  AVlDiferenca: extended;
begin
  inherited;

  AVlDiferenca := BtnTotalizarTransacao;
  if (AVlDiferenca <> 0) then
  begin
    Action := caNone;
    raise Exception.Create('Existe uma diferença a ser lançada.');
  end;

  if DtmFinanceiro.CdsFinTitCxaLct.Active then DtmFinanceiro.CdsFinTitCxaLct.CancelUpdates;
  if DtmFinanceiro.CdsFinTitCxa.Active then DtmFinanceiro.CdsFinTitCxa.CancelUpdates;
  if DtmFinanceiro.CdsFinCxaDet.Active then DtmFinanceiro.CdsFinCxaDet.CancelUpdates;
  if DtmFinanceiro.CdsFinCheque.Active then DtmFinanceiro.CdsFinCxaLct.CancelUpdates;
  if DtmFinanceiro.CdsFinCxaLct.Active then DtmFinanceiro.CdsFinCxaLct.CancelUpdates;
  if DtmFinanceiro.CdsFinCxaTrn.Active then DtmFinanceiro.CdsFinCxaTrn.CancelUpdates;
end;

// ------------------------------------------------------------------------- //
// -- CONTROLE FINCXATRN --------------------------------------------------- //
// ------------------------------------------------------------------------- //

procedure TMovFinCaixaMovimentar.EdtCD_FILIALEnter(Sender: TObject);
begin
  // -- Sugerir a filial da transação 
	if (DtmFinanceiro.CdsFinCxaTrn.State in [dsEdit, dsInsert]) then
  begin
		if (DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'] = NULL) then
    begin
    	DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'] := FCdFilial;
      EdtCD_FILIAL.SelectAll;
    end;
  end;
end;

procedure TMovFinCaixaMovimentar.EdtCD_FILIALExit(Sender: TObject);
begin
	if DataTranspApp.CreateFormSeek(TConFrtFilial, Self,
  	[DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']], ['NM_FANTASIA'], [EdtNM_FILIAL]) then
  begin
    if not DtmUsuario.ValidarUsuarioFilialAcesso(DataTranspApp.UserId,
      DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger, tmFinanceiroCaixa) then
    begin
      DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'] := Null;
      EdtCD_FILIAL.SetFocus;
      raise Exception.Create('Este usuário não tem permissão para utilizar este recurso desta filial.');
    end;
  	//EdtCD_FILIAL.Enabled := False;
  	FCdFilial := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
  end
  else begin
    if EdtCD_FILIAL.CanFocus then EdtCD_FILIAL.SetFocus;
    raise Exception.Create('Filial não cadastrada, informe um código de filial válido!');
  end;
end;

procedure TMovFinCaixaMovimentar.EdtCD_FILIALPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	DataTranspApp.CreateFormMdi(TConFrtFilial, Self, [DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL']],
  	[DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL')]);
end;

procedure TMovFinCaixaMovimentar.EdtNR_TRANSACAOExit(Sender: TObject);
begin
  //EdtNR_TRANSACAO.Enabled := False;
  BtnProcurarChaveClick(Self);	// -- Consultar a transação
end;

procedure TMovFinCaixaMovimentar.EdtNR_TRANSACAOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	// -- Consulta lançamentos utilizando vários termos como filtro ...
  DataTranspApp.CreateFormMdi(TConFinFinCxaTrn, Self, [null],
    [DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL'),
      DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO')]);
end;

procedure TMovFinCaixaMovimentar.EdtDT_TRANSACAOExit(Sender: TObject);
begin
  // -- Validar a alteração da data permitindo refazer toda a transação para uma nova data ...
	if (DtmFinanceiro.CdsFinCxaTrn.State in [dsEdit, dsInsert]) then
  begin
    // -- Implementar nova rotina ...
  end;
end;

// ------------------------------------------------------------------------- //
// -- BOTÕES --------------------------------------------------------------- //
// ------------------------------------------------------------------------- //

procedure TMovFinCaixaMovimentar.BtnNovoClick(Sender: TObject);
begin

	// -- Configurar entrada de dados ...
{
  if DataTranspApp.ReadConfigBoolean(DataTranspApp.CdFilial, 'FL_INFORMAR_TRANSACAO', False) then
  begin
    EdtNR_TRANSACAO.Properties.ReadOnly := False;
    EdtNR_TRANSACAO.Style.Color := clWindow;
    EdtNR_TRANSACAO.TabStop := True;
  end
  else begin
    EdtNR_TRANSACAO.Properties.ReadOnly := True;
    EdtNR_TRANSACAO.Style.Color := cl3DLight;
    EdtNR_TRANSACAO.TabStop := False;
  end;
}
	// -- Limpar Campos e setar o primeiro componente da tela

	FCdMoeda := -1; // -- Nenhuma moeda selecionada para a transação ...
  FCdOper := toIncluir;

  EdtCD_FILIAL.Enabled := True;
  EdtNR_TRANSACAO.Enabled := True;
  EdtDT_TRANSACAO.Enabled := True;
  EdtVL_TRANSACAO.Enabled := True;
  EdtFL_DC.Enabled := True;
  EdtNM_FILIAL.Clear;
  EdtVL_DIFERENCA.Clear;

  // -- Fechar todas as tabelas auxiliares, e atribuir o comando rápido para controle dos lançamentos ...

  DtmFinanceiro.CdsFinCxaLct.Close;
  DtmFinanceiro.CdsFinCheque.Close;
  DtmFinanceiro.CdsFinCxaDet.Close;
  DtmFinanceiro.CdsFinTitCxa.Close;
  DtmFinanceiro.CdsFinTitCxaLct.Close;

  DtmFinanceiro.CdsFinCxaTrnExt.Close;

  DtmFinanceiro.CdsFinCxaTrn.Close;
  DtmFinanceiro.CdsFinCxaTrn.Open;
  DtmFinanceiro.CdsFinCxaTrn.Insert;

  // -- Tarefa: 2896 ...
  DtmAuditoriaFinanceiro.CdsFinCxaLctAud.Close;
  DtmAuditoriaFinanceiro.CdsFinCxaLctAud.Open;
  DtmAuditoriaFinanceiro.CdsFinCxaDetAud.Close;
  DtmAuditoriaFinanceiro.CdsFinCxaDetAud.Open;
  DtmAuditoriaFinanceiro.CdsFinTitLctAud.Close;
  DtmAuditoriaFinanceiro.CdsFinTitLctAud.Open;
  DtmAuditoriaFinanceiro.CdsFinTitCxaAud.Close;
  DtmAuditoriaFinanceiro.CdsFinTitCxaAud.Open;

  SelectFirst;

end;

procedure TMovFinCaixaMovimentar.BtnProcurarChaveClick(Sender: TObject);
var
  ANrTransacao: integer;
  AEnabled: Boolean;
begin

  // -- Guardar os valores informados pelo usuário ...

  FCdFilial := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
  ANrTransacao := DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger;

	// -- Procurar transação (alteração) ...

  Screen.Cursor := crSQLWait;
  try

    // -- Procurar pela transação ou pela chave do título

    DtmFinanceiro.CdsFinCxaTrn.Cancel;

    DtmFinanceiro.CdsFinCxaTrn.Close;
    DtmFinanceiro.CdsFinCxaTrn.Params.Clear;
    DtmFinanceiro.SqlFinCxaTrn.ParamByName('CD_FILIAL').AsInteger := FCdFilial;
    DtmFinanceiro.SqlFinCxaTrn.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacao;
    DtmFinanceiro.CdsFinCxaTrn.Open;

    if not(DtmFinanceiro.CdsFinCxaTrn.IsEmpty) then
    begin

      FCdOper := toAlterar;

      // -- Editar o lançamento do caixa ...

      DtmFinanceiro.CdsFinCxaTrn.Edit;

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

      // -- Desabilitar os campos chaves da transação ...

      EdtCD_FILIAL.Enabled := False;
      EdtNR_TRANSACAO.Enabled := False;
      EdtDT_TRANSACAO.Enabled := False;
      EdtFL_DC.Enabled := False;
      EdtCD_FILIALExit(Self);
      ActiveControl := GrdFinCxaTrn;

      // -- Tarefa: 2724 ...
      AEnabled := True;
      while not DtmFinanceiro.CdsFinCxaLct.Eof do
      begin
        if (DtmFinanceiro.CdsFinCxaLct.FieldByName('DT_CONCILIADO').Text <> EmptyStr) then
          AEnabled := False;

        DtmFinanceiro.CdsFinCxaLct.Next;
      end;

      BtnExcluirTrn.Enabled        := AEnabled;
      BtnExcluirLct.Enabled        := AEnabled;
      BtnExcluirLancamento.Enabled := AEnabled;
      ExcluirTrn1.Enabled          := AEnabled;

      // -- Totalizar a transação do caixa (usa CdsFinCxaTrnExt) ...

      BtnTotalizarTransacao;

    end
    else begin
      DtmFinanceiro.CdsFinCxaTrn.Insert;
      DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'] := FCdFilial;
    end;

  finally
  	Screen.Cursor := crDefault;
  end;

end;

function TMovFinCaixaMovimentar.BtnIniciarTransacao: boolean;
var
  ANrTransacao: integer;
  ADtTransacao: TDateTime;
begin

	try

  	// -- Caso esteja em edição sair da rotina ...
    
    if (DtmFinanceiro.CdsFinCxaTrn.State = dsEdit) then
    begin
      Result := True;
      Exit;
    end;

    // -- Validar o cabeçalho da transação ...
    
    if (EdtCD_FILIAL.Text = '') then
    begin
      ActiveControl := EdtCD_FILIAL;
      raise Exception.Create('O campo filial de controle é obrigatório.');
    end;

    if (EdtDT_TRANSACAO.Text = '') then
    begin
      ActiveControl := EdtDT_TRANSACAO;
      raise Exception.Create('O campo data de movimento é obrigatório.');
    end
    else
    begin
      if (EdtDT_TRANSACAO.Date <= (DataTranspApp.ReadConfigDate(StrToIntDef(EdtCD_FILIAL.Text, DataTranspApp.CdFilial), 'DT_MOV_BLOQUEIO_SISTEMA', StrToDate('01/01/1899')))) then
      begin
        ActiveControl := EdtDT_TRANSACAO;
        raise Exception.Create('O DataTransp está bloqueado para data de movimento inferior à ' + FormatDateTime('dd/mm/yyyy', DataTranspApp.ReadConfigDate(StrToIntDef(EdtCD_FILIAL.Text, DataTranspApp.CdFilial), 'DT_MOV_BLOQUEIO_SISTEMA', StrToDate('01/01/1899'))));
      end;
    end;

    if (EdtFL_DC.Text = '') then
    begin
      ActiveControl := EdtFL_DC;
      raise Exception.Create('O campo tipo da transação é obrigatório.');
    end;

    // -- Iniciar a transação ...

    Screen.Cursor := crHourGlass;
    try

      // -- Gerar nova transação ...
      FCdFilial := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
      ANrTransacao := DtmFinanceiro.GetTransacao(FCdFilial);
      ADtTransacao := DtmFinanceiro.CdsFinCxaTrn.FieldByName('DT_TRANSACAO').AsDateTime;

      // -- Atribuir ao cabeçalho da transação ...
      DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO'] := ANrTransacao;
      DtmFinanceiro.CdsFinCxaTrn.Post;
      DtmFinanceiro.CdsFinCxaTrn.ApplyUpdates(0);

      // -- Reabrir transação ...
      DtmFinanceiro.CdsFinCxaTrn.Close;
      DtmFinanceiro.CdsFinCxaTrn.Params.Clear;
      DtmFinanceiro.SqlFinCxaTrn.ParamByName('CD_FILIAL').AsInteger := FCdFilial;
      DtmFinanceiro.SqlFinCxaTrn.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacao;
      DtmFinanceiro.CdsFinCxaTrn.Open;

      // -- Editar uma segunda vez no banco de dados a transação para fins de gerar o lançamento contábil ...
      DtmFinanceiro.CdsFinCxaTrn.Edit;
      if (DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'] = Null) then
        DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO'] := ADtTransacao;

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

      // -- Desabilitar o cabeçalho da transação ... 
      EdtCD_FILIAL.Enabled := False;
      EdtNR_TRANSACAO.Enabled := False;
      EdtDT_TRANSACAO.Enabled := False;
      EdtVL_TRANSACAO.Enabled := False;
      EdtFL_DC.Enabled := False;

    finally
      Screen.Cursor := crDefault;
    end;

    Result := True;

  except
  	Result := false;
    raise;
  end;

end;

function TMovFinCaixaMovimentar.BtnTotalizarTransacao: extended;
var
	ACount: integer;
begin

  Result := 0;
  ACount := 0;

  Screen.Cursor := crHourGlass;
  DtmFinanceiro.CdsFinCxaTrnExt.DisableControls;
  try

  	DtmFinanceiro.CdsFinCxaTrnExt.Close;
    DtmFinanceiro.CdsFinCxaTrnExt.Params.Clear;
    DtmFinanceiro.SqlFinCxaTrnExt.ParamByName('PCD_FILIAL').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger;
    DtmFinanceiro.SqlFinCxaTrnExt.ParamByName('PNR_TRANSACAO').AsInteger := DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger;
  	DtmFinanceiro.CdsFinCxaTrnExt.Open;

  	DtmFinanceiro.CdsFinCxaTrnExt.First;
    while not DtmFinanceiro.CdsFinCxaTrnExt.Eof do
    begin
			Result := Result + (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('VL_LANCAMENTO_D').AsFloat -
				DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('VL_LANCAMENTO_C').AsFloat);
    	DtmFinanceiro.CdsFinCxaTrnExt.Next;
      Inc(ACount);
    end;

    Result := FmtRound(Result, 15, 2);
    EdtVL_DIFERENCA.Value := Result;
    DtmFinanceiro.CdsFinCxaTrn['VL_TRANSACAO'] := Result;
    
    if (Result = 0) and (ACount > 0) then
    	ActiveControl := BtnConfirmar;

  finally
    DtmFinanceiro.CdsFinCxaTrnExt.EnableControls;
    Screen.Cursor := crDefault;
  end;

end;

procedure TMovFinCaixaMovimentar.BtnConfirmarClick(Sender: TObject);
var
  ANrTransacao: integer;
  AVlDiferenca: extended;
begin

  // -- Selecionar a transação em questão ...

  ANrTransacao := DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger;

  if (ANrTransacao = 0) then
  begin
  	SelectFirst;
    raise Exception.Create('Nenhum lançamento para esta transação.');
  end;

  // -- Totalizar os lançamentos da transação validando a diferença a lançar (ponto chave para confirmação de uma transação) ...

  AVlDiferenca := BtnTotalizarTransacao;

  if (AVlDiferenca = 0) then
  begin

    // -- Validar se foi lançado algo no caixa / conta corrente, e pedir para iniciar lançamento caso negativo ...

    if (DtmFinanceiro.CdsFinCxaLct.IsEmpty) then
    begin
      raise Exception.Create('Nenhum lançamento de caixa / conta corrente para esta transação.');
    end;

    // -- Confirmar a transação ...

    if Application.MessageBox('Confirma os lançamentos desta transação?',
      PChar(Self.Caption), MB_ICONQUESTION + MB_YESNO) = idYES then
    begin

      // -- Registrar para auditoria ...

      DtmUsuario.RegistrarAuditoria(
        DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger,
        UpperCase(Self.Name),
        Format('%s;%s;', [
          DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsString,
          DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsString]),
        FCdOper);

      // -- Salva definitivamente no banco de dados os registros ...

      DtmFinanceiro.CdsFinCxaTrn.ApplyUpdates(0);
      if DtmFinanceiro.CdsFinCxaLct.Active then DtmFinanceiro.CdsFinCxaLct.ApplyUpdates(0);
      if DtmFinanceiro.CdsFinCheque.Active then DtmFinanceiro.CdsFinCheque.ApplyUpdates(0);
      if DtmFinanceiro.CdsFinCxaDet.Active then DtmFinanceiro.CdsFinCxaDet.ApplyUpdates(0);
      if DtmFinanceiro.CdsFinTitCxa.Active then DtmFinanceiro.CdsFinTitCxa.ApplyUpdates(0);
      if DtmFinanceiro.CdsFinTitCxaLct.Active then DtmFinanceiro.CdsFinTitCxaLct.ApplyUpdates(0);

      // -- Inicia nova transação ...

      BtnNovoClick(Self);

	    // -- Atualizar a transação anterior na contabilidade ...
      if (DataTranspApp.ReadConfigString(FCdFilial,'FL_CONTABILIDADE','S') = 'S') then
        DtmFinanceiro.SetTransacao(FCdFilial, ANrTransacao);

    end;

  end
  else
  	raise Exception.Create(Format('Existe uma diferença de %15.2f a ser lançada!', [AVlDiferenca]));

end;

// -- Tarefa: 3660 ...
procedure TMovFinCaixaMovimentar.BtnConciliarClick(Sender: TObject);
begin
  EdtDT_CONCILIADO.Clear;

  if DtmFinanceiro.CdsFinCxaLct.Active then
  begin
    DtmFinanceiro.CdsFinCxaLct.CancelUpdates;
    DtmFinanceiro.CdsFinCxaLct.Refresh;

    if not DtmFinanceiro.CdsFinCxaLct.IsEmpty then
      DataTranspApp.CreateFormNormal(TMovFinConciliarLancamentos, Self, [], [nil]);

    if (EdtDT_CONCILIADO.Text <> EmptyStr) then
    begin
      DtmFinanceiro.CdsFinCxaLct.First;
      while not DtmFinanceiro.CdsFinCxaLct.Eof do
      begin

        DataTranspApp.CreateFormSeek(TConFinContacxa, Self, [DtmFinanceiro.CdsFinCxaLct.FieldByName('CD_CONTA').AsInteger], ['DT_ULT_FECHAMENTO'], [EdtDT_ULT_FECHAMENTO]);

        if StrToDate(EdtDT_ULT_FECHAMENTO.Text) >= StrToDate(EdtDT_CONCILIADO.Text) then
          raise Exception.Create('Não é possível Conciliar/Desconciliar o Caixa: ' + DtmFinanceiro.CdsFinCxaLct.FieldByName('CD_CONTA').AsString +
            ' com a data de conciliação menor/igual a data de fechamento cadastrada.');

        DtmFinanceiro.CdsFinCxaLct.Edit;
        DtmFinanceiro.CdsFinCxaLct.FieldByName('DT_CONCILIADO').AsDateTime := EdtDT_CONCILIADO.Date;
        DtmFinanceiro.CdsFinCxaLct.Post;

        DtmFinanceiro.CdsFinCxaLct.Next;

      end;
    end;
  end;

  BtnConfirmarClick(Self);
end;

procedure TMovFinCaixaMovimentar.BtnMovimentarCaixaClick(Sender: TObject);
begin
	// -- Lançar Caixa
  if BtnIniciarTransacao then
		DataTranspApp.CreateFormMdi(TMovFinCaixaMovimentarCaixa, Self, [DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'],
		  DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO']], [NIL]);
end;

procedure TMovFinCaixaMovimentar.BtnMovimentarTituloClick(Sender: TObject);
begin
	// -- Lançar Título
  if BtnIniciarTransacao then
		DataTranspApp.CreateFormMdi(TMovFinCaixaMovimentarTitulo, Self, [DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'],
		  DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO']], [NIL]);
end;

procedure TMovFinCaixaMovimentar.BtnMovimentarDetalheClick(Sender: TObject);
begin
	// -- Lançar Detalhe
  if BtnIniciarTransacao then
		DataTranspApp.CreateFormMdi(TMovFinCaixaMovimentarDetalhe, Self, [DtmFinanceiro.CdsFinCxaTrn['CD_FILIAL'],
		  DtmFinanceiro.CdsFinCxaTrn['NR_TRANSACAO']], [NIL]);
end;

procedure TMovFinCaixaMovimentar.BtnAlterarLancamentoClick(Sender: TObject);
var
	ACdFilial,
  ANrTransacao,
  ANrLancamento,
  ANrParcela: integer;
  AFilter: string;
  ANmHistorico: string;
begin
  inherited;

  if (DtmFinanceiro.CdsFinCxaTrnExt.IsEmpty) then
  begin
    SelectFirst;
    Exit;
  end;

  ANmHistorico := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NM_HISTORICO').AsString;
  if (InputQuery('Alterar Histórico', 'Informe o novo histórico para o lançamento:', ANmHIstorico)) then
  begin

    case DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger of

      1 : begin // -- Caixa

        ACdFilial := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger;
        ANrTransacao := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO').AsInteger;
        ANrLancamento := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger;
        AFilter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d)',
          [ACdFilial, ANrTransacao, ANrLancamento]);

        DtmFinanceiro.CdsFinCxaLct.Filter := AFilter;
        DtmFinanceiro.CdsFinCxaLct.Filtered := True;
        if not DtmFinanceiro.CdsFinCxaLct.IsEmpty then
        begin
          DtmFinanceiro.CdsFinCxaLct.Edit;
          DtmFinanceiro.CdsFinCxaLct['NM_HISTORICO'] := UpperCase(ANmHistorico);
          DtmFinanceiro.CdsFinCxaLct.Post;
          DtmFinanceiro.CdsFinCxaLct.ApplyUpdates(0);
        end;
        DtmFinanceiro.CdsFinCxaLct.Filtered := False;
        DtmFinanceiro.CdsFinCxaLct.Filter := '';

      end;

      2 : begin // -- Detalhe

        ACdFilial := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger;
        ANrTransacao := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO').AsInteger;
        ANrLancamento := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger;
        AFilter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d)',
          [ACdFilial, ANrTransacao, ANrLancamento]);

        DtmFinanceiro.CdsFinCxaDet.Filter := AFilter;
        DtmFinanceiro.CdsFinCxaDet.Filtered := True;
        if not DtmFinanceiro.CdsFinCxaDet.IsEmpty then
        begin
          DtmFinanceiro.CdsFinCxaDet.Edit;
          DtmFinanceiro.CdsFinCxaDet['NM_HISTORICO'] := UpperCase(ANmHistorico);
          DtmFinanceiro.CdsFinCxaDet.Post;
          DtmFinanceiro.CdsFinCxaDet.ApplyUpdates(0);
        end;
        DtmFinanceiro.CdsFinCxaDet.Filtered := False;
        DtmFinanceiro.CdsFinCxaDet.Filter := '';

      end;

      3 : begin // -- Título

        ACdFilial := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger;
        ANrTransacao := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO_TIT').AsInteger;
        ANrLancamento := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger;
        ANrParcela := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_PARCELA_TIT').AsInteger;

        DtmFinanceiro.CdsFinTitCxaLct.Close;
        DtmFinanceiro.CdsFinTitCxaLct.Params.Clear;
        DtmFinanceiro.SqlFinTitCxaLct.ParamByName('CD_FILIAL').AsInteger := ACdFilial;
        DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_TRANSACAO').AsInteger := ANrTransacao;
        DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_LANCAMENTO').AsInteger := ANrLancamento;
        DtmFinanceiro.SqlFinTitCxaLct.ParamByName('NR_PARCELA').AsInteger := ANrParcela;
        DtmFinanceiro.CdsFinTitCxaLct.Open;

        if not DtmFinanceiro.CdsFinTitCxaLct.IsEmpty then
        begin
          DtmFinanceiro.CdsFinTitCxaLct.Edit;
          DtmFinanceiro.CdsFinTitCxaLct['NM_HISTORICO'] := UpperCase(ANmHistorico);
          DtmFinanceiro.CdsFinTitCxaLct.Post;
          DtmFinanceiro.CdsFinTitCxaLct.ApplyUpdates(0);
        end;

      end;

    end;

    BtnTotalizarTransacao;

  end;

end;

procedure TMovFinCaixaMovimentar.BtnExcluirLctClick(Sender: TObject);
var
	ACdFilial,
  ANrTransacao,
  ANrLancamento,
  ANrParcela: integer;
  AFilter: string;
  ADeletar: Boolean;
  ANmUsuario: String;
begin

	// -- Selecionar lançamento ...

	if DtmFinanceiro.CdsFinCxaTrnExt.IsEmpty then
  begin
  	SelectFirst;
    Exit;
  end;

  if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 1) then
  begin
    if (DtmFinanceiro.CdsFinCxaTrnExt['DT_ULT_FECHAMENTO'] >= DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO']) then
      raise Exception.Create('Não é possível excluir este lançamento, o caixa está fechado nesta data.');

    // -- Tarefa: 3306 ...
    if not DtmUsuario.ValidarUsuarioCaixaAcesso(DataTranspApp.UserId, DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_CONTA').AsInteger) then
      raise Exception.Create('Este usuário não tem permissão para utilizar este recurso deste caixa / conta corrente.');
  end;

  if Application.MessageBox('Confirma a exclusão deste lançamento da transação?',
  	PChar(Self.Caption), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) = IDNO then
  begin
  	SelectFirst;
    Exit;
  end;

  // -- Tarefa: 1841 ...
  if (DataTranspApp.ReadConfigString(FCdFilial,'FL_EXCLUIR_TRANS_CXA', 'S') = 'N') then
  begin
    ANmUsuario := DataTranspApp.UserName;
    ADeletar   := False;
    DataTranspApp.VerificarAdministrador(ANmUsuario, ADeletar);

    if not ADeletar then
      raise Exception.Create('O usuário não possui privilégios de administrador. Portanto, não poderá excluir este lançamento.');
  end;

	// -- Excluir conforme o tipo do lançamento ...

  if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 1) then
  begin

    ACdFilial := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger;
    ANrTransacao := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO').AsInteger;
    ANrLancamento := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger;
    AFilter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d)',
    	[ACdFilial, ANrTransacao, ANrLancamento]);

    DtmFinanceiro.CdsFinCxaLct.Filter := AFilter;
    DtmFinanceiro.CdsFinCxaLct.Filtered := True;
    if not DtmFinanceiro.CdsFinCxaLct.IsEmpty then
    begin
    	// -- TODO - Cancelar o cheque caso exista ...
      DtmFinanceiro.CdsFinCxaLct.Delete;
      DtmFinanceiro.CdsFinCxaLct.ApplyUpdates(0);
    end;
    DtmFinanceiro.CdsFinCxaLct.Filtered := False;
    DtmFinanceiro.CdsFinCxaLct.Filter := '';

  end
  else if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 2) then
  begin

    ACdFilial := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger;
    ANrTransacao := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO').AsInteger;
    ANrLancamento := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger;
    AFilter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d)',
    	[ACdFilial, ANrTransacao, ANrLancamento]);

    DtmFinanceiro.CdsFinCxaDet.Filter := AFilter;
    DtmFinanceiro.CdsFinCxaDet.Filtered := True;
    if not DtmFinanceiro.CdsFinCxaDet.IsEmpty then
    begin
      DtmFinanceiro.CdsFinCxaDet.Delete;
      DtmFinanceiro.CdsFinCxaDet.ApplyUpdates(0);
    end;
    DtmFinanceiro.CdsFinCxaDet.Filtered := False;
    DtmFinanceiro.CdsFinCxaDet.Filter := '';

  end
  else if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 3) then
  begin

    ACdFilial := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger;
    ANrTransacao := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO_TIT').AsInteger;
    ANrLancamento := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger;
    ANrParcela := DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_PARCELA_TIT').AsInteger;
    AFilter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d) AND (NR_PARCELA = %d)',
    	[ACdFilial, ANrTransacao, ANrLancamento, ANrParcela]);

    DtmFinanceiro.CdsFinTitCxa.Filter := AFilter;
    DtmFinanceiro.CdsFinTitCxa.Filtered := True;

    if not DtmFinanceiro.CdsFinTitCxa.IsEmpty then
    begin
      DtmFinanceiro.CdsFinTitCxa.Delete;
      DtmFinanceiro.CdsFinTitCxa.ApplyUpdates(0);
    end;

    DtmFinanceiro.CdsFinTitCxa.Filtered := False;
    DtmFinanceiro.CdsFinTitCxa.Filter := '';
  end;

  BtnTotalizarTransacao; // -- Recalcular após excluir o lançamento ...

end;

procedure TMovFinCaixaMovimentar.BtnExcluirTrnClick(Sender: TObject);
var
  ABotao: TcxButton;
  AGrid: TcxGrid;
  i: Integer;
  ADeletar: Boolean;
  ANmUsuario: String;
begin

  // -- Diferentes ações conforme a situação da transação ...

  if (DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsInteger > 0) then
  begin
    if DtmFinanceiro.CdsFinCxaTrnExt.Active then
    begin
      DtmFinanceiro.CdsFinCxaTrnExt.First;
      while not DtmFinanceiro.CdsFinCxaTrnExt.Eof do
      begin
        if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 1) and
           (DtmFinanceiro.CdsFinCxaTrnExt['DT_ULT_FECHAMENTO'] >= DtmFinanceiro.CdsFinCxaTrn['DT_TRANSACAO']) then
          raise Exception.Create('Não é possível excluir esta transação, o caixa está fechado nesta data.');

        // -- Tarefa: 3306 ...
        // -- Tarefa: 3385 - Colocado para validar a permissão do caixa, somente quando o FL_LANCAMENTO for 1 ...
        if ((DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_LANCAMENTO').AsInteger = 1) and
            (not DtmUsuario.ValidarUsuarioCaixaAcesso(DataTranspApp.UserId, DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_CONTA').AsInteger))) then
          raise Exception.Create('Este usuário não tem permissão para utilizar este recurso deste caixa / conta corrente.');

        DtmFinanceiro.CdsFinCxaTrnExt.Next;
      end;
    end;

    if Application.MessageBox('Excluir a transação do caixa juntamente com TODOS os lançamentos? As baixas dos títulos serão estornadas!',
      PChar(Self.Caption), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYES then
    begin

      // -- Tarefa: 1841 ...
      if (DataTranspApp.ReadConfigString(FCdFilial,'FL_EXCLUIR_TRANS_CXA', 'S') = 'N') then
      begin
        ANmUsuario := DataTranspApp.UserName;
        ADeletar   := False;
        DataTranspApp.VerificarAdministrador(ANmUsuario, ADeletar);

        if not ADeletar then
          raise Exception.Create('O usuário não possui privilégios de administrador. Portanto, não poderá excluir esta transação.');
      end;

      FCdOper := toExcluir;

      // -- Registrar para auditoria ...

      DtmUsuario.RegistrarAuditoria(
        DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsInteger,
        UpperCase(Self.Name),
        Format('%s;%s;', [
          DtmFinanceiro.CdsFinCxaTrn.FieldByName('CD_FILIAL').AsString,
          DtmFinanceiro.CdsFinCxaTrn.FieldByName('NR_TRANSACAO').AsString]),
        FCdOper);

      // -- Excluir toda a transação (com todos seus lançamentos/itens) ...

      if DtmFinanceiro.CdsFinTitCxaLct.Active then DtmFinanceiro.CdsFinTitCxaLct.CancelUpdates;
      if DtmFinanceiro.CdsFinTitCxa.Active then DtmFinanceiro.CdsFinTitCxa.CancelUpdates;
      if DtmFinanceiro.CdsFinCxaDet.Active then DtmFinanceiro.CdsFinCxaDet.CancelUpdates;
      if DtmFinanceiro.CdsFinCheque.Active then DtmFinanceiro.CdsFinCheque.CancelUpdates;
      if DtmFinanceiro.CdsFinCxaLct.Active then DtmFinanceiro.CdsFinCxaLct.CancelUpdates;

      DtmFinanceiro.CdsFinCxaTrn.Delete;
      DtmFinanceiro.CdsFinCxaTrn.ApplyUpdates(0);

      // --> ID: 880
      if ((Self.Owner.Name = 'MovFrtViagemComissao') or (Self.Owner.Name = 'FrmMenu')) then
      begin
        for i := 0 to Screen.FormCount - 1 do
        begin
          if (Screen.Forms[i].Name = 'MovFrtViagemComissao') then
          begin
            ABotao := TcxButton(Screen.Forms[i].FindComponent('BtnIntegrar'));
            ABotao.Enabled := True;

            ABotao := TcxButton(Screen.Forms[i].FindComponent('BtnOk'));
            ABotao.Enabled := True;

            ABotao := TcxButton(Screen.Forms[i].FindComponent('BtnTransacao'));
            ABotao.Enabled := False;

            AGrid := TcxGrid(Screen.Forms[i].FindComponent('GrdViagemConhecto'));
            AGrid.Enabled := True;

            DtmViagem.CdsViagem.Refresh; 
          end;
        end;
      end;
      // --- Iniciar nova transação ...
      BtnNovoClick(Self);
    end;
  end
  else begin

    if DtmFinanceiro.CdsFinTitCxaLct.Active then DtmFinanceiro.CdsFinTitCxaLct.CancelUpdates;
    if DtmFinanceiro.CdsFinTitCxa.Active then DtmFinanceiro.CdsFinTitCxa.CancelUpdates;
    if DtmFinanceiro.CdsFinCxaDet.Active then DtmFinanceiro.CdsFinCxaDet.CancelUpdates;
    if DtmFinanceiro.CdsFinCheque.Active then DtmFinanceiro.CdsFinCheque.CancelUpdates;
    if DtmFinanceiro.CdsFinCxaLct.Active then DtmFinanceiro.CdsFinCxaLct.CancelUpdates;

    DtmFinanceiro.CdsFinCxaTrn.CancelUpdates;

    BtnNovoClick(Self);

  end;

end;

procedure TMovFinCaixaMovimentar.BtnSairClick(Sender: TObject);
begin
	Self.Close; // -- Sair
end;

{
  // -- Validar se o grid possui dados ...

  if (not DtmFinanceiro.CdsFinCxaTrnExt.Active) or (DtmFinanceiro.CdsFinCxaTrn.IsEmpty) then
    Exit;

  // -- Validar se o conteúdo está sendo editado ...

  if GrdFinCxaTrnView.DataController.IsEditing then
    GrdFinCxaTrnView.DataController.PostEditingData
  else
    Exit;

  // -- Alterar a descrição do item informado  ...

  if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_CAIXA').AsInteger = 1) then // -- Caixa
  begin

    try

      DtmFinanceiro.CdsFinCxaLct.Filter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d)',
        [DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger,
          DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO').AsInteger,
            DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger]);
      DtmFinanceiro.CdsFinCxaLct.Filtered := True;

      if not DtmFinanceiro.CdsFinCxaLct.IsEmpty then
      begin
        DtmFinanceiro.CdsFinCxaLct.Edit;
        DtmFinanceiro.CdsFinCxaLct['NM_HISTORICO'] := DtmFinanceiro.CdsFinCxaTrnExt['NM_HISTORICO'];
        DtmFinanceiro.CdsFinCxaLct.Post;
        DtmFinanceiro.CdsFinCxaLct.ApplyUpdates(0);
      end;

    finally
      DtmFinanceiro.CdsFinCxaLct.Filter := '';
      DtmFinanceiro.CdsFinCxaLct.Filtered := False;
    end;

  end
  else
  if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_CAIXA').AsInteger = 0)
    and (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO_TIT').AsInteger = 0) then // -- Detalhamento
  begin

    try

      DtmFinanceiro.CdsFinCxaDet.Filter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_LANCAMENTO = %d)',
        [DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger,
          DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO').AsInteger,
            DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger]);
      DtmFinanceiro.CdsFinCxaDet.Filtered := True;

      if not DtmFinanceiro.CdsFinCxaDet.IsEmpty then
      begin
        DtmFinanceiro.CdsFinCxaDet.Edit;
        DtmFinanceiro.CdsFinCxaDet['NM_HISTORICO'] := DtmFinanceiro.CdsFinCxaTrnExt['NM_HISTORICO'];
        DtmFinanceiro.CdsFinCxaDet.Post;
        DtmFinanceiro.CdsFinCxaDet.ApplyUpdates(0);
      end;

    finally
      DtmFinanceiro.CdsFinCxaDet.Filter := '';
      DtmFinanceiro.CdsFinCxaDet.Filtered := False;
    end;

  end
  else
  if (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('FL_CAIXA').AsInteger = 0)
    and (DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO_TIT').AsInteger > 0) then // -- Título
  begin

    try

      // -- O número da parcela se encontra após a segunda barra do número do documento ...
      APosParcela := PosEx('/', DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_DOCUMENTO').AsString, 1);
      APosParcela := PosEx('/', DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_DOCUMENTO').AsString, APosParcela + 1);
      if (APosParcela > 0) then
        ANrParcela := StrToInt(Copy(DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_DOCUMENTO').AsString, APosParcela + 1, 5))
      else
        ANrParcela := 0;

      DtmFinanceiro.CdsFinTitCxaLct.Filter := Format('(CD_FILIAL = %d) AND (NR_TRANSACAO = %d) AND (NR_PARCELA = %d) AND (NR_LANCAMENTO = %d)',
        [DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('CD_FILIAL').AsInteger,
          DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_TRANSACAO_TIT').AsInteger,
            ANrParcela, DtmFinanceiro.CdsFinCxaTrnExt.FieldByName('NR_LANCAMENTO').AsInteger]);
      DtmFinanceiro.CdsFinTitCxaLct.Filtered := True;

      if not DtmFinanceiro.CdsFinTitCxaLct.IsEmpty then
      begin
        DtmFinanceiro.CdsFinTitCxaLct.Edit;
        DtmFinanceiro.CdsFinTitCxaLct['NM_HISTORICO'] := DtmFinanceiro.CdsFinCxaTrnExt['NM_HISTORICO'];
        DtmFinanceiro.CdsFinTitCxaLct.Post;
        DtmFinanceiro.CdsFinTitCxaLct.ApplyUpdates(0);
      end;

    finally
      DtmFinanceiro.CdsFinTitCxaLct.Filter := '';
      DtmFinanceiro.CdsFinTitCxaLct.Filtered := False;
    end;

  end;
}

initialization
  RegisterClass(TMovFinCaixaMovimentar);

end.
