//dBをゲインに変換
function db2gain(value) {
  return Math.pow(10, value / 20)
}
//ゲインをdBに変換
function gain2db(value) {
  return 20 * Math.log(value) / Math.log(10)
}
