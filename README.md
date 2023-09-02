# Descrição do Projeto Lógico - Oficina Mecânica

Este é um projeto lógico de um banco de dados para uma oficina mecânica fictícia. O objetivo deste banco de dados é auxiliar na gestão das operações da oficina, incluindo informações sobre clientes, veículos, serviços, mecânicos, estoque de peças e fornecedores.

## Esquema Lógico

O esquema lógico deste projeto inclui as seguintes tabelas:

1. **Cliente**: Armazena informações sobre os clientes da oficina, incluindo nome, telefone e endereço.

2. **Veiculo**: Registra informações sobre os veículos dos clientes, como marca, modelo, ano e placa. Cada veículo está associado a um cliente.

3. **Servico**: Contém informações sobre os serviços oferecidos pela oficina, incluindo descrição e preço. Os serviços são categorizados por tipos de serviço.

4. **Mecanico**: Registra os mecânicos que realizam os serviços na oficina, incluindo nome e especialidade.

5. **Estoque**: Mantém informações sobre o estoque de peças e produtos disponíveis na oficina, incluindo nome e quantidade disponível.

6. **Fornecedor**: Armazena dados sobre os fornecedores de peças e produtos, incluindo nome.

7. **Produto**: Registra os produtos disponíveis na oficina, incluindo nome, preço e associação ao fornecedor.

8. **TipoServico**: Categoriza os serviços em tipos, como manutenção, reparo, troca de peças, inspeção e diagnóstico.

9. **OrdemServico**: Registra informações sobre as ordens de serviço, incluindo data de entrada, data de saída, cliente associado, veículo associado e mecânico responsável.

10. **ItemServico**: Associa os serviços realizados nas ordens de serviço aos serviços registrados na tabela Servico e calcula o preço de cada serviço.

Este esquema lógico foi projetado para permitir o registro eficiente de informações relacionadas às operações da oficina mecânica, bem como para suportar consultas e análises para a gestão de serviços, estoque e clientes.

## Uso do Banco de Dados

Para utilizar este banco de dados, é possível executar consultas SQL para recuperar informações específicas, como o número de veículos por cliente, o serviço mais caro em média, o mecânico que realizou o maior número de serviços, produtos com estoque abaixo de um limite, entre outras consultas úteis para a gestão da oficina.



