# PC環境メモ

### 主な構成 (2018/09/07時点)
* Windows 10
    * AutoHotkey
    * PowerShell
    * Cmder
    * Windows Subsystem for Linux
        * Ubuntu 18.04 LTS
            * venv
                * python

### AutoHotkey
Windows全体で自由にキーコンフィグを設定できる.  
全く使っていない変換キーにCtrl, 無変換キーにEscを設定.

### PowerShell
PowerShellやコマンドプロンプト(~~そんなもん使わねぇよ~~)等は公式の[colortool](https://github.com/Microsoft/console)を使ってカラースキームを適用できる.  
インストールはcloneしてコマンドラインから`build.bat`を実行してビルド.  
またはリリースページにビルド済みの物もある.  
使えるカラースキームは.iniファイルと[iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)の.itermcolorsファイル.  
`colortool/schemes/`に置くこと.  
~~同梱の`solarized_dark.itermcolors`か,  
[ここ](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes)に
ある`Solarized Dark - Patched.itermcolors`や  
`Solarized Dark Higher Contrast.itermcolors`は文字が見やすくていい感じ.~~  
→同梱の`solarized_dark.itermcolors`を使うと公式の値と異なっていたので正しいRGB値の設定を`solarized_dark_modified.ini`として作成した.  
`colortool/schemes/`でPowerShellを開いて`./colortool -b ${カラースキーム名}`を
実行すれば良い. (スタートメニュー等からではなくpowershell.exeを直接起動しないと反映されないかも? 下記参照.)

##### 注意
~~PowerShellの本体は`C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe`だが,  
スタートメニューにピン留めしたPowerShellを起動すると  
`C:/Users/${ユーザー名}/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Windows PowerShell/`にあるショートカットが呼ばれる.  
このショートカットは起動時の色やフォント等の設定を独自に保持しており, ショートカット作成後にcolortoolで加えた変更は反映されない.  
colortoolを使った後にpowershell.exeのショートカットを新たに作成し, 古いショートカットは削除するか, 新しいショートカットよりもファイル名が辞書順で後ろになるようにリネームするのが良い.  
ただし, ショートカットのプロパティで作業ディレクトリを`%HOMEDRIVE%%HOMEPATH%`にすること.~~  
2018/09/07の時点ではこれをやらなくても大丈夫になっていた.

### Cmder
ターミナルエミュレータ. 最初からタブ機能が使えるのでmintty+tmuxとかを使って無駄に躓くより良いと思った.  
2018/09/07時点ではコンテキストメニューの｢ここで開く｣がうまく機能しなかったので[ここ](https://syon.github.io/refills/rid/1498646/)参照.  
Solarizedのカラースキームがあるが暗色と明色 (black/brblack等) が入れ替わっているので[公式](https://ethanschoonover.com/solarized/)の値を見て修正.

### Windows Subsystem for Linux (WSL)
2017年のWindows 10 Fall Creators Updateでベータが取れて正式な機能になった.  
Windows上でネイティブなLinuxシステムを実行できる.
コントロールパネルの｢プログラムと機能｣でWSLを有効化後, Windowsストアからいくつかのディストリビューションをインストールできる. (各ディストリビューションは共存可.)  
インストール後の設定は[ここ](https://laboradian.com/installation-and-setting-of-wsl/#Cmder-2)参照.

##### WSLのメリット･デメリット
###### メリット
* WindowsとLinux(の一部)が同時に使える.
* VirtualBoxのようにシステム全体を仮想化する方法と比べてリソースの無駄が少ない.  いちいち仮想環境を立ち上げる必要もない. Linux側からWindows側のファイルに自由にアクセスできる.

###### デメリット
* CPUのパフォーマンス, ディスクI/Oのパフォーマンスともに  
WSL < VirtualBox < 実機なので重い計算をするにはおすすめはしない.   
今後の改良に期待.  
* ~~**Linux側からWindows側のファイルにアクセスする時, パーミッションは常にWindows側のものになる. 所有者は常にroot:root, 権限755または555になる.**~~
Windows側の権限が優先されるものの, WSL側でも権限が設定できるよう改善された.

### .dircolors
`ls`した時の色は`~/.dircolors`によって変わる.  
[ここ](https://github.com/seebi/dircolors-solarized)にいい感じのsolarized用の設定ファイルがある.  
solarized_darkを使いたいなら`dircolors.ansi-dark`を取ってきて`.dircolors`とリネームして(Ubuntu側の)ホームディレクトリに置くだけ.  
あるいはシンボリックリンクを貼る方がいいかもしれない.

### venv
pyenvとか色々あるけどvenvがデファクトスタンダードらしい.