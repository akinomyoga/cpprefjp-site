# discard
* random[meta header]
* std[meta namespace]
* linear_congruential_engine[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
void discard(unsigned long long z);
```

## 概要
指定した回数だけ擬似乱数を生成し、内部状態を進める。


## 効果
`*this`を`e`とした場合、

```cpp
for (unsigned long long i = 0; i < z; ++i) {
  e();
}
```
* e()[link op_call.md]

と同じ効果を持つ。

指定された回数だけ乱数生成を行い、結果を破棄する。


## 戻り値
なし


## 例
```cpp example
#include <iostream>
#include <random>

int main()
{
  std::minstd_rand engine;

  for (int i = 0; i < 5; ++i) {
    engine();
  }

  std::cout << engine() << std::endl;

  // エンジンを再初期化し、内部状態を5回進める
  // 上のコードで生成した乱数と同じ結果が得られる
  engine.seed();
  engine.discard(5);

  std::cout << engine() << std::endl;
}
```
* discard[color ff0000]
* std::minstd_rand[link /reference/random/minstd_rand.md]
* engine()[link op_call.md]
* seed()[link seed.md]

### 出力
```
407355683
407355683
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
