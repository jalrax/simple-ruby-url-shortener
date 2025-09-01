#!/bin/bash

# Скрипт для миграции репозитория с GitLab на GitHub

echo "Этот скрипт поможет вам перенести репозиторий с GitLab на GitHub"
echo "Убедитесь, что у вас создан пустой репозиторий на GitHub"

# Добавление GitHub как удаленного репозитория
echo "Добавление GitHub remote..."
git remote add github https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git

# Показать текущие remote
echo "Текущие remote репозитории:"
git remote -v

# Push всех веток
echo "Отправка всех веток на GitHub..."
git push github --all

# Push всех тегов
echo "Отправка всех тегов на GitHub..."
git push github --tags

echo "Миграция завершена!"
echo "Теперь вы можете:"
echo "1. Изменить origin на GitHub: git remote set-url origin https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git"
echo "2. Удалить GitLab remote: git remote remove origin"
echo "3. Переименовать github в origin: git remote rename github origin"