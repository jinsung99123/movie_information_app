# movie_information_app
- flutter 영화정보 앱

## 프로젝트 소개
- TMDB 영화 사이트 API를 활용한 영화 정보 앱입니다.

## 사용 방법
- 각 카테고리 별(가장 인기있는, 인기순, 상영중, 개봉예정, 평점순)로 순위가 매겨진 영화들을 클릭시 
  해당 영화의 상세 정보(예산, 런타임, 개봉일자, 영화 정보, 제작사 정보)등을 포스터와 함께 확인할 수 있습니다.

## 개발 기간
- 25.5.11 ~ 25.5.15

### 추가 사용 패키지
- http
- flutter-riverpod

### 페이지 구성
- Home Page
- Detail Page
- 페이지 이동: Home Page -> Detail Page

#### 주요 기능
- TMDB에서 API를 통해 받아온 데이터를 통해 각 카테고리 별로 분류한 영화 포스터를 리스트로 나열
- 해당 영화 ID를 통해 Detail Page로 ID 값을 넘겨 영화의 상세정보를 확인 가능
- Hero 위젯과 카테고리/ID 로 구분지은 태그로 포스터 애니메이션 기능을 구현
- 영화설명 뿐 아니라 제작사, 예산, 평점, 수익 등 다양한 TMDB 데이터 정보 활용

##### 데이터 전달 과정
- UI -> ViewModel 데이터 요청
- ViewModel -> Repository 요청
- Repository 에서 API (Model) 호출
- API가 TMDB 서버에서 응답 받아옴
- 응답을 Repository -> ViewModel -> UI 전달

- 클린 아키텍쳐 구조는 완성 후 README 수정 예정
