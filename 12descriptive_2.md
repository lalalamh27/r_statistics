
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# 통계 

# 통계학 유형
1. 기술통계학
2. 추론통계학
3. 베이즈통계학


# 표본추출방법
* 단순랜덤
* 계통추출
* 층화추출
* 군집추출

* 복원추출
    + 표본을 하나 추출한 후 다시 모집단에 넣은 후 
      그 다음 표본을 추출하는 방식 
      $$ m X m X ... x m = m^n = m{\pi} n $$
      $$ _m{\pi}n$$
      
* 비복원추출
    + 한번 뽑은 표본을 모집단에 넣지 않고 다음 표본을 추출
      $$ m(m-1)(m-2) ...(m-n+1) = _m^n = m{\pi} = _m{p}_n $$
      $$ _m{p}_n$$
      
* R에서는 sample 함수를 이용해서 표본을 추출할 수 있음       
    + sample(모집단, 표본수, 복원/비복원여부)      
      
```{r}
sample(x=1:10, 5, replace = T)   # 복원 추출
```
     
     
```{r}
sample(x=1:10, 5, replace = T)      # 비복원 추출
```


     
```{r}
menu <- c('라면','돈까스','비빔국수','탕수육','짜장면')
sample(menu, 1, replace = F)      # 비복원 추출
```
      
      
```{r}
menu <- c('라면','돈까스','비빔국수','탕수육','짜장면')
sample(menu, 5, replace = F)      # 같은 메뉴 3번 나오면 당첨첨
```
  
#자료의 종류
* 질적자료
    + 명목자료 
    + 순서자료 
    + 구간자료 
    + 비율자료 
    
* 양적자료 
    + 이산형
    + 연속형 
    
```
타이타닉 승객 자료에서 성별, 승선위치별, 승선권등급별 승객 비율을 조사해서 출력하세요 
```

```{r}
setwd('c:/java')
titanic <- read.csv('titanic.csv')

```


```{r}
summary(titanic)
```

```{r}
# 성별 승객 현황
frq_gender <-table(titanic$sex) 
barplot(frq_gender)
```

```{r}
# 승선권 등급별 승객 현황
frq_pcls <-table(titanic$pclass) 
barplot(frq_pcls)
```

```{r}
# 승선권 위치별 승객 현황
frq_embk <-table(titanic$embarked) 
barplot(frq_embk)
```


```{r}
# 나이별 승객 현황 1- 양적자료 
age <- titanic$age
summary(titanic$age)
boxplot(age)
```

```{r}
# 나이별 승객 현황 2- 양적자료 
hist(age,xlim=c(0,80))
```


```{r}
# 나이별 승객 현황 1
# 양적자료는 구간척도로 변환해서 시각화 

# 먼저, 나이와 나이대를 저장할 데이터프레임 생성 
age <- titanic$age[!is.na(titanic$age)]
ages <- as.character(age)

df_age <- data.frame(age,ages,stringsAsFactors=F)

head(df_age, 10)

```

```{r}
# 나이 데이터를 토대로 명목변수 생성 
df_age<- within(df_age, {

 ages[age <=1] <-'~01'
 ages[age >= 2 & age < 5] <-'~05'
 ages[age >= 5 & age < 13] <-'~13'
 ages[age >= 13 & age < 19] <-'~18'
 ages[age >= 19 & age < 30] <-'~20'
 ages[age >= 30 & age < 40] <-'~30'
 ages[age >= 40 & age < 50] <-'~40'
 ages[age >= 50 & age < 60] <-'~50'
 ages[age >= 60 & age < 69] <-'~60'
 ages[age >= 70 & age < 79] <-'~70'
 ages[age >=80] <-'~80'
})

head(df_age$ages, 10)

```

```{r}
# 분류된 결과에 대한 빈도표 작성 
frq_ages <- table(df_age$ages)
frq_ages

```


```{r}
# 빈도표를 바탕으로 막대그래프 시각화 
barplot(frq_ages)
```

# 통계 중요용어
* 모집단
  + $U$, $N$
  
  
* 표본
  + $S$, $n$

# 중심화 경향
  + 평균
  + 중앙값
  + 최빈값

# 분산화 경향 
  + 범위
  + 사분위수
  + 분산
  + 표준편차 
  
  
# 대표값
### 평균: 중심척도의 대표적인 통계값

