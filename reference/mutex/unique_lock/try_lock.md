# try_lock
* mutex[meta header]
* std[meta namespace]
* unique_lock[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
bool try_lock();
```

## 概要
ロックの取得を試みる


## 要件
`Mutex`型が、`try_lock()`メンバ関数をサポートするミューテックス型であること


## 効果
```cpp
pm->try_lock();
```

※`pm`はメンバ変数として保持している、ミューテックスオブジェクトへのポインタ


## 事後条件
[`owns_lock()`](owns_lock.md)の値が、`pm->try_lock()`の戻り値になること


## 戻り値
`pm->try_lock()`の戻り値が返る


## 例外
この関数は、`pm->try_lock()` 関数内で投げられうるあらゆる例外を投げる可能性がある。 

そのほかに、以下のerror conditionを持つ[`system_error`](/reference/system_error/system_error.md)例外オブジェクトを送出する可能性がある：

- [`operation_not_permitted`](/reference/system_error/errc.md) ： `pm`が`NULL`
- [`resource_deadlock_would_occur`](/reference/system_error/errc.md) ： [`owns_lock()`](owns_lock.md) `== true`の状態でこの関数が呼び出された


## 例
```cpp example
#include <iostream>
#include <thread>
#include <mutex>
#include <system_error>

class X {
  std::mutex mtx_;
  int value_ = 0;
public:
  // メンバ変数value_への書き込みを排他的にする
  void add_value(int value)
  {
    std::unique_lock<std::mutex> lk(mtx_, std::defer_lock);

    if (!lk.try_lock()) {
      // ロックの取得に失敗
      std::error_code ec(static_cast<int>(std::errc::device_or_resource_busy), std::generic_category());
      throw std::system_error(ec);
    }
    value_ = value;
  }
};

int main()
{
  X x;

  std::thread t1([&x]{ x.add_value(1); });
  std::thread t2([&x]{ x.add_value(2); });

  t1.join();
  t2.join();
}
```
* try_lock[color ff0000]
* std::defer_lock[link /reference/mutex/defer_lock.md]
* std::errc::device_or_resource_busy[link /reference/system_error/errc.md]
* std::generic_category()[link /reference/system_error/generic_category.md]
* std::system_error[link /reference/system_error/system_error.md]

### 出力
```
terminate called after throwing an instance of 'std::system_error'
  what():  Device or resource busy
```

## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): ??
- [GCC](/implementation.md#gcc): 4.7.0 [mark verified]
- [ICC](/implementation.md#icc): ??
- [Visual C++](/implementation.md#visual_cpp): 2012 [mark verified], 2013 [mark verified], 2015 [mark verified]
    - 2012, 2013は、例外の節で説明している`system_error`を投げる処理が実装されていない。


## 参照
