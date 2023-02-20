# dotfiles example

dotfiles のサンプルです。

以下を設定します。

- GitHub CLI
- Git global config
- Z Shell (ZSH)

## 使い方

以下を実行すると自動的に設定されます。

```bash
./install.sh
```

## 注意点

`git/config` の `[user]` には自分の情報を入力してください。

## TIPS

Dev Container や Codespaces の場合に挙動を変えたい場合は、それらの環境で自動的に設定される環境変数によって条件分岐させると良いです。

参考: https://github.com/5t111111/dotfiles-example/blob/main/zsh/hooks/starship.zsh#L10
