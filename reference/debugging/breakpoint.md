# breakpoint
* debugging[meta header]
* std[meta namespace]
* function[meta id-type]
* cpp26[meta cpp]

```cpp
namespace std {
  void breakpoint() noexcept; // (1) C++26
}
```

## 概要
ブレークポイントを設置する。

この関数は無条件のブレークポイントであり、デバッガの存在を検出できない状況でもプログラムの一時停止 (ブレーク) を試みる。

プログラムコードでブレークポイントを指定できると、複雑な実行時条件でプログラムを一時停止させることができる。


## 効果
標準規格としては、この関数の意味論は処理系定義である。

実際の動作としては、この関数が呼び出されるとプログラムの実行が一時停止され、以下のいずれかの時点までデバッガに制御が渡される：

- デバッガによってプログラムが終了される、または
- デバッガが、この関数が呼び出されなかったかのようにプログラムの実行を再開する


## 例外
投げない


## 備考
- 実装としては、生成されるコードがプラットフォームに対して可能な限り最小になるように最適化することが期待される。例として、x86ターゲット環境ではINT3命令をひとつだけ生成することが期待される


## 例
```cpp example
#include <print>
#include <debugging>
#include <cmath>

// なんらかの処理
double g(double a, double b) {
  return a / b;
}

double f(double a, double b) {
  double ret = g(a, b);
  if (std::isnan(ret) || std::isinf(ret)) {
    // 演算結果でNaNかinfが発生したらブレークし、
    // デバッガでパラメータ (ローカル変数) などを確認する
    std::breakpoint();
  }
  return ret;
}

int main() {
  double ret = f(2.0, 0.0);
  std::println("{}", ret);
}
```
* std::breakpoint[color ff0000]
* std::isnan[link /reference/cmath/isnan.md]
* std::isinf[link /reference/cmath/isinf.md]

### 出力例
```
inf
```


## バージョン
### 言語
- C++26

### 処理系
- [Clang](/implementation.md#clang): 19 [mark noimpl]
- [GCC](/implementation.md#gcc): 14 [mark noimpl]
- [Visual C++](/implementation.md#visual_cpp): 2022 Update 10 [mark noimpl]


## 参照
- [P2546R5 Debugging Support](https://open-std.org/jtc1/sc22/wg21/docs/papers/2023/p2546r5.html)