### 모평균
* $\mu$
>>
$$\mu=\dfrac{1}{N} 
\sum_{n=1}^N x_i $$

### 표본평균
* $\bar x$ 


```{r}
# ctr + alt+ i 하면 코드 블럭 생성됨
# 평균: mean(x, na.rm=F)
# x: 평균을 구할 대상 
# 결측치 포함여부
x = c(1,2,3,4,5,6,7,8,9,10)

mean(x)

```
[그리스문자](https://cloud.naver.com/fileLink.nhn?filekey=gMkTtabE4OWPTGo%2BbEExUdVvtSwZRbKuhzggalyBAJe8W0TplT847WBiM7W%2BGb3KQkKAiOFLz5mV32wySYLY5go%3D)  

```{r}
# 조선조 왕들의 평균수명은? 
kings <- c(73,62,45,53,38,16,51,28,37,30,56,30,33,56,
         66,54,40,33,59,36,82,48,44,22,32,67,52)

mean(kings)
```

### 중앙값 
* $M_e$

```{r}
# 중앙값: median(x, na.rm=F)
a <- c(1,2,3,4,5,6,7,8,9)
median(a)

# 중앙값 수식 써넣어 보기

b <- c(1,2,3,4,5,6,7,8,9,10)
median(b)
```

```{r}
# 다음 값들의 중앙값을 계산하세요 
x <- c(12,7,3,4.2, 18,2,54,-21,8,-5)
sort(x)
median(x)
```

### 최빈값
* $M_o$
* R에서는 최빈값을 구하는 함수가 제동되지 않음 
* table 함수와 wich.max 함수를 이용해서 구하도록 함 

```{r}
# 최빈값 
# 빈도표 작성: table(x)
# 최대빈도 요소 위치값 조사: which.max(x)
# 빈도표의 컬럼명 조사: names(x)
x <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
sort(x)

table(x)
frqx <- table(x)
frqx
```


```{r}
which.max(frqx)

names(frqx[2])


maxidx<- which.max(frqx)
maxidx

names(frqx[maxidx])
# 주의) 위 예에서는 최빈값이 2개인데 1개만 출력됨 
```

```{r}
# 최빈값 구하는 함수: get_mode
getmode <- function(x) {
}
```

```{r}
# 평균이 동일한 자료들
a <- c(1,2,3,4,5,5,5,6,7,8,8,9,9,9,9)
b <- c(4,5,5,5,6,6,6,6,6,6,6,7,7,7,8)

mean(a)
mean(b)
# 두 자료 모두 평균은 동일하지만 
# 자료의 구성은 다름 
```

### 범위
* $R$
수집한 자료의 가장 큰 값과 작은 값의 차이
수집한 자료가 어느정도 흩어져 있는지 살펴볼 수 있는 통계치
계산하기 쉽다
특이값에 영향을 많이 받는다
범위가 동일해도 분산정도는 크게 다를 수 있다

```{r}
# 범위: range(x)
range(a)
range(b)
```

```{r}
# 조선조 왕들의 평균수명의 범위는?
kings <- c(73,62,45,53,38,16,51,28,37,30,56,30,33,56,
         66,54,40,33,59,36,82,48,44,22,32,67,52)

range(kings)
```

### 분산 
* 모분산: $\sigma^2$
* 표본분산: $S^2$
![](https://camo.githubusercontent.com/d940dd3ee3714fb61d6537384b92f64d3aad398e/68747470733a2f2f64726976652e676f6f676c652e636f6d2f75633f69643d315752494e6a46326d7159755146347a435733464c6d6f4552584956305a4c496f)

* 평균을 중심으로 밀집되거나 퍼짐 정도를 나타내는 척도
* 모분산: 모집단을 구성하는 모든 자료값과 모평균의 편차 제곱에 대한 평균
* 표본분산: 표본을 구성하는 모든 자료값과 표본평균의 편차의 제곱합을 n-1로 나눈 수치 

```{r}
# 분산: var(x)
# 조선조 왕들의 평균수명의 범위는?

var(kings)

# 엥? 결과값이 뭔가 이상? 
```
```{r}
my.var <- function(x) {
  m <- mean(x)   #평균계산)
  # return (sum((x - m)^2)/length(x)))  # 모분산
  return (sum((x - m)^2)/(length(x)-1))  # 표본분산
}


my.var(kings)
```

```{r}
# 어떤 카푸치노 판매점들의 5일동안 
# 오후 4~5시 사이의 판매량 데이터를 보고
# 어느 지점이 판매를 잘하였는지 파악하시오
ga <- c(20,40,50,60,80)
na <- c(20,45,50,55,80)


mean(ga)
mean(na)

range(ga)
range(na)


table(ga)
table(na)

which.max(ga)
which.max(na)

summary(ga)
summary(na)
# 중심화 경향으로 기술통계 실시=> 가늠할 수 없음 

var(ga)
var(na)
# 위치 척도로 두 집단의 차이를 알아봄 
# '가' 집단의 분산이 '나' 집단의 분산보다 큼 
# '나' 집단의 카푸치노가 일정하게 팔리고 있음 

```

### 표준편차 
* 분산을 구하기 위해 편차($x_i - \bar x$)의 제곱합을 했음
* 편차의 제곱합 덕택에 값이 너무 커짐
* 따라서, 분산값에 제곱근을 취함으로써 
  측정값과 같은 단위로 변환할 수 있음 
* $S$

```{r}
# 분산: sd(x)
# 조선조 왕들의 평균수명의 표준편차는?

sd(kings)
```

```{r}
# 회계사원들의 월급과 사무수습사원들의 월급의 
# 차이를 비교해보시요
# 단, 사무수습사원의 평균월급은 3550, 표준편차는 250이다. 
# acc vs off
acc <- c(3536,3173,3448,3121,3622)

summary(acc)
mean(acc)
sd(acc)

# 평균적으로는 사무수습사원의 월급이 높지만, 직함에 따른 임금차이는 높다.

```

#### 사분위수 
# 대표적인 위치척도를 이용한 기술통계 
# 관측치를 여러부분으로 나눠 각 값들의 위치를 결정
# 나의 점수가 전체 점수중 어느 정도 위치에 있는가?
  와 같은 상대적 위치 파악에 용이
# 사분위수를 구하는 방법은 데이터의 유형과 방식에 따라 
  9가지가 존재 
* $Q_1,Q_2,Q_3,Q_4$

### 사분위수 구하는 방법
* 먼저, 중앙값을 구함: 2사분위수  
* 중앙값을 기준으로 왼쪽방향의 1사분위수를 구함 
* 중앙값을 기준으로 오른쪽 방향의 3사분위수를 구함

```{r}
# 표본이 다음과 같을때 Q1,Q2,Q3을 구하세요
# 한번에 작동은 crl+sht_ent

nums <-c(1,3,4,7,10,11,20,22,25,30,31)


fivenum(nums)
quantile(nums,type=1) # 값 기반
quantile(nums,type=6) # 위치 기반
```
```{r}
boxplot(nums)

```


```{r}
# 사분위수: quantile(x,type)
# 위치 기준 사분위수: fivenum(x)
# 비연속형 수치 (위치기준): type 1 ~ 3 (1추천)
# 연속형 수치 (값기준): type 4 ~ 9 (6추천)

x <- c(1,2,3,4,10,50,100)
quantile(x)
quantile(x,type=1) # *
quantile(x,type=2)
quantile(x,type=3) 

fivenum(x)
```


```{r}
?fivenum
```



```{r}
num <-c(1,2,2,4,4,6,7,8,9,10,12,12)
summary(num)

quantile(num)
quantile(num, type=1)
quantile(num, type=6)

```

```{r}
?quantile
```

### 사분위수 활용방법
* fivenum: 상자수염그래프와 같이 사용: 
* quantile: 일반적인 사분위수 


### 비대칭도 
* 중심치 경향과 분포 경향을 통해 표본의 특성과 
  산포정도를 파악 가능
* 분포가 좌우대칭/완만 정도를 파악하기 어려움
* 표본의 도수분포에서 평균에 대한 비대칭 방향과 
  정도를 어느정도 알수 있음 


```{r}
# 80명의 학생데이터의 분포에 대한 시각화 실행 
# 먼저, 도수분포표를 작성해야 함  
setwd('c:/Users/주말반/Desktop')
height <- read.csv('height.csv')
head(height)
```


```{r}
# 구간 파악: 최대/최소 파악
min <- min(height)
max <- max(height)
# min # 143 -> 140 (내림)
# max # 169 -> 170 (올림)
min=(as.integer(min/10)) * 10
max=(as.integer(max/10)) * 10 + 10
```

```{r}
# 구간별 범위 지정 
seq(140,170,5)
bins <- seq(140,170,5)    # bins는 무슨 함수? 
bins

```

```{r}
# 계급값: 각 계급을 대표하는 값, 계급의 중앙값
# 140 145 150 155 160 165 170
bins[1]      
bins[2]

mid <- (bins[2]-bins[1])/2
mdbins <- bins +mid
mdbins

```

```{r}
# 상대 도수 구하기: 구간별 도수/전체빈도수  
total <- length(height$height)    # lengh가 무슨 함수지? 
h <- hist(height$height)
relfrq <- h$counts/total
relfrq
sum(relfrq)

```

```{r}
# 누적도수: 각 구간별 도수의 누적합 
# 누적합: cumsum(x)
h$counts
csfrq <- cumsum(h$counts)
csfrq
```

```{r}
# 히스토그램, 계급값, 상대도수, 누적도수 시각화 
hist(height$height)
```

```{r}
# 히스토그램, 계급값 시각화
plot(mdbins[1:6], h$counts, type='b', col='red')
```
```{r}
# 히스토그램, 계급값, 상대도수 시각화 
plot(mdbins[1:6], relfrq, type='l', col='orange')

```


```{r}
# 누적도수 시각화
plot(mdbins[1:6], type='b', col='blue')
```



```{r}
hist(height$height, freq = F)   # probability 함수가 뭐지? 
lines(density(height$height),col='red')
```

### 왜도 
* 분포곡선이 좌측이나 우측으로 어느 정도 쏠렸는지 나타냄
* 왜도가 0보다 크면 왼쪽으로 쏠리는 분포를 나타냄
* 즉, 오른쪽으로 꼬리가 긴 분포를 나타냄 

### 첨도
* 분포곡선의 봉우리가 어느 정도로 뾰족한지 나타냄 
* 첨도가 3보다 크면 폭이 좁고 봉우리가 높은 분포를 나타냄
* 간혹 프로그램에 따라 0을 기준으로 측정하는 경우도 있음 


```{r}
# R에서는 psych 패키지의 skew와 
# kurtosi 함수를 이용 
# 왜도: skew
# 첨도: kurtosi(x)

install.packages("moments")
library (moments)
```

```{r}
skewness(x)
kurtosis(x)
```

```{r}
# 청소년 핸드폰 사용시간에 대한 히스토그램과 
# KCDE을 작성하세요

# 내답
phone <- c(10,37,22,32,18,15,15,18,22,15,20,25,38,28,
         25,30,20,22,18,22,22,12,22,26,22,32,22,23,
         20,23,23,20,25,51,20,25,26,22,26,28,28,20,
         23,30,12,22,35,11,20,25)


hist(phone)
hist(phone, freq = F)
lines(density(phone),col='red')   #확률밀도곡선

skewness(phone)
kurtosis(phone)
```
```{r}
hist(phone)
```


```{r}
hist(phone, freq = F)
lines(density(phone),col='red') 
```

### 확률밀도추정
* kernal density estimation
* 관측된 데이터들의 분포로부터 원래의 변수의 확률분포특성을 추정
* 즉, 해당변수에 관측된 몇가지 데이터로 부터 변수가 가질수 있는 모든       값들에 대한 밀도 (확률)을 추정하는 것 
   * 예) 수능을 위해 모의고사를 실시함
   * 모의고사를 통해 실제 수능시험 성적을 예측할 수 있음
   * 몇회의 모의고사 성적에 대한 분포를 토대로
   * 실제로 받을 수능시험 성적에 대한 확률을 유추해 볼 수 있음 


```{r}

# ex) 어떤 IT 회사의 주당 이익자료이다. 
# 0.09, 0.13, 0.41, 0.51, 1.12, 1.20, 1.49, 3.18
# 3.50, 6.36, 7.83, 8.92, 10.13, 12.99, 16.40
# 평균, 사분위값, 표준편차, 왜도, 첨도는?

it <- c(0.09, 0.13, 0.41, 0.51, 1.12, 1.20, 1.49, 3.18, 3.50, 6.36, 7.83, 8.92, 10.13, 12.99, 16.40)
mean(it)
quantile(it)
quantile(it, type = 1)
sd(it)
skewness(it)
kurtosis(it)
hist(it, freq = F)

lines(density(it), col='red')
```














