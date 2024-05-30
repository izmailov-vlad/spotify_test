#!/bin/bash

# Убедимся, что скрипт завершится при ошибке
set -e

# Цветовые коды
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Анимация загрузки
spinner() {
  local pid=$1
  local delay=0.75
  local spinstr='/-\|'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

# Функция для извлечения текущей версии и номера билда из pubspec.yaml
get_version_and_build_number() {
  local version_line=$(grep 'version:' pubspec.yaml)
  local version=$(echo $version_line | sed 's/version: //')
  local base_version=$(echo $version | cut -d'+' -f1)
  local build_number=$(echo $version | grep -o '+[0-9]*' | cut -d'+' -f2)

  if [ -z "$build_number" ]; then
    build_number=1
  else
    build_number=$((build_number + 1))
  fi

  echo "$base_version $build_number"
}

# Функция для создания папки "changelog", если она не существует
create_changelog_directory() {
  if [ ! -d "changelog" ]; then
    mkdir "changelog"
    echo -e "${BLUE}📁 Создана папка changelog${NC}"
  fi
}

# Основная логика
main() {
  echo -e "${BLUE}📁 Проверка и создание папки changelog${NC}"
  # Создание папки "changelog", если она не существует
  create_changelog_directory

  echo -e "${BLUE}🔍 Получение текущей версии и номера билда из pubspec.yaml${NC}"
  # Получение текущей версии и номера билда из pubspec.yaml
  spinner $$ &
  pid=$!
  read -r VERSION BUILD_NUMBER <<< $(get_version_and_build_number)
  kill $pid
  echo -e "${BLUE}🎉 Успешно получены данные о версии и номере билда${NC}"

  # Формирование заголовка для changelog
  CHANGELOG_HEADER="stage_release-v${VERSION}+${BUILD_NUMBER}"
  echo -e "${BLUE}📝 Сформирован заголовок для changelog${NC}"

  # Генерация changelog начиная с последнего unreleased_version, соответствующего шаблону
  echo -e "${BLUE}⚙️ Генерация changelog начиная с последнего unreleased_version, соответствующего шаблону${NC}"
  spinner $$ &
  pid=$!
  if ! npx cz changelog --unreleased-version="$CHANGELOG_HEADER" --file-name "changelog/$CHANGELOG_HEADER.md"; then
    kill $pid
    echo -e "${RED}❌ Ошибка: Не удалось сгенерировать changelog.${NC}"
    exit 1
  fi

  # Обновление версии в pubspec.yaml
  echo -e "${BLUE}🔄 Обновление версии в pubspec.yaml${NC}"
  spinner $$ &
  pid=$!
  if ! sed -i "" "s/version: .*/version: ${VERSION}+${BUILD_NUMBER}/" pubspec.yaml; then
    kill $pid
    echo -e "${RED}❌ Ошибка: Не удалось обновить версию в pubspec.yaml.${NC}"
    exit 1
  fi

  kill $pid
  echo -e "${GREEN}✅ Успешно обновлена версия в pubspec.yaml${NC}"
}

main "$@"
