# TODO-List Pro 📋

Bem-vindo ao repositório do **TODO-List Pro**, uma aplicação completa de gerenciamento de tarefas focada em produtividade.

## 🚀 Tecnologias Utilizadas

- **Frontend:** Next.js (React 19), Tailwind CSS, Framer Motion, Aceternity UI, ReactBits.
- **Backend:** Node.js, Express, JWT, node-cron, nodemailer, pdfkit.
- **Banco de Dados:** MySQL.

## ⚙️ Como executar o projeto

1. **Clone o repositório:**
```bash
git clone https://github.com/gustavinzx/TODO-List---Resid-ncia-Rec.git
cd TODO-List---Resid-ncia-Rec
```

2. **Configure o Banco de Dados:**
Execute o script `schema_todolist.sql` (encontrado na pasta `Entrega_Faculdade/BancoDeDados/`) no seu MySQL para criar as tabelas `todo_usuarios` e `todo_tarefas`.

3. **Backend:**
Abra um terminal na pasta `backend`:
```bash
cd backend
npm install
npm start
```
*Não esqueça de configurar as variáveis no arquivo `.env`.*

4. **Frontend:**
Abra outro terminal na pasta `frontend`:
```bash
cd frontend
npm install
npm run dev
```

5. **Acesso:**
Abra `http://localhost:3000` no seu navegador.
Você pode usar a conta de administrador padrão (criada pelo script SQL):
- Login: `admin`
- Senha: `123456`

---
*Projeto desenvolvido para a atividade de Recuperação - Residência Tecnológica III.*
