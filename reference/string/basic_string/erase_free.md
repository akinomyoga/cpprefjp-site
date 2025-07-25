# erase (非メンバ関数)
* string[meta header]
* std[meta namespace]
* function template[meta id-type]
* cpp20[meta cpp]

```cpp
namespace std {
  template <class CharT, class Traits, class Allocator, class U>
  constexpr typename basic_string<CharT, Traits, Allocator>::size_type
    erase(basic_string<CharT, Traits, Allocator>& c, const U& value);   // (1) C++20
  template <class CharT, class Traits, class Allocator, class U = CharT>
  constexpr typename basic_string<CharT, Traits, Allocator>::size_type
    erase(basic_string<CharT, Traits, Allocator>& c, const U& value);   // (1) C++26
}
```

## 概要
指定した値をもつ要素とその分の領域を、コンテナから削除する。


## 効果
以下と等価：

```cpp
auto it = remove(c.begin(), c.end(), value);
auto r = distance(it, c.end());
c.erase(it, c.end());
return r;
```
* c.erase[link erase.md]
* remove[link /reference/algorithm/remove.md]
* distance[link /reference/iterator/distance.md]
* c.begin()[link begin.md]
* c.end()[link end.md]


## 戻り値
削除した要素数を返す。


## 備考
- (1) :
    - C++26 : 引数として波カッコ初期化`{}`を受け付ける
        ```cpp
        erase(s, {});    // ヌル文字'\0'を削除
        erase(s, {'a'}); // 文字'a'を削除
        ```


## 例
### 基本的な使い方
```cpp example
#include <iostream>
#include <string>

int main()
{
  std::string s = " Hello World ";

  // コンテナsから、スペースをすべて削除する
  std::erase(s, ' ');

  std::cout << s << std::endl;
}
```
* std::erase[color ff0000]

#### 出力
```
HelloWorld
```

### 波カッコ初期化を入力文字として使用する (C++26)
```cpp example
#include <iostream>
#include <string>

int main() {
  const char ar[] = "hel\0lo";
  std::string s(ar, ar + sizeof(ar));

  std::erase(s, {});
  std::erase(s, {'l'});

  std::cout << s << std::endl;
}
```

#### 出力
```
heo
```


## バージョン
### 言語
- C++20

### 処理系
- [Clang](/implementation.md#clang): 8.0 [mark verified]
- [GCC](/implementation.md#gcc): 9.1 [mark verified]
- [Visual C++](/implementation.md#visual_cpp): ??


## 参照
- [P1209R0 Adopt consistent container erasure from Library Fundamentals 2](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p1209r0.html)
- [R1115R3 Improving the Return Value of Erase-Like Algorithms II: Free `erase`/`erase_if`](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2019/p1115r3.pdf)
- [P2248R8 Enabling list-initialization for algorithms](https://open-std.org/jtc1/sc22/wg21/docs/papers/2024/p2248r8.html)
    - C++26で波カッコ初期化 (リスト初期化) に対応した
