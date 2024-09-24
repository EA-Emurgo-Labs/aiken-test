use aiken/collection/list
use cardano/transaction.{Datum, OutputReference, Redeemer, Transaction}

validator example {
  spend(_d: Option<Datum>, _r: Redeemer, oref: OutputReference, tx: Transaction) {
    expect Some(ownInput) =
      list.find(tx.inputs, fn(input) { input.output_reference == oref })

    expect Some(ownOutput) =
      list.find(
        tx.outputs,
        fn(output) {
          output.address.payment_credential == ownInput.output.address.payment_credential
        },
      )

    ownInput.output.value == ownOutput.value
  }

  else(_) {
    fail
  }
}
