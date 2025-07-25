# operator<<
* random[meta header]
* std[meta namespace]
* function template[meta id-type]
* cpp11[meta cpp]

```cpp
namespace std {
  template <class CharT, class Traits,
            class UIntType, size_t w, size_t s, size_t r>
  std::basic_ostream<CharT, Traits>& operator<<(
    std::basic_ostream<CharT, Traits>& os
    const subtract_with_carry_engine<UIntType, w, s, t>& x);
}
```

## 概要
ストリームへの出力を行う。


## 効果
`os`に対してフォーマットフラグ`ios_base::dec | ios_base::left`を設定する。  
フォーマットを設定した`os`に対して、エンジン`x`の現在状態を出力する。


## 事後条件
`os`のフォーマットフラグが、この関数を呼び出す前の状態に戻ること。


## 戻り値
`os`


## 例
```cpp example
#include <iostream>
#include <random>

int main()
{
  std::ranlux24_base engine;
  std::cout << engine << std::endl;
}
```
* std::ranlux24_base[link /reference/random/ranlux24_base.md]

### 出力
```
15136306 8587749 2346244 16479026 15515802 9510553 16090340 14501685 13839944 10789678 11581259 9590790 5840316 5953700 13398366 8134459 16629731 6851902 15583892 1317475 4231148 9092691 5707268 2355175 0 0
```

## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): ??
- [GCC](/implementation.md#gcc): 4.7.2 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): 2010 [mark verified], 2012 [mark verified], 2013 [mark verified], 2015 [mark verified], 2017 [mark verified]


## 参照
