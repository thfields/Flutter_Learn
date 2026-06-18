# Flutter Learn - Concepts & Practices

Este projeto é um laboratório prático desenvolvido para consolidar os fundamentos e as melhores práticas de desenvolvimento mobile utilizando Flutter. O foco principal está na estruturação de interface, navegação e integração com dados externos e locais.

## 🚀 Funcionalidades e Aprendizados

* **Consumo de API REST:** Integração assíncrona com APIs públicas utilizando o pacote http, com tratamento de estados de carregamento e exibição de dados dinâmicos na UI.
* **Armazenamento Local:** Implementação de persistência de dados no dispositivo utilizando shared_preferences, permitindo simular sessões de login e manter as preferências do usuário ativas mesmo após o fechamento do aplicativo.
* **Gerenciamento de Estado Reativo:** Uso de ChangeNotifier e AnimatedBuilder para controle de estado global, aplicando a inversão de dependência na injeção do tema (Light/Dark Mode).
* **UI/UX (Material Design):** Construção de interfaces responsivas utilizando Scaffold, Drawer customizado, ListView e gerenciamento de navegação fluida entre telas (Rotas).

## 🛠️ Tecnologias Utilizadas

* Flutter & Dart (Versão 3.x)
* http (Requisições de rede)
* shared_preferences (Cache e persistência local)
* Material Components

## ⚙️ Como executar o projeto

1. Clone o repositório:
git clone https://github.com/thfields/Flutter_Learn.git

2. Instale as dependências:
flutter pub get

3. Execute o aplicativo:
flutter run