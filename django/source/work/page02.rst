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


実装
********

テスト
********

リリース
********


