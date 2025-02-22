# supabase_playground
 


## How to run?

키를 환경변수로 주입해야하기에 batch파일을 만들거나 shell script를 작성해서 그걸로 실행해야합니다.


### on Windows

```batch
@echo off
flutter run --dart-define=SUPABASE_KEY=your_supabase_key
pause
```


### on MacOS & Linux

```sh
#!/bin/bash
flutter run --dart-define=SUPABASE_KEY=your_supabase_key
```


## SHA-1 얻는 방법

```bash
# macOS/Linux
cd android
./gradlew signingReport

# Windows
cd android
gradlew signingReport
```