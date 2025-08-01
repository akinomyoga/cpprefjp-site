# operator|=
* valarray[meta header]
* std[meta namespace]
* gslice_array[meta class]
* function[meta id-type]

```cpp
void operator|=(const ValOrProxy<T>& xs) const;
```
* ValOrProxy[italic]

## 概要
論理和の複合代入を行う。


## 効果
元となる [`valarray`](../valarray.md) オブジェクトから参照によって抽出した各要素に、`xs` の各要素を論理和する。


## 戻り値
なし


## 備考
- 引数の型 *`ValOrProxy`* は、[`valarray`](../valarray.md)、あるいは、その代理となる型である。  
	[`<valarray>`](../../valarray.md) の概要も参照のこと。
- [`valarray`](../valarray.md) から抽出した要素数と `xs` の要素数が異なる場合、未定義動作を引き起こす。


## 例
```cpp example
#include <iostream>
#include <valarray>
#include <bitset>
#include <numeric>
#include <functional>

std::size_t product(const std::valarray<std::size_t>& va)
{
  return std::accumulate(
           std::begin(va),
           std::end(va),
           1u,
           std::multiplies<std::size_t>());
}

int main()
{
  std::valarray<int> va = {
    0b00000101,
    0b00001010,
    0b00010101
  };

  const std::size_t start = 0u;  // 開始位置
  const std::valarray<std::size_t> lengths = {3u}; // 要素数
  const std::valarray<std::size_t> strides = {1u}; // 何個置きに処理するか

  // 抽出した要素に0b11を論理和する
  // lengthを掛け合わせたものがgsliceで抽出した配列の長さ
  va[std::gslice(start, lengths, strides)] |= std::valarray<int>(0b00000011, product(lengths));

  for (int x : va) {
    std::cout << std::bitset<8>(x).to_string() << std::endl;
  }
}
```
* std::gslice[link /reference/valarray/gslice.md]
* std::begin[link /reference/valarray/valarray/begin_free.md]
* std::end[link /reference/valarray/valarray/end_free.md]
* std::multiplies[link /reference/functional/multiplies.md]
* to_string()[link /reference/bitset/bitset/to_string.md]

### 出力
```
00000111
00001011
00010111
```
