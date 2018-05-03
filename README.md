# PC環境メモ

### 主な構成 (~2017/11/27)
* Windows 10
    * AutoHotkey
    * win32yank
    * WSLtty 1.8.1
    * PowerShell
    * Windows Subsystem for Linux
        * Ubuntu 16.04.3 LTS
            * Z Shell
            * Vim 7.4
            * Git 2.7.4
            * tmux 2.6
            * Midnight Commander 4.8.15
            * anyenv
                * pyenv + pyenv-virtualenv
                    * anaconda
                        * python
                * nodenv
                    * node.js
                * ...

### AutoHotkey
Windows全体で自由にキーコンフィグを設定できる.  
全く使っていない変換キーにCtrl, 無変換キーにEscを設定.

### win32yank
Windwosのクリップボードをtmux上でも利用できるようにする.  
[ここ](https://qiita.com/rattcv/items/da6730384111ad8fb70a)参照

### WSLtty
WSLのターミナルはデフォルトのままだと微妙なので[WSLtty](https://github.com/mintty/wsltty)を導入.  

カラースキームは.minttyrcファイルを利用可能.  
`C:\Users\${ユーザー名}\AppData\Roaming\wsltty\themes`に置くこと.  
solarized_darkのカラースキームを[大元のリポジトリ](https://github.com/altercation/solarized)の値を参照して作成.
(solarized_dark.minttyrc)

### PowerShell
PowerShellやコマンドプロンプト(~~そんなもん使わねぇよ~~)等は公式の[colortool](https://github.com/Microsoft/console)を使ってカラースキームを適用できる.  
インストールはcloneしてコマンドラインから`build.bat`を実行してビルド.  
またはリリースページにビルド済みの物もある.  
使えるカラースキームは.iniファイルと[iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)の.itermcolorsファイル.  
`colortool/schemes/`に置くこと.  
[ここ](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes)に
ある`Solarized Dark - Patched.itermcolors`か  
`Solarized Dark Higher Contrast.itermcolors`は文字が見やすくていい感じ.  
`colortool/schemes/`でPowerShellを開いて`./colortool -b ${カラースキーム名}`を
実行すれば良い. (スタートメニュー等からではなくpowershell.exeを直接起動しないと反映されないかも? 下記参照)

##### 注意
PowerShellの本体は`C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe`だが,  
スタートメニューにピン留めしたPowerShellを起動すると  
`C:/Users/${ユーザー名}/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Windows PowerShell/`にあるショートカットが呼ばれる.  
このショートカットは起動時の色やフォント等の設定を独自に保持しており, ショートカット作成後にcolortoolで加えた変更は反映されない.  
colortoolを使った後にpowershell.exeのショートカットを新たに作成し, 古いショートカットは削除するか, 新しいショートカットよりもファイル名が辞書順で後ろになるようにリネームするのが良い.  
ただし, ショートカットのプロパティで作業ディレクトリを`%HOMEDRIVE%%HOMEPATH%`にすること.

### Windows Subsystem for Linux (WSL)
2017年のWindows 10 Fall Creators Updateでベータが取れて正式な機能になった.  
Windows上で素のLinuxバイナリが実行できる. (Bashとか)  
コントロールパネルの｢プログラムと機能｣でWSLを有効化後, Windowsストア経由でUbuntu,  openSUSE, SUSE Linux Enterprise Server (SLES) をインストールできる.  
各ディストリビューションは共存できる.
ホームディレクトリの変更, パッケージソースの変更, 日本語化

##### WSLのメリット･デメリット
###### メリット
* WindowsとLinux(の一部)が同時に使える.
* VirtualBoxのようにシステム全体を仮想化する方法と比べてリソースの無駄が少ない.  いちいち仮想環境を立ち上げる必要もない. Linux側からWindows側のファイルに自由にアクセスできる.

###### デメリット
* CPUのパフォーマンス, ディスクI/Oのパフォーマンスともに  
WSL < VirtualBox < 実機なので重い計算をするにはおすすめはしない.   
今後の改良に期待.  
* **Linux側からWindows側のファイルにアクセスする時, パーミッションは常にWindows側のものになる. 所有者は常にroot:root, 権限755または555になる.**

Windowsが必要なのはMicrosoft Officeを使いたいからだけど今はMacでも使えるし...  
~~あれ? Macで良くね?~~

### Z Shell (zsh)

### Vim
win32yankを使ってクリップボードを共有.
カラースキームはsolarizedを設定.

### .dircolors
`ls`した時の色の設定は`~/.dircolors`   
[ここ](https://github.com/seebi/dircolors-solarized)にいい感じのsolarized用の設定ファイルがある.  
solarized_darkを使いたいなら`dircolors.ansi-dark`を取ってきて`.dircolors`とリネームして(Ubuntu側の)ホームディレクトリに置くだけ.

### <a name="tmux">tmux</a>
ターミナル仮想化ソフト.  
通常のターミナル内で仮想ターミナルを起動できる. 仮想ターミナルは終了しても明示的にkillするかPCの電源を落とすまで保たれ, 前回の続きから再開できる. (PCの電源を落としても再開できるようにするプラグインもあるよ)  
1つの仮想ターミナルの画面を分割して複数の仮想ターミナルを表示したりできる.

### <a name="mc">Midnight Commander</a>
CLIベースのファイルビューア.  
あんまり必要ない.

### dotfiles
大切な設定ファイルはGitで管理しよう.
