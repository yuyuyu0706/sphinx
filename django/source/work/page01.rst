##############################
Django 環境の構築
##############################

* Django を導入する際の初期構築テンプレートを整備する

ディレクトリ構造
===================

* デフォルトでは、PROJECT_ROOT にアプリケーションを並べる。
* 以下では、アプリケーションを「apps」配下に並べるよう、settings.py をカスタマイズしている

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
    │   │   ├── static
    │   │   │   ├── css
    │   │   │   ├── js
    │   │   │   └── main.css
    │   │   ├── templates
    │   │   │   └── directoryindex
    │   │   │       ├── uploadfile_list.html
    │   │   │       └── uploadfile_list.html_org
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
    ├── media
    └── servers
        ├── __init__.py
        ├── __pycache__
        ├── settings.py
        ├── settings.py_org
        ├── urls.py
        ├── urls.py_org
        └── wsgi.py

ディレクトリ概説
--------------------
* アプリケーション配置先を BASE_DIRからappsフォルダに変更する

  * `BASE_DIRについて <https://codor.co.jp/django/about-basedir>`_
  * servers/settings.py の末尾に以下を追記する

::

  //変更後
  sys.path.insert(0, os.path.join(BASE_DIR, "apps"))

* `MEDIA_ROOTについて <https:>`_

* staticの配置 (CSS/JavaScript)

  * `bootstrap <https://getbootstrap.com/>`_

    * class を指定するだけで適用できるため便利

  * `Django staticファイル まとめ <https://qiita.com/okoppe8/items/38688fa9259f261c9440>`_
  * APP配下にstaticフォルダを作成して、CSS/JS資材を格納する
  * template でスタイルシートを指定する

::

    <head>
        <link rel="stylesheet" type="text/css" href="{% static 'css/bootstrap.css' %}"</link>
        <link rel="stylesheet" type="text/css" href="{% static 'main.css' %}"</link>
    </head>


コマンドまとめ
===================

初期構築
----------------------------------------

**バージョン確認**

* 自宅環境 v2.2.12
* 社用環境 v3.x.xx

::

    python -m django --version


**プロジェクト作成**

* インスタンス(runserver)の単位

::

    django-admin startproject プロジェクト名


**アプリケーション作成**

* manage.py と同じディレクトリで作成したくない為、apps内で実行します。

::

    python ../manage.py startapp polls


**サーバ起動**

::

    python manage.py runserver
    python manage.py runserver 8080   # ポート番号を変える場合


マイグレーション関連
----------------------------------------

**マイグレーション一覧確認**

* [X] が付いてるとマイグレーション済

::

    // 全アプリ指定
    python manage.py showmigrations

    // 特定アプリ指定
    python manage.py showmigrations lists

　　　 // 適用計画順に出力
　　　　python manage.py showmigrations --plan

* 出力例

::

    //　makemigration前
    (note) support@PC01:~/python/note/django/servers$ python manage.py showmigrations lists
    lists
     (no migrations)

    //　makemigration後
    (note) support@PC01:~/python/note/django/servers$ python manage.py showmigrations lists
    lists
     [ ] 0001_initial


**マイグレーションファイル作成**

::

    // 全アプリ指定
    python manage.py makemigrations

    // 特定アプリ指定
    python manage.py makemigrations lists


* 出力例

::

    (note) support@PC01:~/python/note/django/servers$ python manage.py makemigrations lists
    Migrations for 'lists':
      apps/lists/migrations/0001_initial.py
        - Create model Member


**マイグレーションするSQLを確認**

::

    python manage.py sqlmigrate アプリ名 マイグレーションID
    python manage.py sqlmigrate lists 0001


* 出力例

::

    (note) support@PC01:~/python/note/django/servers$ python manage.py sqlmigrate lists 0001
    BEGIN;
    --
    -- Create model Member
    --
    CREATE TABLE "lists_member" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "age" integer NOT NULL);
    COMMIT;


**データベース反映**

* データベース直接変更した場合、既存DBからの移行も --fakeオプションがあれば良さそう

::

    // 全アプリ指定
    python manage.py migrate

    // 特定アプリ指定
    python manage.py migrate lists

    // マイグレーションファイルの内容は実施せずしない
    // django_migrationsテーブルへの追記のみ実行する
    python manage.py migrate --fake


* 出力例

::

  (note) support@PC01:~/python/note/django/servers$ python manage.py migrate lists --fake
  Operations to perform:
    Apply all migrations: lists
  Running migrations:
    Applying lists.0001_initial... FAKED


