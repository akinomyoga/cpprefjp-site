# operator!=
* functional[meta header]
* std[meta namespace]
* function template[meta id-type]
* cpp11[meta cpp]

```cpp
namespace std {
  // operator==により、以下のオーバーロードが使用可能になる (C++20)
  template <class R, class... ArgTypes>
  bool operator!=(const function<R(ArgTypes...)>& f, nullptr_t) noexcept; // (1) C++11

  template <class R, class... ArgTypes>
  bool operator!=(nullptr_t, const function<R(ArgTypes...)>& f) noexcept; // (2) C++11
}
```

## 概要
非等値比較する。


## 戻り値
`static_cast<bool>(f)`


## 例
```cpp example
#include <iostream>
#include <functional>

int ident(int x) { return x; }

int main()
{
  std::function<int(int)> f = ident;

  if (f != nullptr) {
    std::cout << "not empty" << std::endl;
  }

  f = nullptr;
  if (f != nullptr) {}
  else {
    std::cout << "empty" << std::endl;
  }
}
```

### 出力
```
not empty
empty
```


## バージョン
### 言語
- C++11


### 処理系
- [Clang](/implementation.md#clang): 3.0 [mark verified]
- [GCC](/implementation.md#gcc): 4.6.4 [mark verified]
- [Visual C++](/implementation.md#visual_cpp): ??


## 参照
- [P1614R2 The Mothership has Landed](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2019/p1614r2.html)
    - C++20での三方比較演算子の追加と、関連する演算子の自動導出
