# コンストラクタ
* typeindex[meta header]
* std[meta namespace]
* type_index[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
type_index(const type_info& rhs) noexcept;
```

## type_indexの構築
- `type_index(const type_info& rhs) noexcept`

`type_info`オブジェクトからの構築


## 例外
投げない


## 例
```cpp example
#include <cassert>
#include <typeindex>

int main()
{
  std::type_index ti = typeid(int);
  assert(ti == typeid(int));
}
```

### 出力
```
```

## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): ?
- [GCC](/implementation.md#gcc): 4.6.1 [mark verified]
- [ICC](/implementation.md#icc): ?
- [Visual C++](/implementation.md#visual_cpp): 2010 [mark verified], 2012 [mark verified], 2013 [mark verified], 2015 [mark verified], 2017 [mark verified]
