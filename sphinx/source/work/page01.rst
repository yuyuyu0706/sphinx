
##########################
sphinx 学習メモ
##########################

導入
==========
`sphinx でドキュメント作成からWeb公開までをやってみた <https://qiita.com/kinpira/items/505bccacb2fba89c0ff0>`_

書き方
==========

全般
------------
`study sphinx：Sphinxでの文章の書き方(reStructuredText) <https://planset-study-sphinx.readthedocs.io/ja/latest/04.html>`_

テーブル
------------

`表の書き方-CSVテーブル&LISTテーブル <https://www1.gifu-u.ac.jp/~fujilab/sphinx_html/tsuka.html#id5>`_

`Sphinxで使えるテーブルのメモ-2018年12月28日 <https://dawtrav.skr.jp/blog/sphinx/sphinx-tables/>`_

`Sphinxで全角記号をテーブルに使うには-2018年12月31日 <https://dawtrav.skr.jp/blog/sphinx/docutils-ambiguous-malformed-table/#docutils-ambiguous-malformed-table>`_

ソースコード
------------
* コードブロックの前後には空白行を入れること
* 「::」の前後には半角スペースを入れること
* `reStructuredText入門-ソースコード <http://www.sphinx-doc.org/ja/stable/rest.html#source-code>`_

ハイパーリンク
---------------
* 新しいタブで開くはサポートされていない
* `reStructuredText入門-ハイパーリンク <http://www.sphinx-doc.org/ja/stable/rest.html#hyperlinks>`_
* `reStructuredTextで、新しいウィンドウで開くリンクを書く方法 <https://shirabeta.net/How-to-write-link-with-target-blank-in-reST.html#.XqPX4E_7Q8o>`_



テーマ
==========

`study sphinx：色々なテーマ、sphinx拡張 <https://planset-study-sphinx.readthedocs.io/ja/latest/06.html>`_

`テーマの紹介 <http://usaturn.net/memo/sphinx-theme.html>`_


コマンド
==========
新規にプロジェクト作成する ::

	sphinx-quickstart

htmlを生成する ::

	make html


