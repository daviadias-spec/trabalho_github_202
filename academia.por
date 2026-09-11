programa
{
	// Vetores para armazenar até 50 alunos
	cadeia nomes[50]
	inteiro idades[50]
	cadeia planos[50]
	logico pagamentosEmDia[50]
	inteiro totalAlunos = 0

	funcao inicio()
	{
		inteiro opcao = -1

		faca
		{
			escreva("\n=====================================\n")
			escreva("     SISTEMA DE GESTÃO DE ACADEMIA    \n")
			escreva("=====================================\n")
			escreva("1. Cadastrar Aluno\n")
			escreva("2. Listar Todos os Alunos\n")
			escreva("3. Buscar Aluno por Nome\n")
			escreva("4. Alterar Status de Pagamento\n")
			escreva("0. Sair\n")
			escreva("-------------------------------------\n")
			escreva("Opção desejada: ")
			leia(opcao)

			escolha(opcao)
			{
				caso 1:
					cadastrarAluno()
					pare
				caso 2:
					listarAlunos()
					pare
				caso 3:
					buscarAluno()
					pare
				caso 4:
					atualizarPagamento()
					pare
				caso 0:
					escreva("\nEncerrando o sistema... Até logo!\n")
					pare
				caso contrario:
					escreva("\nOpção inválida! Tente novamente.\n")
			}
		} enquanto(opcao != 0)
	}

	funcao cadastrarAluno()
	{
		se (totalAlunos < 50)
		{
			escreva("\n--- CADASTRAR NOVO ALUNO ---\n")
			
			escreva("Nome completo: ")
			leia(nomes[totalAlunos])
			
			escreva("Idade: ")
			leia(idades[totalAlunos])
			
			escreva("Plano (Mensal / Trimestral / Anual): ")
			leia(planos[totalAlunos])
			
			pagamentosEmDia[totalAlunos] = verdadeiro
			
			totalAlunos++
			escreva("\n-> Aluno cadastrado com sucesso!\n")
		}
		senao
		{
			escreva("\n-> Limite de cadastros atingido (máximo 50 alunos).\n")
		}
	}

	funcao listarAlunos()
	{
		escreva("\n--- LISTA DE ALUNOS CADASTRADOS ---\n")
		
		se (totalAlunos == 0)
		{
			escreva("Nenhum aluno registrado no sistema.\n")
		}
		senao
		{
			para (inteiro i = 0; i < totalAlunos; i++)
			{
				escreva("ID: ", i + 1, " | Nome: ", nomes[i], " | Idade: ", idades[i], " | Plano: ", planos[i])
				
				se (pagamentosEmDia[i])
				{
					escreva(" | Status: Adimplente\n")
				}
				senao
				{
					escreva(" | Status: PENDENTE\n")
				}
			}
		}
	}

	funcao buscarAluno()
	{
		cadeia nomeBusca
		logico encontrado = falso

		escreva("\n--- BUSCAR ALUNO ---\n")
		escreva("Digite o nome exato do aluno: ")
		leia(nomeBusca)

		para (inteiro i = 0; i < totalAlunos; i++)
		{
			se (nomes[i] == nomeBusca)
			{
				escreva("\n[ Aluno Encontrado ]")
				escreva("\nID: ", i + 1)
				escreva("\nNome: ", nomes[i])
				escreva("\nIdade: ", idades[i])
				escreva("\nPlano: ", planos[i])
				
				se (pagamentosEmDia[i])
				{
					escreva("\nStatus Financeiro: Adimplente\n")
				}
				senao
				{
					escreva("\nStatus Financeiro: PENDENTE\n")
				}
				
				encontrado = verdadeiro
				pare
			}
		}

		se (nao encontrado)
		{
			escreva("\n-> Aluno não encontrado no sistema.\n")
		}
	}

	funcao atualizarPagamento()
	{
		inteiro id
		inteiro statusOpcao

		escreva("\n--- ATUALIZAR STATUS DE PAGAMENTO ---\n")
		
		se (totalAlunos == 0)
		{
			escreva("Nenhum aluno disponível para alteração.\n")
		}
		senao
		{
			escreva("Digite o ID do aluno (1 a ", totalAlunos, "): ")
			leia(id)

			inteiro indice = id - 1

			se (indice >= 0 e indice < totalAlunos)
			{
				escreva("Aluno selecionado: ", nomes[indice])
				escreva("\n1. Definir como Adimplente (Em dia)")
				escreva("\n2. Definir como Pendente (Em atraso)")
				escreva("\nOpção: ")
				leia(statusOpcao)

				se (statusOpcao == 1)
				{
					pagamentosEmDia[indice] = verdadeiro
					escreva("\n-> Status alterado para ADIMPLENTE.\n")
				}
				senao se (statusOpcao == 2)
				{
					pagamentosEmDia[indice] = falso
					escreva("\n-> Status alterado para PENDENTE.\n")
				}
				senao
				{
					escreva("\n-> Opção de status inválida.\n")
				}
			}
			senao
			{
				escreva("\n-> ID do aluno é inválido.\n")
			}
		}
	}
}