# 文字列リテラルの文字エンコーディング失敗を不適格とする [P1854R4]
* cpp26[meta cpp]

<!-- start lang caution -->

このページはC++26に採用される見込みの言語機能の変更を解説しています。

のちのC++規格でさらに変更される場合があるため[関連項目](#relative-page)を参照してください。

<!-- last lang caution -->

## 概要
C++23では、以下のような1ワイド文字に収まらないリテラルが不適格 (コンパイルエラー) になるよう仕様変更された。

```cpp
wchar_t a = L'🤦'; // C++20:OK, C++23:OK \U0001f926
wchar_t b = L'ab'; // C++20:OK, C++23:NG マルチキャラクタリテラル
wchar_t c = L'é';  // C++20:OK, C++23:NG \u0065\u0301
```

C++26ではさらに、文字列リテラルとしてエンコーディングできない文字の扱いが処理系定義でコンパイラーに任されていたものを、不適格になるよう仕様変更する。

また、マルチ文字リテラル (ひとつの文字リテラルに4文字まで入れられて値が処理系定義なもの。例として`'intl'`) については、単一のコードユニットにエンコードされるもののみ許可される。

```cpp
char c = 'é'; // C++23:処理系定義, C++26:NG グレイブアクセントをつけると複数のコードユニットになる
```


## 関連項目
- [C++23 1ワイド文字に収まらないワイド文字リテラルを禁止する](/lang/cpp23/remove_non_encodable_wide_character_literals_and_multicharacter_wide_character_literals.md)


## 参照
- [P1854R4 Making non-encodable string literals ill-formed](http://open-std.org/jtc1/sc22/wg21/docs/papers/2023/p1854r4.pdf)
