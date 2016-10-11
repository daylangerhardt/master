inherited MovFinCaixaMovimentar: TMovFinCaixaMovimentar
  Left = 273
  Top = 105
  Caption = 'MovFinCaixaMovimentar'
  ClientHeight = 372
  ClientWidth = 844
  OnDestroy = FormDestroy
  ExplicitWidth = 850
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 729
    Height = 372
    ExplicitWidth = 729
    ExplicitHeight = 372
    object Bevel1: TBevel
      Left = 1
      Top = 1
      Width = 727
      Height = 45
      Align = alTop
      Shape = bsBottomLine
      ExplicitWidth = 766
    end
    object GrdFinCxaTrn: TcxGrid
      Left = 5
      Top = 50
      Width = 716
      Height = 316
      TabOrder = 11
      TabStop = False
      object GrdFinCxaTrnView: TcxGridDBTableView
        PopupMenu = PopFinCxaTrn
        DataController.DataSource = DtmFinanceiro.DsrFinCxaTrnExt
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#,##0.00'
            Kind = skSum
            Column = GrdFinCxaTrnViewColumn5
          end
          item
            Format = '#,##0.00'
            Kind = skSum
            Column = GrdFinCxaTrnViewColumn6
          end
          item
            Format = '#0'
            Kind = skCount
            Column = GrdFinCxaTrnViewColumn1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhum lan'#231'amento para exibir>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupRowHeight = 19
        OptionsView.GroupRowStyle = grsOffice11
        Styles.ContentEven = StyEven
        Styles.ContentOdd = StyOdd
        Styles.Inactive = StyInactive
        object GrdFinCxaTrnViewColumn1: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'FL_LANCAMENTO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.Items = <
            item
              Description = 'Caixa'
              ImageIndex = 0
              Value = '1'
            end
            item
              Description = 'Detalhe'
              Value = '2'
            end
            item
              Description = 'T'#237'tulo'
              Value = '3'
            end>
          Properties.ReadOnly = True
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 50
        end
        object GrdFinCxaTrnViewColumn2: TcxGridDBColumn
          Caption = 'Conta'
          DataBinding.FieldName = 'NM_CONTA'
          PropertiesClassName = 'TcxLabelProperties'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 200
        end
        object GrdFinCxaTrnViewColumn3: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'NR_DOCUMENTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 85
        end
        object GrdFinCxaTrnViewColumn4: TcxGridDBColumn
          Caption = 'Hist'#243'rico'
          DataBinding.FieldName = 'NM_HISTORICO'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 300
        end
        object GrdFinCxaTrnViewColumn5: TcxGridDBColumn
          Caption = 'D'#233'bito'
          DataBinding.FieldName = 'VL_LANCAMENTO_D'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Styles.Content = StySaida
          Width = 75
        end
        object GrdFinCxaTrnViewColumn6: TcxGridDBColumn
          Caption = 'Cr'#233'dito'
          DataBinding.FieldName = 'VL_LANCAMENTO_C'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Styles.Content = StyEntrada
          Width = 75
        end
      end
      object GrdFinCxaTrnLevel: TcxGridLevel
        GridView = GrdFinCxaTrnView
      end
    end
    object cxLabel1: TcxLabel
      Left = 5
      Top = 5
      Caption = 'Filial (Controle):'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel2: TcxLabel
      Left = 305
      Top = 5
      Caption = 'N'#186' da Transa'#231#227'o:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel14: TcxLabel
      Left = 410
      Top = 5
      Caption = 'Data de Movimento:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel9: TcxLabel
      Left = 515
      Top = 5
      Caption = 'Tipo da Transa'#231#227'o:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel10: TcxLabel
      Left = 620
      Top = 5
      Caption = 'Valor da Transa'#231#227'o:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object EdtCD_FILIAL: TcxDBButtonEdit
      Left = 5
      Top = 20
      DataBinding.DataField = 'CD_FILIAL'
      DataBinding.DataSource = DtmFinanceiro.DsrFinCxaTrn
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
        end>
      Properties.ClickKey = 120
      Properties.OnButtonClick = EdtCD_FILIALPropertiesButtonClick
      TabOrder = 0
      OnEnter = EdtCD_FILIALEnter
      OnExit = EdtCD_FILIALExit
      Width = 51
    end
    object EdtNM_FILIAL: TcxTextEdit
      Left = 60
      Top = 20
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 1
      Width = 241
    end
    object EdtNR_TRANSACAO: TcxDBButtonEdit
      Left = 305
      Top = 20
      DataBinding.DataField = 'NR_TRANSACAO'
      DataBinding.DataSource = DtmFinanceiro.DsrFinCxaTrn
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
        end>
      Properties.ClickKey = 120
      Properties.OnButtonClick = EdtNR_TRANSACAOPropertiesButtonClick
      TabOrder = 2
      OnExit = EdtNR_TRANSACAOExit
      Width = 101
    end
    object EdtFL_DC: TcxDBImageComboBox
      Left = 515
      Top = 20
      DataBinding.DataField = 'FL_DC'
      DataBinding.DataSource = DtmFinanceiro.DsrFinCxaTrn
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = '1 - Sa'#237'da'
          ImageIndex = 0
          Value = 'C'
        end
        item
          Description = '2 - Entrada'
          Value = 'D'
        end>
      Style.Color = clWindow
      TabOrder = 4
      Width = 101
    end
    object EdtDT_TRANSACAO: TcxDBDateEdit
      Left = 410
      Top = 20
      DataBinding.DataField = 'DT_TRANSACAO'
      DataBinding.DataSource = DtmFinanceiro.DsrFinCxaTrn
      TabOrder = 3
      OnExit = EdtDT_TRANSACAOExit
      Width = 101
    end
    object EdtVL_TRANSACAO: TcxDBCurrencyEdit
      Left = 620
      Top = 20
      TabStop = False
      DataBinding.DataField = 'VL_TRANSACAO'
      DataBinding.DataSource = DtmFinanceiro.DsrFinCxaTrn
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 5
      Width = 101
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 372
    Width = 844
    Height = 0
    ExplicitTop = 372
    ExplicitWidth = 844
    ExplicitHeight = 0
  end
  object Panel2: TPanel
    Left = 729
    Top = 0
    Width = 115
    Height = 372
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 2
    object BtnConfirmar: TcxButton
      Left = 10
      Top = 100
      Width = 96
      Height = 26
      Caption = 'Salvar (F2)'
      TabOrder = 3
      OnClick = BtnConfirmarClick
    end
    object BtnExcluirTrn: TcxButton
      Left = 10
      Top = 190
      Width = 96
      Height = 26
      Caption = 'Excluir Trn. (F4)'
      TabOrder = 6
      OnClick = BtnExcluirTrnClick
    end
    object BtnSair: TcxButton
      Left = 10
      Top = 220
      Width = 96
      Height = 26
      Cancel = True
      Caption = 'Sair'
      TabOrder = 7
      OnClick = BtnSairClick
    end
    object BtnMovimentarCaixa: TcxButton
      Left = 10
      Top = 10
      Width = 96
      Height = 26
      Caption = 'Caixa (F6)'
      TabOrder = 0
      OnClick = BtnMovimentarCaixaClick
    end
    object BtnMovimentarTitulo: TcxButton
      Left = 10
      Top = 40
      Width = 96
      Height = 26
      Caption = 'T'#237'tulo (F7)'
      TabOrder = 1
      OnClick = BtnMovimentarTituloClick
    end
    object BtnMovimentarDetalhe: TcxButton
      Left = 10
      Top = 70
      Width = 96
      Height = 26
      Caption = 'Detalhe (F8)'
      TabOrder = 2
      OnClick = BtnMovimentarDetalheClick
    end
    object cxLabel16: TcxLabel
      Left = 9
      Top = 327
      Caption = 'Diferen'#231'a '#224' Lan'#231'ar:'
      Style.TextColor = clBlue
    end
    object BtnExcluirLct: TcxButton
      Left = 10
      Top = 160
      Width = 96
      Height = 26
      Caption = 'Excluir Lct. (F3)'
      TabOrder = 5
      OnClick = BtnExcluirLctClick
    end
    object EdtVL_DIFERENCA: TcxCurrencyEdit
      Left = 5
      Top = 342
      TabStop = False
      Properties.Alignment.Horz = taCenter
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.ReadOnly = True
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clMenuBar
      TabOrder = 9
      Width = 106
    end
    object BtnConciliar: TcxButton
      Left = 10
      Top = 130
      Width = 96
      Height = 26
      Caption = 'Salvar/Conc.'
      TabOrder = 4
      OnClick = BtnConciliarClick
    end
    object EdtDT_CONCILIADO: TcxDateEdit
      Left = 11
      Top = 141
      TabOrder = 10
      Visible = False
      Width = 10
    end
  end
  object EdtDT_ULT_FECHAMENTO: TcxTextEdit
    Left = 749
    Top = 141
    TabStop = False
    Properties.ReadOnly = True
    Style.Color = cl3DLight
    TabOrder = 3
    Visible = False
    Width = 10
  end
  object StyCaixa: TcxStyleRepository
    Left = 500
    Top = 150
    PixelsPerInch = 96
    object StyEntrada: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object StySaida: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clRed
    end
    object StyEven: TcxStyle
      AssignedValues = [svColor]
      Color = 16378331
    end
    object StyOdd: TcxStyle
      AssignedValues = [svColor]
      Color = 15979198
    end
    object StyInactive: TcxStyle
      AssignedValues = [svColor]
      Color = cl3DLight
    end
  end
  object PopFinCxaTrn: TPopupMenu
    Left = 500
    Top = 100
    object BtnSalvarTransacao: TMenuItem
      Caption = 'Salvar Transa'#231#227'o'
      ShortCut = 113
      OnClick = BtnConfirmarClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object BtnIncluirLancamentoCaixa: TMenuItem
      Caption = 'Incluir Lan'#231'amento Caixa'
      ShortCut = 117
      OnClick = BtnMovimentarCaixaClick
    end
    object BtnIncluirLancamentoTitulo: TMenuItem
      Caption = 'Incluir Lan'#231'amento T'#237'tulo'
      ShortCut = 118
      OnClick = BtnMovimentarTituloClick
    end
    object BtnIncluirLancamentoDetalhe: TMenuItem
      Caption = 'Incluir Lan'#231'amento Detalhe'
      ShortCut = 119
      OnClick = BtnMovimentarDetalheClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object BtnAlterarLancamento: TMenuItem
      Caption = 'Alterar Hist'#243'rico'
      ShortCut = 116
      OnClick = BtnAlterarLancamentoClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object BtnExcluirLancamento: TMenuItem
      Caption = 'Excluir Lan'#231'amento'
      ShortCut = 114
      OnClick = BtnExcluirLctClick
    end
    object ExcluirTrn1: TMenuItem
      Caption = 'Excluir Transa'#231#227'o '
      ShortCut = 115
    end
  end
end
