@val external document: {..} = "document"

let counter = ref(0)

let updateCountText = value => {
  let count = document["querySelector"](".count")
  count["innerText"] = `Count is ${Belt.Int.toString(value)}`
}

let updateCount = steps => {
  counter := counter.contents + steps
  updateCountText(counter.contents)
}

let plusOne = () => updateCount(1)
let minusOne = () => updateCount(-1)

let plusBtn = document["querySelector"]("#plus-one")
plusBtn["addEventListener"]("click", plusOne)
let minusBtn = document["querySelector"]("#minus-one")
minusBtn["addEventListener"]("click", minusOne)

let getCountClassName = value => {
  if value > 0 {
    "count-positive"
  } else if value < 0 {
    "count-negative"
  } else {
    "count-zero"
  }
}

let updateClassName = () => {
  let count = document["querySelector"]("#count")
  let count_sign = getCountClassName(counter.contents)
  count["className"] = `count ${count_sign}`
}

let button_row = document["querySelector"](".button-row")
button_row["addEventListener"]("click", updateClassName)
