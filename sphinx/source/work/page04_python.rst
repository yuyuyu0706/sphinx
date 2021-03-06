
###########################################
Pythonで始めるソフトウェアアーキテクチャ
###########################################

* ポイント：どう感じたかを記述してみよう

目次
####################

第1章 ソフトウェアアーキテクチャの原則
==========================================

定義
---------
* しゃべり散らしてる印象が拭えない。キラーワードが見当たらない。
* あえて挙げるなら、次の箇所。

  * アーキテクチャは、骨組み。機能に焦点を当てていない。(P2)
  * デザインは、コード・モジュールに対して考える。(P2)

特性
---------
* ストラクチャの定義

  * ストラクチャは、アーキテクチャの見通しを良くする（P4)

* 重要な要素の明確化
* デザインの方針決定

* ステークホルダの要件管理

  * 極論、ステークホルダの望むようにシステムは設計・構築される
  * ★複数ある要求の間で矛盾が生じる。これをトレードオフして調整する
  * ★優れたアーキテクチャは、各要件を出来る限り満たす。
  * ★更には、共通言語をステークホルダに提供する。コミュニケーションの円滑化に寄与する。

* ストラクチャに与える影響

  * ストラクチャは、システム構築に関わるチーム編成も同時に表される(P6)

* 環境に与える影響

重要性
---------
* 「なぜアーキテクチャなのか？、なぜ重要なのか？」に対する答えは表になっていた。探してしまった。
* 答えと所感をメモ。

  * 最適な品質属性の選択を可能にする
  * 初期プロトタイプを促す
  * コンポーネント単位で構築可能にする
  * 円滑なシステム変更を可能にする

* なぜ、システム構築には正しいアーキテクチャが必要不可欠なのか？

  * 全てのシステムは潜在的にアーキテクチャを備えているため　→　これの理由は記載なし

* 潜在しているので、きちんと文書化しておこう。情報共有できるので、忘れずにやりましょう。とのこと。至極当然。

システムアーキテクチャとエンタープライズアーキテクチャ
--------------------------------------------------
* エンタープライズアーキテクトを戦略面におき、残りのアーキテクトが技術面で支える説明。
* 「戦略／技術」、「組織／PJ」のマトリックスは位置づけわかりやすい。(P13-図1.7)


品質属性
-----------------
* 本書の主題。それが、品質属性。
* ステークホルダ間の要求を調整して、アーキテクチャは選択するもの。
* 矛盾する要求には、トレードオフを考慮する。
* 品質属性は多岐に渡るため、本書では7つに厳選した。

  * 修正容易性

    * 整理の仕方

      * 影響レベル：容易さ・コスト・リスク
      * 影響範囲：ローカル、ノンローカル、グローバル
      * コード・モジュール：凝縮度・結合度

    * これらの関係は表で整理（P16-表1.2、表1.3）
    * 「ローカルに寄せる、グローバルを避ける」とは書いていない → 具体案は、第2章に期待
    * 「凝縮度を高め、結合度を疎にせよ」とも書いていない → 同上。
    * 可読性が高いと、修正容易性も高いらしい。 → 同上

  * テスト容易性

    * テストの容易性とは、「どれだけシステムの振る舞いが予測可能か」を表す → なるほど。予測できないものはテストも大変
    * テストスイート → テストケースのこと
    * テストハーネス → テストで用いるソフトウェアのこと（LoadRunnerとか、GTAMとか、Seleniumとか？)
    * テストアサーション → 失敗した時の振る舞いコードのこと。事前に書いておけと。
    * つまりは自動テストを書いて走らせる → recode/Playbackで再現性を見る → 改修 → 回帰

      * テスト失敗時のセッション状態や、データコンディションを記録できる前提。
      * オンラインはこの流れが効きそう。データパターンもわかってるし。
      * そう考えると、LoadRunner VuGen だったら、デバッグできるね。1ユーザなら無料だし。★気づき★

  * スケーラビリティ

    * 増加する負荷に対して対応していることを、スケーラビリティと呼ぶ
    * 水平スケーラビリティ → ノードを増やすこと
    * 垂直スケーラビリティ → CPU・RAMを増やすこと

  * パフォーマンス

    * 応答時間、レイテンシ、スループットが指標 → 応答時間・レイテンシの違いがわからん
    * Pythonの場合、GILによってマルチスレッディングに制限がある → 昔見た記憶がある。なんだっけこれ。(第5章で言及している模様)


  * 可用性

    * 当然ですね。という説明が続く。

      * システムがダウンしにくい → 「可用性が高い」ということ
      * 障害復旧計画は3点 → 欠陥検知、障害復旧、障害予防
      * 水平スケール → 障害は自動で切り離す設計を取り入れる
      * 垂直スケール → パフォーマンス監視が極めて重要。

  * セキュリティ

   * ★わかりやすい説明：セキュリティとは、不正アクセスによるサービスの損害を回避すること

  * デプロイ容易性

   * デプロイ容易性とは、開発環境から本番環境へのデプロイのしやすさを指す

     * モジュール構造が整理してあること → 何となくまで。明確にはイメージできず。
     * 本番環境と開発環境は、揃えて整備すること → 当然すぎる。デプロイツールは使い回すことを推奨している？
     * 開発エコシステムサポートを活用すること → なんだろこれ？？
     * 標準化された設定を維持すること → 当然
     * 標準化したインフラを維持すること → 当然
     * コンテナの使用すること → 同じ設定・インフラを扱うことの方法論？


まとめ
--------------

* アーキテクチャ は、技術だけでなく、ビジネス領域も含めて、広範に視野を配らなければならない。
* 特にステークホルダ間の要件管理は、超重要。

  * コミュニケーションをとりもつ役割は、アーキテクチャならではかも。

* 本書は、7つの品質属性に絞って、解説を展開する


第2章 修正容易性と可読性
===========================

修正容易性とは
-----------------------

修正容易性に関連する品質属性
----------------------------------

可読性とは
-----------------

可読性向上のテクニック
----------------------------

凝縮度と結合度
----------------------

修正容易性向上のテクニック
---------------------------------

静的解析ツールとメトリクス測定
---------------------------------

コードリファクタリング
---------------------------------

まとめ
---------------------------------


第3章 テスト容易性
===========================

第4章
==================
第5章
==================

