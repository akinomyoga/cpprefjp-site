# min
* random[meta header]
* std[meta namespace]
* geometric_distribution[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
result_type min() const;
```

## 概要
生成し得る値の下限を取得する。


## 戻り値
最小の失敗回数である`0`を返す。


## 例
```cpp example
#include <iostream>
#include <random>

int main()
{
  std::geometric_distribution<> dist(0.5);

  int min_value = dist.min();
  std::cout << min_value << std::endl;
}
```
* min()[color ff0000]

### 出力
```
0
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
