library(XML)
#一個把html 轉成xml的東西
library(httr)
#一個把html 轉成xml的東西
library(RCurl)
#爬蟲程式的東西
#subpathURL = "https://www.ptt.cc/bbs/MLB/index"
subpathURL = "https://www.ptt.cc/bbs/movie/index"


startnum=1950
endnum= 2009
alldata = data.frame()
for(i in c(startnum:endnum)) {
  pathURL =paste( subpathURL ,i,".html", sep="" )
  print(pathURL)
  #定義一個儲存原始碼的變數（把url裡面的內容通通存在doc裡面）
  doc <- getURL(pathURL, encoding="utf-8")
  #定義一個轉換成XML的結果（把doc處理的結果存在xml裡面 ）
  xmldoc <- htmlParse(doc, encoding = "utf-8")
  #把解析的結果存在變數裡面(eg title)(被解析者，規則，抓裡面的內容/如果沒寫的話就是抓tag的屬性)
  title= xpathSApply(xmldoc,"//div[@class=\"title\"]",xmlValue )
  link= xpathSApply(xmldoc,"//div[@class=\"title\"]/a//@href")
  tempframe = data.frame(title, link)
  alldata = rbind(alldata, tempframe)
}

write.table(alldata, file = "./codepen/movie.csv")



#urlPath <- "https://www.ptt.cc/bbs/movie/index.html"
#temp    <- getURL(urlPath, encoding = "big5")
#xmldoc  <- htmlParse(temp)
#title   <- xpathSApply(xmldoc, "//div[@class=\"title\"]", xmlValue)
