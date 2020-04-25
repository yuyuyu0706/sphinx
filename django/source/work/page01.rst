##############################
Django 環境の構築
##############################

Django を導入する際の初期構築テンプレートを整備する

ディレクトリ構造
===================

デフォルトはPROJECT_ROOT にアプリケーションを並べるが、  
アプリケーションを「apps」配下に並べるようにsettings.py にてカスタマイズしている
::

    PROJECT_ROOT
    └── servers
    ├── apps
    │   ├── directoryindex
    │   │   ├── __init__.py
    │   │   ├── __pycache__
    │   │   ├── admin.py
    │   │   ├── apps.py
    │   │   ├── migrations
    │   │   │   └── __init__.py
    │   │   ├── models.py
    │   │   ├── tests.py
    │   │   ├── urls.py
    │   │   ├── views.py
    │   │   └── views.py_org
    │   └── polls
    │       ├── __init__.py
    │       ├── __pycache__
    │       ├── admin.py
    │       ├── apps.py
    │       ├── migrations
    │       │   ├── 0001_initial.py
    │       │   ├── __init__.py
    │       │   └── __pycache__
    │       ├── models.py
    │       ├── templates
    │       │   └── polls
    │       │       ├── detail.html
    │       │       └── index.html
    │       ├── tests.py
    │       ├── urls.py
    │       └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── servers
        ├── __init__.py
        ├── __pycache__
        ├── settings.py
        ├── settings.py_org
        ├── urls.py
        ├── urls.py_org
        └── wsgi.py


コマンドまとめ
===================

バージョン確認
--------------
::

    python -m django --version 2.2.12

アプリケーション作成
-------------------
manage.py と同じディレクトリで作成したくない為、apps内で実行します。
::

    python ../manage.py startapp polls


