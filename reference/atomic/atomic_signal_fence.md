# atomic_signal_fence
* atomic[meta header]
* std[meta namespace]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
namespace std {
  extern "C"
  void
    atomic_signal_fence(memory_order order) noexcept; // (1) C++11
  extern "C"
  constexpr void
    atomic_signal_fence(memory_order order) noexcept; // (1) C++26
}
```
* memory_order[link memory_order.md]


## 概要
同一スレッド内のシグナルハンドラ実行との間でのみ有効なメモリフェンスを発行する。


## 効果
この関数は、スレッドと、そのスレッド上で処理されるシグナルハンドラとの間でのみ、その効果が有効である、という点を除いて[`atomic_thread_fence`](atomic_thread_fence.md)`(order)`と同じ効果を持つ。


## 戻り値
なし


## 例外
投げない


## 例
```cpp
```


### 出力
```
```


## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): ??
- [GCC](/implementation.md#gcc): 4.7.0 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): 2012 [mark verified], 2013 [mark verified]


## 参照
- [How to correctly use std::atomic_signal_fence()?](http://stackoverflow.com/questions/14581090/how-to-correctly-use-stdatomic-signal-fence)
- [P3309R3 `constexpr atomic` and `atomic_ref`](https://open-std.org/jtc1/sc22/wg21/docs/papers/2024/p3309r3.html)
    - C++26で`constexpr`に対応した
