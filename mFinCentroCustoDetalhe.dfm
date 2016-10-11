inherited MovFinCentroCustoDetalhe: TMovFinCentroCustoDetalhe
  BorderIcons = [biSystemMenu]
  Caption = 'MovFinCentroCustoDetalhe'
  ClientHeight = 338
  ClientWidth = 602
  Position = poDesktopCenter
  OnShow = FormShow
  ExplicitWidth = 608
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 602
    Height = 324
    ExplicitWidth = 602
    ExplicitHeight = 324
    object PnlCabecalho: TPanel
      Left = 1
      Top = 1
      Width = 600
      Height = 55
      Align = alTop
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = 10
        Top = 10
        Caption = 'Centro de Custo'
        Style.TextColor = clMaroon
      end
      object cxLabel2: TcxLabel
        Left = 220
        Top = 10
        Caption = 'Conta'
        Style.TextColor = clMaroon
      end
      object cxLabel3: TcxLabel
        Left = 430
        Top = 10
        Caption = 'Valor'
        Style.TextColor = clMaroon
      end
      object EdtNM_CENTROCUSTO: TcxTextEdit
        Left = 88
        Top = 25
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 5
        Width = 128
      end
      object EdtNM_CONTA: TcxTextEdit
        Left = 298
        Top = 25
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 6
        Width = 128
      end
      object EdtCD_CENTROCUSTO: TcxButtonEdit
        Left = 10
        Top = 25
        Properties.Buttons = <
          item
            Default = True
            Kind = bkGlyph
          end>
        Properties.CharCase = ecUpperCase
        Properties.ClickKey = 120
        Properties.OnButtonClick = EdtCD_CENTROCUSTOPropertiesButtonClick
        TabOrder = 0
        OnExit = EdtCD_CENTROCUSTOExit
        Width = 76
      end
      object EdtCD_CONTA: TcxButtonEdit
        Left = 220
        Top = 25
        Properties.Buttons = <
          item
            Default = True
            Kind = bkGlyph
          end>
        Properties.CharCase = ecUpperCase
        Properties.ClickKey = 120
        Properties.OnButtonClick = EdtCD_CONTAPropertiesButtonClick
        TabOrder = 1
        OnExit = EdtCD_CONTAExit
        Width = 76
      end
      object EdtVL_LANCAMENTO: TcxCurrencyEdit
        Left = 430
        Top = 25
        Properties.DisplayFormat = '#,0.00'
        TabOrder = 7
        Width = 96
      end
      object BtnLancar: TcxButton
        Left = 530
        Top = 22
        Width = 66
        Height = 26
        Caption = 'Lan'#231'ar'
        LookAndFeel.NativeStyle = True
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        OnClick = BtnLancarClick
      end
    end
    object GrdCentroCustoDet: TcxGrid
      Left = 1
      Top = 56
      Width = 600
      Height = 223
      Align = alClient
      TabOrder = 1
      TabStop = False
      object GrdCentroCustoDetDBTableView1: TcxGridDBTableView
        PopupMenu = PopCentroCusto
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '#,0.00'
            Position = spFooter
            Column = GrdCentroCustoDetDBTableView1VL_LANCAMENTO
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#,0.00'
            Kind = skSum
            Column = GrdCentroCustoDetDBTableView1VL_LANCAMENTO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object GrdCentroCustoDetDBTableView1CD_CENTROCUSTODET: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'CD_CENTROCUSTODET'
          Visible = False
        end
        object GrdCentroCustoDetDBTableView1NR_SEQ: TcxGridDBColumn
          Caption = 'Sequ'#234'ncia'
          DataBinding.FieldName = 'NR_SEQ'
          Visible = False
        end
        object GrdCentroCustoDetDBTableView1CD_CENTROCUSTO: TcxGridDBColumn
          Caption = 'C'#243'digo Centro Custo'
          DataBinding.FieldName = 'CD_CENTROCUSTO'
          Visible = False
        end
        object GrdCentroCustoDetDBTableView1NM_CENTROCUSTO: TcxGridDBColumn
          Caption = 'Centro de Custo'
          DataBinding.FieldName = 'NM_CENTROCUSTO'
          Options.Editing = False
          Options.Sorting = False
          Width = 240
        end
        object GrdCentroCustoDetDBTableView1CD_CONTA: TcxGridDBColumn
          Caption = 'C'#243'digo da Conta'
          DataBinding.FieldName = 'CD_CONTA'
          Visible = False
        end
        object GrdCentroCustoDetDBTableView1NM_CONTA: TcxGridDBColumn
          Caption = 'Conta'
          DataBinding.FieldName = 'NM_CONTA'
          Options.Editing = False
          Options.Sorting = False
          Width = 213
        end
        object GrdCentroCustoDetDBTableView1VL_LANCAMENTO: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VL_LANCAMENTO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,0.00'
          Options.Editing = False
          Options.Sorting = False
          Width = 105
        end
      end
      object GrdCentroCustoDetLevel1: TcxGridLevel
        GridView = GrdCentroCustoDetDBTableView1
      end
    end
    object PnlTotais: TPanel
      Left = 1
      Top = 279
      Width = 600
      Height = 44
      Align = alBottom
      TabOrder = 2
      object cxLabel4: TcxLabel
        Left = 375
        Top = 15
        Caption = 'Vlr. Total Item:'
        Style.TextColor = clWindowText
      end
      object BtnConfirmar: TcxButton
        Left = 6
        Top = 7
        Width = 97
        Height = 26
        Caption = 'Confirmar'
        LookAndFeel.NativeStyle = True
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = BtnConfirmarClick
      end
      object BtnSair: TcxButton
        Left = 210
        Top = 7
        Width = 97
        Height = 26
        Cancel = True
        Caption = 'Sair'
        LookAndFeel.NativeStyle = True
        ModalResult = 3
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = BtnSairClick
      end
      object BtnCancelar: TcxButton
        Left = 108
        Top = 7
        Width = 97
        Height = 26
        Cancel = True
        Caption = 'Cancelar'
        LookAndFeel.NativeStyle = True
        ModalResult = 2
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = BtnCancelarClick
      end
      object EdtVL_TOTAL: TcxCurrencyEdit
        Left = 455
        Top = 10
        Properties.DisplayFormat = '#,0.00'
        TabOrder = 4
        Width = 101
      end
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 324
    Width = 602
    Height = 14
    ExplicitTop = 324
    ExplicitWidth = 602
    ExplicitHeight = 14
  end
  object PopCentroCusto: TPopupMenu
    Left = 60
    Top = 125
    object mniExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = mniExcluirClick
    end
  end
end
