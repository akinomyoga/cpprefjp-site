# operator==
* random[meta header]
* std[meta namespace]
* function template[meta id-type]
* cpp11[meta cpp]

```cpp
namespace std {
  template <class UIntType, size_t w, size_t n, size_t m, size_t r,
            UIntType a, size_t u, UIntType d, size_t s,
            UIntType b, size_t t,
            UIntType c, size_t l, UIntType f>
  bool operator==(
    const mersenne_twister_engine<UIntType, w, n, m, r, a, u, d, s, b, t, c, l, f>& a,
    const mersenne_twister_engine<UIntType, w, n, m, r, a, u, d, s, b, t, c, l, f>& b);
}
```

## 概要
等値比較を行う。


## 戻り値
`a`と`b`の状態シーケンスの、全ての値を等値比較し、等しければ`true`、そうでなければ`false`を返す。


## 計算量
O(状態シーケンスのサイズ)


## 例
```cpp example
#include <iostream>
#include <random>

int main()
{
  std::mt19937 e1;
  std::mt19937 e2;

  if (e1 == e2) {
    std::cout << "equal" << std::endl;
  }
  else {
    std::cout << "not equal" << std::endl;
  }
}
```

### 出力
```
equal
```

## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): ??
- [GCC](/implementation.md#gcc): 4.7.2 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): ??


## 参照
