programa {
  inclua biblioteca Util --> u
  inclua biblioteca Texto --> txt
  inclua biblioteca Tipos --> tp

  funcao inicio() {
    cadeia opcaoDigitada, opcao, opcaoMenuSecundario
    cadeia nomeCliente = ""
    inteiro produtoEscolhido

    cadeia produtos[6] = {
      "iPhone 15 Pro", 
      "Samsung Galaxy S24",
      "MacBook Pro M3",
      "PlayStation 5",
      "iPad Air",
      "Fone Bluetooth JBL"
    }

    real precos[6] = {
      8000.00,
      6000.00,
      15000.00,
      4000.00,
      5500.00,
      350.00
    }

    faca {
      escreva("--- TechStore - Eletrônicos ---\n")
      escreva("C - Continuar\n")
      escreva("S - Sair\n")
      escreva("Sua opção: ")
      leia(opcaoDigitada)

      opcao = txt.caixa_alta(opcaoDigitada)

      escolha(opcao) {
        caso "S": 
          escreva("\nSaindo do sistema... Até logo!\n")
          pare

        caso "C":
          se (nomeCliente == "") {
            nomeCliente = registrarCliente()
          }

          escreva("\n--- MENU PRINCIPAL ---\n")
          escreva("1 - Ver Catálogo\n")
          escreva("2 - Fazer Pedido\n")
          escreva("Sua opção: ")
          leia(opcaoMenuSecundario)
          escreva("\n")

          escolha(opcaoMenuSecundario) {
            caso "1": 
              exibirProdutos(produtos, precos)
              pare

            caso "2": 
              produtoEscolhido = realizarCompra(nomeCliente, produtos, precos)
              se(produtoEscolhido != 0) {
                imprimirNotaFiscal(nomeCliente, produtos, precos, produtoEscolhido)
              }
              pare

            caso contrario:
              escreva("Opção de menu inválida!\n\n")
              pare
          }
          pare

        caso contrario: 
          escreva("\nOpção inválida! Digite novamente.\n\n")
      }
    } enquanto(opcao != "S")
  }

  funcao cadeia registrarCliente() {
    cadeia nome
    escreva("\nDigite seu nome para o cadastro: ")
    leia(nome)
    retorne nome
  }

  funcao exibirProdutos(cadeia produtos[], real precos[]) {
    inteiro totalProdutos = u.numero_elementos(produtos)
    escreva("\n--- CATÁLOGO DE PRODUTOS ---\n")
    para(inteiro i = 0; i < totalProdutos; i++) {
      escreva(i + 1, " - ", produtos[i], " - R$ ", precos[i], "\n")
    }
    escreva("\n")
  }

  funcao inteiro realizarCompra(cadeia nome, cadeia produtos[], real precos[]) {
    inteiro opcao
    inteiro totalProdutos = u.numero_elementos(produtos)

    exibirProdutos(produtos, precos)
    escreva("0 - Voltar ao menu\n")

    escreva("\n", nome, ", digite o número do produto desejado: ")
    leia(opcao)

    enquanto(opcao < 0 ou opcao > totalProdutos) {
      escreva("\nOpção inválida! Escolha um item de 1 a ", totalProdutos, " ou digite 0 para cancelar: ")
      leia(opcao)
    }

    se(opcao == 0) {
      escreva("\nPedido cancelado.\n\n")
      retorne 0
    }

    escreva("\nItem adicionado ao carrinho: ", produtos[opcao - 1], "!\n")
    retorne opcao
  }

  funcao imprimirNotaFiscal(cadeia nome, cadeia produtos[], real precos[], inteiro itemEscolhido) {
    escreva("\n=====================================\n")
    escreva("            NOTA FISCAL              \n")
    escreva("=====================================\n")
    escreva("Cliente: ", nome, "\n")
    escreva("Produto: ", produtos[itemEscolhido - 1], "\n")
    escreva("Valor Total: R$ ", precos[itemEscolhido - 1], "\n")
    escreva("Código do Pedido: ", gerarCodigoRastreio(), "\n")
    escreva("=====================================\n\n")
  }

  funcao cadeia gerarCodigoRastreio() {
    cadeia codigo
    cadeia letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    inteiro pos1 = u.sorteia(0, 25)
    inteiro pos2 = u.sorteia(0, 25)

    inteiro numeros = u.sorteia(100, 999)
    cadeia numerosCadeia = tp.inteiro_para_cadeia(numeros, 10)

    codigo = txt.extrair_subtexto(letras, pos1, pos1 + 1)
    codigo += txt.extrair_subtexto(letras, pos2, pos2 + 1)
    codigo = "BR-" + codigo + numerosCadeia

    retorne codigo
  }
}