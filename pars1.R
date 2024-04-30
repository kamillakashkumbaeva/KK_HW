library (rvest)
k1 <- "https://augustnews.ru/category/culture/page/" 
links1 <- c() #создаём вектор, где будут все ссылки, начиная с 1 страницы

linkslinks1 <- c() #страницы/все ссылки
for (i in 1:84) { 
  links1[i] <- paste0(k1,i,"/") #чтобы страницы менялись #функция paste0() объединяет
  linkslinks1 <- c(linkslinks1, links1[i]) #берём ссылки на каждую страницу
}
readlinks <- function(x) { #создаём функцию, которая будет считывать ссылки с новостей
  webpage <- read_html(x) #обращаемся к коду страницы
  sch <- webpage %>% html_nodes(".entry-title") %>% html_elements("a") %>% html_attr("href")                                   #html_nodes css класс - ф-ция пакета rvest в R, которая извлекает HTML-элементы из кода веб-страницы.#html_elements - это функция, используемая для выбора конкретного экземпляра HTML-элемента#html_attr - это функция, позволяющая извлекать атрибуты HTML-элементов (такие как href, src, и т.д.) из выбранных узлов. 
  sch <- sch[!is.na(sch)]                                                                                                      #логическое выражение, которое проверяет, содержит ли переменная sch значения NA, то есть отсутствующие значения).  
  return(sch) 
}

nwslnks1 <- list()
for (i in 1:length(linkslinks1)) {
  nwslnks1[[i]] <- readlinks(linkslinks1[i]) #тут будут собираться ссылки с каждой страницы на каждую новость
}
nwslnks1 <- unlist(nwslnks1)

ftitle <- function(x) {
  titles <- c()
  for (i in 1:length(x)){
    titles[i] <- read_html(x[i]) %>% html_nodes (".entry-title") %>% html_text()#чтобы текст собрался со всех заголовков
  }
  return(titles) #ф-ция, которая собирает заголовки
}

ftime <- function(x) {
  timee <- c()
  for (i in 1:length(x)){
    timee[i] <- read_html(x[i]) %>% html_nodes (".published") %>% html_text()
  }
return(timee) 
}

fbody <- function(x) { 
  bodyy <- c()
  for (i in 1:length(x)){
    bodyy[i] <- read_html(x[i]) %>% html_nodes (".entry-inner") %>% html_text2() 
  }
return(bodyy)  
}
 
alltitl1 <-  c()
for (i in 1:length(nwslnks1)) {
alltitl1[i] <- ftitle(nwslnks1[i])                                                                                             #чтобы с каждой считался заголовок и мобрался в вектор
}
timeee1 <-  c()
for (i in 1:length(nwslnks1)) {
timeee1[i] <- ftime(nwslnks1[i]) 
}
bodyyy1 <-  c()
for (i in 1:length(nwslnks1)) {
bodyyy1[i] <- fbody(nwslnks1[i]) 
}

category1 <- c()
for (i in 1:length(nwslnks1)) {
  category1[i] <- paste("культура")
}

k2 <- "https://augustnews.ru/category/sport/page/"
links2 <- c() 

linkslinks2 <- c() 
for (i in 1:84) { 
  links2[i] <- paste0(k2,i,"/") 
  linkslinks2 <- c(linkslinks2, links2[i]) 
}

nwslnks2 <- c()
for (i in 1:length(linkslinks2)) {
  nwslnks2[[i]] <- readlinks(linkslinks2[i]) #тут будут собираться ссылки с каждой страницы на каждую новость
}
nwslnks2 <- unlist(nwslnks2)

#вектор с заголовками
alltitl2 <-  c()
for (i in 1:length(nwslnks2)) {
  alltitl2[i] <- ftitle(nwslnks2[i]) 
}
timeee2 <-  c()
for (i in 1:length(nwslnks2)) {
  timeee2[i] <- ftime(nwslnks2[i]) 
}
bodyyy2 <-  c()
for (i in 1:length(nwslnks2)) {
  bodyyy2[i] <- fbody(nwslnks2[i]) 
}

category2 <- c()
for (i in 1:length(nwslnks2)) {
  category2[i] <- paste("спорт")
}

category <- c(category1, category2)
alltitl <- c(alltitl1, alltitl2)
timeee <- c(timeee1, timeee2)
bodyyy <- c(bodyyy1, bodyyy2)

df <- data.frame(category=category, title = alltitl, time= timeee, body = bodyyy) 



                             
                             