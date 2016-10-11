// -- Tarefa: 1602 ...
unit mFinCentroCustoDetalhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoMDI, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxCurrencyEdit, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxStatusBar, ExtCtrls, Menus, StdCtrls, cxButtons, DBClient, SqlExpr,
  cxNavigator;

type
  TMovFinCentroCustoDetalhe = class(TFrmPadraoMDI)
    PnlCabecalho: TPanel;
    GrdCentroCustoDetDBTableView1: TcxGridDBTableView;
    GrdCentroCustoDetLevel1: TcxGridLevel;
    GrdCentroCustoDet: TcxGrid;
    PnlTotais: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    EdtNM_CENTROCUSTO: TcxTextEdit;
    EdtNM_CONTA: TcxTextEdit;
    EdtCD_CENTROCUSTO: TcxButtonEdit;
    EdtCD_CONTA: TcxButtonEdit;
    GrdCentroCustoDetDBTableView1CD_CENTROCUSTODET: TcxGridDBColumn;
    GrdCentroCustoDetDBTableView1NR_SEQ: TcxGridDBColumn;
    GrdCentroCustoDetDBTableView1CD_CENTROCUSTO: TcxGridDBColumn;
    GrdCentroCustoDetDBTableView1NM_CENTROCUSTO: TcxGridDBColumn;
    GrdCentroCustoDetDBTableView1CD_CONTA: TcxGridDBColumn;
    GrdCentroCustoDetDBTableView1NM_CONTA: TcxGridDBColumn;
    GrdCentroCustoDetDBTableView1VL_LANCAMENTO: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    BtnConfirmar: TcxButton;
    BtnSair: TcxButton;
    EdtVL_LANCAMENTO: TcxCurrencyEdit;
    BtnLancar: TcxButton;
    PopCentroCusto: TPopupMenu;
    mniExcluir: TMenuItem;
    BtnCancelar: TcxButton;
    EdtVL_TOTAL: TcxCurrencyEdit;
    procedure EdtCD_CENTROCUSTOExit(Sender: TObject);
    procedure EdtCD_CENTROCUSTOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure EdtCD_CONTAExit(Sender: TObject);
    procedure EdtCD_CONTAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnLancarClick(Sender: TObject);
    procedure BtnNovoClik(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCdCentroCustoDet: Integer;
    FFLAutomatizar: String;
    FImportacao: Boolean;
  end;

var
  MovFinCentroCustoDetalhe: TMovFinCentroCustoDetalhe;

implementation

uses dDocumento, dPrincipal, qFinCentroCusto, qFinContactb, mFrtDocumentoNormal,
  mFrtDocumentoAdminist, mFrtDocumentoDespesa, mFrtDocumentoAbastecida,
  mFrtDocumentoManutencao, mFrtDocumentoPneuCons, mFrtDocumentoPneuRecape,
  mFrtDocumentoImportarNFE, dDocumentoNFe, dxRibbonSkins;

{$R *.dfm}

procedure TMovFinCentroCustoDetalhe.FormCreate(Sender: TObject);
var
  AConta,
  ACentroCusto: Boolean;

  procedure AbrirClients(AClientDataSet, AClientDataSetItem: TClientDataSet;
    ASqlDataSet, ASqlDataSetItem: TSQLDataSet);
  begin
    AClientDataSet.Close;
    AClientDataSet.Params.Clear;
    ASqlDataSet.ParamByName('CD_CENTROCUSTODET').AsInteger := FCdCentroCustoDet;
    AClientDataSet.Open;

    if FCdCentroCustoDet = 0 then
    begin
      FCdCentroCustoDet := DataTranspApp.AutoInc['CD_CENTROCUSTODET'];
      AClientDataSet.Append;
      AClientDataSet['CD_CENTROCUSTODET'] := FCdCentroCustoDet;
      AClientDataSet.Post;
    end
    else
    begin
      if FImportacao then
        FCdCentroCustoDet := DtmDocumentoNFe.CdsDocumentoItem['CD_CENTROCUSTODET']
      else
        FCdCentroCustoDet := DtmDocumento.CdsDocumentoItem['CD_CENTROCUSTODET'];
    end;

    AClientDataSetItem.Close;
    AClientDataSetItem.Params.Clear;
    ASqlDataSetItem.ParamByName('CD_CENTROCUSTODET').AsInteger := FCdCentroCustoDet;
    AClientDataSetItem.Open;
  end;

begin
  AConta       := False;
  ACentroCusto := False;

  if (Self.Owner is TMovFrtDocumentoImportarNFe) then
  begin
    FImportacao := True;
    GrdCentroCustoDetDBTableView1.DataController.DataSource := DtmDocumentoNFe.DsrCentroCustoDetItem;
  end
  else
  begin
    FImportacao := False;
    GrdCentroCustoDetDBTableView1.DataController.DataSource := DtmDocumento.DsrCentroCustoDetItem;
  end;

  EdtCD_CENTROCUSTO.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');
  EdtCD_CONTA.Properties.Buttons[0].Glyph.LoadFromResourceName(HInstance, 'LINK');

  BtnConfirmar.Glyph.LoadFromResourceName(HInstance, 'CONFIRMAR');
  BtnCancelar.Glyph.LoadFromResourceName(HInstance, 'CANCELAR');
  BtnSair.Glyph.LoadFromResourceName(HInstance, 'SAIR');
  BtnLancar.Glyph.LoadFromResourceName(HInstance, 'INCLUIR');

  if (DataTranspApp.ParamValues[0] <> Null) then
    FCdCentroCustoDet := DataTranspApp.ParamValues[0]
  else
    FCdCentroCustoDet := 0;

  if ((DataTranspApp.ParamValues[1] <> Null) and (DataTranspApp.ParamValues[1] <> 0)) then
  begin
    AConta := True;
    EdtCD_CONTA.EditValue := DataTranspApp.ParamValues[1];
  end;

  if ((DataTranspApp.ParamValues[2] <> Null) and (DataTranspApp.ParamValues[2] <> 0)) then
  begin
    ACentroCusto := True;
    EdtCD_CENTROCUSTO.EditValue := DataTranspApp.ParamValues[2];
  end;

  if FImportacao then
    AbrirClients(DtmDocumentoNFe.CdsCentroCustoDet, DtmDocumentoNFe.CdsCentroCustoDetItem,
      DtmDocumentoNFe.SqlCentroCustoDet, DtmDocumentoNFe.SqlCentroCustoDetItem)
  else
    AbrirClients(DtmDocumento.CdsCentroCustoDet, DtmDocumento.CdsCentroCustoDetItem,
      DtmDocumento.SqlCentroCustoDet, DtmDocumento.SqlCentroCustoDetItem);

  if FImportacao then
  begin
    EdtVL_LANCAMENTO.EditValue := DtmDocumentoNFe.CdsDocumentoItem['VL_TOTAL'];
    EdtVL_TOTAL.EditValue := DtmDocumentoNFe.CdsDocumentoItem['VL_TOTAL'];
  end
  else
  begin
    EdtVL_LANCAMENTO.EditValue := DtmDocumento.CdsDocumentoItem['VL_TOTAL'];
    EdtVL_TOTAL.EditValue := DtmDocumento.CdsDocumentoItem['VL_TOTAL'];
  end;

  if (DataTranspApp.ParamValues[3] = 'S') then
  begin
    FFLAutomatizar := DataTranspApp.ParamValues[3];
    if not AConta then             
    begin
      MessageBox(0, 'A conta padrão não está cadastrada para realizar o lançamento automático.', PChar(Self.Caption), MB_ICONINFORMATION or MB_OK);
      EdtCD_CONTAExit(Self);
      EdtCD_CENTROCUSTOExit(Self);
      Exit;
    end;

    if not ACentroCusto then
    begin
      MessageBox(0, 'O centro de custo padrão não está cadastrado para realizar o lançamento automático.', PChar(Self.Caption), MB_ICONINFORMATION or MB_OK);
      EdtCD_CONTAExit(Self);
      EdtCD_CENTROCUSTOExit(Self);
      Exit;
    end;
  end;

  EdtCD_CONTAExit(Self);
  EdtCD_CENTROCUSTOExit(Self);
end;

procedure TMovFinCentroCustoDetalhe.FormShow(Sender: TObject);
var
  AEdicao: boolean;
begin
  // -- tarefa 3530, erro encontrado na verificação do estado do cliente quando utilizado pela importação de NF-e (entradas) -- //
  // -- o clientdataset DtmDocumentoNFe.CdsDocumentoItem sempre esta em edição, por isso é verificado se ele está vazio para sugerir o centro -- //
  if FImportacao then
    AEdicao := not DtmDocumentoNFe.CdsCentroCustoDetItem.IsEmpty
  else
    AEdicao := DtmDocumento.CdsDocumentoItem.State = dsEdit;
  if ((EdtCD_CENTROCUSTO.Text <> EmptyStr) and (EdtCD_CONTA.Text <> EmptyStr) and
    (EdtVL_LANCAMENTO.Text <> EmptyStr) and (FFLAutomatizar = 'S') and
    not (AEdicao)) then  //Tarefa: 3469
      BtnLancarClick(Self);
end;

procedure TMovFinCentroCustoDetalhe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  // -- Controle do botão do centro de custos ...

  if (Self.Owner.Owner is TMovFrtDocumentoAdminist) then
    if (TMovFrtDocumentoAdminist(Self.Owner.Owner).BtnConfirmar.CanFocus) then
      TMovFrtDocumentoAdminist(Self.Owner.Owner).BtnConfirmar.SetFocus
    else TMovFrtDocumentoAdminist(Self.Owner.Owner).BtnCancelar.SetFocus;

  if (Self.Owner.Owner is TMovFrtDocumentoDespesa) then
    if (TMovFrtDocumentoDespesa(Self.Owner.Owner).BtnConfirmar.CanFocus) then
      TMovFrtDocumentoDespesa(Self.Owner.Owner).BtnConfirmar.SetFocus
    else TMovFrtDocumentoDespesa(Self.Owner.Owner).BtnCancelar.SetFocus;

  if (Self.Owner.Owner is TMovFrtDocumentoAbastecida) then
    if (TMovFrtDocumentoAbastecida(Self.Owner.Owner).BtnConfirmar.CanFocus) then
      TMovFrtDocumentoAbastecida(Self.Owner.Owner).BtnConfirmar.SetFocus
    else TMovFrtDocumentoAbastecida(Self.Owner.Owner).BtnCancelar.SetFocus;

  if (Self.Owner.Owner is TMovFrtDocumentoManutencao) then
    if (TMovFrtDocumentoManutencao(Self.Owner.Owner).BtnConfirmar.CanFocus) then
      TMovFrtDocumentoManutencao(Self.Owner.Owner).BtnConfirmar.SetFocus
    else TMovFrtDocumentoManutencao(Self.Owner.Owner).BtnCancelar.SetFocus;

  if (Self.Owner.Owner is TMovFrtDocumentoPneuCons) then
    if (TMovFrtDocumentoPneuCons(Self.Owner.Owner).BtnConfirmar.CanFocus) then
      TMovFrtDocumentoPneuCons(Self.Owner.Owner).BtnConfirmar.SetFocus
    else TMovFrtDocumentoPneuCons(Self.Owner.Owner).BtnCancelar.SetFocus;

  if (Self.Owner.Owner is TMovFrtDocumentoPneuRecape) then
    if (TMovFrtDocumentoPneuRecape(Self.Owner.Owner).BtnConfirmar.CanFocus) then
      TMovFrtDocumentoPneuRecape(Self.Owner.Owner).BtnConfirmar.SetFocus
    else TMovFrtDocumentoPneuRecape(Self.Owner.Owner).BtnCancelar.SetFocus;

  if FImportacao then
    TMovFrtDocumentoImportarNFe(Self.Owner).GrdItens.Enabled := True;

end;

procedure TMovFinCentroCustoDetalhe.mniExcluirClick(Sender: TObject);
begin
  if FImportacao then
  begin
    if not DtmDocumentoNFe.CdsCentroCustoDetItem.IsEmpty then
      DtmDocumentoNFe.CdsCentroCustoDetItem.Delete;
  end
  else
  begin
    if not DtmDocumento.CdsCentroCustoDetItem.IsEmpty then
      DtmDocumento.CdsCentroCustoDetItem.Delete;
  end;
end;

procedure TMovFinCentroCustoDetalhe.EdtCD_CENTROCUSTOExit(Sender: TObject);
begin
  if not DataTranspApp.CreateFormSeek(TConFinCentroCusto, Self, [EdtCD_CENTROCUSTO.EditValue],
    ['NM_CENTROCUSTO'], [EdtNM_CENTROCUSTO]) then
  begin
    EdtCD_CENTROCUSTO.Clear;
    EdtNM_CENTROCUSTO.Clear;
  end;
end;

procedure TMovFinCentroCustoDetalhe.EdtCD_CENTROCUSTOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinCentroCusto, Self, [EdtCD_CENTROCUSTO.EditValue],
  	[EdtCD_CENTROCUSTO]);
