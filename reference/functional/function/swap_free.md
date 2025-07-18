# swap (非メンバ関数)
* functional[meta header]
* std[meta namespace]
* function template[meta id-type]
* cpp11[meta cpp]

```cpp
namespace std {
  template <class R, class... ArgTypes>
  void swap(function<R(ArgTypes...)>& x, function<R(ArgTypes...)>& y);
}
```

## 概要
2つの`function`オブジェクトを入れ替える。


## 効果
`x.`[`swap`](swap.md)`(y)`


## 戻り値
なし


## 例
```cpp example
#include <iostream>
#include <functional>

int ident(int x) { return x; }
int add(int x) { return x + 1; }

int main()
{
  std::function<int(int)> f = ident;
  std::function<int(int)> g = add;

  // fとgを交換
  std::swap(f, g);

  std::cout << f(1) << std::endl; // add
  std::cout << g(1) << std::endl; // ident
}
```
* std::swap[color ff0000]
* f(1)[link op_call.md]
* g(1)[link op_call.md]

### 出力
```
2
1
```


## バージョン
### 言語
- C++11


### 処理系
- [Clang](/implementation.md#clang): 3.0 [mark verified]
- [GCC](/implementation.md#gcc): 4.3.6 [mark verified]
- [Visual C++](/implementation.md#visual_cpp): ??


## 参照
