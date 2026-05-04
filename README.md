# Baby Lia Starter

Starter Flutter project for **Baby Lia**, a safe AI learning companion for kids.

## Product Summary

Baby Lia is designed as a guided educational character app, not an unrestricted chatbot.

The current starter includes:

- multi-page onboarding
- visual home hub
- guided talk flow
- lesson modules
- rewards and progress state
- parent area settings
- local persistence

## Current Learning Modules

- Talk with Lia
- Colors
- Numbers
- Shapes
- Feelings
- Animals
- Body Parts
- First Words
- Listening Time
- Rewards

## Tech Stack

- Flutter
- Provider
- SharedPreferences

## Project Structure

```text
lib/
  app/
  core/
    models/
    progress/
    safety/
    settings/
  features/
    animals/
    body_parts/
    colors/
    feelings/
    first_words/
    home/
    listening_time/
    numbers/
    parent_area/
    rewards/
    shapes/
    talk/
    welcome/
  shared/
    widgets/
```

## Run

```bash
flutter pub get
flutter run
```

## Quality Check

```bash
flutter analyze
```

## MVP Status

Implemented:

- onboarding flow
- guided learning home
- lesson screens
- guided topic chat
- progress and badges
- parent settings
- local persistence

Still needed:

- real AI service interface
- stronger parent gate
- polished visual assets
- widget tests
- store-ready app branding

## Next Build Priorities

1. Real AI service abstraction
2. Stronger parent gate logic
3. Better lesson progression rules
4. Widget tests
5. Final branding assets
