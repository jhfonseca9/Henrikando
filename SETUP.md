# Setup & Installation Guide - Henrikando

## 📋 Pré-requisitos

Antes de começar, certifique-se de que você tem instalado:

- **Flutter SDK**: 3.x ou superior ([Instalar](https://flutter.dev/docs/get-started/install))
- **Dart SDK**: 3.x (incluído no Flutter)
- **Git**: ([Instalar](https://git-scm.com/))
- **Firebase CLI**: ([Instalar](https://firebase.google.com/docs/cli))
- **Xcode** (macOS/iOS): Versão 12.0+
- **Android Studio** (Android): Versão 4.1+

## 🚀 Instalação

### 1. Clone o Repositório

```bash
git clone https://github.com/jhfonseca9/Henrikando.git
cd Henrikando
```

### 2. Instale as Dependências Flutter

```bash
cd app
flutter pub get
```

### 3. Configure o Firebase

#### Opção A: Usar Firebase Console (Recomendado)

1. Acesse [Firebase Console](https://console.firebase.google.com/)
2. Crie um novo projeto
3. Registre um app Flutter
4. Baixe `google-services.json` (Android) e `GoogleService-Info.plist` (iOS)
5. Coloque os arquivos nos respectivos diretórios

#### Opção B: Usar FlutterFire CLI (Mais Fácil)

```bash
# Instale o FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure o Firebase
flutterfire configure
```

Siga as instruções. O FlutterFire vai gerar automaticamente:
- `lib/core/firebase_options.dart`
- Configurações do Android
- Configurações do iOS

### 4. Habilite Autenticação Firebase

1. Firebase Console → Autenticação
2. Ative "Email/Senha"
3. Configure a URL de redirecionamento (para recuperação de senha)

### 5. Configure Firestore

1. Firebase Console → Firestore Database
2. Crie um banco de dados (modo produção recomendado)
3. As regras de segurança estão em `backend/firestore.rules`

#### Deploy das Regras

```bash
cd backend
firebase deploy --only firestore:rules
```

### 6. Configure o Emulador (Opcional - Desenvolvimento Local)

```bash
# Instale o emulador
firebase emulators:start --only firestore,auth

# Em outro terminal, rode o app
flutter run
```

## 🏃 Executando a Aplicação

### iOS

```bash
flutter run -d ios
```

**Nota**: Primeira execução pode levar alguns minutos.

### Android

```bash
flutter run -d android
```

### Web (Futuro)

```bash
flutter run -d chrome
```

## 📱 Testando em Dispositivo Real

### iOS

1. Conecte seu iPhone via USB
2. Execute: `flutter run -d ios`

### Android

1. Ative "Depuração USB" nas Configurações do Desenvolvedor
2. Conecte via USB
3. Execute: `flutter run -d android`

## 🔍 Verificando a Instalação

```bash
# Verifica se tudo está configurado corretamente
flutter doctor

# Verifica a análise estática do código
flutter analyze

# Formata o código
flutter format .
```

## 📦 Estrutura de Pastas

```
app/
├── lib/
│   ├── core/
│   │   └── firebase_options.dart        # Config Firebase (gerado)
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── transaction_model.dart
│   │   ├── category_model.dart
│   │   └── report_model.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── transaction_service.dart
│   │   ├── category_service.dart
│   │   └── report_service.dart
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── home_screen.dart
│   │   ├── add_transaction_screen.dart
│   │   ├── transactions_screen.dart
│   │   ├── reports_screen.dart
│   │   ├── settings_screen.dart
│   │   └── reset_password_screen.dart
│   └── main.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
└── pubspec.yaml
```

## 🛠️ Solução de Problemas

### "FlutterError: Unable to load asset"
- Verifique se os assets estão listados em `pubspec.yaml`
- Execute: `flutter pub get`

### "Firebase App is not initialized"
- Confirme que `FlutterFire` foi configurado
- Verifique `firebase_options.dart`

### "Erro de autenticação do Firebase"
- Verifique as regras em `backend/firestore.rules`
- Confirme que a autenticação está habilitada no Firebase

### "Port 8080 is already in use"
- Feche outros emuladores ou processos
- Use outro port: `firebase emulators:start --only firestore,auth --export-on-exit`

## 📚 Próximas Etapas

1. **Configure suas credenciais Firebase** (`firebase_options.dart`)
2. **Implemente os serviços** (expandir lógica existente)
3. **Crie testes unitários** (`test/` folder)
4. **Teste em dispositivos reais**
5. **Faça deploy no Firebase Hosting** (opcional)

## 🚀 Deploy

### Play Store (Android)

```bash
cd app
flutter build apk --release
# ou
flutter build appbundle --release
```

### App Store (iOS)

```bash
cd app
flutter build ipa --release
```

Siga a documentação oficial para fazer upload nas lojas.

## 📞 Suporte

- Documentação: [docs/](../docs/)
- Issues: [GitHub Issues](https://github.com/jhfonseca9/Henrikando/issues)
- Discussões: [GitHub Discussions](https://github.com/jhfonseca9/Henrikando/discussions)

---

**Pronto!** Você está pronto para começar a desenvolver no Henrikando! 🎉
