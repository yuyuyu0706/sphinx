##############################
Django アプリケーション開発
##############################

DirectoryIndex
=======================
* ログ提供サイトを想定。
* アップロード機能は要検討。まずはダウンロード。

基本機能定義
------------------
* 【実装済】ファイル一覧を出力する
* 【実装済】クリックしたらダウンロードできるようにする
* まとめてZIPダウンロードする
* ファイルサイズを出力する
* タイムスタンプを出力する

詳細機能定義
------------------
* クリックしたらファイルの中身を表示せずにダウンロードを強制する
* 【実装済】更新したら反映されるようにする（クラスで実装しないとダメだった）

技術調査
**************
* フォルダ内のファイル一覧取得 -> glob.glob
* `Pythonでフォルダ内のファイルリストを取得する <https://qiita.com/amowwee/items/e63b3610ea750f7dba1b>`_
* `Djangoで、ファイルダウンロード <https://narito.ninja/blog/detail/93/#zip>`_
* `テンプレート forループ `<https://blog.aristo-solutions.net/2018/06/djangofor_25.html>`_
* `downloadfile stackoverflow <https://stackoverflow.com/questions/36392510/django-download-a-file/36394206#36394206>`_
* `downloadfile stackoverflow-ja <https://ja.stackoverflow.com/questions/49937/django%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89>`_
* `Djangoでファイル一覧情報を更新する方法 <https://sinyblog.com/django/form-001/>`_

学ぶべきこと
------------------
* {% url %} の使い方
* urlpattan のマッチングによるアプリ起動
* temprate の実装
* view.py → ロジック、 models → データ


設計
********


実装
********

テスト
********

リリース
********


Polls
=======================
* WEB投票サイト
* Djangoチュートリアルで提供


アイデア募集中
=======================



