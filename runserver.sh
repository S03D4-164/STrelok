#!/bin/bash

APP="strelok_app"
WEB="web"
PROJECT="compose"

if [ ! -f ./manage.py ];then
    django-admin startproject $PROJECT .
    cp $PROJECT/settings.py $PROJECT/settings.py.bk
    cat $PROJECT/settings.py.bk settings.example \
        | sed -e "s/^ROOT_URLCONF = 'compose.urls'//" \
            -e "s/db.backends.sqlite3/db.backends.postgresql/" \
            -e "s/os.path.join(BASE_DIR, 'db.sqlite3'),/'postgres','USER': 'postgres', 'HOST': 'db', 'PORT': 5432,/" \
        | tee compose/settings.py
    if [ -d $APP/migrations ];then
        rm -rfi $APP/migrations
    fi
    sleep 10
    python3 manage.py makemigrations $APP \
    && python3 manage.py migrate \
    && python3 manage.py loaddata $APP/fixtures/1/* $APP/fixtures/2/* \
    && python3 manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('strelok', '', 'strelok')"
    #python3 manage.py createsuperuser
fi

python3 manage.py runserver 0.0.0.0:8000
