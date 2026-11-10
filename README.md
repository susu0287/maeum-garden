# 마음의 정원 🌱

Netlify 정적 배포 + GitHub 자동 배포 + Supabase 이메일 로그인 및 사용자별 클라우드 동기화.

## 현재 구성
- `index.html`: 감정 기록, 테마, 그림/사진, 보따리, 그림 편집, 로그인
- `supabase-config.js`: 도쿄 Supabase 프로젝트 URL과 공개 publishable key
- `supabase-schema.sql`: 테이블과 사용자별 RLS 정책 참고용 SQL
- `netlify.toml`: 저장소 루트 정적 사이트 설정

## Netlify
GitHub 저장소의 `main` 브랜치를 연결하고 Build command는 비워 두며 Publish directory는 `.` 로 설정합니다.

## Supabase
프로젝트 리전은 `ap-northeast-1` (Tokyo)입니다. `emotion_garden_data` 테이블과 사용자별 SELECT/INSERT/UPDATE RLS 정책은 이미 생성되어 있으므로 SQL을 다시 실행할 필요는 없습니다.
Authentication의 Email provider를 활성화하고, 배포 후 Authentication → URL Configuration에 Netlify 사이트 URL을 Site URL 및 Redirect URLs로 등록하세요.

브라우저 코드에는 공개용 publishable key만 사용합니다. `service_role` 또는 secret key는 절대 커밋하지 마세요.

## 저장
로그인 전에는 현재 브라우저 localStorage에 저장됩니다. 로그인 후에는 계정별 클라우드에 기록/테마/보따리가 동기화됩니다. 첫 로그인 시 클라우드 데이터가 없으면 현재 기기의 기존 기록을 클라우드로 올립니다.