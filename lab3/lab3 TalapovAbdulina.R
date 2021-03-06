#������� 1

#����������� ������� readLines ��� �������� ����� � ��������� ������ html.
forbesData<-readLines("https://github.com/SergeyMirvoda/da2016/blob/master/data/forbes.htm", n=-1)

#������� ����� � �����?
length(forbesData)

#������� �������� � �����?
sum(nchar(forbesData))

#�������� ���� � ��������� ���������. ������� ������, ���������� ������ � ����� ������ � ����� �������� � ��������� ������ �� ������.
#�������� ������ ����������� ��������� � ����������� ������� grep, ����� ������� ������ ������ �� ������ � ������� html. ��������������, ��� ���������� ������ ������� ����� �������� �������� ����� 100 ������� � ��������� �� ������ ����� � ������ ������������� ���� ���������� � ������, � �� ������ ������ ���������� �����.
pattern <- "[$]\\d{,2}[,]?\\d{,2}?\\s[B]"
length(grep(pattern,forbesData))

#�������� ���, ����������� ���������� ��������� �� �. 3, � ������� regexp � regmatches, ����� ������� ��� ������ � ������. 
regexpr(pattern,forbesData)
regmatches(forbesData, regexpr(pattern,forbesData))

#��������� ���������:
# ������ ���� ����� ��� ��������.
length(regmatches(forbesData, regexpr(pattern,forbesData)))

#����� ������� ����� ������ ���� ����� ����� ������
regmatches(forbesData, regexpr(pattern,forbesData))[1]

#����� ����� ������ ���� � ������ ���� ���.
length(regmatches(forbesData, regexpr(pattern,forbesData))["$72 B"])

#� ������� ������ ���� �����, ������� �� ��������� ��� ����� ��������.
length(regmatches(forbesData, regexpr(pattern,forbesData))["$41 B"])

#������ ���� ��� ������� ��� ��������, ������������� ��������� ���.
length(unique(regmatches(forbesData, regexpr(pattern,forbesData))))

#������� 2

#� ������ ����� ����������� � ������� "$42 B", ��� �������� 42 ?? 10^9. ������������ ���� ������ � �������� � ��������� � ������ worths.
dohod<-regmatches(forbesData, regexpr(pattern,forbesData)) 
dohod<-sub(",",".",dohod)
dohod<-substr(dohod,2,nchar(dohod)-2)
worths<-as.numeric(dohod)*10**9

#�������������� � ���������:
#worths �������� �������� � � ��� ��� �������� ���� double.
is.double(worths)

#��� �������� ������� worths ������ 1 ���������.
length(worths[worths>1*10**9]) 

#����� ������� ����� ��� ����� ����� ������.
which.max(worths) 

#����������� ������ worths , ����� �������� ���������:
#������ ������� ��� ���� �������?
median(worths)

#������� �����?
mean(worths) 

#��� ����� ����� �� ����� ������ ����� ����� ������ 5����., 10, 25?
length(worths[worths>5*10**9]) 
length(worths[worths>10*10**9]) 
length(worths[worths>25*10**9]) 

#����� �� ����� �����?
sum(worths)

#����� ���� �� ������ ������, ���������� ������ ����� �������.
sum(worths[1:5])/sum(worths)

#����� ���� �� ������ ������, ���������� 20 ����� �������.
sum(worths[1:20])/sum(worths) 

#� ������ ������������ ������� ��� ������� ���������� ������ ���� ������������ (Household net worth) � ������������� ����, ����� ���� ������ ������ ���������� 100 ���������� �����.
sum(worths)/90196.1*10**9
