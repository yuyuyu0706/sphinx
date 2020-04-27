##############################
Django アプリケーション開発
##############################

DirectoryIndex
=======================
* ログ提供サイトを想定。
* ファイル一覧を出力する
* クリックしたらダウンロードできる
* アップロード機能は要検討。まずはダウンロード。

技術調査
**************
* フォルダ内のファイル一覧取得 -> glob.glob
* `Pythonでフォルダ内のファイルリストを取得する <https://qiita.com/amowwee/items/e63b3610ea750f7dba1b>`_
* `Djangoで、ファイルダウンロード <https://narito.ninja/blog/detail/93/#zip>`_
* `テンプレート forループ `<https://blog.aristo-solutions.net/2018/06/djangofor_25.html>`_
* `downloadfile stackoverflow <https://stackoverflow.com/questions/36392510/django-download-a-file/36394206#36394206>`_
* `downloadfile stackoverflow-ja <https://ja.stackoverflow.com/questions/49937/django%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89>`_

設計
********

====== ================
ID      Value
====== ================
3      データ3
4      データ4
====== ================

.. seqdiag::
   :desctable:

   seqdiag {
      A -> B[label = "test"];
      B -> C[label = "test"];
      A [description = "browsers in each client"];
      B [description = "web server"];
      C [description = "database server"];
   }

.. seqdiag::
   :desctable:

   seqdiag {
      PC -> LB[label = "HTTP"];
      LB -> IHS[label = "HTTP"];
      IHS -> "WAS Plugins" [label = "HTTP", description = "Timeout xxxx"];
      "WAS Plugins" -> WAS [label = "HTTP:9080", description = "Timeout xxxx"];
      WAS -> DB [description = "CPU-Time 300sec RLF"];
   }



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



