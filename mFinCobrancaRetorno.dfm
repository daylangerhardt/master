inherited MovFinCobrancaRetorno: TMovFinCobrancaRetorno
  Caption = 'MovFinCobrancaRetorno'
  ClientHeight = 485
  ClientWidth = 703
  ExplicitWidth = 709
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 586
    Height = 466
    ExplicitWidth = 586
    ExplicitHeight = 466
    object Bevel3: TBevel
      Left = 210
      Top = 60
      Width = 366
      Height = 6
      Shape = bsBottomLine
    end
    object Bevel2: TBevel
      Left = 205
      Top = 415
      Width = 371
      Height = 6
      Shape = bsBottomLine
    end
    object cxGroupBox1: TcxGroupBox
      Left = 10
      Top = 5
      Caption = ' Caminho da pasta dos retornos: '
      TabOrder = 0
      Height = 46
      Width = 566
      object EdtNM_PASTA_IMPORT: TcxButtonEdit
        Left = 5
        Top = 15
        Properties.Buttons = <
          item
            Default = True
            Kind = bkGlyph
          end>
        Properties.ClickKey = 120
        Properties.OnButtonClick = EdtCaminhoArquivoPropertiesButtonClick
        TabOrder = 0
        Width = 556
      end
    end
    object cxLabel2: TcxLabel
      Left = 10
      Top = 55
      Caption = 'Visualiza'#231#227'o das Cr'#237'ticas de Retorno:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object MmoArquivo: TcxMemo
      Left = 10
      Top = 75
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssBoth
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Lucida Console'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Height = 334
      Width = 566
    end
    object LblAndamento: TcxLabel
      Left = 10
      Top = 410
      Caption = 'Andamento do processo da leitura:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object PrbProgresso: TcxProgressBar
      Left = 10
      Top = 435
      TabOrder = 4
      Width = 566
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 466
    Width = 703
    ExplicitTop = 466
    ExplicitWidth = 703
  end
  object Panel2: TPanel
    Left = 586
    Top = 0
    Width = 117
    Height = 466
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 2
    object BtnImportar: TcxButton
      Tag = 1
      Left = 3
      Top = 9
      Width = 112
      Height = 25
      Caption = 'Processar'
      TabOrder = 0
      OnClick = BtnImportarClick
    end
    object BtnSair: TcxButton
      Tag = 2
      Left = 3
      Top = 71
      Width = 112
      Height = 25
      Hint = 'Envia o relat'#243'rio para a impressora (F6)'
      Cancel = True
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object BtnRelCritica: TcxButton
      Tag = 1
      Left = 3
      Top = 39
      Width = 112
      Height = 25
      Hint = 'Visualiza o relat'#243'rio na tela (F5)'
      Caption = 'Rel. das Cr'#237'ticas'
      TabOrder = 2
      OnClick = BtnImportarClick
    end
  end
  object SQLQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmPrincipal.SQLConnection
    Left = 605
    Top = 305
  end
  object CdsRomaneioNota: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 605
    Top = 270
  end
  object DlgArquivo: TOpenDialog
    Left = 602
    Top = 200
  end
  object gbCobranca: TgbCobranca
    NumeroArquivo = 0
    LayoutArquivo = laCNAB400
    TipoMovimento = tmRetorno
    Left = 603
    Top = 234
  end
end
