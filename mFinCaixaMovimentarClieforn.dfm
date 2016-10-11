inherited MovFinCaixaMovimentarClieforn: TMovFinCaixaMovimentarClieforn
  Caption = 'MovFinCaixaMovimentarClieforn'
  ClientHeight = 372
  ClientWidth = 694
  ExplicitWidth = 700
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 694
    Height = 346
    ExplicitWidth = 694
    ExplicitHeight = 346
    object PgcTitulo: TcxPageControl
      Left = 1
      Top = 111
      Width = 692
      Height = 234
      ActivePage = TabReceber
      Align = alClient
      Focusable = False
      TabOrder = 1
      ClientRectBottom = 234
      ClientRectRight = 692
      ClientRectTop = 24
      object TabReceber: TcxTabSheet
        Caption = 'Contas a Receber'
        ImageIndex = 0
        object GrdReceber: TcxGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 210
          Align = alClient
          TabOrder = 0
          object GrdReceberView: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DtmFinanceiro.DsrFinCxaRec
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = GrdReceberViewVL_SALDO
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = GrdReceberViewVL_LCTO_BAIXA
              end
              item
                Kind = skCount
                Column = GrdReceberViewCD_CONTA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhum t'#237'tulo para exibir>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.ContentEven = StyEven
            Styles.ContentOdd = StyOdd
            Styles.Inactive = StyInactive
            object GrdReceberViewCD_CONTA: TcxGridDBColumn
              Caption = 'Conta'
              DataBinding.FieldName = 'CD_CONTA'
              Options.Editing = False
              Width = 50
            end
            object GrdReceberViewSR_TITULO: TcxGridDBColumn
              Caption = 'S'#233'rie'
              DataBinding.FieldName = 'SR_TITULO'
              Options.Editing = False
              Width = 50
            end
            object GrdReceberViewNR_TITULO: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'NR_TITULO'
              Options.Editing = False
              Width = 75
            end
            object GrdReceberViewNR_PARCELA: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'NR_PARCELA'
              Options.Editing = False
              Width = 50
            end
            object GrdReceberViewDT_EMISSAO: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'DT_EMISSAO'
              Options.Editing = False
              Width = 85
            end
            object GrdReceberViewDT_VENCIMENTO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DT_VENCIMENTO'
              Options.Editing = False
              Width = 85
            end
            object GrdReceberViewVL_SALDO: TcxGridDBColumn
              Caption = 'Vlr.Saldo'
              DataBinding.FieldName = 'VL_SALDO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Options.Editing = False
              Width = 85
            end
            object GrdReceberViewVL_LCTO_BAIXA: TcxGridDBColumn
              Caption = 'Vlr.Baixa'
              DataBinding.FieldName = 'VL_LCTO_BAIXA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Options.Editing = False
              Width = 85
            end
            object GrdReceberViewFL_BAIXA: TcxGridDBColumn
              Caption = 'Baixar?'
              DataBinding.FieldName = 'FL_BAIXA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.FullFocusRect = True
              Properties.ImmediatePost = True
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              Properties.OnEditValueChanged = GrdReceberViewColumn9PropertiesEditValueChanged
              Options.Filtering = False
              Options.Sorting = False
              Width = 50
              OnHeaderClick = GrdReceberViewFL_BAIXAHeaderClick
            end
          end
          object GrdReceberLevel: TcxGridLevel
            GridView = GrdReceberView
          end
        end
      end
      object TabPagar: TcxTabSheet
        Caption = 'Contas a Pagar'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GrdPagar: TcxGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 210
          Align = alClient
          TabOrder = 0
          object GrdPagarView: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DtmFinanceiro.DsrFinCxaPag
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = GrdPagarViewVL_SALDO
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = GrdPagarViewVL_LCTO_BAIXA
              end
              item
                Kind = skCount
                Column = GrdPagarViewCD_CONTA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhum t'#237'tulo para exibir>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.ContentEven = StyEven
            Styles.ContentOdd = StyOdd
            Styles.Inactive = StyInactive
            object GrdPagarViewCD_CONTA: TcxGridDBColumn
              Caption = 'Conta'
              DataBinding.FieldName = 'CD_CONTA'
              Options.Editing = False
              Width = 50
            end
            object GrdPagarViewSR_TITULO: TcxGridDBColumn
              Caption = 'S'#233'rie'
              DataBinding.FieldName = 'SR_TITULO'
              Options.Editing = False
              Width = 50
            end
            object GrdPagarViewNR_TITULO: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'NR_TITULO'
              Options.Editing = False
              Width = 75
            end
            object GrdPagarViewNR_PARCELA: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'NR_PARCELA'
              Options.Editing = False
              Width = 50
            end
            object GrdPagarViewDT_EMISSAO: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'DT_EMISSAO'
              Options.Editing = False
              Width = 85
            end
            object GrdPagarViewDT_VENCIMENTO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DT_VENCIMENTO'
              Options.Editing = False
              Width = 85
            end
            object GrdPagarViewVL_SALDO: TcxGridDBColumn
              Caption = 'Vlr.Saldo'
              DataBinding.FieldName = 'VL_SALDO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Options.Editing = False
              Width = 85
            end
            object GrdPagarViewVL_LCTO_BAIXA: TcxGridDBColumn
              Caption = 'Vlr.Baixa'
              DataBinding.FieldName = 'VL_LCTO_BAIXA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Options.Editing = False
              Width = 85
            end
            object GrdPagarViewFL_BAIXA: TcxGridDBColumn
              Caption = 'Baixar?'
              DataBinding.FieldName = 'FL_BAIXA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.FullFocusRect = True
              Properties.ImmediatePost = True
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              Properties.OnEditValueChanged = GrdPagarViewFL_BAIXAPropertiesEditValueChanged
              Options.Filtering = False
              Options.Sorting = False
              Width = 50
              OnHeaderClick = GrdPagarViewFL_BAIXAHeaderClick
            end
          end
          object GrdPagarLevel: TcxGridLevel
            GridView = GrdPagarView
          end
        end
      end
    end
    object PnlFiltro: TPanel
      Left = 1
      Top = 1
      Width = 692
      Height = 110
      Align = alTop
      TabOrder = 0
      OnExit = BtnAtualizarClick
      object EdtCD_FILIAL_CXA: TcxTextEdit
        Left = 235
        Top = 10
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 0
        Visible = False
        Width = 16
      end
      object EdtDT_FECHAMENTO_CXA: TcxTextEdit
        Left = 250
        Top = 10
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 1
        Visible = False
        Width = 16
      end
      object EdtFL_DC_CXA: TcxTextEdit
        Left = 265
        Top = 10
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 2
        Visible = False
        Width = 16
      end
      object EdtCD_MOTORISTA: TcxTextEdit
        Left = 280
        Top = 10
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 3
        Visible = False
        Width = 16
      end
      object EdtCD_MOEDA_CXA: TcxTextEdit
        Left = 295
        Top = 10
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 4
        Visible = False
        Width = 16
      end
      object LblCD_CONTA: TcxLabel
        Left = 5
        Top = 10
        Caption = 'Conta Caixa:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object LblCD_CLIEFORN: TcxLabel
        Left = 5
        Top = 35
        Caption = 'Cliente / Fornecedor:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel2: TcxLabel
        Left = 5
        Top = 60
        Cursor = crHandPoint
        Caption = 'Conta Detalhe:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 5
        Top = 85
        Caption = 'Data de Movimento:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel1: TcxLabel
        Left = 465
        Top = 85
        Caption = 'Diferen'#231'a a Detalhar:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.IsFontAssigned = True
      end
      object EdtCD_CONTACXA: TcxButtonEdit
        Left = 125
        Top = 5
        Properties.Alignment.Horz = taRightJustify
        Properties.Buttons = <
          item
            Default = True
            Kind = bkGlyph
          end>
        Properties.ClickKey = 120
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.OnButtonClick = EdtCD_CONTACXAPropertiesButtonClick
        TabOrder = 10
        OnExit = EdtCD_CONTACXAExit
        Width = 101
      end
      object EdtNM_CONTACXA: TcxTextEdit
        Left = 230
        Top = 5
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 11
        Width = 456
      end
      object EdtCD_CLIEFORN: TcxButtonEdit
        Left = 125
        Top = 30
        Properties.Alignment.Horz = taRightJustify
        Properties.Buttons = <
          item
            Default = True
            Kind = bkGlyph
          end>
        Properties.ClickKey = 120
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.OnButtonClick = EdtCD_CLIEFORNPropertiesButtonClick
        TabOrder = 12
        OnExit = EdtCD_CLIEFORNExit
        Width = 101
      end
      object EdtNM_CLIEFORN: TcxTextEdit
        Left = 230
        Top = 30
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 13
        Width = 456
      end
      object EdtCD_CONTADET: TcxButtonEdit
        Left = 125
        Top = 55
        Properties.Alignment.Horz = taRightJustify
        Properties.Buttons = <
          item
            Default = True
            Kind = bkGlyph
          end>
        Properties.ClickKey = 120
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(-?\d+)'
        Properties.MaxLength = 0
        Properties.OnButtonClick = EdtCD_CONTADETPropertiesButtonClick
        TabOrder = 14
        OnExit = EdtCD_CONTADETExit
        Width = 101
      end
      object EdtNM_CONTADET: TcxTextEdit
        Left = 230
        Top = 55
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 15
        Width = 456
      end
      object EdtDT_MOVIMENTO: TcxDateEdit
        Left = 125
        Top = 80
        TabOrder = 16
        OnEnter = EdtDT_MOVIMENTOEnter
        Width = 101
      end
      object EdtVL_DIFERENCA: TcxCurrencyEdit
        Left = 585
        Top = 80
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.ReadOnly = True
        Style.Color = cl3DLight
        TabOrder = 17
        Width = 101
      end
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 346
    Width = 694
    Height = 26
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer7
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer8
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    ExplicitTop = 346
    ExplicitWidth = 694
    ExplicitHeight = 26
    object StatusBarContainer7: TdxStatusBarContainerControl
      Left = 2
      Top = 4
      Width = 98
      Height = 20
      object BtnConfirmar: TcxButton
        Left = 0
        Top = 0
        Width = 98
        Height = 20
        Align = alClient
        Caption = 'Confirmar'
        TabOrder = 0
        OnClick = BtnConfirmarClick
      end
    end
    object StatusBarContainer8: TdxStatusBarContainerControl
      Left = 106
      Top = 4
      Width = 98
      Height = 20
      object BtnCancelar: TcxButton
        Left = 0
        Top = 0
        Width = 98
        Height = 20
        Align = alClient
        Cancel = True
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = BtnCancelarClick
      end
    end
  end
  object StyCaixa: TcxStyleRepository
    Left = 25
    Top = 175
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
end
