##############################
Django 環境の構築
##############################

| Django を導入する際の初期構築テンプレートを整備する

ディレクトリ構造
===================

| デフォルトでは、PROJECT_ROOT にアプリケーションを並べる。
| 以下では、アプリケーションを「apps」配下に並べるよう、settings.py をカスタマイズしている

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

**バージョン確認**
::
    python -m django --version 2.2.12

**アプリケーション作成**
* manage.py と同じディレクトリで作成したくない為、apps内で実行します。

::

    python ../manage.py startapp polls

**サーバ起動**
::

    python manage.py runserver
    python manage.py runserver 8080   # ポート番号を変える場合


マイグレーション関連
**************************
**マイグレーション一覧確認**
* [X] が付いてるとマイグレーション済

::
    python manage.py showmigtaions

**マイグレーションファイル作成**
::

    python manage.py makemigtations

**マイグレーションするSQLを確認**
::

    python manage.py sqlmigrate アプリ名 マイグレーションID

**データベース反映**
::

    python manage.py migrate

* `マイグレーションまとめ <https://qiita.com/okoppe8/items/c9f8372d5ac9a9679396>`_


管理サイト作成
===================
* settings.py の INSTALL_APPS で定義している機能。必要なければ実施しなくても良い。

**スーパーユーザの作成**
::
    python manage.py createsuperuser


エラー対策
=======================

django.db.utils.OperationalError: no such table: "テンプレート名"
***********************************************************************
* データベースにテーブルが存在しない
* models.py に class を書いて、migration することで解決した (2020/4/27 directoryindex)


参考資料
============

* `Djangoプロジェクト チュートリアル <https://docs.djangoproject.com/ja/3.0/intro/tutorial01/>`_
* `Djangoプロジェクト構造のカスタマイズ（分割と構造化）-2018年2月9日 <https://qiita.com/aion/items/ca375efac5b90deed382#%E3%82%B3%E3%83%B3%E3%83%95%E3%82%A3%E3%82%B0%E7%B3%BB>`_
* `DjangoのAppをプロジェクトルート以外に配置する-2017年11月27日 <https://blog.daisukekonishi.com/post/django-app-some-path/>`_




