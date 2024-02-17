# Prography 9기  

Prography 9기 모바일 과제 테스트  

[개발 환경]  
Target: iOS 17.0  

[구현 완료]  

[메인 탭]  
- 로딩 중 상태 -> skeleton view 사용 (AsyncImage)  
- 북마크 Local DB로 구현 (UserDefaults)
- 저장한 북마크 있을 시 섹션 표시
- 저장한 북마크 없을 시 섹션 미표시
- 무한 스크롤 구현 완료
- 북마크 사진 클릭시 디테일 화면 이동 구현 완료
- 최신 이미지 사진 클릭시 디테일 화면 이동 구현 완료
- 모든 이미지는 어떤 url 써야할 지 몰라 small으로 사용

[랜덤 포토 탭]  
- 랜덤 포토 사진 카드 좌우 스크롤 구현 완료
- 가운데 북마크 버튼 누를 시, 랜덤 포토 추가 생성 (다음 사진으로 넘어가지는 않음)  
- 스와이프 미구현  
- 정보 버튼(느낌표 버튼) 누를 시 detail 이동 구현 완료 

[디테일]  
- description 최대 2줄 구현 완료
- 사진 가로 고정, 세로는 가변 구현 완료 + 가운데 정렬
- 북마크 local DB 저장 완료
- 우측 상단 북마크 버튼으로 북마크 저장, 삭제 가능
- 북마크 opacity 적용 완료
- Title, tag는 response field가 상세히 적혀있지 않아 일단은 raw string으로 대체

# Tuist 적용

Tuist 테스트로 적용해봄.  
- Feature Module을 하나 더 둘까? 
- TCA 의존성도 Core로 처리?
- enum으로 각 케이스 나눠서 allCase 처리 (workspace)?
- DI 처리 못함 아직