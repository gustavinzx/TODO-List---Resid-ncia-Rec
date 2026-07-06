-- Crie o banco de dados caso não exista (se o seu já tiver criado, pule essa linha)
CREATE DATABASE IF NOT EXISTS todolist_rec;
USE todolist_rec;

-- Tabela de Usuários (Deverá ser criada primeiro por causa da chave estrangeira)
CREATE TABLE IF NOT EXISTS todo_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    perfil ENUM('admin', 'user') DEFAULT 'user',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Tarefas
CREATE TABLE IF NOT EXISTS todo_tarefas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    status ENUM('a_fazer', 'em_andamento', 'concluida') DEFAULT 'a_fazer',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES todo_usuarios(id) ON DELETE CASCADE
);

-- (Opcional) Criação de um usuário Admin Padrão para testes
-- A senha '123456' em bcrypt gera o hash abaixo
INSERT IGNORE INTO todo_usuarios (nome, username, email, senha_hash, perfil) 
VALUES ('Administrador', 'admin', 'admin@admin.com', '$2b$10$EpI3i4L2V5o8O2Xh6dO8x.gSZb8YF6n3R1zO/WjT3h0Y3O9M4G8E6', 'admin');
