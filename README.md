# Couple Conversations

A practice app for engaged couples to answer difficult questions in private, then see a partner's status without seeing their words.

This repository currently contains the phase 0 decisions and a Flutter prototype. The prototype keeps practice answers in memory. It does not create accounts, store answers on disk, or call a server or an AI provider. Do not type real relationship information.

The decided stack is a Flutter app, a Laravel API in `backend/`, and Supabase for Postgres and Auth. That split is recorded in [0002-laravel-and-supabase.md](docs/decisions/0002-laravel-and-supabase.md).

Phase 2 adds sign-in. The phone asks Supabase Auth for a session, then calls Laravel with that access token. Laravel returns only the signed-in profile. Practice answers still stay in memory. Do not type real relationship information.

## Decisions

- [Phase 0 boundaries](docs/decisions/0001-phase0-boundaries.md)
- [Laravel and Supabase](docs/decisions/0002-laravel-and-supabase.md)
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

## Run the API

Copy `backend/.env.example` to `backend/.env`, set `SUPABASE_JWT_SECRET` to the JWT secret from the Supabase project, and run migrations. The service-role key stays in that file. Do not pass it to Flutter.

```bash
cd backend
composer install
php artisan key:generate
php artisan migrate
php artisan test
php artisan serve --host=0.0.0.0 --port=8000
```

On a phone, point the app at this machine's address. The anon key is the public Supabase client key. It is not the service-role key.

```bash
flutter run -d <device-id> \
  --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=YOUR_ANON_KEY \
  --dart-define=API_BASE_URL=http://YOUR_COMPUTER_IP:8000
```

Apply [supabase/migrations/20261027180000_identity_rls.sql](supabase/migrations/20261027180000_identity_rls.sql) in the Supabase SQL editor after `php artisan migrate` has created the tables. A hosted Supabase project is still required before sign-in works on a phone. `php artisan test` covers the authorization rule locally.
