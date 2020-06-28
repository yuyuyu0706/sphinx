##############################
Django アプリケーション開発
##############################

DirectoryIndex
=======================
* ログ提供サイトを想定。
* アップロード機能は要検討。まずはダウンロード。

基本機能定義
------------------
* 戻るボタンの実装（上に戻る）
* ディレクトリとファイルの区別表示
* ファイルダウンロード機能
* 【実装済】ディレクトリ遷移を可能にする→現在は「Page not Found」
* 【実装済】ファイル一覧を出力する
* 【実装済】クリックしたらダウンロードできるようにする
* 【実装済】タイムスタンプを出力する
* 【実装済】ファイルサイズを出力する

詳細機能定義
------------------
* まとめてZIPダウンロードする
* クリックしたらファイルの中身を表示せずにダウンロードを強制する(手法は色々。ロジックで対応を目指す)
* タイムスタンプ昇順ソートを変更 → ファイル名昇順 or タイムスタンプ降順 にソートする
* 【実装済】更新したら反映されるようにする（クラスで実装しないとダメだった）
* 【実装済】画面配置を整形する：パス・サイズ・タイムスタンプを綺麗に並べる

モジュール
------------------
* Views.py
  * class FileList
    * __init__(self)
    * getfdict(self)
  * index(request)
  * download(request, path)
  * download_zip(request)


技術調査
**************
* フォルダ内のファイル一覧取得 -> glob.glob(パス)
* ファイルのタイムスタンプ取得 -> os.path.getmtime(パス)
* Unix時間をdatetimeに変換 -> datetime.datetime.fromtimestamp(Unix時間)
* datetimeの文字列化 -> datetime.strftime('%Y-%m-%d %H:%M:%S')
* 辞書で1つのkeyに複数Valueを登録 -> valueをlistで登録。初期化は collections の defaultdict(list)。後はappendしていく
* 複数の変数をforで扱う -> zipでforに入れる（書籍：Python3参照）
* template は defaultdictクラスが読めない -> dict型に変換すると読める
* 画面更新をトリガーに再読み込み -> class化して __init__(self) のコンストラクタに処理を書く

参考文献
-------------
* `Pythonでフォルダ内のファイルリストを取得する <https://qiita.com/amowwee/items/e63b3610ea750f7dba1b>`_
* `Pythonでファイル、ディレクトリ（フォルダ）のサイズを取得 <https://note.nkmk.me/python-os-path-getsize/>`_
* `Djangoで、ファイルダウンロード <https://narito.ninja/blog/detail/93/#zip>`_
* `テンプレート forループ `<https://blog.aristo-solutions.net/2018/06/djangofor_25.html>`_
* `downloadfile stackoverflow <https://stackoverflow.com/questions/36392510/django-download-a-file/36394206#36394206>`_
* `downloadfile stackoverflow-ja <https://ja.stackoverflow.com/questions/49937/django%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89>`_
* `Djangoでファイル一覧情報を更新する方法 <https://sinyblog.com/django/form-001/>`_
* `Pythonにおけるclassの使い方 <https://qiita.com/Morio/items/0fe3abb58fcaff229f3d>`_
* `Python3 文字列操作 <https://qiita.com/Kenta-Han/items/e64035e9c3e4ef08e394#%E6%96%87%E5%AD%97%E5%88%97%E3%81%AE%E7%BD%AE%E6%8F%9B>`_
* `datetimeの文字列変換 <https://qiita.com/t-iguchi/items/a0bb8a5f273b319e5755>`_
* `【python】辞書で同じキーに複数の値を登録する <https://www.haya-programming.com/entry/2018/04/24/002524>`_
* `Python defaultdict の使い方 <https://qiita.com/xza/items/72a1b07fcf64d1f4bdb7>`_
* `CSS マージンと余白 <http://open.shonan.bunkyo.ac.jp/~ohtan/kouza/css-margin.html>`_
* `スタイルシート 作り方と書き方 <https://www.homepage-tukurikata.com/css/howto-css.html>`_
* `Bootstrap4 テーブル(table)クラスの使い方を徹底解説 <https://webst8.com/blog/bootstrap4-table-howto/>`_

学ぶべきこと
------------------
* {% url %} の使い方
* urlpattan のマッチングによるアプリ起動
* temprate の実装（forで取り出す）
* view.py → ロジック、 models → データ
* class によるオブジェクト操作


設計
********
* model は利用しない。
    * アップロードを利用しない限りは不要のはず

実装
********
* ディレクトリ遷移は細かい実装追加で実現できた

  * urls.pyのルーティング ← ここは思いつきで気づく
  * 2回目以降のレスポンス処理(index_next関数追加) ← これの必要性に気づけず時間がかかった
  * パスの整形処理(templateで/directoryindex を付けてリンクするよう追記)
  * FileListクラスで1回目と2回目以降のMEDIA_ROOTパスを条件分岐



テスト
********

リリース
********


Polls
=======================
* WEB投票サイト
* Djangoチュートリアルで提供


月間カレンダー
=======================
* 課題解決：基盤調整カレンダーがEXCEL で凄く見づらい
* Teams / SharePoint ではイマイチ動かない為、手軽にDjangoでカレンダーが提供できないだろうか

技術調査
**************

参考文献
-------------
* `Djangoでカレンダーを作るシリーズ <https://narito.ninja/blog/detail/11/#_1>`_


Web版 面一覧
=======================
* 課題解決：面一覧情報がEXCELで見づらい
* AIMのような形で一覧化、履歴管理を実機ベースで構築できないだろうか

Web版 各種一覧
=======================
* 課題解決：EXCELで見づらい
* 汎用ビューを扱って、sqliteに保存したデータを検索・出力できると色々嬉しいかも
* IPKK のような機能が簡単に作れたら嬉しい



アイデア募集中
=======================



   




