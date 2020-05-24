
##########################
エミュレータ 雑記メモ
##########################

SNES
==========

ZNES
------------
* ESC でメニューに戻れる
* 起動時にノイズ音あるが、噂ほどサウンドに違和感は無し
* `【雑記】ubuntuでスーファミやってみた <http://smot93516.hatenablog.jp/entry/2018/03/21/112524>`_

SNES9x
------------
* Joypad を認識せず
* /etc/snes9x/snes9x.conf を編集するが機能せず。
* `Snes9xでゲームパッドを使うためにした過程をまとめ <http://ubuntumemoblog.blogspot.com/2007/07/blog-post_5878.html>`_

ROMS
--------------
* `CDRomance https://cdromance.com/>`_

PS2
==========

PSXS2
------------------
* パッチ適用先ファイルのパス：/usr/share/games/PCSX2/GameIndex.dbf
* プラグイン：v1.4.0 → v1.5.0 でグラフィック用プラグインが増えた
* ビデオ設定 `<http://obsrvfun.nusutto.jp/004-16-4.html>`_
* インストール `<http://kapper1224.sblo.jp/article/185020407.html>`_

sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:pcsx2-team/pcsx2-daily
sudo apt-get update
sudo apt-get install pcsx2-unstable

テイルズオブディステニー ディレクターズカット版
****************************************************
* OPムービーでフリーズする→パッチを適用することで解消
* ToD 動作状況 `<https://w.atwiki.jp/emups2/pages/65.html#id_496d16be>`_
* 参考①パッチ提供 `<https://w.atwiki.jp/emups2/pages/35.html>`_
* 参考② `<https://egg.5ch.net/test/read.cgi/software/1521561801/306-n>`_

Serial = SLPS-25842
Name   = Tales of Destiny [Director's Cut]
Region = NTSC-J
Compat = 5
FpuMulHack = 1
[patches = 8409FD51]
//Tales of Destiny Director's Cut FMV FIX
patch=0,EE,001B4858,word,00000000
patch=1,EE,201A7054,word,00000000
patch=1,EE,201A70DC,word,00000000
patch=1,EE,20109FA8,extended,A620066C
[/patches]

PS
==========



