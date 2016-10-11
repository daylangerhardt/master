inherited MovFinCaixaMovimentarCaixa: TMovFinCaixaMovimentarCaixa
  Caption = 'MovFinCaixaMovimentarCaixa'
  ClientHeight = 407
  ClientWidth = 594
  ExplicitWidth = 600
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 594
    Height = 381
    ExplicitWidth = 594
    ExplicitHeight = 381
    object EdtFL_CHEQUE: TcxTextEdit
      Left = 235
      Top = 35
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 7
      Visible = False
      Width = 16
    end
    object EdtFL_TITULO: TcxTextEdit
      Left = 250
      Top = 35
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 8
      Visible = False
      Width = 16
    end
    object EdtCD_FILIAL_CXA: TcxTextEdit
      Left = 235
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 2
      Visible = False
      Width = 16
    end
    object EdtDT_FECHAMENTO_CXA: TcxTextEdit
      Left = 250
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 3
      Visible = False
      Width = 16
    end
    object EdtFL_DC_CXA: TcxTextEdit
      Left = 265
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 4
      Visible = False
      Width = 16
    end
    object EdtCD_MOTORISTA: TcxTextEdit
      Left = 280
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 15
      Visible = False
      Width = 16
    end
    object EdtCD_MOEDA_CXA: TcxTextEdit
      Left = 295
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 24
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
    object cxLabel15: TcxLabel
      Left = 5
      Top = 35
      Caption = 'Tipo da Opera'#231#227'o:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object LblNR_DOCUMENTO: TcxLabel
      Left = 5
      Top = 60
      Caption = 'S'#233'rie / Documento:'
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
      Top = 85
      Caption = 'Hist'#243'rico:'
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
      Top = 160
      Caption = 'Valor Lan'#231'amento:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
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
      TabOrder = 0
      OnExit = EdtCD_CONTACXAExit
      Width = 101
    end
    object EdtNM_CONTACXA: TcxTextEdit
      Left = 230
      Top = 5
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 1
      Width = 361
    end
    object EdtTP_LANCAMENTO: TcxButtonEdit
      Left = 125
      Top = 30
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClickKey = 120
      Properties.MaxLength = 2
      Properties.OnButtonClick = EdtTP_LANCAMENTOPropertiesButtonClick
      TabOrder = 5
      OnExit = EdtTP_LANCAMENTOExit
      Width = 101
    end
    object EdtNM_LANCAMENTO: TcxTextEdit
      Left = 230
      Top = 30
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 6
      Width = 361
    end
    object EdtSR_DOCUMENTO: TcxButtonEdit
      Left = 125
      Top = 55
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
          Visible = False
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClickKey = 120
      Properties.MaxLength = 5
      TabOrder = 9
      Width = 71
    end
    object EdtNR_DOCUMENTO: TcxButtonEdit
      Left = 200
      Top = 55
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
          Visible = False
        end>
      Properties.ClickKey = 120
      Properties.MaxLength = 10
      TabOrder = 10
      OnExit = EdtNR_DOCUMENTOExit
      Width = 121
    end
    object EdtCD_HISTORICO: TcxButtonEdit
      Left = 125
      Top = 80
      Properties.Alignment.Horz = taLeftJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClickKey = 120
      Properties.OnButtonClick = EdtCD_HISTORICOPropertiesButtonClick
      TabOrder = 11
      OnEnter = EdtCD_HISTORICOEnter
      OnExit = EdtCD_HISTORICOExit
      Width = 466
    end
    object EdtVL_LANCAMENTO: TcxCalcEdit
      Left = 125
      Top = 155
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,##0.00'
      TabOrder = 14
      OnEnter = EdtVL_LANCAMENTOEnter
      OnExit = EdtVL_LANCAMENTOExit
      Width = 121
    end
    object PnlCheque: TPanel
      Left = 5
      Top = 180
      Width = 586
      Height = 196
      BevelOuter = bvNone
      TabOrder = 16
      object cxLabel1: TcxLabel
        Left = 0
        Top = 155
        Caption = 'Emiss'#227'o:'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMaroon
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 0
        Top = 130
        Caption = 'Pra'#231'a:'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMaroon
        Style.IsFontAssigned = True
      end
      object cxLabel5: TcxLabel
        Left = 0
        Top = 180
        Caption = 'Bom Para:'
        Enabled = False
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
        Left = 0
        Top = 80
        Caption = 'N'#186' do Cheque:'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMaroon
        Style.IsFontAssigned = True
      end
      object cxLabel2: TcxLabel
        Left = 0
        Top = 30
        Caption = 'Valor por Extenso 2:'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.IsFontAssigned = True
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 105
        Caption = 'Nominal '#224':'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMaroon
        Style.IsFontAssigned = True
      end
      object cxLabel8: TcxLabel
        Left = 0
        Top = 5
        Caption = 'Valor por Extenso 1:'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.IsFontAssigned = True
      end
      object LblNR_CONTA: TcxLabel
        Left = 0
        Top = 55
        Caption = 'Banco / Ag'#234'ncia / Cta.:'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clMaroon
        Style.IsFontAssigned = True
      end
      object EdtDS_EXTENSO1: TcxMaskEdit
        Left = 120
        Top = 0
        Enabled = False
        Properties.CharCase = ecUpperCase
        TabOrder = 8
        Width = 466
      end
      object EdtDS_EXTENSO2: TcxMaskEdit
        Left = 120
        Top = 25
        Enabled = False
        Properties.CharCase = ecUpperCase
        TabOrder = 9
        Width = 466
      end
      object EdtNR_BANCO: TcxMaskEdit
        Left = 120
        Top = 50
        Enabled = False
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        TabOrder = 10
        Width = 61
      end
      object EdtNR_AGENCIA: TcxMaskEdit
        Left = 185
        Top = 50
        Enabled = False
        TabOrder = 11
        Width = 81
      end
      object EdtNR_CONTA: TcxMaskEdit
        Left = 270
        Top = 50
        Enabled = False
        TabOrder = 12
        Width = 101
      end
      object EdtNR_CHEQUE: TcxMaskEdit
        Left = 120
        Top = 75
        Enabled = False
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        TabOrder = 13
        OnEnter = EdtNR_CHEQUEEnter
        OnExit = EdtNR_CHEQUEExit
        Width = 121
      end
      object EdtNM_NOMINAL: TcxMaskEdit
        Left = 120
        Top = 100
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.MaskKind = emkRegExprEx
        Properties.MaxLength = 0
        TabOrder = 14
        OnEnter = EdtNM_NOMINALEnter
        OnExit = EdtNM_NOMINALExit
        Width = 466
      end
      object EdtNM_PRACA: TcxMaskEdit
        Left = 120
        Top = 125
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.MaskKind = emkRegExprEx
        Properties.MaxLength = 0
        TabOrder = 15
        OnEnter = EdtNM_PRACAEnter
        OnExit = EdtNM_PRACAExit
        Width = 466
      end
      object EdtDT_EMISSAO: TcxDateEdit
        Left = 120
        Top = 150
        Enabled = False
        TabOrder = 16
        OnEnter = EdtDT_EMISSAOEnter
        OnExit = EdtDT_EMISSAOExit
        Width = 121
      end
      object EdtDT_BOMPARA: TcxDateEdit
        Left = 120
        Top = 175
        Enabled = False
        TabOrder = 17
        Width = 121
      end
      object EdtFL_IMPRIMIR_CHEQUE: TcxCheckBox
        Left = 240
        Top = 175
        Caption = 'Imprimir Cheque?'
        Enabled = False
        State = cbsChecked
        TabOrder = 18
        Width = 121
      end
    end
    object LblVL_MOEDA: TcxLabel
      Left = 5
      Top = 110
      Caption = 'Valor em Moeda:'
      Enabled = False
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
    end
    object EdtVL_MOEDA: TcxCalcEdit
      Left = 125
      Top = 105
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,##0.00'
      TabOrder = 12
      Width = 121
    end
    object LblVL_COTACAO: TcxLabel
      Left = 5
      Top = 135
      Caption = 'C'#226'mbio de Convers'#227'o:'
      Enabled = False
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
    end
    object EdtVL_COTACAO: TcxCalcEdit
      Left = 125
      Top = 130
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,##0.000000'
      TabOrder = 13
      OnEnter = EdtVL_COTACAOEnter
      Width = 121
    end
    object EdtCD_HIST: TcxTextEdit
      Left = 157
      Top = 86
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 25
      Visible = False
      Width = 11
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 381
    Width = 594
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
    ExplicitTop = 381
    ExplicitWidth = 594
    ExplicitHeight = 26
    object StatusBarContainer1: TdxStatusBarContainerControl
      Left = 2
      Top = 4
      Width = 98
      Height = 20
      object BtnConfirmar: TcxButton
        Left = 0
        Top = 0
        Width = 96
        Height = 26
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
        Width = 96
        Height = 26
        Cancel = True
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = BtnCancelarClick
      end
    end
  end
end
