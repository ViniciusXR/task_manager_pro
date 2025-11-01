# 📱 Task Manager Pro

Implementação em Flutter de um gerenciador de tarefas completo utilizando Material Design 3, sensores do dispositivo, câmera, GPS e mapas interativos.

## ✨ Funcionalidades

### 📝 Gerenciamento de Tarefas
- ✅ Criar, editar e excluir tarefas
- ✅ Marcar tarefas como completas
- ✅ Níveis de prioridade (Baixa, Média, Alta, Urgente)
- ✅ Descrição opcional para cada tarefa
- ✅ Data de criação automática

### 📷 Câmera e Galeria (Funcionalidade 1: Galeria de Fotos)
- ✅ **Tirar fotos** com a câmera do dispositivo
- ✅ **Selecionar foto da galeria** (seleção única)
- ✅ **Selecionar múltiplas fotos da galeria** (Funcionalidade 4: Múltiplas Fotos)
- ✅ Visualizar fotos em galeria interativa
- ✅ Swipe entre fotos com navegação fluida
- ✅ Zoom e pan nas fotos
- ✅ Armazenamento local das imagens
- ✅ Remover fotos individuais ou todas de uma vez
- ✅ Miniaturas com scroll horizontal
- ✅ Contador visual de fotos

### 📍 GPS e Localização
- ✅ Adicionar localização às tarefas
- ✅ Obter localização atual automaticamente
- ✅ Geocodificação reversa (converter coordenadas em endereço)

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
- **image_picker** - Seleção de imagens da galeria (Funcionalidade 1)
- **geolocator** & **geocoding** - GPS e geolocalização
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
│   └── task.dart                # Modelo com suporte a múltiplas fotos
├── screens/
│   ├── task_list_screen.dart
│   ├── task_form_screen.dart    # Com galeria de fotos
│   └── camera_screen.dart
├── services/
│   ├── database_service.dart    # v6 com suporte a photoPaths
│   ├── camera_service.dart      # 📷 Com seleção múltipla de galeria
│   ├── location_service.dart
│   └── sensor_service.dart
└── widgets/
    ├── task_card.dart           # Com preview de múltiplas fotos
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

---

## 📸 Screenshots

*As screenshots serão adicionadas em breve...*

<!-- Espaço reservado para screenshots das funcionalidades:
- Tela inicial com lista de tarefas
- Formulário de criação/edição de tarefa
- Galeria de fotos (múltiplas fotos)
- Seleção de foto da galeria
- Visualização de foto em tela cheia
- Card de tarefa com múltiplas fotos
- Detalhes de tarefa com localização
- Sensor de shake em ação
-->

---

## 🎯 Funcionalidades Desenvolvidas - Laboratório 3

Este projeto implementou as seguintes funcionalidades solicitadas:

### 1️⃣ Galeria de Fotos
**Descrição:** Adicione opção de selecionar foto da galeria além da câmera.

**Implementação:**
- ✅ Integração com `image_picker` para acesso à galeria do dispositivo
- ✅ Método `pickFromGallery()` no `CameraService`
- ✅ Modal com 3 opções: Câmera, Galeria (Múltiplas), Galeria (Única)
- ✅ Seleção individual de foto da galeria
- ✅ Compressão e redimensionamento automático (1920x1080, 85% qualidade)
- ✅ Armazenamento em diretório local do app

**Arquivos modificados:**
- `lib/services/camera_service.dart` - Adicionado `pickFromGallery()`
- `lib/screens/task_form_screen.dart` - Integração com galeria

### 4️⃣ Múltiplas Fotos
**Descrição:** Permita adicionar várias fotos por tarefa com galeria.

**Implementação:**
- ✅ Modelo `Task` alterado de `String? photoPath` para `List<String> photoPaths`
- ✅ Método `pickMultipleFromGallery()` para seleção múltipla
- ✅ Banco de dados atualizado (v5 → v6) com coluna `photoPaths`
- ✅ Migração automática de dados antigos
- ✅ Interface com scroll horizontal de miniaturas (120x120px)
- ✅ Botão "+" para adicionar mais fotos
- ✅ Botão "X" em cada miniatura para remover
- ✅ Botão "Limpar" para remover todas as fotos
- ✅ Galeria fullscreen com swipe entre fotos
- ✅ Zoom interativo (pinça para zoom in/out)
- ✅ Contador de fotos: "Fotos (N)"
- ✅ Preview inteligente no card:
  - 1 foto: imagem completa
  - 2-4 fotos: grid 2x2
  - +4 fotos: grid 2x2 com overlay "+N"
- ✅ Widget `_PhotoGalleryScreen` para visualização fullscreen
- ✅ Excluir foto individual na galeria

**Arquivos modificados:**
- `lib/models/task.dart` - Novo campo `List<String> photoPaths`
- `lib/services/database_service.dart` - Migração v5→v6
- `lib/services/camera_service.dart` - Método `pickMultipleFromGallery()`
- `lib/screens/task_form_screen.dart` - UI completa de galeria
- `lib/widgets/task_card.dart` - Preview de múltiplas fotos
- `lib/screens/task_list_screen.dart` - Deletar múltiplas fotos

**Destaques técnicos:**
- Armazenamento em banco: paths separados por `|` (pipe)
- Conversão automática: `String ↔ List<String>`
- Performance otimizada com lazy loading
- UX intuitiva com gestos (swipe, zoom)
- Feedback visual (contador, badges, overlay)

---

## 🔧 Detalhes Técnicos

### Migração do Banco de Dados

**Versão 5 → Versão 6:**
```sql
-- Adicionada coluna photoPaths
ALTER TABLE tasks ADD COLUMN photoPaths TEXT;

-- Migração de dados antigos (photoPath → photoPaths)
UPDATE tasks SET photoPaths = photoPath WHERE photoPath IS NOT NULL;
```

### Formato de Armazenamento
```dart
// Lista de paths
['path1.jpg', 'path2.jpg', 'path3.jpg']

// Armazenado como string no banco
'path1.jpg|path2.jpg|path3.jpg'
```

### Estrutura da Galeria
```
TaskFormScreen
├── ListView.horizontal (miniaturas)
│   ├── Foto 1 [X]
│   ├── Foto 2 [X]
│   ├── Foto 3 [X]
│   └── [+] Adicionar
└── _PhotoGalleryScreen (fullscreen)
    └── PageView (swipe)
        ├── InteractiveViewer (zoom)
        ├── Contador "N / Total"
        └── Botão Delete
```

---

## 🐛 Solução de Problemas

**Erro de banco de dados**: Se encontrar erro de colunas ausentes, desinstale e reinstale o app completamente com:
```bash
flutter run --uninstall-first
```

**Fotos não aparecem**: Verifique se as permissões de câmera e galeria foram concedidas.

**Erro ao selecionar múltiplas fotos**: Certifique-se de que o `image_picker` está atualizado:
```bash
flutter pub upgrade image_picker
```

**Imagens não sendo adicionadas**: Certifique-se de que o modal está retornando o resultado corretamente. O problema foi corrigido removendo `Navigator.pop()` duplicados no `CameraService`.

---

## 👨‍💻 Desenvolvido por

**Vinicius Xavier Ramalho**
- Disciplina: Laboratório de Desenvolvimento de Aplicações Móveis e Distribuídas
- Instituição: PUC Minas

---

