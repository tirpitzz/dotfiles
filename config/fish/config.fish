# ALIAS
alias sudo    'sudo '
alias cmatlab 'matlab -nodesktop -nosplash -nosoftwareopengl'
alias vi      '/usr/bin/vim'
alias vim     'nvim'
alias fq      'proxychains -q'
alias surf    'surf -m'
alias surfq   'proxychains -q surf -m'
alias man     'man --locale=zh_CN'
#
#
# EXPORT
set -U FZF_LEGACY_KEYBINDINGS 0
set -x _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.opengl=true'
set -x PATH $PATH $HOME/Misc/opt/MiniConda/bin $HOME/.local/bin
#
#
# INIT
source $HOME/Misc/opt/MiniConda/etc/fish/conf.d/conda.fish