end;

procedure TMovFinCentroCustoDetalhe.EdtCD_CONTAExit(Sender: TObject);
begin
  if not DataTranspApp.CreateFormSeek(TConFinContactb, Self, [EdtCD_CONTA.EditValue],
    ['NM_CONTA'], [EdtNM_CONTA]) then
  begin
    EdtCD_CONTA.Clear;
    EdtNM_CONTA.Clear;
  end;
end;

procedure TMovFinCentroCustoDetalhe.EdtCD_CONTAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  DataTranspApp.CreateFormMdi(TConFinContactb, Self, [EdtCD_CONTA.EditValue],
  	[EdtCD_CONTA]);
end;

procedure TMovFinCentroCustoDetalhe.BtnNovoClik(Sender: TObject);
begin
  EdtCD_CENTROCUSTO.Clear;
  EdtNM_CENTROCUSTO.Clear;
  EdtCD_CONTA.Clear;
  EdtNM_CONTA.Clear;
  EdtVL_LANCAMENTO.Clear;
end;

procedure TMovFinCentroCustoDetalhe.BtnLancarClick(Sender: TObject);
var
  AKeyValues: variant;

  procedure Lancar(AClientDataSet: TClientDataSet);
  begin
    if not AClientDataSet.Locate('CD_CENTROCUSTO;CD_CONTA', AKeyValues, []) then
    begin

      AClientDataSet.Append;

      AClientDataSet['CD_CENTROCUSTODETITEM'] := DataTranspApp.AutoInc['CD_CENTROCUSTODETIT'];
      AClientDataSet['CD_CENTROCUSTODET']     := FCdCentroCustoDet;
      AClientDataSet['CD_CENTROCUSTO']        := EdtCD_CENTROCUSTO.EditValue;
      AClientDataSet['NM_CENTROCUSTO']        := EdtNM_CENTROCUSTO.Text;
      AClientDataSet['CD_CONTA']              := EdtCD_CONTA.EditValue;
      AClientDataSet['NM_CONTA']              := EdtNM_CONTA.Text;
      AClientDataSet['VL_LANCAMENTO']         := EdtVL_LANCAMENTO.EditValue;

      AClientDataSet.Post;
    end
    else
      Application.MessageBox(PWideChar('Este item já foi adicionado à este centro de custo'), PWideChar(Self.Caption), MB_ICONINFORMATION or MB_OK);
  end;

