# Flutter 프로젝트 개발 규칙 (rules.md)

## Git 규칙

### 브랜치 전략

- `main`: 운영용 배포 브랜치
- `dev`: 개발 통합 브랜치
- 기능 개발 시 `dev`에서 분기한 topic 브랜치에서 작업 (예: `board/write`, `ui/user/update`)
- PR 머지는 `Squash and Merge`로 하나의 커밋으로 정리

### 브랜치

- 기능 단위로 생성
- 생성과 수정으로만 나뉘고 수정 시 "fix/"를 붙임
- 그림을 그린다면 "ui/"를 붙임
- 모든 영문은 소문자
- 브랜치 이름은 기본적으로 `도메인명/상세페이지명` 형식을 따르며,  
  필요에 따라 상세페이지명 대신 명확한 기능명 사용 가능

예시

- 게시글 작성 통신 브랜치: `board/write`
- 게시글 작성 통신 수정 브랜치: `fix/board/write`
- 게시글 작성 UI 브랜치: `ui/board/write`
- 게시글 작성 UI 수정 브랜치: `fix/ui/board/write`
- 마이페이지 알림 기능 브랜치: `mypage/notification` 또는 `notification`

### 커밋 메시지

- 한국어로 작성
- 필요한 부분만 영어 사용 가능
- 의미 없는 메시지는 제외, 내용 파악 가능하게 작성

## Flutter 규칙

- 수업 시간의 프로젝트들을 참고해서 수업 기준으로 작성

### 메서드명

- 조회: get
- 수정: update
- 삭제: delete
- 등록: write
- 단가정보: One
- 전체: All

예시: `getOne`, `deleteAll`

### 파일명

- `snake_case` 사용
- **페이지 전용 위젯** 파일의 기본 명명 규칙은 `상세페이지명_위젯명.dart` 형식을 사용

  - 예: `detail_body.dart`

- 단, 아래의 경우에는 **도메인명을 앞에 추가**하여 명확하게 구분
  1. **다른 도메인과 상세페이지명이 중복되는 경우**
     - 예: `board_detail_body.dart`, `visit_record_detail_body.dart`
  2. **Flutter 기본 위젯명과 혼동 우려가 있는 경우**
     - 예: `user_card.dart` → `mypage_user_card.dart`

#### 클래스명 규칙

- 파일명과 연결되는 클래스명은 `PascalCase`를 사용하며, 파일명을 단어 단위로 나눈 뒤 각 단어의 첫 글자를 대문자로 변환
  - 예: `mypage_user_card.dart` → `MypageUserCard`
  - 예: `board_detail_body.dart` → `BoardDetailBody`


> 즉, 파일명은 `snake_case`, 클래스명은 `PascalCase`를 사용하며, 파일명과 클래스명 간의 일관성을 유지해야 함

### 모델 필드명

- `camelCase` 사용
- 공통 필드명에서 혼돈을 줄이기 위해 **모델명을 접두어로 명시**

  - 예: `id` → `boardId`, `replyId`
  - 예: `user` → `boardUser`, `replyUser`

#### 날짜 관련 필드명

- 날짜만: `~Date` (예: `birthDate`)
- 날짜+ 시간: `~At` (예: `createdAt`)
- 상대 시간: `relativeTime`

  - 1시간 이내: `nn분 전`
  - 24시간 이내: `nn시간 전`
  - 24시간 이후: `YYYY-MM-DD` 형식 (예: `2025-06-23`)

#### 일반 필드명

- 제목: `title`
- 내용: `content`
- 복수형: 반드시 `~s` 붙이 (예: `imgs`)

#### 약어 사용 규칙

- 가능한 경우에만 축약 사용: `per`, `img` (○), `pred` (✖)

#### 이미지 처리 방식

- **클라이언트 → 서버**: `base64` 형식으로 전송
- **서버 → 클라이언트**: 저장된 이미지의 `URL`로 전송

##### 수정 화면에서의 이미지 처리 예시

- 화면 진입 시:

  - 기존 이미지는 서버에 저장된 이미지 URL을 통해 불러오기

- 이미지 추가 시:

  - 새로 등록한 이미지는 `base64` 형식으로 서버에 전달

```json
{
  "urlImgs": [
    "/images/cheer1.jpg",
    "/images/cheer2.jpg",
    "/images/cheer3.jpg"
  ],
  "base64Imgs": [
    "data:image/jpeg;base64,/123...",
    "data:image/jpeg;base64,/456..."
  ]
}
```

#### assets 폴더 사용 규칙

- 정적 리소스는 `assets/` 폴더 하위에 **유형별로 디렉토리를 구분해 관리**

  - 예시:

    - 이미지 → `assets/images/`
    - 동영상 → `assets/videos/`

- `pubspec.yaml`에 **하위 폴더까지 명시** 해야 Flutter가 리소스를 인식할 수 있음

```yaml
flutter:
  assets:
    - assets/images/
    - assets/videos/
```

- 사용 시 전체 경로를 명시

```dart
Image.asset('assets/images/team_logo_lg.png')
```

- 파일명 작성 규칙:

  - **`snake_case`** 사용
  - 어느 리소스인지 명확히 알 수 있도록 의미 있게 지정

    - 예시:

      - `team_logo_lg.png`
      - `background_night.jpg`

### 페이지 구조

- 화면 전체 감싸는 파일: `*_page.dart`
- Page의 body 속성 Body 위젯으로 추출: `*_body.dart`
- 강제 페이지 이동 가능하도록 각 페이지마다 `floatingActionButton` 작성

## 폴더 구조 및 명명

### model 폴더

- **단순 조회용**: DTO처럼 보이지만 ViewModel에서 사용하는 구조처럼 vm 내부의 model 클래스로 정의

  - 예시: 승부 예측, 상대 전적, 우천 취소 예측 등

- **상태 변화 필요**: model 정의 + ViewModel에서 상태 관리

  - 예시: 게시글 작성/수정, 유저 정보 변경 등

### 공통 위젯

- 이름: `m_위젯명.dart` (예: `m_text_button.dart`)

### 페이지 전용 위젯

- 이름: `페이지명_위젯명.dart` (예: `visit_record_detail_body.dart`)

### 스타일 및 Util

- `m_파일명.dart`로 작성 (예: `m_color.dart`)

### ViewModel 파일

- 이름: `*_vm.dart` (예: `visit_record_write_vm.dart`)

## 테스트 코드 구조

- `lib/` 내부 구조 그대로 유지
- 테스트 파일명: 기존 파일명\_test

```
test/
└── ui/
    └── mypage/
        └── user/
            └── user_update_page_test.dart
```

## 코드 작성 순서

- 기존 dart 파일에 코드 추가 시 무조건 **기존 코드 아래에 작성**

  - 중간 삽입 금지 → merge 시 충돌 최소화 위해
