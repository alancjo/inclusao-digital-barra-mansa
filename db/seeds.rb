puts "Limpando dados..."
Student.destroy_all
Mentor.destroy_all
Supporter.destroy_all

puts "Criando mentores..."
Mentor.create!(
  full_name: 'Carlos Silva',
  expertise: 'Python',
  bio: 'Desenvolvedor backend focado em APIs e automações. Mentor voluntário apaixonado por ensino colaborativo.',
  availability: 'Sábados manhã',
  contact_info: 'carlos.silva@example.com'
)
Mentor.create!(
  full_name: 'Ana Beatriz',
  expertise: 'Design',
  bio: 'UI/UX designer com experiência em projetos sociais e acessibilidade digital.',
  availability: 'Quartas noite',
  contact_info: 'ana.beatriz@example.com'
)
Mentor.create!(
  full_name: 'João Pereira',
  expertise: 'Lógica',
  bio: 'Professor de lógica e raciocínio computacional. Focado em bases sólidas para iniciantes.',
  availability: 'Sábados tarde',
  contact_info: 'joao.pereira@example.com'
)

puts "Criando apoiadores..."
Supporter.create!(
  name: 'Associação de Moradores Bairro Centro',
  support_type: 'Doação de espaço',
  contact_info: 'contato@associacao-centro.org'
)
Supporter.create!(
  name: 'Padaria Bom Pão',
  support_type: 'Lanche',
  contact_info: 'padariabompao@example.com'
)

puts "Criando alunos..."
Student.create!(
  full_name: 'Maria Souza',
  interests: 'Python, lógica',
  learning_goal: 'Quero aprender programação básica para automatizar tarefas domésticas e planilhas.',
  availability: 'Sábados manhã',
  contact_info: 'maria.souza@example.com',
  proficiency_level: 'iniciante'
)
Student.create!(
  full_name: 'Pedro Alves',
  interests: 'Design UX, acessibilidade',
  learning_goal: 'Desejo criar interfaces simples e acessíveis para aplicativos comunitários.',
  availability: 'Quartas noite',
  contact_info: 'pedro.alves@example.com',
  proficiency_level: 'iniciante'
)
Student.create!(
  full_name: 'Luciana Ribeiro',
  interests: 'Lógica, Python, dados',
  learning_goal: 'Aprender lógica e fundamentos de análise de dados para projetos locais.',
  availability: 'Sábados tarde',
  contact_info: 'luciana.ribeiro@example.com',
  proficiency_level: 'intermediario'
)

puts "Seed concluído."
