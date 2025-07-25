# page_title ((1行目の見出し1はページのタイトルです。修飾なしで記載してください)

([cpprefjpを編集するには](/start_editing.md) および [cpprefjpでのMarkdown記法の制限と拡張](markdown_cpprefjp.md) を先に読んで下さい。)

(
  サンプルコードは文章中のどの部分で書いても大丈夫です。閲覧者の理解を助けるために必要だと感じたところで入れてください。
  その際拡張構文である`example`タグをルールに従って付け、コンパイル・実行可能にすることを検討してください。
)

* header_name[meta header]
* cpo[meta id-type]
* std[meta namespace]
* cpp20[meta cpp]

<!-- `[meta header]`は、所属ヘッダを表すメタ情報 -->
<!-- `[meta id-type]`は、識別子の種別を表すメタ情報。class, class template, function, function template, enum, variable, type-alias, concept, macro, namespace。全てのオーバーロードが関数テンプレートならfunction templateを使用し、そうでなければfunctionを使用する -->
<!-- `[meta namespace]`は、所属する名前空間を表すメタ情報。マクロを考慮して省略可。名前空間の区切りは`::` -->
<!-- `[meta cpp]`は、機能が追加・非推奨・削除されたバージョンを表すメタ情報。改行して複数指定ができる。 -->
<!--    `cpp20[meta cpp]` : C++20で追加された機能 -->
<!--    `cpp23[meta cpp]` : C++23で追加された機能 -->
<!--    `cpp26[meta cpp]` : C++26で追加された機能 -->
<!--    `cpp23deprecated[meta cpp]` : C++23で非推奨になった機能 -->
<!--    `cpp23removed[meta cpp]` : C++23で削除された機能 -->
<!--    `cpp26deprecated[meta cpp]` : C++26で非推奨になった機能 -->
<!--    `cpp26removed[meta cpp]` : C++26で削除された機能 -->
<!--    `future[meta cpp]` : 将来のC++で検討されている機能 -->
<!--    `archive[meta cpp]` : 廃案になったが記録として残す価値のあるC++機能 -->

```cpp
namespace std {
  inline namespace /*unspecified*/ {

    inline constexpr /*unspecified*/ cponame = /*unspecified*/;
  }
}
```

## 概要
(ここには、カスタマイゼーションポイントオブジェクトの概要を記述します。必須事項です。)

(必要な項目を省略する場合には、「(執筆中)」と書いておいてください。)


## 効果
(ここには、カスタマイゼーションポイントオブジェクトの内部で行われる効果:effect を記述します。)


## 戻り値
(ここには、カスタマイゼーションポイントオブジェクトの戻り値を記述します。戻り値の型が`void`の場合は、「なし」と記述してください。)


## 例外
(ここには、例外送出の有無、例外送出の条件と送出される例外、例外を抄出しない条件、例外送出後の変数・オブジェクトの状態 (例外安全性) などを記述します。`noexcept`なら「投げない」を記述します。規格上とくに明記がなければ、項目を削除してください。)


## 定数式に評価される条件
(`constexpr`評価される条件を記述します。)


## カスタマイゼーションポイント
(ここには、カスタマイゼーションポイントオブジェクトにアダプトする方法を記述します。)


## 備考
(ここには、カスタマイゼーションポイントオブジェクトを説明するにあたっての、補足事項を記述します。とくになければ、項目を削除してください。)


## この機能が必要になった背景・経緯
(ここには、その機能が必要になった背景や経緯を記述します。その機能で解決したい問題は何だったのかは、ユーザーがその言語機能を実際に使う上で重要な情報となります。余裕があったら書いてください)


## 例
```cpp example
// (ここには、カスタマイゼーションポイントオブジェクトを解説するための、サンプルコードを記述します。)
// (インクルードとmain()関数を含む、実行可能なサンプルコードを記述してください。そのようなコードブロックにはexampleタグを付けます。)

#include <iostream>

int main()
{
  int variable = 0;
  std::cout << variable << std::endl;
}
```
* variable[color ff0000]

(コードブロック中の識別子に、文字色を付ける例です。)

### 出力
```
0
```

(ここには、サンプルコードの実行結果を記述します。何も出力がない場合は、項目を削除せず、空の出力にしてください。)  
(実行結果が処理系・実行環境によって異なる場合は、項目名を「出力例」に変更し、可能であればその理由も併記してください。)


## バージョン
### 言語
- C++20

### 処理系
- [Clang](/implementation.md#clang): 11.0 [mark verified]
- [GCC](/implementation.md#gcc): 10.0 [mark verified]
- [Visual C++](/implementation.md#visual_cpp): ??

(ここには、その機能が存在する言語のバージョンと、確認がとれたコンパイラとそのバージョンを記述します。)
(これらの項目を削除した場合、C++03のあらゆる環境で使用できることを意味します。)
(確認のテストできないときは、??を記述してください。)

### 備考
(処理系ごとに存在するバグや注意事項を記述します。とくにない場合は、項目を削除してください。)


## 関連項目
(ここには、その機能と関連のあるcpprefjpサイト内の項目へのリンクを記述します。とくに必要がないと判断した場合、項目を削除してください。)


## 参照
(ここには、そのカスタマイゼーションポイントオブジェクトを理解するにあたっての参考資料や、関連する機能へのリンクを記述します。とくに必要がないと判断した場合、項目を削除してください。)
