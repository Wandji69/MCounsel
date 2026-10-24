# Couple Conversations

A practice app for engaged couples to answer difficult questions in private, then see a partner's status without seeing their words.

This repository currently contains the phase 0 decisions and a Flutter prototype. The prototype runs on the Pixel 9 emulator. It does not create accounts, store answers on disk, or call a server or an AI provider. Do not type real relationship information.

## Decisions

- [Phase 0 boundaries](docs/decisions/0001-phase0-boundaries.md)
- [Privacy and consent](docs/policies/privacy-and-consent.md)
- [Safety and high-risk topics](docs/policies/safety-and-high-risk.md)
- [Disconnect and retention](docs/policies/disconnect-and-retention.md)
- [Interview guide](docs/research/interview-guide.md) — interviews have not been done
- [Question catalog](assets/content/engaged_questions_v1.json) — draft, not expert-reviewed

## Run the prototype

Flutter SDK: `$HOME/develop/flutter`. Android SDK: `$HOME/Android/Sdk`, with the existing `Pixel_9` emulator. In Android Studio, install the Flutter and Dart plugins and set the Flutter SDK path to `$HOME/develop/flutter`.

```bash
export PATH="$HOME/develop/flutter/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"

flutter pub get
flutter analyze
flutter test
flutter emulators --launch Pixel_9
flutter run -d emulator
```

Open the project folder in Android Studio and choose the Pixel 9 device to run the same app from the IDE.
