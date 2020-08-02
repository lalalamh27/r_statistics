---
title: "R Markdown"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# R 마크다운 제목1
## R 마크다운 제목2
### R 마크다운 제목3
#### R 마크다운 제목4
##### R 마크다운 제목5
###### R 마크다운 제목6

# 줄바꿈 (스페이스 3칸)
첫번째줄   
두번째줄   
세번째줄   

# 글짜꾸미기
문장내에서 **진하게** 표시할 수 있어요    
문장내에서 _기울어지게_ 표시할 수 있어요    
문장내에서 ~~취소선~~ 표시할 수 있어요   

# 구분선 출력하기 
***

# 인용구 출력하기 
> 당신이 만약 힘들다면 그건 당신의 인생을 살고 있지 않기 때문이다.


# 코드 삽입하기 
```
a= read.csv('EMPLOYEES.csv')
```

# 순서있는 목록 표시 (스페이스4칸)
1. 산점도 
    1. 산점도
        1. 산점도
2. 히스토그램
3. 박스그래프 
4. 파이그래프


# 순서없는 목록 표시 
* 산점도 
  + 산점도 
    - 산점도
* 히스토그램
* 박스그래프 
* 파이그래프



# 링크 만들기 
[구글로 이동](http://google.com)   
[네이버로 이동](http://naver.com)   

# 이미지 출력하기 
![](https://4.bp.blogspot.com/-dfHBPg2rXcA/UC4v-5OPXhI/AAAAAAAAHic/EMCX2mOV8Go/s1600/ikea-00-instructions-orig.png)   

# 테이블 출력하기 
| 이름 | 국어 | 영어 | 수학 |
|------|:-----|:----:|-----:|
|헤교  |99    |98    |87    |
|수지  |90    |80    |81    |
|지현  |99    |78    |83    |




<!--kable(데이터, 기타옵션)-->
```{r table}
knitr:: kable(head(mtcars[,1:8],10),
              booktabs=TRUE,
              caption = 'mtcarss 상위 10개 자료')
```

# 수식 표현하기 : latex
#### https://ko.wikipedia.org/wiki/%EC%9C%84%ED%82%A4%EB%B0%B1%EA%B3%BC:TeX_%EB%AC%B8%EB%B2%95
$a^2 = b^2 + c^2$    
$\sum_{i=1}^N x_i$   
$\alpha\beta\gamma$   
$$ \sum_{i=1}^N x_i $$   
$bar{x} = (x_1+x_2+x_3+...+x_n)n= 1/n\sum_{i=1}^n x_i$


# github
* 분산 소스 버젼 관리인 git을 웹으로 제공하는 클라우드 사이트 
* 자신이 작성한 코드파일을 github에 업로드해두면 
  다른 개발자들과 같이 공유할 수 있음 
* 또한, 자신이 공유해 둔 소스를 분기fork해서 
  새로운 종류의 개발할 수도 있음 (오픈소스의 장점)
  












```{r cars}
summary(cars)
```

'''
'''
```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
