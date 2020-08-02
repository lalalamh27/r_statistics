
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
ages <- titanic$age[!is.na(titanic$age)]
ages[ages <=1] <-'~1'
ages[ages >= 2 & ages <= 5] <-'~5'
ages[ages > 5 & ages <= 13] <-'~13'
ages[ages > 13 & ages <= 18] <-'~18'
ages[ages > 18 & ages <= 29] <-'~20'
ages[ages > 30 & ages <= 39] <-'~30'
ages[ages > 40 & ages <= 49] <-'~40'
ages[ages > 50 & ages <= 59] <-'~50'
ages[ages > 60 & ages <= 69] <-'~60'
ages[ages > 70 & ages <= 79] <-'~70'
ages[ages >=80] <-'~80'

frq_ages <- table(ages)
barplot(frq_ages)
```






























