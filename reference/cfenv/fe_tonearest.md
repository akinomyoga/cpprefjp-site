# FE_TONEAREST
* cfenv[meta header]
* macro[meta id-type]
* cpp11[meta cpp]

```cpp
#define FE_TONEAREST integer-constant-expression
// または
#undef FE_TONEAREST
```
* integer-constant-expression[italic]

## 概要
浮動小数点数の丸め方式として、「最も近い値への丸め (round to nearest)」を表すマクロ。

この丸め方式は、最も近い整数方向に対して丸める。中間値 (`0.5`) の場合にどちらの方向に丸められるかは、はIEC 60559 (IEEE 754) の推奨方式によって決まる。

このマクロは、標準ライブラリの丸め処理で使用される丸め方式をユーザーが選択するために使用する。

処理系がこの丸め方式に対応している場合にこのマクロが定義される。
マクロが定義されるとき、このマクロの値は整数の定数式になり、非負の値を持つ。


## 備考
`FE_TONEAREST`は実装として、以下がありえる:

1. 中間値の場合に、偶数方向へ丸める (「最近接偶数への丸め」「to nearest, ties to even」「JIS丸め」「ISO丸め」「bankers’ rounding」)
2. 中間値の場合に、ゼロから遠い方向へ丸める (「四捨五入」「to nearest, ties away from zero」)

標準C++の規格では、この動作はIEC 60559 (IEEE 754) にゆだねている。そして、IEC 60559では、デフォルトが1. の「偶数方向への丸め」となっている (実装に推奨されている)。そのため、IEC 60559の推奨に従っている処理系では、`FE_TONEAREST`の動作は「最近接偶数への丸め」となるだろう。


## 例
```cpp example
#include <iostream>
#include <cfenv>
#include <cmath>

int main()
{
  std::fesetround(FE_TONEAREST);

  float ar[] = {
      2.0,  2.1,  2.5,  2.9,
     -2.0, -2.1, -2.5, -2.9
  };

  for (float f : ar) {
    int x = std::nearbyint(f);
    std::cout << f << " -> " << x << std::endl;
  }
}
```
* FE_TONEAREST[color ff0000]
* std::fesetround[link fesetround.md]
* std::nearbyint[link /reference/cmath/nearbyint.md]

### 出力
```
2 -> 2
2.1 -> 2
2.5 -> 2
2.9 -> 3
-2 -> -2
-2.1 -> -2
-2.5 -> -2
-2.9 -> -3
```

## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): 3.0 [mark verified]
- [GCC](/implementation.md#gcc): 4.3.0 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): 2013 [mark verified], 2015 [mark verified]
	- コンパイルオプション`/fp:strict`または`#pragma fenv_access (on)`が必要。さもなくば、正しく動作しないおそれがある。
