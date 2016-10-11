inherited MovFinCaixaMovimentarTitMoeda: TMovFinCaixaMovimentarTitMoeda
  Caption = 'MovFinCaixaMovimentarTitMoeda'
  ClientHeight = 133
  ClientWidth = 234
  ExplicitWidth = 240
  ExplicitHeight = 161
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 234
    Height = 133
    ExplicitWidth = 234
    ExplicitHeight = 133
    object Bevel1: TBevel
      Left = 1
      Top = 1
      Width = 232
      Height = 90
      Align = alTop
      Shape = bsBottomLine
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 15
      Caption = 'Moeda:'
      Style.TextColor = clMaroon
    end
    object cxLabel3: TcxLabel
      Left = 10
      Top = 40
      Caption = 'Convers'#227'o:'
      Style.TextColor = clMaroon
    end
    object BtnConfirmar: TcxButton
      Left = 54
      Top = 100
      Width = 126
      Height = 26
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnConfirmarClick
    end
    object EdtVL_TOTAL: TcxCurrencyEdit
      Left = 70
      Top = 60
      Enabled = False
      TabOrder = 3
      Width = 151
    end
    object EdtCD_MOEDA: TcxCurrencyEdit
      Left = 70
      Top = 10
      Enabled = False
      Properties.AssignedValues.DisplayFormat = True
      Properties.DecimalPlaces = 0
      TabOrder = 4
      Width = 26
    end
    object EdtVL_COTACAO: TcxCurrencyEdit
      Left = 70
      Top = 35
      Properties.DecimalPlaces = 6
      Properties.DisplayFormat = ',0.000000;-,0.000000'
      TabOrder = 5
      OnExit = EdtVL_COTACAOExit
      OnKeyDown = EdtVL_COTACAOKeyDown
      Width = 151
    end
    object EdtTP_LANCAMENTO: TcxTextEdit
      Left = 218
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 6
      Visible = False
      Width = 16
    end
    object EdtFL_DC: TcxTextEdit
      Left = 218
      Top = 30
      TabStop = False
      Properties.ReadOnly = False
      Style.Color = cl3DLight
      TabOrder = 7
      Visible = False
      Width = 16
    end
    object EdtFL_TITULO: TcxTextEdit
      Left = 218
      Top = 50
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 8
      Visible = False
      Width = 16
    end
    object EdtNM_MOEDA: TcxTextEdit
      Left = 98
      Top = 10
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = cl3DLight
      TabOrder = 9
      Width = 123
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 133
    Width = 234
    Height = 0
    ExplicitTop = 133
    ExplicitWidth = 234
    ExplicitHeight = 0
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 65
    Caption = 'Total Baixa:'
    Style.TextColor = clMaroon
  end
end
