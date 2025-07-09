# 1ワイド文字に収まらないワイド文字リテラルを禁止する [P2362R3]
* cpp23[meta cpp]

<!-- start lang caution -->

このページはC++23に採用された言語機能の変更を解説しています。

のちのC++規格でさらに変更される場合があるため[関連項目](#relative-page)を参照してください。

<!-- last lang caution -->

## 概要
C++23では、ワイド文字リテラルとして、以下を禁止する：

- マルチキャラクタリテラル
- エンコード可能ではない、または複数文字を含む文字

```cpp
wchar_t a = L'🤦'; // C++20:OK, C++23:OK \U0001f926
wchar_t b = L'ab'; // C++20:OK, C++23:NG マルチキャラクタリテラル
wchar_t c = L'é';  // C++20:OK, C++23:NG \u0065\u0301
```

`wchar_t`はプラットフォームによって16ビットか32ビットのどちらかとなる。
変数`a`のケースは`wchar_t`が32ビットの環境では情報を損うことなく表現でき、16ビットの環境では上位16ビットか下位16ビットのどちらかが切り捨てられる実装がある。
`a`のケースは32ビットの場合には正しいものであるため、C++23では維持される。

変数`b`のケースはマルチキャラクタリテラル (multi-character literals) であり、処理系定義の値となるが、多くの環境でいずれか1文字の値のみが使われていた。また、韓国語やバラモン語では1文字に見えて複数文字であるような場合があるため、`wchar_t`にマルチキャラクタリテラルを許可することはバグの元であるため、禁止とする。

変数`c`のケースは1文字のように見えても複数のコードポイントで構成されており、マルチキャラクタリテラルの一種であるため禁止とする。


## <a id="relative-page" href="#relative-page">関連項目</a>
- [C++26 文字列リテラルの文字エンコーディング失敗を不適格とする](/lang/cpp26/making_non-encodable_string_literals_ill-formed.md)


## 参照
- [P2362R3 Remove non-encodable wide character literals and multicharacter wide character literals](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/p2362r3.pdf)
