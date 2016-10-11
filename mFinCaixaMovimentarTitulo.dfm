inherited MovFinCaixaMovimentarTitulo: TMovFinCaixaMovimentarTitulo
  Caption = 'MovFinCaixaMovimentarTitulo'
  ClientHeight = 332
  ClientWidth = 757
  ExplicitWidth = 763
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 757
    Height = 306
    ExplicitWidth = 757
    ExplicitHeight = 306
    object PgcTitulo: TcxPageControl
      Left = 1
      Top = 1
      Width = 755
      Height = 304
      Align = alClient
      Focusable = False
      TabOrder = 0
      Properties.ActivePage = TabSimples
      ClientRectBottom = 304
      ClientRectRight = 755
      ClientRectTop = 24
      object TabSimples: TcxTabSheet
        Caption = '&Simples'
        ImageIndex = 0
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
        object cxLabel24: TcxLabel
          Left = 5
          Top = 10
          Cursor = crHandPoint
          Caption = 'Conta T'#237'tulo:'
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
          Top = 60
          Caption = 'S'#233'rie / N'#186' / Parcela:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object cxLabel27: TcxLabel
          Left = 5
          Top = 260
          Caption = 'Valor Lan'#231'amento:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object cxLabel11: TcxLabel
          Left = 5
          Top = 235
          Caption = 'Hist'#243'rico:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object cxLabel7: TcxLabel
          Left = 5
          Top = 85
          Caption = 'Data de Emiss'#227'o:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object cxLabel8: TcxLabel
          Left = 5
          Top = 110
          Caption = 'Data de Vencimento:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object cxLabel1: TcxLabel
          Left = 5
          Top = 135
          Caption = 'Valor Nominal:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object cxLabel2: TcxLabel
          Left = 5
          Top = 160
          Caption = 'Valor Acr'#233'scimos:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object cxLabel4: TcxLabel
          Left = 5
          Top = 185
          Caption = 'Valor Descontos:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object cxLabel5: TcxLabel
          Left = 5
          Top = 210
          Caption = 'Valor Baixas:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object EdtCD_CONTATIT: TcxButtonEdit
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
          Properties.EditMask = '(-?\d+)'
          Properties.MaxLength = 0
          Properties.OnButtonClick = EdtCD_CONTATITPropertiesButtonClick
          TabOrder = 0
          OnExit = EdtCD_CONTATITExit
          Width = 101
        end
        object EdtNM_CONTATIT: TcxTextEdit
          Left = 230
          Top = 5
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 1
          Width = 456
        end
        object EdtCD_FILIAL_TIT: TcxTextEdit
          Left = 235
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 3
          Visible = False
          Width = 16
        end
        object EdtNR_TRANSACAO_TIT: TcxTextEdit
          Left = 250
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 4
          Visible = False
          Width = 16
        end
        object EdtVL_SALDO_TIT: TcxTextEdit
          Left = 265
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 5
          Visible = False
          Width = 16
        end
        object EdtFL_DC_TIT: TcxTextEdit
          Left = 280
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 6
          Visible = False
          Width = 16
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
          TabOrder = 10
          OnExit = EdtCD_CLIEFORNExit
          Width = 101
        end
        object EdtNM_CLIEFORN: TcxTextEdit
          Left = 230
          Top = 30
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 11
          Width = 456
        end
        object EdtSR_TITULO: TcxButtonEdit
          Left = 125
          Top = 55
          Properties.Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClickKey = 120
          Properties.MaxLength = 5
          Properties.OnButtonClick = EdtNR_PARCELAPropertiesButtonClick
          TabOrder = 13
          OnExit = EdtNR_PARCELAExit
          Width = 71
        end
        object EdtNR_TITULO: TcxButtonEdit
          Left = 200
          Top = 55
          Properties.Alignment.Horz = taRightJustify
          Properties.Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          Properties.ClickKey = 120
          Properties.MaxLength = 10
          Properties.OnButtonClick = EdtNR_PARCELAPropertiesButtonClick
          TabOrder = 14
          OnExit = EdtNR_PARCELAExit
          Width = 121
        end
        object EdtNR_PARCELA: TcxButtonEdit
          Left = 325
          Top = 55
          Properties.Alignment.Horz = taRightJustify
          Properties.Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          Properties.ClickKey = 120
          Properties.MaxLength = 4
          Properties.OnButtonClick = EdtNR_PARCELAPropertiesButtonClick
          TabOrder = 15
          OnExit = EdtNR_PARCELAExit
          Width = 51
        end
        object EdtDT_EMISSAO: TcxTextEdit
          Left = 125
          Top = 80
          TabStop = False
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 17
          Width = 121
        end
        object EdtDT_VENCIMENTO: TcxTextEdit
          Left = 125
          Top = 105
          TabStop = False
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 19
          Width = 121
        end
        object EdtVL_NOMINAL: TcxCurrencyEdit
          Left = 125
          Top = 130
          TabStop = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 21
          Width = 121
        end
        object EdtVL_ACRESCIMOS: TcxCurrencyEdit
          Left = 125
          Top = 155
          TabStop = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 23
          Width = 121
        end
        object EdtVL_DESCONTOS: TcxCurrencyEdit
          Left = 125
          Top = 180
          TabStop = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 25
          Width = 121
        end
        object EdtVL_BAIXA: TcxCurrencyEdit
          Left = 125
          Top = 205
          TabStop = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 27
          Width = 121
        end
        object EdtCD_HISTORICO: TcxButtonEdit
          Left = 125
          Top = 230
          Properties.Alignment.Horz = taLeftJustify
          Properties.Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClickKey = 120
          TabOrder = 29
          OnEnter = EdtCD_HISTORICOEnter
          OnExit = EdtCD_HISTORICOExit
          Width = 561
        end
        object EdtVL_LANCAMENTO: TcxCalcEdit
          Left = 125
          Top = 255
          EditValue = 0.000000000000000000
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '#,##0.00'
          TabOrder = 31
          OnEnter = EdtVL_LANCAMENTOEnter
          OnExit = EdtVL_LANCAMENTOExit
          Width = 121
        end
        object EdtTP_LANCAMENTO: TcxTextEdit
          Left = 295
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 7
          Visible = False
          Width = 16
        end
        object EdtFL_TITULO: TcxTextEdit
          Left = 310
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 8
          Visible = False
          Width = 16
        end
        object EdtFL_DC: TcxTextEdit
          Left = 325
          Top = 10
          TabStop = False
          Properties.ReadOnly = False
          Style.Color = cl3DLight
          TabOrder = 9
          Visible = False
          Width = 16
        end
        object EdtCD_MOEDA: TcxTextEdit
          Left = 340
          Top = 10
          TabStop = False
          Properties.ReadOnly = False
          Style.Color = cl3DLight
          TabOrder = 33
          Visible = False
          Width = 16
        end
        object EdtCD_HIST: TcxTextEdit
          Left = 157
          Top = 238
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 34
          Visible = False
          Width = 11
        end
      end
      object TabMultiplas: TcxTabSheet
        Caption = '&M'#250'ltiplas'
        ImageIndex = 1
        OnShow = TabMultiplasShow
        object Bevel1: TBevel
          Left = 0
          Top = 0
          Width = 755
          Height = 36
          Align = alTop
          Shape = bsSpacer
          ExplicitWidth = 592
        end
        object GrdConsulta: TcxGrid
          Left = 0
          Top = 36
          Width = 755
          Height = 244
          Align = alClient
          TabOrder = 10
          object GrdConsultaView: TcxGridDBTableView
            OnDblClick = BtnSelecionarClick
            DataController.DataSource = DtmFinanceiro.DsrFinTituloCxa
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skCount
                Position = spFooter
                Column = GrdConsultaDBTableView1CD_CLIEFORN
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdConsultaDBTableView1VL_SALDO
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdConsultaDBTableView1VL_LCTO_BAIXA
              end
              item
                Kind = skCount
                Column = GrdConsultaDBTableView1CD_CLIEFORN
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhum t'#237'tulo para exibir>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object GrdConsultaDBTableView1CD_FILIAL: TcxGridDBColumn
              Caption = 'Filial'
              DataBinding.FieldName = 'CD_FILIAL'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 33
            end
            object GrdConsultaDBTableView1NR_TRANSACAO: TcxGridDBColumn
              Caption = 'Transa'#231#227'o'
              DataBinding.FieldName = 'NR_TRANSACAO'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 61
            end
            object GrdConsultaDBTableView1CD_CONTA: TcxGridDBColumn
              Caption = 'Conta'
              DataBinding.FieldName = 'CD_CONTA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
            end
            object GrdConsultaDBTableView1CD_CLIEFORN: TcxGridDBColumn
              Caption = 'C'#243'd.'
              DataBinding.FieldName = 'CD_CLIEFORN'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 35
            end
            object GrdConsultaDBTableView1NR_NOSSO_NUMERO: TcxGridDBColumn
              Caption = 'Nosso N'#186
              DataBinding.FieldName = 'NR_NOSSO_NUMERO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 67
            end
            object GrdConsultaDBTableView1NM_FANTASIA: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'NM_FANTASIA'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 224
            end
            object GrdConsultaDBTableView1SR_TITULO: TcxGridDBColumn
              Caption = 'S'#233'rie'
              DataBinding.FieldName = 'SR_TITULO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 30
            end
            object GrdConsultaDBTableView1NR_TITULO: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'NR_TITULO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 49
            end
            object GrdConsultaDBTableView1NR_PARCELA: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'NR_PARCELA'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 24
            end
            object GrdConsultaDBTableView1CD_MOEDA: TcxGridDBColumn
              Caption = 'Moeda'
              DataBinding.FieldName = 'CD_MOEDA'
              Visible = False
            end
            object GrdConsultaDBTableView1DT_EMISSAO: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'DT_EMISSAO'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 65
            end
            object GrdConsultaDBTableView1DT_VENCIMENTO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DT_VENCIMENTO'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 62
            end
            object GrdConsultaDBTableView1VL_SALDO: TcxGridDBColumn
              Caption = 'Saldo'
              DataBinding.FieldName = 'VL_SALDO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 65
            end
            object GrdConsultaDBTableView1VL_LCTO_BAIXA: TcxGridDBColumn
              Caption = 'Baixa'
              DataBinding.FieldName = 'VL_LCTO_BAIXA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.OnEditValueChanged = GrdConsultaDBTableView1VL_LCTO_BAIXAPropertiesEditValueChanged
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 52
            end
            object GrdConsultaDBTableView1VL_LCTO_ACRES_DESCTO: TcxGridDBColumn
              Caption = 'Acr'#233'sc./Desc.'
              DataBinding.FieldName = 'VL_LCTO_ACRES_DESCTO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 65
            end
            object GrdConsultaDBTableView1FL_BAIXA: TcxGridDBColumn
              Caption = 'Sel'
              DataBinding.FieldName = 'FL_BAIXA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ImmediatePost = True
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Properties.OnEditValueChanged = GrdConsultaDBTableView1FL_BAIXAPropertiesEditValueChanged
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 21
              OnHeaderClick = GrdConsultaDBTableView1FL_BAIXAHeaderClick
            end
          end
          object GrdConsultaLevel: TcxGridLevel
            GridView = GrdConsultaView
          end
        end
        object cxLabel6: TcxLabel
          Left = 5
          Top = -5
          Cursor = crHandPoint
          Caption = 'Conta T'#237'tulo:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object EdtCD_CONTATIT2: TcxButtonEdit
          Left = 5
          Top = 10
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
          Properties.OnButtonClick = EdtCD_CONTATIT2PropertiesButtonClick
          TabOrder = 0
          OnExit = EdtCD_CONTATIT2Exit
          Width = 61
        end
        object EdtNM_CONTATIT2: TcxTextEdit
          Left = 70
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 1
          Width = 191
        end
        object LblCD_CLIEFORN2: TcxLabel
          Left = 265
          Top = -5
          Cursor = crHandPoint
          Caption = 'Cliente / Fornecedor:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object EdtCD_CLIEFORN2: TcxButtonEdit
          Left = 265
          Top = 10
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
          Properties.OnButtonClick = EdtCD_CLIEFORN2PropertiesButtonClick
          TabOrder = 2
          OnExit = EdtCD_CLIEFORN2Exit
          Width = 71
        end
        object EdtNM_CLIEFORN2: TcxTextEdit
          Left = 340
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 3
          Width = 241
        end
        object cxLabel10: TcxLabel
          Left = 585
          Top = -5
          Cursor = crHandPoint
          Caption = 'Data Vencto. M'#225'x.:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object EdtDT_LIMITE: TcxDateEdit
          Left = 585
          Top = 10
          Properties.ImmediatePost = True
          TabOrder = 4
          OnExit = EdtDT_LIMITEExit
          Width = 101
        end
        object EdtCD_FILIAL_TIT2: TcxTextEdit
          Left = 80
          Top = 15
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 5
          Visible = False
          Width = 16
        end
        object EdtFL_DC_TIT2: TcxTextEdit
          Left = 100
          Top = 15
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 6
          Visible = False
          Width = 16
        end
      end
      object TabFatura: TcxTabSheet
        Caption = 'Fa&tura'
        ImageIndex = 2
        OnShow = TabFaturaShow
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 755
          Height = 36
          Align = alTop
          Shape = bsSpacer
          ExplicitWidth = 592
        end
        object LblFatura: TcxLabel
          Left = 5
          Top = -5
          Cursor = crHandPoint
          Caption = 'Fatura:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object LblClieforn3: TcxLabel
          Left = 110
          Top = -5
          Cursor = crHandPoint
          Caption = 'Cliente:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
        end
        object EdtNR_FATURA: TcxButtonEdit
          Left = 5
          Top = 10
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
          Properties.OnButtonClick = EdtNR_FATURAPropertiesButtonClick
          TabOrder = 0
          OnExit = EdtNR_FATURAExit
          Width = 101
        end
        object EdtCD_FILIAL_TIT3: TcxTextEdit
          Left = 10
          Top = 15
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 3
          Visible = False
          Width = 16
        end
        object EdtFL_DC_TIT3: TcxTextEdit
          Left = 25
          Top = 15
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 4
          Visible = False
          Width = 16
        end
        object EdtCD_CLIEFORN3: TcxTextEdit
          Left = 110
          Top = 10
          TabStop = False
          Style.Color = clBtnFace
          TabOrder = 1
          Width = 71
        end
        object EdtNM_CLIEFORN3: TcxTextEdit
          Left = 185
          Top = 10
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 2
          Width = 501
        end
        object GrdTitFatura: TcxGrid
          Left = 0
          Top = 36
          Width = 755
          Height = 244
          Align = alClient
          TabOrder = 5
          object GrdTitFaturaView: TcxGridDBTableView
            DataController.DataSource = DtmFinanceiro.DsrFinTitFatura
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skCount
                Position = spFooter
                Column = GrdTitFaturaViewCD_CLIEFORN
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdTitFaturaViewVL_SALDO
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdTitFaturaViewVL_ACRESCIMOS
              end
              item
                Kind = skCount
                Column = GrdTitFaturaViewCD_CLIEFORN
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdTitFaturaViewVL_NOMINAL
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdTitFaturaViewVL_DESCONTOS
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdTitFaturaViewVL_LCTO_BAIXA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhuma fatura para exibir>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object GrdTitFaturaViewCD_FILIAL: TcxGridDBColumn
              Caption = 'Filial'
              DataBinding.FieldName = 'CD_FILIAL'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 32
            end
            object GrdTitFaturaViewNR_TRANSACAO: TcxGridDBColumn
              Caption = 'Transa'#231#227'o'
              DataBinding.FieldName = 'NR_TRANSACAO'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 34
            end
            object GrdTitFaturaViewCD_CONTA: TcxGridDBColumn
              Caption = 'Conta'
              DataBinding.FieldName = 'CD_CONTA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
            end
            object GrdTitFaturaViewCD_CLIEFORN: TcxGridDBColumn
              Caption = 'C'#243'd.'
              DataBinding.FieldName = 'CD_CLIEFORN'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 35
            end
            object GrdTitFaturaViewNR_NOSSO_NUMERO: TcxGridDBColumn
              Caption = 'Nosso N'#186
              DataBinding.FieldName = 'NR_NOSSO_NUMERO'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 40
            end
            object GrdTitFaturaViewNM_FANTASIA: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'NM_FANTASIA'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 103
            end
            object GrdTitFaturaViewSR_TITULO: TcxGridDBColumn
              Caption = 'S'#233'rie'
              DataBinding.FieldName = 'SR_TITULO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 29
            end
            object GrdTitFaturaViewNR_TITULO: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'NR_TITULO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 51
            end
            object GrdTitFaturaViewNR_PARCELA: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'NR_PARCELA'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 20
            end
            object GrdTitFaturaViewDT_EMISSAO: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'DT_EMISSAO'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 66
            end
            object GrdTitFaturaViewDT_VENCIMENTO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DT_VENCIMENTO'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 69
            end
            object GrdTitFaturaViewVL_NOMINAL: TcxGridDBColumn
              Caption = 'Inclus'#227'o'
              DataBinding.FieldName = 'VL_NOMINAL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Width = 60
            end
            object GrdTitFaturaViewVL_ACRESCIMOS: TcxGridDBColumn
              Caption = 'Acr'#233'scimos'
              DataBinding.FieldName = 'VL_ACRESCIMOS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Properties.OnEditValueChanged = GrdConsultaDBTableView1VL_LCTO_BAIXAPropertiesEditValueChanged
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 58
            end
            object GrdTitFaturaViewVL_DESCONTOS: TcxGridDBColumn
              Caption = 'Descontos'
              DataBinding.FieldName = 'VL_DESCONTOS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 58
            end
            object GrdTitFaturaViewVL_SALDO: TcxGridDBColumn
              Caption = 'Saldo'
              DataBinding.FieldName = 'VL_SALDO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 60
            end
            object GrdTitFaturaViewVL_LCTO_BAIXA: TcxGridDBColumn
              Caption = 'Baixa'
              DataBinding.FieldName = 'VL_LCTO_BAIXA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.OnEditValueChanged = GrdTitFaturaViewVL_LCTO_BAIXAPropertiesEditValueChanged
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 53
            end
            object GrdTitFaturaViewFL_BAIXA: TcxGridDBColumn
              Caption = 'Sel'
              DataBinding.FieldName = 'FL_BAIXA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ImmediatePost = True
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Properties.OnEditValueChanged = GrdTitFaturaViewFL_BAIXAPropertiesEditValueChanged
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 20
              OnHeaderClick = GrdTitFaturaViewFL_BAIXAHeaderClick
            end
            object GrdTitFaturaViewCD_MOEDA: TcxGridDBColumn
              Caption = 'Moeda'
              DataBinding.FieldName = 'CD_MOEDA'
              Visible = False
            end
          end
          object GrdTitFaturaLevel: TcxGridLevel
            GridView = GrdTitFaturaView
          end
        end
        object EdtCD_MOEDA_TIT3: TcxTextEdit
          Left = 40
          Top = 15
          TabStop = False
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          TabOrder = 8
          Visible = False
          Width = 16
        end
      end
      object TabCartaFrete: TcxTabSheet
        Caption = 'Carta Frete'
        ImageIndex = 3
        OnShow = TabCartaFreteShow
        object cxbu: TBevel
          Left = 0
          Top = 0
          Width = 755
          Height = 42
          Align = alTop
          Shape = bsSpacer
          ExplicitWidth = 692
        end
        object EdtNR_CONHEC: TcxButtonEdit
          Left = 108
          Top = 18
          Properties.Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClickKey = 120
          Properties.OnButtonClick = EdtNR_CONHECPropertiesButtonClick
          TabOrder = 1
          OnExit = EdtNR_CONHECExit
          Width = 98
        end
        object GrdFinCartaFrete: TcxGrid
          Left = 0
          Top = 42
          Width = 755
          Height = 238
          Align = alClient
          TabOrder = 2
          TabStop = False
          object GrdFinCartaFreteView: TcxGridDBTableView
            DataController.DataSource = DtmFinanceiro.DsrCartaFreteCTRCGrid
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
                Column = GrdFinCartaFreteVL_SALDO
              end
              item
                Kind = skSum
                Position = spFooter
                Column = GrdFinCartaFreteVL_BAIXA
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdFinCartaFreteVL_SALDO
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = GrdFinCartaFreteVL_BAIXA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhum CTRC para exibir>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object GrdFinCartaFreteSR_TITULO: TcxGridDBColumn
              Caption = 'S'#233'rie'
              DataBinding.FieldName = 'SR_TITULO'
              Options.Editing = False
              Options.Moving = False
              Width = 49
            end
            object GrdFinCartaFreteNR_TITULO: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'NR_TITULO'
              Options.Editing = False
              Options.Moving = False
              Width = 47
            end
            object GrdFinCartaFreteCD_MOEDA: TcxGridDBColumn
              Caption = 'Moeda'
              DataBinding.FieldName = 'CD_MOEDA'
              Visible = False
              Options.Editing = False
              Options.Moving = False
            end
            object GrdFinCartaFreteNR_PARCELA: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'NR_PARCELA'
              Options.Editing = False
              Options.Moving = False
              Width = 38
            end
            object GrdFinCartaFreteDT_EMISSAO: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'DT_EMISSAO'
              Options.Editing = False
              Options.Moving = False
              Width = 74
            end
            object GrdFinCartaFreteDT_VENCIMENTO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DT_VENCIMENTO'
              Options.Editing = False
              Options.Moving = False
              Width = 80
            end
            object GrdFinCartaFreteViewColumn1: TcxGridDBColumn
              Caption = 'Nominal'
              DataBinding.FieldName = 'VL_NOMINAL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
            end
            object GrdFinCartaFreteVL_SALDO: TcxGridDBColumn
              Caption = 'Saldo'
              DataBinding.FieldName = 'VL_SALDO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Options.Editing = False
              Options.Moving = False
              Width = 69
            end
            object GrdFinCartaFreteVL_BAIXA: TcxGridDBColumn
              Caption = 'Baixa'
              DataBinding.FieldName = 'VL_BAIXA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.OnEditValueChanged = GrdFinCartaFreteVL_BAIXAPropertiesEditValueChanged
              Options.Moving = False
              Width = 84
            end
            object GrdFinCartaFreteFL_SELECIONADO: TcxGridDBColumn
              Caption = 'Selec.'
              DataBinding.FieldName = 'FL_SELECIONADO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Properties.OnEditValueChanged = GrdFinCartaFreteFL_SELECIONADOPropertiesEditValueChanged
              Options.Moving = False
              Width = 37
              OnHeaderClick = GrdFinCartaFreteFL_SELECIONADOHeaderClick
            end
          end
          object GrdFinCartaFreteLevel: TcxGridLevel
            GridView = GrdFinCartaFreteView
          end
        end
        object EdtSR_CONHEC: TcxButtonEdit
          Left = 4
          Top = 18
          Properties.Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClickKey = 120
          Properties.OnButtonClick = EdtSR_CONHECPropertiesButtonClick
          TabOrder = 0
          OnExit = EdtSR_CONHECExit
          Width = 98
        end
        object Label2: TcxLabel
          Left = 4
          Top = 3
          Caption = 'Tipo do CT:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object cxLabel115: TcxLabel
          Left = 105
          Top = 3
          Caption = 'N'#186' do CT:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
      end
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 306
    Width = 757
    Height = 26
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer1
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer2
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    ExplicitTop = 306
    ExplicitWidth = 757
    ExplicitHeight = 26
    object StatusBarContainer1: TdxStatusBarContainerControl
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
    object StatusBarContainer2: TdxStatusBarContainerControl
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
end
