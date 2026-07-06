# Documentação do Projeto - TODO-LIST
*Atividade de Recuperação - Residência Tecnológica III (Porto Digital)*

Abaixo está a documentação pronta para você copiar e colocar no documento final da sua atividade, seguindo exatamente o modelo e requisitos solicitados pelo professor.

---

### Modelo de Documento – Requisitos e Histórias de Usuário a serem preenchidos:

#### 1 – Requisitos Funcionais (RF):
| Código | Descrição | Prioridade |
|---|---|---|
| **RF01** | O sistema deve permitir o cadastro de novos usuários informando nome, e-mail válido, nome de usuário e senha. | Alta |
| **RF02** | O sistema deve permitir que usuários realizem login para acessar suas atividades de forma autenticada. | Alta |
| **RF03** | O sistema deve possuir regras de acesso distintas para Usuário Comum e Administrador. | Alta |
| **RF04** | Os usuários devem poder realizar o CRUD completo das tarefas (criar, listar pendentes/concluídas, atualizar status e excluir). | Alta |
| **RF05** | O administrador deverá visualizar e gerenciar contas, podendo editar dados e excluir usuários. | Alta |
| **RF06** | O administrador deverá visualizar o conjunto de todas as tarefas cadastradas no sistema. | Média |
| **RF07** | O sistema deve permitir a geração e download de relatórios de tarefas em formato PDF, com filtros de status, contendo as informações da emissão. | Alta |
| **RF08** | O sistema deve enviar alertas via e-mail automaticamente para notificar os usuários sobre atividades ainda não concluídas. | Alta |

#### 2 – Requisitos Não Funcionais (RNF):
| Código | Descrição |
|---|---|
| **RNF01** | O banco de dados deve armazenar usuários e tarefas de forma relacional. |
| **RNF02** | O sistema deve oferecer uma interface interativa e amigável (focada em organização pessoal). |
| **RNF03** | As senhas dos usuários devem ser armazenadas de forma segura através de Hash (criptografia unidirecional). |
| **RNF04** | A comunicação entre cliente e servidor (autenticação) deve utilizar JWT para garantir rotas restritas e seguras. |
| **RNF05** | O envio de e-mails de alerta deve ser implementado via rotinas de Cron atuando em segundo plano. |

#### 3 - Histórias de Usuário (HU):
| ID | História | Critérios de Aceite |
|---|---|---|
| **HU01** | Como usuário, quero me cadastrar no sistema para poder acessar minhas tarefas. | O sistema deve validar campos obrigatórios e registrar os dados no banco de forma segura. |
| **HU02** | Como usuário comum, quero criar e alterar o status das minhas atividades (A fazer, Em andamento, Concluídas) para manter o controle da rotina. | As tarefas devem aparecer no quadro e o status deve ser atualizado no banco imediatamente. |
| **HU03** | Como usuário, quero gerar um relatório em PDF filtrando pelo status da atividade para ter uma visão analítica do meu dia. | O PDF deve ser baixado contendo nome, data da emissão e as tarefas filtradas ordenadamente. |
| **HU04** | Como administrador, quero um painel de visão global para gerenciar contas de usuários e monitorar as tarefas totais. | O acesso ao painel deve ser restrito, e o admin deve poder excluir ou promover usuários livremente. |
| **HU05** | Como usuário esquecido, quero receber um e-mail de alerta sobre minhas pendências para não perder prazos. | O servidor deve identificar periodicamente as atividades com status "A fazer" e "Em andamento" e enviar a relação para o e-mail do dono. |

---

### Modelagem do Banco de Dados

**Diagrama e Estrutura Lógica**
O sistema é composto por duas entidades relacionais simples: `todo_usuarios` e `todo_tarefas`.

#### Tabela: `todo_usuarios`
Armazena as credenciais e dados dos usuários do sistema.
- `id` (INT, Primary Key, Auto Increment)
- `nome` (VARCHAR(100), Not Null)
- `username` (VARCHAR(50), Unique, Not Null)
- `email` (VARCHAR(100), Unique, Not Null)
- `senha_hash` (VARCHAR(255), Not Null) - *Senha criptografada*
- `perfil` (ENUM('admin', 'user'), Default 'user') - *Controle de acesso*
- `criado_em` (TIMESTAMP, Default CURRENT_TIMESTAMP)

#### Tabela: `todo_tarefas`
Armazena os registros de atividades e mantém relação direta com o usuário (dono).
- `id` (INT, Primary Key, Auto Increment)
- `usuario_id` (INT, Foreign Key para `todo_usuarios(id)`, Not Null)
- `titulo` (VARCHAR(255), Not Null)
- `descricao` (TEXT, Nullable)
- `status` (ENUM('a_fazer', 'em_andamento', 'concluida'), Default 'a_fazer')
- `criado_em` (TIMESTAMP, Default CURRENT_TIMESTAMP)

> *Nota Relacional:* A ligação (Constraint) na `usuario_id` utiliza regra genérica `ON DELETE CASCADE`. Isso garante que, se um usuário for deletado pelo administrador (HU04), todas as tarefas associadas a ele também sejam apagadas, evitando dados órfãos.
