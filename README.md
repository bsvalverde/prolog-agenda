# Agenda in Prolog

Foi   implementada   uma   agenda   eletrônica,   armazenando   contatos   com   suas  
respectivas   datas   de   nascimento.   A   cada   contato   pode,   ainda,   ser   associado   um   ou  
mais telefones e endereços. 
O   código­fonte   está   anexado   no   arquivo   agenda.pl.   Os   arquivos   config.pl,  
contatos.pl,   enderecos.pl   e   telefones.pl   são   de   armazenamento   das   informações   do  
banco de dados. 
Para   executar   os   predicados   a   seguir   e   manipular   o   banco   de   dados   é  
necessário compilar apenas o arquivo agenda.pl (?­ [agenda].). 
 
● Inserção de dados 
1. Inserção de Contatos 
?­ inserirContato(Nome, DataDeNascimento). 
Os   telefones   e   endereços   estão   associados   a   um   contato   específico.   Sendo   assim,   um  
novo   contato   deve   ser   inserido   no   banco   de   dados   antes   da   inserção   do   respectivo  
telefone   ou   endereço.   Vale   ressaltar   que   não   é   possível   inserir   um   contato   de   nome  
igual a outro já existente na agenda. 
 
2. Inserção de Telefones 
?­ inserirTelefone(NomeContato, DDD, Telefone). 
Um   contato   correspondente   deve   ser   criado   antes   de   ser   adicionado   um   telefone.   Um  
contato pode ter mais de um telefone associado a ele. 
 
3. Inserção de Endereços 
?­ inserirEndereco(NomeContato, TipoEnd, Rua, Num, Bairro, Cidade, UF). 
Assim   como   os   números   de   telefone,   os   endereços   devem   ser   associados   a   um  
contato,   que   pode   ter   mais   de   um   endereço.   Além   do   endereço   propriamente   dito,   o  
usuário   da   agenda   pode   identificá­lo   em   TipoEnd   como   comercial   ou   residencial,   por  
exemplo. 
 
 ● Exclusão de dados 
Na   exclusão   de   qualquer   tipo   de   dado,   qualquer   uma   das   variáveis   pode   ser   substituída  
pelo   caractere   ‘_’,   para   indicar   que   seu   valor   é   indiferente.   Para   excluir   todos   os   dados  
de   um   determinado   tipo,   portanto,   basta   colocar   este   caractere   nas   posições   de   todas  
as variáveis. 
 
1. Exclusão de Contatos 
?­ removerContato(Nome, DataDeNascimento). 
Como   os   telefones   e   endereços   estão   associados   a   um   contato   específico,   a   exclusão  
de   um   contato   implica   na   respectiva   exclusão   dos   telefones   e   endereços   associados   a  
ele.   Sendo   assim,   um   comando   removerContato(_,   _).   implica   na   exclusão   de   todos   os  
dados da agenda. 
 
2. Exclusão de Telefones 
?­ removerTelefone(NomeContato, DDD, Telefone). 
 
3. Exclusão de Endereços 
?­ removerEndereco(NomeContato, TipoEnd, Rua, Num, Bairro, Cidade, UF). 
 
● Alteração de dados 
Na   alteração   de   dados,   devem   ser   fornecidas   as   variáveis   correspondentes   às  
informações   que   se   quer   alterar.   Os   dados   atuais   serão   impressos,   e   os   novos   dados  
serão   solicitados.   Todas   as   variáveis   serão   solicitadas.   Sendo   assim,   caso   deseje­se  
preservar   alguma   informação,   deve­se   digitar   os   dados   previamente   existentes   nesta  
variável. 
?­ alterarContato(Nome, DataNascimento). 
?­ alterarTelefone(Nome, DDD, Numero). 
?­ alterarEndereco(Nome, Tipo, Rua, Número, Bairro, Cidade, UF). 
 
● Consulta 
Assim   como   na   exclusão   de   dados   da   agenda,   qualquer   variável   pode   ser   substituída  
pelo caractere ‘_’ caso seu valor não seja de interesse. 
 
1. Pesquisa por Contatos 
?­ procurarPorContato(Nome, DataNascimento). 
A   consulta   por   um   contato   retorna   todos   os   dados   associados   a   ele,   ou   seja,   todos   os  
contatos   cujo   nome   e/ou   data   de   nascimento   foi   digitado,   acompanhados   de   todos   os  
telefones e endereços associados a eles. 
 2. Pesquisa por Telefones 
?­ procurarPorTelefone(DDD, Número). 
A   pesquisa   por   telefone,   diferentemente   da   pesquisa   por   contato,   não   fornece   os   dados  
completos   do   contato,   mas   apenas   os   nomes   dos   contatos   cadastrados   que   possuem   o  
DDD e/ou telefone fornecido. 
 
3. Pesquisa por Endereços 
?­ procurarPorEndereco(Tipo, Rua, Número, Bairro, Cidade, UF). 
Assim   como   a   pesquisa   por   telefone,   a   pesquisa   por   endereço   retorna   ao   usuário  
apenas   os   endereços   e   nomes   dos   contatos   associados   que   correspondem   às  
variáveis fornecidas
