# max
* random[meta header]
* std[meta namespace]
* piecewise_constant_distribution[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
result_type max() const;
```

## 概要
値の範囲の上限を取得する。


## 戻り値
生成する値の範囲の上限を返す。


## 例
```cpp example
#include <iostream>
#include <random>
#include <array>

int main()
{
  std::array<double, 3> intervals = {0.0, 0.5, 1.0};
  std::array<double, 2> densities = {0.3, 0.5};

  std::piecewise_constant_distribution<> dist(
    intervals.begin(),
    intervals.end(),
    densities.begin()
  );

  double max_value = dist.max();
  std::cout << max_value << std::endl;
}
```
* max()[color ff0000]
* intervals.begin()[link /reference/array/array/begin.md]
* intervals.end()[link /reference/array/array/end.md]
* densities.begin()[link /reference/array/array/begin.md]

### 出力
```
1
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
