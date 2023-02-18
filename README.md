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

Codespaces の場合に挙動を変えたい場合は、環境変数 `CODESPACES` によって条件分岐させると良いです。

参考: https://github.com/5t111111/dotfiles-example/blob/6b36089c1933d0b2c62a4ee97f510d5a3961734d/zsh/hooks/starship.zsh#L10-L16
