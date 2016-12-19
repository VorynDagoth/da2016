#Задание 1

#Используйте команду readLines для загрузки файла в текстовый вектор html.
forbesData<-readLines("https://github.com/SergeyMirvoda/da2016/blob/master/data/forbes.htm", n=-1)

#Сколько строк в файле?
length(forbesData)

#Сколько символов в файле?
sum(nchar(forbesData))

#Откройте файл в текстовом редакторе. Найдите строки, содержащие данные о Билле Гейтсе и Ларри Эллисоне и запомните размер их дохода.
#Напишите шаблон регулярного выражения и используйте функцию grep, чтобы извлечь размер дохода из данных в векторе html. Удостоверьтесь, что полученный вектор номеров строк содержит содержит ровно 100 записей и ссылается на номера строк в котрых действительно есть информация о доходе, а не просто первый попавшийся текст.
pattern <- "[$]\\d{,2}[,]?\\d{,2}?\\s[B]"
length(grep(pattern,forbesData))

#Напишите код, использовав регулярное выражение из п. 3, и функции regexp и regmatches, чтобы извлечь все данные о доходе. 
regexpr(pattern,forbesData)
regmatches(forbesData, regexpr(pattern,forbesData))

#Проверьте следующее:
# Должно быть ровно сто значений.
length(regmatches(forbesData, regexpr(pattern,forbesData)))

#Самый большой доход должен быть доход Билла Гейтса
regmatches(forbesData, regexpr(pattern,forbesData))[1]

#Такой доход должен быть в списке один раз.
length(regmatches(forbesData, regexpr(pattern,forbesData))["$72 B"])

#В всписке должна быть цифра, которую мы запомнили для Ларри Эллисона.
length(regmatches(forbesData, regexpr(pattern,forbesData))["$41 B"])

#Должно быть как минимум два значения, встречающихся несколько раз.
length(unique(regmatches(forbesData, regexpr(pattern,forbesData))))

#Задание 2

#В данных доход представлен в формате "$42 B", что означает 42 ?? 10^9. Преобразуйте этот формат в числовой и сохраните в вектор worths.
dohod<-regmatches(forbesData, regexpr(pattern,forbesData)) 
dohod<-sub(",",".",dohod)
dohod<-substr(dohod,2,nchar(dohod)-2)
worths<-as.numeric(dohod)*10**9

#Удостоверьтесь в следующем:
#worths является вектором и в нём сто занчений типа double.
is.double(worths)

#Все элементы вектора worths больше 1 миллиарда.
length(worths[worths>1*10**9]) 

#Самое большое число это доход Билла Гейтса.
which.max(worths) 

#Используйте вектор worths , чтобы выяснить следующее:
#Какова медиана ста этих записей?
median(worths)

#Средний доход?
mean(worths) 

#Как много людей из этого списка имеют доход больше 5млрд., 10, 25?
length(worths[worths>5*10**9]) 
length(worths[worths>10*10**9]) 
length(worths[worths>25*10**9]) 

#Какой их общий доход?
sum(worths)

#Какую долю от общего дохода, составляет пятёрка самых богатых.
sum(worths[1:5])/sum(worths)

#Какую долю от общего дохода, составляют 20 самых богатых.
sum(worths[1:20])/sum(worths) 

#В данных федерального резерва США найдите показатель дохода всех домохозяйств (Household net worth) в соответвующем году, какую долю общего дохода составляют 100 богатейших людей.
sum(worths)/90196.1*10**9
