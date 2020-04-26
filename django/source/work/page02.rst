##############################
Django アプリケーション開発
##############################

DirectoryIndex
=======================
* ログ提供サイトを想定。
* ファイル一覧を出力する
* クリックしたらダウンロードできる
* アップロード機能は要検討。まずはダウンロード。

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



