inherited MovFinCaixaMovimentarDetalhe: TMovFinCaixaMovimentarDetalhe
  Caption = 'MovFinCaixaMovimentarDetalhe'
  ClientHeight = 132
  ClientWidth = 594
  ExplicitWidth = 600
  ExplicitHeight = 160
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 594
    Height = 106
    ExplicitWidth = 594
    ExplicitHeight = 106
    object cxLabel4: TcxLabel
      Left = 5
      Top = 10
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
    object EdtCD_CONTADET: TcxButtonEdit
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
      Properties.OnButtonClick = EdtCD_CONTADETPropertiesButtonClick
      TabOrder = 1
      OnExit = EdtCD_CONTADETExit
      Width = 101
    end
    object EdtNM_CONTADET: TcxTextEdit
      Left = 230
      Top = 5
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 3
      Width = 361
    end
    object cxLabel5: TcxLabel
      Left = 5
      Top = 35
      Cursor = crHandPoint
      Caption = 'Natureza:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object EdtFL_DC_DET: TcxImageComboBox
      Left = 125
      Top = 30
      Properties.Items = <
        item
          Description = '1 - Receita'
          ImageIndex = 0
          Value = 'C'
        end
        item
          Description = '2 - Despesa'
          Value = 'D'
        end>
      TabOrder = 5
      Width = 121
    end
    object cxLabel11: TcxLabel
      Left = 5
      Top = 60
      Caption = 'Hist'#243'rico:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object EdtCD_HISTORICO: TcxButtonEdit
      Left = 125
      Top = 55
      Properties.Alignment.Horz = taLeftJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkGlyph
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClickKey = 120
      Properties.OnButtonClick = EdtCD_HISTORICOPropertiesButtonClick
      TabOrder = 6
      OnEnter = EdtCD_HISTORICOEnter
      OnExit = EdtCD_HISTORICOExit
      Width = 466
    end
    object EdtVL_LANCAMENTO: TcxCalcEdit
      Left = 125
      Top = 80
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,##0.00'
      TabOrder = 8
      OnEnter = EdtVL_LANCAMENTOEnter
      Width = 121
    end
    object cxLabel27: TcxLabel
      Left = 5
      Top = 85
      Caption = 'Valor Lan'#231'amento:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 106
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
    ExplicitTop = 106
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
