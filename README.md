# 📱 Task Manager Pro

Implementação em Flutter de um gerenciador de tarefas completo utilizando Material Design 3, sensores do dispositivo, câmera, GPS e mapas interativos.

## ✨ Funcionalidades

### 📝 Gerenciamento de Tarefas
- ✅ Criar, editar e excluir tarefas
- ✅ Marcar tarefas como completas
- ✅ Níveis de prioridade (Baixa, Média, Alta, Urgente)
- ✅ Descrição opcional para cada tarefa
- ✅ Data de criação automática

### 📷 Câmera e Galeria
- ✅ **Tirar fotos** com a câmera do dispositivo
- ✅ **Selecionar fotos da galeria**
- ✅ Visualizar fotos em tela cheia
- ✅ Armazenamento local das imagens
- ✅ Remover fotos anexadas

### 📍 GPS e Localização
- ✅ Adicionar localização às tarefas
- ✅ Obter localização atual automaticamente
- ✅ Geocodificação reversa (converter coordenadas em endereço)
- ✅ Filtrar tarefas por proximidade
- ✅ **Mapa interativo** com todas as tarefas
- ✅ Marcadores coloridos por prioridade no mapa
- ✅ Navegação para localização da tarefa

### 🗺️ Mapa Interativo
- ✅ Visualizar todas as tarefas com localização no mapa
- ✅ Marcadores personalizados por prioridade e status
- ✅ Detalhes da tarefa ao tocar no marcador
- ✅ Estatísticas em tempo real no mapa

### 📳 Sensores
- ✅ Detecção de shake (agitar o celular)
- ✅ Completar tarefas por shake
- ✅ Feedback tátil (vibração)

### 🎨 Interface
- ✅ Design moderno com Material Design 3
- ✅ Filtros de tarefas (Todas, Pendentes, Concluídas)
- ✅ Cards coloridos por prioridade
- ✅ Animações e transições suaves
- ✅ Estatísticas visuais

## 🛠️ Tecnologias Utilizadas

- **Flutter** & **Dart**
- **sqflite** - Banco de dados local
- **camera** - Acesso à câmera
- **image_picker** - Seleção de imagens da galeria
- **geolocator** & **geocoding** - GPS e geolocalização
- **google_maps_flutter** - Mapas interativos
- **sensors_plus** - Acelerômetro
- **vibration** - Feedback tátil

## 🚀 Como Executar

### 1. Instale as dependências
```bash
flutter pub get
```

### 2. Execute o aplicativo
```bash
flutter run
```

## 📊 Estrutura do Projeto

```
lib/
├── main.dart
├── models/
│   └── task.dart
├── screens/
│   ├── task_list_screen.dart
│   ├── task_form_screen.dart
│   ├── camera_screen.dart
│   └── map_screen.dart          # 🗺️ NOVO
├── services/
│   ├── database_service.dart
│   ├── camera_service.dart      # 📷 Atualizado com galeria
│   ├── location_service.dart
│   └── sensor_service.dart
└── widgets/
    ├── task_card.dart
    └── location_picker.dart
```

## 📱 Permissões Necessárias

- 📷 Câmera
- 📍 Localização (GPS)
- 📳 Vibração
- 🖼️ Galeria de fotos

## 🐛 Solução de Problemas

**Erro de banco de dados**: Se encontrar erro de colunas ausentes, desinstale e reinstale o app completamente.

**Mapa não aparece**: Verifique se você configurou a API Key do Google Maps corretamente.

## 📝 Licença

MIT License - veja [LICENSE](LICENSE) para mais detalhes.
