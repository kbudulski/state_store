:: dependencies
cd dependencies/firebase_dependencies
call flutter pub get

cd ../../dependencies/shared_assets
call flutter pub get

cd ../../dependencies/shared_dependencies
call flutter pub get

:: repositories
cd ../../repositories/authentication_repository
call flutter pub get

cd ../../repositories/firestore_user_repository
call flutter pub get

cd ../../repositories/notification_repository
call flutter pub get

cd ../../repositories/realtime_chat_repository
call flutter pub get

:: services
cd ../../services/firebase_service
call flutter pub get
cd ../../services/notification_service
call flutter pub get

:: styleguide
cd ../../styleguide
call flutter pub get

:: apps
cd ../apps/bloc_app
call flutter pub get

cd ../../apps/provider_app
call flutter pub get

cd ../../apps/riverpod_app
call flutter pub get