* `マイグレーションまとめ <https://qiita.com/okoppe8/items/c9f8372d5ac9a9679396>`_
* `マイグレーション完全に理解した(基礎編) <https://note.crohaco.net/2018/django-migration/>`_


**静的ファイルの確認**

::

    python manage.py findstatic .


* 出力例

::

    (note) support@PC01:~/python/note/django/servers$ python manage.py findstatic .
    Found '.' here:
      /home/support/python/note/django/servers/apps/directoryindex/static
      /home/support/python/note/lib/python3.5/site-packages/django/contrib/admin/static


管理サイト作成
===================
* settings.py の INSTALL_APPS で定義している機能。必要なければ実施しなくても良い。

**スーパーユーザの作成**

::

    python manage.py createsuperuser

初期設定
=======================
* Django導入
* プロジェクト作成
* ディレクトリ設定

  * apps 配置先変更

    * servers/settings.py

* アプリケーション配置作成
* データベース設定

  * servers/settings.py

* グローバルURLパターン登録

  * servers/urls.py

* グローバルアプリケーション登録

  * servers/settings.py

* 初回起動

エラー対策
=======================

* django.db.utils.OperationalError: no such table: "テンプレート名"

  * データベースにテーブルが存在しない
  * models.py に class を書いて、migration することで解決した (2020/4/27 directoryindex)

* RuntimeError: Model class apps.lists.models.Member doesn't declare an explicit app_label and isn't in an application in INSTALLED_APPS.

  * view.py からのmodel.py指定を修正したら解消した(2020/6/28 lists)
  * from .models import Member →  from lists.models import Member

* django.template.exceptions.TemplateDoesNotExist: lists/member_list.html

  * `DjangoでTemplateDoesNotExistと言われたら <https://udomomo.hatenablog.com/entry/2018/08/14/234153>`_
  * テンプレート名はView で指定している
  * 汎用ビューの場合はデフォルトで "model名_ビュー由来.html" と名付ける模様

* django.db.utils.OperationalError: table "lists_member" already exists

  * 既にデータベースにTBLが作成されてオペレーションが通らないエラー
  * --fake でスキップさせると良い

* UnicodeDecodeError : 'utf-8' codec can't decode byte 0x83 in ~

  * テンプレートがsjisで格納してあった為、UTF8に直したら改善した
  * `DjangoでUnicodeDecodeErrorが出たときに確認すべきこと <https://qiita.com/yukhig/items/b57dac38299e0fd8793d>`_

実装パターン
=====================

* 最小限で実装をまとめる

テンプレートの使い方
--------------------------------

* view.py

::

  template = loader.get_template('directoryindex/uploadfile_list.html')
  context = {'fdict': fdict}
  return HttpResponse(template.render(context, request))

汎用ビューの使い方 - ListView
--------------------------------

* view.py

::

  from django.views.generic import ListView
  from lists.models import Member

  class NWListView(ListView):
      model = Member

* models.py

::

  from django.db import models

  class Member(models.Model):
      name = models.CharField(max_length=100)
      age = models.IntegerField()
 
      def __str__(self):
          return self.name

* `ListViewでモデルの一覧表示 <https://noumenon-th.net/programming/2019/11/15/django-listview/>`_


モデルが扱うテーブル名を指定する
------------------------------------------

::

  class xxxxx(models.Model):
    xxx = models.xxxx
    ~~
    class Meta:
      db_table = 'テーブル名'

* ` <https://ideal-user-interface.hatenablog.com/entry/20110105/1294225266>`_

Djangoアーキテクチャ
=============================

* View

  * HttpRequest オブジェクトを受け取り、 HttpResponse オブジェクトを返す機能
  * Http404 のような例外を返す機能

* Urls

  * urlpattarn から、Viewを呼ぶ機能

* Model


参考資料
============

* `Djangoプロジェクト チュートリアル <https://docs.djangoproject.com/ja/3.0/intro/tutorial01/>`_
* `Djangoプロジェクト構造のカスタマイズ（分割と構造化）-2018年2月9日 <https://qiita.com/aion/items/ca375efac5b90deed382#%E3%82%B3%E3%83%B3%E3%83%95%E3%82%A3%E3%82%B0%E7%B3%BB>`_
* `DjangoのAppをプロジェクトルート以外に配置する-2017年11月27日 <https://blog.daisukekonishi.com/post/django-app-some-path/>`_




