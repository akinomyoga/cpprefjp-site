# CHAR_MAX
* climits[meta header]
* macro[meta id-type]

```cpp
#define CHAR_MAX implementation-defined
```

## 概要
`char`型が表現できる値の最大値。

値は [`std::numeric_limits`](/reference/limits/numeric_limits.md)`<char>::`[`max()`](/reference/limits/numeric_limits/max.md) と等しいが、型が異なり、また `CHAR_MAX` は `#if` などのプリプロセッサディレクティブで使用できる。

具体的な値は実装依存であるが、`char` が符号付きであれば [`SCHAR_MAX`](schar_max.md) と同じ、符号無しであれば [`UCHAR_MAX`](uchar_max.md) と同じである。このマクロによって定義される値の型は、 `char` の全ての値が `int` で表すことができれば `int`、そうでなければ `unsigned int` である。


## 例
```cpp example
#include <climits>
#include <iostream>

int main()
{
  std::cout << CHAR_MAX << '\n';
}
```


### 出力例
```
127
```

## バージョン
### 言語
- C++03
- C++11

### 処理系
- [Clang](/implementation.md#clang): 3.0 [mark verified], 3.1 [mark verified], 3.2 [mark verified], 3.3 [mark verified], 3.4 [mark verified]
- [GCC](/implementation.md#gcc): 4.3.6 [mark verified], 4.4.7 [mark verified], 4.5.3 [mark verified], 4.5.4 [mark verified], 4.6.4 [mark verified], 4.7.3 [mark verified], 4.8.1 [mark verified], 4.8.2 [mark verified], 4.9.0 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): 2003 [mark verified], 2005 [mark verified], 2008 [mark verified], 2010 [mark verified]
