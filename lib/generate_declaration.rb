require 'prawn'

module GeneratePdf
    PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75],
    #:background  => "lib/imagens/d1.png"
    :image => "/lib/imagens/d1.png"


    }


def self.declaration declaration_name, details
    #Apenas uma string aleatório para termos um corpo de texto pro contrato
    #lorem_ipsum = "DECLARO, para os devidos fins de direito que, conforme dispõe o art. 379, § 3°, alíneas "a" e "b", da Lei n° 12.342, de 28 de julho de 1994 (CÓDIGO DE DIVISÃO E DE ORGANIZAÇÃO JUDICIÁRIA DO ESTADO DO CEARÁ), a comarca de Fortaleza possui 01 (um) SERVIÇO DE DISTRIBUIÇÃO, órgão integrante da estrutura organizacional deste Fórum, que detém competência exclusiva para distribuir os feitos judiciais entre os diversos Juízos desta Capital e de expedir certidão única negativa ou positiva, de processos judiciais em andamento, inclusive ações civis de recuperação de empresas e falências. DECLARO,"


    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # Define a cor do traçado
      pdf.fill_color "666666"
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
      #pdf.text "Declaration", :size => 32, :style => :bold, :align => :center
      # Move 80 PDF points para baixo o cursor
      pdf.move_down 80
      # Escreve o texto do contrato com o tamanho de 14 PDF points, com o alinhamento justify
      #pdf.text "<b>DECLARO</b>, para os devidos fins de direito que, conforme dispõe o art. 379, § 3°, alíneas \"a\" e \"b\", da Lei n° 12.342, de 28 de julho de 1994 (CÓDIGO DE DIVISÃO E DE ORGANIZAÇÃO JUDICIÁRIA DO ESTADO DO CEARÁ), a comarca de Fortaleza possui 01 (um) SERVIÇO DE DISTRIBUIÇÃO, órgão integrante da estrutura organizacional deste Fórum, que detém competência exclusiva para distribuir os feitos judiciais entre os diversos Juízos desta Capital e de expedir certidão única negativa ou positiva, de processos judiciais em andamento, inclusive ações civis de recuperação de empresas e falências. DECLARO,", :size => 10, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 580
      # Escreve o texto com os detalhes que o usuário entrou
      #pdf.text "#{details}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 10
      pdf.text "Fortaleza, #{(I18n.l Date.today, :format => :long)}", :size => 12, :align => :justify, :inline_format => true
      # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
      #pdf.text "Com o cliente: <b>#{name}</b> por", :size => 12, :align => :justify, :inline_format => true
      # Muda de font para Helvetica
      pdf.font "Helvetica"
      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
      #pdf.text "Link Para o Manul do Prawn<link href='http://prawnpdf.org/manual.pdf'> <color rgb='5ca3e6'>clicável</color></link>", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      #pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome declaration.pdf
      pdf.render_file('public/declaration.pdf')
    end
  end

  # Inicia nosso PDF
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # Define a cor do traçado
      pdf.fill_color "666666"
      # Cria um título com tamanho 28 PDF Points, bold alinha no centro
      pdf.text "Gráficos de gastos", :size => 28, :style => :bold, :align => :center
      # Move 60 PDF points para baixo o cursor
      pdf.move_down 60
      # Escreve mais um texto sobre o gráfico
      pdf.text "Gráfico em R$ de gastos por setor", size: 14, color: 'AAAAAA', align: :center
      # Inclui a imagem com o gráfico na escala 0.50 para diminuir pela metade a imagem

      # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Muda de página para incluir o outro gráfico
      pdf.start_new_page
      # Move 60 PDF points para baixo o cursor
      pdf.move_down 20

      # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera nosso pdf no diretório public
      pdf.render_file('public/declaration.pdf')
    end
  end
