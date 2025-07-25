# notify_all
* condition_variable[meta header]
* std[meta namespace]
* condition_variable_any[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
void notify_all() noexcept;
```

## 概要
待機している全てのスレッドを起床させる


## 効果
`*this`の`condition_variable_any`オブジェクトを待機している全てのスレッドをブロッキング解除する。


## 戻り値
なし


## 例外
投げない


## 例
```cpp example
#include <iostream>
#include <condition_variable>
#include <mutex>
#include <thread>

struct ProcessData {
  std::recursive_mutex mtx_;
  std::condition_variable_any cond_;

  bool data_ready_ = false;

public:
  // 処理に必要なデータの準備をする
  void prepare_data_for_processing()
  {
    // ...準備処理...

    {
      std::lock_guard<std::recursive_mutex> lk(mtx_);
      data_ready_ = true;
    }

    // 準備完了したので待機スレッドを全て起床させる
    cond_.notify_all();
  }

  void wait_for_data_to_process()
  {
    std::unique_lock<std::recursive_mutex> lk(mtx_);

    // データの準備ができるまで待機してから処理する
    cond_.wait(lk, [this] { return data_ready_; });
    process_data();
  }

private:
  void process_data()
  {
    // ...データを処理する...
    std::cout << "process data" << std::endl;
  }
};

int main()
{
  ProcessData p;

  std::thread t1([&] { p.prepare_data_for_processing(); });
  std::thread t2([&] { p.wait_for_data_to_process(); });
  std::thread t3([&] { p.wait_for_data_to_process(); });

  t1.join();
  t2.join();
  t3.join();
}
```
* notify_all[color ff0000]
* std::recursive_mutex[link /reference/mutex/recursive_mutex.md]
* cond_.wait[link wait.md]

### 出力
```
process data
process data
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
