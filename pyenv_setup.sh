# 事前準備
sudo apt install -y build-essential libffi-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
#libssl-dev -> openssl
#libbz2-dev -> sqlite3
#libreadline-dev -> bz2
#libsqlite3-dev -> readline

# pyenv本体のダウンロードとインストール
sudo apt install -y git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# .bashrcの更新
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv -v # pyenvがインストールできたかを確認

# pythonのインストール
pyenv install 2.7.0
pyenv install 3.6.0
pyenv versions

# 使用バージョンの選択
pyenv global 3.6.0
pyenv versions
