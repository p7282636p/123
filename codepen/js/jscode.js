function thetime(){
  var mytime = new Date ();
  h = mytime.getHours();
  if (h<10) {h = "0" + h};
  m = mytime.getMinutes();
  if (m<10) {m = "0" + m };
  s = mytime.getSeconds();
  if (s<10) {
    s = "0" + s
  };
  rr = "時間："+h + " 點 " + m +" 分 " + s + " 秒 ";
  document.getElementById('thetime').innerHTML = rr ;
  t = setTimeout ("thetime()",1000);
}
thetime();