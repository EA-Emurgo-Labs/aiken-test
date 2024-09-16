use aiken/collection/list
use cardano/assets.{Value}

pub fn makeAsset(x: (ByteArray, ByteArray, Int)) -> Value {
  let (a, b, c) = x

  assets.from_asset(a, b, c)
}

pub fn mergeValueList(valueList: List<(ByteArray, ByteArray, Int)>) -> Value {
  when valueList is {
    [x] -> {
      let (a, b, c) = x
      let assetValue = assets.from_asset(a, b, c)
      assetValue
    }
    _ -> {
      expect Some(head) = list.head(valueList)
      expect Some(tail) = list.tail(valueList)
      assets.merge(makeAsset(head), mergeValueList(tail))
    }
  }
}
