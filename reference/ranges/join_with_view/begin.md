# begin
* ranges[meta header]
* std::ranges[meta namespace]
* join_with_view[meta class]
* function[meta id-type]
* cpp23[meta cpp]

```cpp
constexpr auto begin()
  requires (!simple-view<V>);       // (1) C++23

constexpr auto begin() const
  requires range<const V> &&
           input_range<range_reference_t<const V>> &&
           range<const Pattern>;     // (2) C++23
```

## 概要

`view`の先頭要素を指すイテレータを取得する。

## 戻り値
- (1), (2) : `join_with_view`の先頭を指すイテレータを返す。外側のRangeが空でない場合、最初の内側Rangeの先頭要素を指す。外側のRangeが空の場合、[`end()`](end.md)と等価なイテレータを返す。

## 例

```cpp example
#include <ranges>
#include <vector>
#include <string>
#include <iostream>

int main() {
  std::vector<std::string> words = {"hello", "world", "join"};
  std::string delimiter = "-";

  std::ranges::join_with_view r{words, delimiter};

  auto it = r.begin();

  char x = *it;
  std::cout << x << '\n';
}
```
* begin[color ff0000]

### 出力

```
h
```

## バージョン
### 言語
- C++23

### 処理系
- [Clang](/implementation.md#clang): ??
- [GCC](/implementation.md#gcc): 13.2 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): ??
