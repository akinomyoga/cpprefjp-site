# is_character_file
* filesystem[meta header]
* std::filesystem[meta namespace]
* function[meta id-type]
* cpp17[meta cpp]

```cpp
namespace std::filesystem {
  bool is_character_file(file_status s) noexcept;                      // (1)
  bool is_character_file(const path& p);                               // (2)
  bool is_character_file(const path& p, std::error_code& ec) noexcept; // (3)
}
```
* file_status[link file_status.md]
* path[link path.md]

## 概要
指定されたパスがキャラクタデバイスのスペシャルファイルを指しているかを確認する。

Linux環境においては、`/dev/null`、`/dev/urandom`、`/dev/zero`などがキャラクタデバイスに該当する。


## 戻り値
- (1) : `return` [`s.type()`](file_status/type.md) `==` [`file_type::character`](file_type.md)`;`
- (2) : `return is_character_file(`[`status`](status.md)`(p));`
- (3) :
    ```cpp
    file_status s = status(p, ec);
    return is_character_file(s);
    ```
    * file_status[link file_status.md]
    * status[link status.md]
    * file_type[link file_type.md]
    * s.type()[link file_status/type.md]
    * ec.clear()[link /reference/system_error/error_code/clear.md]


## 例外
- (1) : 投げない
- (2) : ファイルシステムがエラーを報告する場合がある。それに加えて、指定されたファイルの種別が[`file_type::none`](file_type.md)、[`file_type::not_found`](file_type.md)、[`file_type::unknown`](file_type.md)のいずれかである場合もエラーである。エラーが発生した場合は、[`std::filesystem::filesystem_error`](filesystem_error.md)例外を送出する
- (3) : 投げない


## 例
### Linux環境の例
```cpp example
#include <cassert>
#include <filesystem>

namespace fs = std::filesystem;

int main()
{
  // (1)
  // 取得済みのファイル状態を使用して、キャラクタスペシャルファイルかを確認
  assert(fs::is_character_file(fs::status("/dev/null")));

  // (2)
  // パスを指定して、キャラクタスペシャルファイルかを確認。
  assert(fs::is_character_file("/dev/null"));
  assert(fs::is_character_file("/dev/urandom"));
  assert(fs::is_character_file("/dev/zero"));

  // (3)
  // エラー情報を例外ではなくerror_codeで受け取る
  std::error_code ec;
  bool result = fs::is_character_file("/dev/null", ec);
  assert(!ec);
  assert(result);
}
```
* fs::is_character_file[color ff0000]
* fs::status[link status.md]

#### 出力
```
```

## バージョン
### 言語
- C++17

### 処理系
- [Clang](/implementation.md#clang): 7.0 [mark verified]
- [GCC](/implementation.md#gcc): 8.1 [mark verified]
- [Visual C++](/implementation.md#visual_cpp):