begin
  if ((EdtCD_CENTROCUSTO.Text <> EmptyStr) and (EdtNM_CONTA.Text <> EmptyStr) and
      (EdtVL_LANCAMENTO.Text <> EmptyStr)) then
  begin
    AKeyValues := VarArrayCreate([0,1], varVariant);
    AKeyValues[0] := EdtCD_CENTROCUSTO.EditValue;
    AKeyValues[1] := EdtCD_CONTA.EditValue;

    if FImportacao then
      Lancar(DtmDocumentoNFe.CdsCentroCustoDetItem)
    else
      Lancar(DtmDocumento.CdsCentroCustoDetItem);

    BtnNovoClik(Self);
    EdtCD_CENTROCUSTO.SetFocus;
  end
  else
  begin
    BtnNovoClik(Self);
    BtnConfirmar.SetFocus;
  end;
end;

procedure TMovFinCentroCustoDetalhe.BtnConfirmarClick(Sender: TObject);
var
  AVlTotal: Currency;
  ACdCodigo: Integer;

  procedure Confirmar(AClientDataSet, AClientDataSetPai: TClientDataSet);
  begin
    AClientDataSet.First;
    while not AClientDataSet.Eof do
    begin
      AVlTotal := AVlTotal + AClientDataSet.FieldByName('VL_LANCAMENTO').AsCurrency;

      AClientDataSet.Next;
    end;

    if FImportacao then
    begin
      if not AClientDataSet.IsEmpty then
        DtmDocumentoNFe.CdsDocumentoItem['CENTROCUSTO'] := 'S'
      else
        DtmDocumentoNFe.CdsDocumentoItem['CENTROCUSTO'] := 'N';
    end;

    // -- Tarefa: 2589 - Incluído o formatfloat no EdtVL_TOTAL ...
    if (FormatFloat('0.00', EdtVL_TOTAL.EditValue) = FormatFloat('0.00', AVlTotal)) then
    begin
      AClientDataSetPai.ApplyUpdates(0);
      AClientDataSet.ApplyUpdates(0);

      if FImportacao then
        DtmDocumentoNFe.CdsDocumentoItem['CD_CENTROCUSTODET'] := FCdCentroCustoDet
      else
        DtmDocumento.CdsDocumentoItem['CD_CENTROCUSTODET']    := FCdCentroCustoDet;

      Close;
    end
    else if AVlTotal <> 0 then
      MessageBox(0, 'Os valores não estão corretos. Verifique os lançamentos e corrija os valores lançados antes de confirmar.', '', MB_ICONINFORMATION or MB_OK)
    else
    begin
      if FImportacao then
        DtmDocumentoNFe.CdsDocumentoItem['CD_CENTROCUSTODET'] := Null
      else
        DtmDocumento.CdsDocumentoItem['CD_CENTROCUSTODET']    := Null;

      AClientDataSetPai.Delete;
      AClientDataSetPai.ApplyUpdates(0);

      Close;
    end;
  end;

