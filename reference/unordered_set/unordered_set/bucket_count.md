# bucket_count
* unordered_set[meta header]
* std[meta namespace]
* unordered_set[meta class]
* function[meta id-type]
* cpp11[meta cpp]

```cpp
size_type bucket_count() const noexcept;
```

## 概要
コンテナの現在のバケット数を返す。


## 戻り値
コンテナの現在のバケット数


## 例外
投げない。


## 計算量
定数。


## 例
```cpp example
#include <iostream>
#include <unordered_set>

int main()
{
  std::unordered_set<int> us{ 1, 3, 5, 7, 9, };

  std::cout << "bucket count is " << us.bucket_count() << std::endl;
}
```
* bucket_count()[color ff0000]

### 出力例
```
bucket count is 5
```

## バージョン
### 言語
- C++11

### 処理系
- [Clang](/implementation.md#clang): 3.1 [mark verified]
- [GCC](/implementation.md#gcc): 4.7.0 [mark verified]
- [ICC](/implementation.md#icc): ?
- [Visual C++](/implementation.md#visual_cpp): ?

## 関連項目

| 名前 | 説明 |
|----------------------------------------------|----------------------|
| [`max_bucket_count`](max_bucket_count.md)  | 最大バケット数の取得 |
| [`bucket_size`](bucket_size.md)            | インデックス（添え字）で指定したバケット内の要素数を取得 |
| [`bucket`](bucket.md)                      | キーで指定したバケットのインデックス（添え字）を取得 |
| [`begin(size_type)`](begin-size_type.md)   | インデックス（添え字）で指定したバケット内の先頭要素を指すイテレータを取得 |
| [`end(size_type)`](end-size_type.md)       | インデックス（添え字）で指定したバケット内の最終要素の次を指すイテレータを取得 |
| [`cbegin(size_type)`](cbegin-size_type.md) | インデックス（添え字）で指定したバケット内の先頭要素を指す読み取り専用イテレータを取得 |
| [`cend(size_type)`](cend-size_type.md)     | インデックス（添え字）で指定したバケット内の最終要素の次を指す読み取り専用イテレータを取得 |
