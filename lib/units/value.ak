use aiken/collection/list
use cardano/assets.{Value}

pub fn makeAsset(x: (ByteArray, ByteArray, Int)) -> Value {
  expect (a, b, c) = x

  assets.from_asset(a, b, c)
}

pub fn mergeValueList(valueList: List<(ByteArray, ByteArray, Int)>) -> Value {
  when valueList is {
    [x] -> {
      expect Some(value) = list.head(valueList)
      let (a, b, c) = value
      let assetValue = assets.from_asset(a, b, c)
      assetValue
    }
    _ -> {
      expect Some(head) = list.head(valueList)
      expect Some(tail) = list.tail(valueList)
      let (a, b, c) = head
      assets.merge(makeAsset(head), mergeValueList(tail))
    }
  }
}
