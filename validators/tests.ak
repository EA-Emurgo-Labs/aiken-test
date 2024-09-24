use cardano/transaction.{NoDatum, Transaction, placeholder}
use example
use props/ints as i
use units/tx as t
use units/value as v

test unit_test() {
  let asset = (#"0000", #"1111", 1)

  let value = v.makeAsset(asset)

  let oref = t.oref(#"face", 1)

  let in = t.input(oref, t.output(t.scriptAddress(#"cafe"), value, NoDatum))

  let out = t.output(t.scriptAddress(#"cafe"), value, NoDatum)

  let tx = Transaction { ..placeholder, inputs: [in], outputs: [out] }

  let redeemer = #"00"

  example.example.spend(None, redeemer, oref, tx)?
}

test property_quantity_test((a, b) via i.twoTens()) fail {
  let asset1 = (#"0000", #"1111", a)
  let asset2 = (#"0000", #"1111", b)

  let oref = t.oref(#"face", 1)

  let in =
    t.input(
      oref,
      t.output(t.scriptAddress(#"cafe"), v.makeAsset(asset1), NoDatum),
    )

  let out = t.output(t.scriptAddress(#"cafe"), v.makeAsset(asset2), NoDatum)

  let tx = Transaction { ..placeholder, inputs: [in], outputs: [out] }

  let redeemer = #"00"

  example.example.spend(None, redeemer, oref, tx)?
}
