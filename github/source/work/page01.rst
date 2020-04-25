
#############################
git コマンドまとめ
#############################

STEP1 初動の手順
********************
| リポジトリの複製 or 新規作成が始まり大抵は複製が良いかも

**リポジトリ用のディレクトリ作成** ::

    mkdir ~/git/vim
    cd ~/git/vim

**リモートリポジトリを複製する** ::

    git clone [URL]

| master の / がカレントに入る
| 指定したディレクトリのみ複製する
| → 要研究。少なくとも階層は短縮不可。
| → kaggle環境はシンボリックリンクで解決した

**ローカルリポジトリを作成する (.git作成)** ::

    git init


**ローカルリポジトリを削除する** ::

    rm -rf ./.git があるディレクトリ

| 特にgitコマンド使わず、削除してOK

**ユーザ情報を登録する** ::

    git config --global user.email "yuyuyu@aa"
    git config --global user.name "yuyuyu"

| これが完了しないとgit commitできない
| ただし、git clone した場合は不要

**SSH公開鍵登録** ::

    ssh -T git@github.com
    >Hi yuyuyu0706! You've successfully authenticated, but GitHub does not provide shell access.

| リポジトリ毎ではなく、アカウントに対して鍵登録する
| gitユーザーでssh認証しないとNG (ハマった)

`GitHubでssh接続する手順~公開鍵・秘密鍵の生成から~ <https://qiita.com/shizuma/items/2b2f873a0034839e47ce>`_

STEP2 リモートリポジトリの準備
*********************************
| git clone すると、originで自動登録される
| ローカルとリモートは同じディレクトリ構成にする

**リモートリポジトリを登録する** ::

    git remote add vim https://github.com/yuyuyu0706/vim.git

**リモートリポジトリを削除する** ::

    git remote rm vim

**リモートリポジトリを確認する** ::

    git remote -v

**リモートリポジトリ名を変更する** ::

    git remote rename origin kaggle

**リモートリポジトリ設定を変更する** ::

    git remote set-url kaggle git@github.com:ID/リポ名
    git remote set-url sphinx git@github.com:yuyuyu0706/sphinx

| HTTPでcloneしたリポジトリをSSHに変更した
| 別リポジトリに切り替える場合も同じ

STEP3 コミット手順
********************
| .git を持つディレクトリで実行すること
| .git を持つパス配下がリポジトリ管理されている

**ローカルリポジトリのステージングに登録する** ::

    git add hello.html

**ローカルリポジトリのステージングを全消し** ::

    git reset HEAD

**ローカルリポジトリにステータスを確認する** ::

    git status

**ローカルリポジトリでコミットする** ::

    git commit -am "Update"

| -a 変更ファイル全てコミット
| -m コメントをつける

**ブランチ名を確認する** ::

    git branch

**リモートリポジトリに変更を反映する** ::

    git push vim master # branch名=master の場合

**リモートリポジトリの変更を確認する** ::

    git fetch vim git diff vim/master

**リモートリポジトリの変更を取り込む** ::

   git pull vim master # branch名=master の場合

その他
*********
**コミット履歴を参照する** ::

    git log -n 10

| `よく使うGitのコマンド12-2017年6月2日 <https://techacademy.jp/magazine/6235>`_


**自動コミット & 自動プッシュ**

`定期的に自動でコミットさせるスクリプト-2016年6月2日 <https://qiita.com/narikei/items/b4e1c035c778d4eb2fc9>`_

WEB操作手順
*************
**ディレクトリ作成**

| `GitHubでディレクトリ作成-2016年7月7日 <http://maeokaka.hatenablog.jp/entry/2016/07/07/001441>`_


