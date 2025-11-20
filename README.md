# 🎓 Inclusão Digital Barra Mansa

<div align="center">

![Ruby](https://img.shields.io/badge/ruby-3.3.6-red?logo=ruby)
![Rails](https://img.shields.io/badge/rails-8.0.0-red?logo=rubyonrails)
![SQLite](https://img.shields.io/badge/sqlite-3-blue?logo=sqlite)
![Tailwind](https://img.shields.io/badge/tailwind-3.x-38bdf8?logo=tailwindcss)

**Plataforma digital para conectar alunos de baixa renda com mentores voluntários de tecnologia**

[Demo](#-funcionalidades) • [Instalação](#-instalação-e-como-rodar) • [Uso](#-como-usar)

</div>

---

## 📋 Sobre o Projeto

**Inclusão Digital Barra Mansa** é uma iniciativa extensionista desenvolvida como parte da disciplina **Atividade Extensionista II** do curso de **Análise e Desenvolvimento de Sistemas** do Centro Universitário Internacional UNINTER.

O projeto visa democratizar o acesso ao conhecimento em tecnologia, criando uma ponte entre mentores experientes e alunos motivados de baixa renda que desejam aprender programação, design, lógica computacional e outras áreas digitais.

### 🎯 Objetivos de Desenvolvimento Sustentável (ODS)

Este projeto está alinhado com os seguintes ODS da ONU:

- **ODS 01** - Erradicação da pobreza
- **ODS 04** - Educação de qualidade
- **ODS 10** - Redução das desigualdades
- **ODS 17** - Parcerias e meios de implementação

### 👨‍🎓 Autor

**Alan Carlos Jorge de Oliveira**
RU: 3892233
Curso: CST em Análise e Desenvolvimento de Sistemas - UNINTER

---

## 📦 Instalação e Como Rodar

### Pré-requisitos

```bash
ruby 3.3.6
bundler 2.5.23
sqlite3 3.x
```

### Passo a Passo

1. **Clone o repositório**

```bash
git clone https://github.com/seu-usuario/inclusao_digital_bm.git
cd inclusao_digital_bm
```

2. **Instale as dependências**

```bash
bundle install
```

3. **Configure o banco de dados**

```bash
rails db:create
rails db:migrate
```

4. **Popule com dados de exemplo**

```bash
rails db:seed
```

Isso criará:
- 3 mentores (especialidades: Python, Design UX, Lógica de Programação)
- 3 alunos (com interesses variados)
- 2 apoiadores

5. **Inicie o servidor**

```bash
rails server
```

6. **Acesse a aplicação**

Abra o navegador em: [http://localhost:3000](http://localhost:3000)

---

## 🚀 Funcionalidades

### 📚 Gestão de Entidades

- **Mentores**: Cadastro de voluntários com especialidade, bio, disponibilidade e contato
- **Alunos**: Cadastro de estudantes com interesses, objetivos de aprendizagem e nível de proficiência
- **Apoiadores**: Registro de organizações/instituições que oferecem suporte (espaço físico, recursos)

### 🔗 Sistema de Conexões

- Algoritmo inteligente de matching baseado em:
  - Compatibilidade de expertise do mentor com interesses do aluno
  - Sobreposição de disponibilidade de horários
  - Alinhamento de objetivos de aprendizagem com experiência do mentor
- Score de compatibilidade para cada conexão sugerida

### 📊 Dashboard Analítico

- Métricas em tempo real:
  - Total de mentores, alunos e apoiadores cadastrados
  - Distribuição de especialidades disponíveis
  - Top 5 interesses dos alunos
- Visualização clara de dados para tomada de decisão

### 🎨 Interface e UX

- Design responsivo (mobile-first)
- Animações de entrada em cascata para melhor experiência
- Validações client-side e server-side
- Breadcrumbs de navegação
- Flash messages informativos
- Estados de erro visuais em formulários

---

## 🛠️ Tecnologias Utilizadas

### Backend

- **Ruby** 3.3.6
- **Rails** 8.0.0
  - Active Record para ORM
  - Turbo para navegação SPA-like
  - Action Controller para rotas REST

### Frontend

- **Tailwind CSS** 3.x (via CDN)
  - Sistema de design consistente
  - Utilitários responsivos
  - Customização de paleta de cores (brand orange)
- **JavaScript Vanilla**
  - Animações em cascata
  - Menu mobile interativo

### Banco de Dados

- **SQLite3** - desenvolvimento e MVP
- Schema com 3 entidades principais: `mentors`, `students`, `supporters`

### Arquitetura

- **MVC** (Model-View-Controller)
- **Service Objects** para lógica de negócio complexa (`Matching::StudentMatcher`)
- **Helpers** para reuso de código de apresentação (breadcrumbs, links ativos)

---

## 💻 Como Usar

### Fluxo Principal

1. **Cadastro de Mentor**
   - Acesse "Sou Mentor" no menu superior
   - Preencha: Nome completo, Especialidade, Bio, Disponibilidade, E-mail
   - Todos os campos exceto Bio e Disponibilidade são obrigatórios

2. **Cadastro de Aluno**
   - Clique em "Sou Aluno" no hero da home
   - Informe: Nome, Interesses (separados por vírgula), Objetivo de aprendizagem, Nível
   - Campos obrigatórios: Nome, Interesses, Objetivo, E-mail

3. **Cadastro de Apoiador**
   - Use "Quero Apoiar" no menu
   - Registre: Nome da organização, Tipo de apoio, Contato
   - Todos os campos são obrigatórios

4. **Visualizar Conexões**
   - Navegue para "Conexões" no menu
   - Veja sugestões automáticas de mentor para cada aluno
   - Score de compatibilidade exibido para cada match

5. **Dashboard**
   - Home apresenta métricas consolidadas
   - Distribuição de expertises dos mentores
   - Top interesses dos alunos

---

## 📂 Estrutura do Projeto

```
app/
├── controllers/
│   ├── home_controller.rb          # Dashboard e métricas
│   ├── mentors_controller.rb       # CRUD de mentores
│   ├── students_controller.rb      # CRUD de alunos
│   ├── supporters_controller.rb    # CRUD de apoiadores
│   ├── matches_controller.rb       # Lógica de conexões
│   └── pages_controller.rb         # Páginas estáticas (Sobre)
├── models/
│   ├── mentor.rb                   # Validações e lógica de mentor
│   ├── student.rb                  # Validações, interests_tokens helper
│   └── supporter.rb                # Validações de apoiador
├── services/
│   └── matching/
│       └── student_matcher.rb      # Algoritmo de matching
├── views/
│   ├── layouts/
│   │   └── application.html.erb    # Layout principal com navbar
│   ├── home/
│   │   ├── index.html.erb          # Dashboard home
│   │   └── _dashboard.html.erb     # Partial de métricas
│   ├── mentors/                    # Views CRUD mentores
│   ├── students/                   # Views CRUD alunos
│   ├── supporters/                 # Views CRUD apoiadores
│   ├── matches/
│   │   └── index.html.erb          # Listagem de conexões
│   └── pages/
│       └── about.html.erb          # Página institucional
└── helpers/
    └── application_helper.rb       # breadcrumb, nav_link_class

db/
├── migrate/                        # Migrations das tabelas
├── schema.rb                       # Schema consolidado
└── seeds.rb                        # Dados de exemplo

config/
├── routes.rb                       # Rotas da aplicação
└── database.yml                    # Configuração SQLite
```

---

## 🧪 Testando o Sistema

### Dados de Exemplo (seeds)

Após `rails db:seed`, você terá:

**Mentores:**
- Carlos Silva - Python (Noites e finais de semana)
- Ana Costa - Design UX (Tardes)
- João Ferreira - Lógica de Programação (Manhãs)

**Alunos:**
- Maria Santos - Interesses: Python, lógica (Iniciante)
- Pedro Alves - Interesses: Design UX (Intermediário)
- Luciana Souza - Interesses: Lógica, Python, dados (Iniciante)

**Apoiadores:**
- Igreja Batista Central - Espaço físico
- ONG TechParaTodos - Equipamentos e lanches

### Testando o Matching

1. Acesse `/conexoes`
2. Veja as sugestões automáticas:
   - Maria será conectada com Carlos (Python + alta compatibilidade)
   - Pedro com Ana (Design UX)
   - Luciana com João ou Carlos (múltiplos interesses)

---

## 🔧 Configuração Avançada

### Variáveis de Ambiente (opcional)

Para produção, considere configurar:

```bash
# .env (não commitado)
DATABASE_URL=postgresql://user:pass@host:5432/dbname
SECRET_KEY_BASE=your_secret_key
RAILS_ENV=production
```

### Deploy

O projeto está pronto para deploy em plataformas como:

- **Heroku**: `Procfile` com Puma configurado
- **Fly.io**: Dockerfile incluído
- **Render**: Suporte nativo a Rails

---

## 📞 Contato

**Alan Carlos Jorge de Oliveira**
📧 Email: alancjobm@gmmail.com
🎓 Instituição: Centro Universitário Internacional UNINTER
📚 Curso: Análise e Desenvolvimento de Sistemas

---

## 🙏 Agradecimentos

- Comunidade de Barra Mansa/RJ
- ONGs e escolas locais que demonstraram interesse na iniciativa
- Professores da UNINTER pelo suporte acadêmico
- Comunidade Ruby on Rails Brasil

---

<div align="center">

**Feito por [Alan Carlos Jorge de Oliveira](https://github.com/alancjo)**

⭐ Se este projeto te ajudou, considere dar uma estrela!

</div>
