# 📋 TODO-List Pro

![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)

**TODO-List Pro** é um sistema completo para gerenciamento de tarefas desenvolvido como atividade final para a disciplina de **Residência Tecnológica III**. Ele oferece uma experiência de usuário rica com design moderno (Glassmorphism), recursos de arrastar-e-soltar e automações no lado do servidor.

---

## ✨ Funcionalidades Principais

- 🔐 **Autenticação Segura**: Cadastro de usuários, login criptografado (Bcrypt) e sessões baseadas em tokens (JWT).
- 📌 **Quadro Kanban Interativo**: Crie, edite, exclua e altere o status das suas tarefas (A Fazer, Em Andamento, Concluída) de forma rápida.
- 🛡️ **Painel Administrativo (`/admin`)**: Um usuário com perfil de administrador pode gerenciar todas as contas da plataforma (criar novos admins, editar, excluir usuários) e visualizar o andamento geral de todas as tarefas.
- 📧 **Notificações Automáticas**: O servidor roda rotinas em segundo plano (`node-cron`) para notificar os usuários por e-mail sobre tarefas que continuam pendentes.
- 📄 **Relatórios em PDF**: Exportação instantânea das suas tarefas em formato PDF, com possibilidade de filtrar pelo status atual da tarefa, contendo data e hora da emissão.

---

## 🛠️ Tecnologias Utilizadas

### Frontend
- **Next.js 15** (App Router)
- **React 19**
- **Tailwind CSS** (Estilização avançada com Glassmorphism e tema escuro)
- **Lucide React** (Ícones modernos)
- **Sonner** (Notificações toast)

### Backend
- **Node.js** com **Express**
- **MySQL 2** (Banco de dados relacional com pool de conexões)
- **JWT (JSON Web Token)** para segurança das rotas
- **Nodemailer** para envio automático de e-mails
- **Node-Cron** para tarefas agendadas (CRON Jobs)
- **PDFKit** para geração programática dos relatórios em PDF.

---

## 🚀 Como Executar o Projeto Localmente

### Pré-requisitos
- [Node.js](https://nodejs.org/en/) (versão 18+)
- [MySQL](https://www.mysql.com/) (Workbench ou servidor local rodando)

### 1. Configurando o Banco de Dados
1. Abra seu MySQL Workbench.
2. Na pasta `Entrega_Faculdade/BancoDeDados`, copie o conteúdo do arquivo `schema_todolist.sql`.
3. Execute o script para criar o banco de dados `todolist_rec`, as tabelas e o usuário administrador padrão.

### 2. Rodando o Backend (API)
Navegue até a pasta do backend:
```bash
cd backend
```
Instale as dependências:
```bash
npm install
```
Configure as variáveis de ambiente:
1. Copie o arquivo `.env.example` e renomeie para `.env`.
2. Preencha com os dados do seu MySQL e insira um e-mail/senha de aplicativo (Gmail) se quiser testar os disparos de e-mail.

Inicie o servidor de desenvolvimento:
```bash
npm run dev
```
*(O servidor iniciará na porta 3001)*

### 3. Rodando o Frontend (Web)
Abra um novo terminal e navegue até a pasta do frontend:
```bash
cd frontend
```
Instale as dependências:
```bash
npm install
```
Inicie a aplicação:
```bash
npm run dev
```
*(A aplicação estará disponível em `http://localhost:3000`)*

---

## 🎓 Acesso Padrão (Admin)
Após rodar o script SQL, um usuário administrador já estará criado no banco para testes:
- **E-mail:** `admin` ou `admin@todo.com`
- **Senha:** `123456`

---

> Desenvolvido com muita dedicação para a disciplina de Residência Tecnológica III. 🚀
