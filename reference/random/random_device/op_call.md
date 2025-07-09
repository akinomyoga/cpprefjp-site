# operator()
* random[meta header]
* std[meta namespace]
* random_device[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
result_type operator()();
```

## 概要
非決定論的な乱数の生成を行う。


## 戻り値
処理系定義な方法で、非決定論的な乱数を生成して返す。  
値の範囲は`[`[`min()`](min.md), [`max()`](max.md)`]`である。つまり、最小値と最大値両方を含む。


## 例外
非決定論的な乱数を生成できなかった場合、[`exception`](/reference/exception/exception.md)から派生した処理系定義の例外オブジェクトを送出する。


## 例
```cpp example
#include <iostream>
#include <random>

int main()
{
  std::random_device rd;

  for (int i = 0; i < 10; ++i) {
    // 乱数生成
    unsigned int result = rd();

    std::cout << result << std::endl;
  }
}
```
* rd()[color ff0000]

### 出力例
```
2284556121
263670535
2150180423
108225722
1190313341
2571297678
2016112144
4255475211
252992055
1302323609
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


