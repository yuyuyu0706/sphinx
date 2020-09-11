
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
* `study sphinx：Sphinxでの文章の書き方(reStructuredText) <https://planset-study-sphinx.readthedocs.io/ja/latest/04.html>`_
* `Sphinx-Users.jp-逆引き辞典 <https://sphinx-users.jp/reverse-dict/index.html>`_

番号なし箇条書き
------------------------
* 番号なしリストは「*」「+」「-」を使う。
* 各行は連続して書いてよい（空行をはさむ必要は無い）。
* 内訳・入れ子のブロックを作りたい場合は、一行空けてインデントする。

  * 使う記号は同じでも違ってもよい。
  * インデントを付けずに記号だけ変えても、同レベルの別ブロックとなるだけで、内訳にはならない
  * インデントは、記号直後の文章の開始桁に合わせる。

* 文章内で改行したい場合は、各文章の先頭に「|」を入れる。
* ★：もし箇条書きがずれるようなら → 半角スペースが全角かもしれない。
* 参考：非常にわかりやすいページ <http://www.ne.jp/asahi/hishidama/home/tech/sphinx/rest.html>`_

番号あり箇条書き
------------------------
* 番号つきリストは数値やアルファベットの後ろにピリオドや括弧閉じを付けるか、丸括弧で囲む。
* 値は自分で増やして付ける必要がある。


テーブル
------------
* `表の書き方-CSVテーブル&LISTテーブル <https://www1.gifu-u.ac.jp/~fujilab/sphinx_html/tsuka.html#id5>`_
* `Sphinxで使えるテーブルのメモ-2018年12月28日 <https://dawtrav.skr.jp/blog/sphinx/sphinx-tables/>`_
* `Sphinxで全角記号をテーブルに使うには-2018年12月31日 <https://dawtrav.skr.jp/blog/sphinx/docutils-ambiguous-malformed-table/#docutils-ambiguous-malformed-table>`_
* `CSVファイルを読み込む <https://www1.gifu-u.ac.jp/~fujilab/sphinx_html/tsuka.html>`_

.. csv-table:: テストテーブル
   :file: aaa.csv
   :header-rows: 1
   :widths: 15, 10, 20

ソースコード
--------------------
* コードブロックの前後には空白行を入れること
* 「::」の前後には半角スペースを入れること
* `reStructuredText入門-ソースコード <http://www.sphinx-doc.org/ja/stable/rest.html#source-code>`_

ハイパーリンク
--------------------
* 新しいタブで開くはサポートされていない
* `reStructuredText入門-ハイパーリンク <http://www.sphinx-doc.org/ja/stable/rest.html#hyperlinks>`_
* `reStructuredTextで、新しいウィンドウで開くリンクを書く方法 <https://shirabeta.net/How-to-write-link-with-target-blank-in-reST.html#.XqPX4E_7Q8o>`_


画像イメージの貼り付け
--------------------------------
* `画像を貼る <http://tdoc.info/sphinx-reverse-dict/basic/image.html>`_
* `Sphinxドキュメントに画像を埋め込むにはどうすればよいですか？ <https://www.it-swarm.dev/ja/python-sphinx/sphinx%E3%83%89%E3%82%AD%E3%83%A5%E3%83%A1%E3%83%B3%E3%83%88%E3%81%AB%E7%94%BB%E5%83%8F%E3%82%92%E5%9F%8B%E3%82%81%E8%BE%BC%E3%82%80%E3%81%AB%E3%81%AF%E3%81%A9%E3%81%86%E3%81%99%E3%82%8C%E3%81%B0%E3%82%88%E3%81%84%E3%81%A7%E3%81%99%E3%81%8B%EF%BC%9F/1049523062/>`_

::

  ..image:: ファイルパス
      :scale: 50%

  ..figure:: ファイルパス
      :scale: 50%

      キャプションの文


PDFで出力する
----------------
* TexLive が必要
* TexLive は aptだと古いため、tlmgrから導入という記事が多い
* `LinuxへのTeX Liveインストール <https://sphinx-users.jp/cookbook/pdf/latex-install-linux.html>`_


文字を赤字にする
--------------------
* インラインマークアップでは出来ない模様
* `CSS の定義でそれぞれ打ち消し線表示、赤い文字にする <http://labs.timedia.co.jp/2012/04/sphinx.html>`_

テーマ
==========
* `study sphinx：色々なテーマ、sphinx拡張 <https://planset-study-sphinx.readthedocs.io/ja/latest/06.html>`_
* `テーマの紹介 <http://usaturn.net/memo/sphinx-theme.html>`_
* `Shinx-themes.org <https://sphinx-themes.org/>`_
* `お気に入りテーマ <https://pypi.org/project/jupyter-sphinx-theme/>`_

サイドバーのカスタマイズ
-----------------------------------
* デフォルトだと 「sidebartoc」 で設定している
* `Sphinxですべての目次をサイドバーに表示する <https://qiita.com/takakiku/items/99cf6505fb5c893a5168>`_
* `Sphinxでテーマをカスタマイズしたときの備忘録-2016年2月24日 <https://www.gesource.jp/weblog/?p=7350>`_

jupyter-sphinx-theme の場合
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* sidebartoc.html が存在しているため、注意。
* 継承したかったが上手く利かなかった。
* 最終的には以下にて、目次の表示変更が出来た

| theme.conf

::

    # Global TOC depth for "site" navbar tab. (Default: 1)
    # Switching to -1 shows all levels.
    globaltoc_depth = 3    # 1 -> 3

| sidebartoc.html

::

    {{ toctree(maxdepth=theme_globaltoc_depth|toint,
               collapse=False,     # True -> False
               includehidden=theme_globaltoc_includehidden|tobool)
    }}
 

コマンド
==========
新規にプロジェクト作成する ::

	sphinx-quickstart

htmlを生成する ::

	make html


