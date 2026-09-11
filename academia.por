programa {
  inclua biblioteca Util --> u
  inclua biblioteca Texto --> txt

  funcao inicio() {
    cadeia op, nome = "", produtos[] = {"iPhone 15 Pro", "Samsung Galaxy S24", "MacBook Pro M3", "PlayStation 5", "iPad Air", "Fone JBL"}
    real precos[] = {8000.0, 6000.0, 15000.0, 4000.0, 5500.0, 350.0}
    inteiro item

    faca {
      escreva("--- TechStore ---\nC - Continuar | S - Sair: ")
      leia(op)
      op = txt.caixa_alta(op)

      se (op == "C") {
        se (nome == "") {
          escreva("Digite seu nome: ")
          leia(nome)
        }

        escreva("\n1 - Ver Catálogo\n2 - Fazer Pedido\nOpção: ")
        leia(op)

        se (op == "1" ou op == "2") {
          exibirProdutos(produtos, precos)

          se (op == "2") {
            escreva("0 - Voltar\n", nome, ", escolha o produto: ")
            leia(item)

            se (item > 0 e item <= u.numero_elementos(produtos)) {
              escreva("\n=== NOTA FISCAL ===\nCliente: ", nome, "\nProduto: ", produtos[item - 1], "\nValor: R$ ", precos[item - 1], "\nCódigo: BR-", u.sorteia(10, 99), u.sorteia(100, 999), "\n===================\n\n")
            } senao se (item != 0) {
              escreva("\nOpção inválida!\n\n")
            }
          }
        }
      }
    } enquanto (op != "S")
  }

  funcao exibirProdutos(cadeia p[], real pr[]) {
    escreva("\n--- CATÁLOGO ---\n")
    para (inteiro i = 0; i < u.numero_elementos(p); i++) {
      escreva(i + 1, " - ", p[i], " - R$ ", pr[i], "\n")
    }
    escreva("\n")
  }
}