begin
  AVlTotal := 0;

  if FImportacao then
    Confirmar(DtmDocumentoNFe.CdsCentroCustoDetItem, DtmDocumentoNFe.CdsCentroCustoDet)
  else
    Confirmar(DtmDocumento.CdsCentroCustoDetItem, DtmDocumento.CdsCentroCustoDet);
end;

procedure TMovFinCentroCustoDetalhe.BtnCancelarClick(Sender: TObject);

  procedure Cancelar(AClientDataSet, AClientDataSetPai: TClientDataSet; ASqlDataSet,
    ASqlDataSetPai: TSqlDataSet);
  begin
    AClientDataSetPai.Close;
    AClientDataSetPai.Params.Clear;
    ASqlDataSetPai.ParamByName('CD_CENTROCUSTODET').AsInteger := FCdCentroCustoDet;
    AClientDataSetPai.Open;

    AClientDataSetPai.Append;
    AClientDataSetPai['CD_CENTROCUSTODET'] := FCdCentroCustoDet;
    AClientDataSetPai.Post;

    AClientDataSet.Close;
    AClientDataSet.Params.Clear;
    ASqlDataSet.ParamByName('CD_CENTROCUSTODET').AsInteger := FCdCentroCustoDet;
    AClientDataSet.Open;

    EdtCD_CENTROCUSTO.Clear;
    EdtCD_CONTA.Clear;
    EdtVL_LANCAMENTO.Clear;
  end;

begin
  if FImportacao then
    Cancelar(DtmDocumentoNFe.CdsCentroCustoDetItem, DtmDocumentoNFe.CdsCentroCustoDet,
      DtmDocumentoNFe.SqlCentroCustoDetItem, DtmDocumentoNFe.SqlCentroCustoDet)
  else
    Cancelar(DtmDocumento.CdsCentroCustoDetItem, DtmDocumento.CdsCentroCustoDet,
      DtmDocumento.SqlCentroCustoDetItem, DtmDocumento.SqlCentroCustoDet);
end;

procedure TMovFinCentroCustoDetalhe.BtnSairClick(Sender: TObject);
begin
  Close;
end;

initialization
	RegisterClass(TMovFinCentroCustoDetalhe);

end.
