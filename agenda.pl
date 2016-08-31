%%        %%
%% AGENDA %%
%%        %%

% Modelos dos registros:
% contato(Id, Nome, DataNascimento).
% telefone(IdContato, DDD, Número).
% endereco(IdContato, Tipo, Rua, Número, Bairro, Cidade, UF).

% Compilar os outros componentes do BD
% (erros de compilação por falta desses arquivos (exceto o config.pl) não prejudicam o funcionamento do programa)
:- [config, contatos, telefones, enderecos].

% Obter o próximo ID de inserção da tabela
proxIdContatos(X) :- idContatos(Y), X is Y + 1.

% Gravar dados no BD
gravarTudo :- gravarConfiguracoes, gravarContatos, gravarTelefones, gravarEnderecos.
gravarConfiguracoes :- tell('config.pl'), listing(idContatos), told.
gravarContatos :- tell('contatos.pl'), listing(contato), told.
gravarTelefones :- tell('telefones.pl'), listing(telefone), told.
gravarEnderecos :- tell('enderecos.pl'), listing(endereco), told.

% Inserir registros
inserirContato(Nome, DataNascimento) :- proxIdContatos(X), assert(contato(X, Nome, DataNascimento)), retractall(idContatos(_)), assert(idContatos(X)), gravarContatos, gravarConfiguracoes, !.
inserirTelefone(NomeContato, DDD, Telefone) :- contato(I, NomeContato, _), integer(DDD), integer(Telefone), assert(telefone(I, DDD, Telefone)), gravarTelefones, !.
inserirEndereco(NomeContato, TipoEnd, Rua, Num, Bairro, Cidade, UF) :- contato(I, NomeContato, _), integer(Num), assert(endereco(I, TipoEnd, Rua, Num, Bairro, Cidade, UF)), gravarEnderecos, !.

% Remover registros
removerContato(Nome, DataNascimento) :- contato(I, Nome, DataNascimento), retractall(contato(I, _, _)), retractall(telefone(I, _, _)), retractall(endereco(I, _, _, _, _, _, _)), gravarTudo, !.
removerTelefone(Contato, DDD, Telefone) :- contato(I, Contato, _), retractall(telefone(I, DDD, Telefone)), gravarTelefones, !.
removerEndereco(Contato,TipoEnd, Rua, Num, Bairro, Cidade, UF) :- contato(I, Contato, _), retractall(endereco(I, TipoEnd, Rua, Num, Bairro, Cidade, UF)), gravarEnderecos, !.

% Mostrar Dados
imprimirContato(Nome, DataNascimento) :- write(Nome), nl, write('Data de nascimento: '), write(DataNascimento).
imprimirTelefone(DDD, Numero) :- write('Telefone: '), write(DDD), write(' '), write(Numero).
imprimirEndereco(Tipo, Rua, Numero, Bairro, Cidade, UF) :- write('Endereço '), write(Tipo), write(': '), write(Rua), write(', '), write(Numero), write(', '), write(Bairro), write(', '), write(Cidade), write(', '), write(UF).
imprimirDadosContato(IdContato) :- telefone(IdContato, DDD, Numero), imprimirTelefone(DDD, Numero), nl.
imprimirDadosContato(IdContato) :- endereco(IdContato, Tipo, Rua, Numero, Bairro, Cidade, UF), imprimirEndereco(Tipo, Rua, Numero, Bairro, Cidade, UF), nl.

% Alterar registros
alterarContato(Nome, DataNascimento) :- contato(Id, Nome, DataNascimento), imprimirContato(Nome, DataNascimento), nl, write('Novo nome\n'), read(NovoNome), write('Nova data de nascimento\n'), read(NovaData), retractall(contato(Id, Nome, DataNascimento)), assert(contato(Id, NovoNome, NovaData)), gravarContatos, !.
alterarTelefone(Nome, DDD, Numero) :- contato(Id, Nome, DataNascimento), telefone(Id, DDD, Numero), imprimirContato(Nome, DataNascimento), nl, imprimirTelefone(DDD, Numero), nl, write('Novo DDD\n'), read(NovoDDD), write('Novo número\n'), read(NovoNumero), retractall(telefone(Id, DDD, Numero)), assert(telefone(Id, NovoDDD, NovoNumero)), gravarTelefones, !.
alterarEndereço(Nome, Tipo, Rua, Numero, Bairro, Cidade, UF) :- contato(Id, Nome, DataNascimento), endereco(Id, Tipo, Rua, Numero, Bairro, Cidade, UF), imprimirContato(Nome, DataNascimento), nl, imprimirEndereco(Tipo, Rua, Numero, Bairro, Cidade, UF), nl, write('Novo Tipo de Endereço\n'), read(NovoTipo), write('Nova rua\n'), read(NovaRua), write('Novo número\n'), read(NovoNumero), write('Novo bairro\n'), read(NovoBairro), write('Nova cidade\n'), read(NovaCidade), write('Nova UF\n'), read(NovaUF), retractall(endereco(Id, Tipo, Rua, Numero, Bairro, Cidade, UF)), assert(endereco(Id, NovoTipo, NovaRua, NovoNumero, NovoBairro, NovaCidade, NovaUF)), gravarEnderecos, !.

% Consultas
procurarPorContato(Nome, DataNascimento) :- contato(Id, Nome, DataNascimento), imprimirContato(Nome, DataNascimento), nl, imprimirDadosContato(Id).
procurarPorTelefone(DDD, Numero) :- telefone(Id, DDD, Numero), contato(Id, Nome, DataNascimento), imprimirContato(Nome, DataNascimento), nl, imprimirTelefone(DDD, Numero).
procurarPorEndereco(Tipo, Rua, Numero, Bairro, Cidade, UF) :- endereco(Id, Tipo, Rua, Numero, Bairro, Cidade, UF), contato(Id, Nome, DataNascimento), imprimirContato(Nome, DataNascimento), nl, imprimirEndereco(Tipo, Rua, Numero, Bairro, Cidade, UF), nl.

