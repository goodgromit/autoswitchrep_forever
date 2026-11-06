# autoswitchrep_forever

World of Warcraft **Forever**용 애드온입니다. 평판이 오르거나 내리면, 화면 아래 평판 바를 방금 바뀐 평판으로 자동 전환합니다.

- 지원 버전: WoW Forever 1.60.1 (Interface 16001)
- 설정 없음. 설치만 하면 동작합니다.

## 설치

`autoswitchrep_forever` 폴더를 `World of Warcraft\_forever_\Interface\AddOns\` 아래에 넣고 게임을 시작합니다.

## 동작

- 평판이 바뀌면 그 평판을 평판 바에 표시합니다. 이미 표시 중인 평판이면 아무것도 하지 않습니다.
- 평판이 내려간 경우에도 전환합니다.
- 전환할 때 채팅 메시지는 출력하지 않습니다.
- 보스전 등 채팅 잠금 중에는 게임 규칙상 평판 정보를 읽을 수 없어서 전환하지 않습니다.

## 동작 방식

게임의 `FACTION_STANDING_CHANGED` 이벤트가 바뀐 평판의 ID를 알려 주면, 그 ID로 바로 전환합니다(`C_Reputation.SetWatchedFactionByID`). 채팅 메시지를 해석하지 않으므로 게임 언어나 평판 창 상태(분류 접힘 등)와 상관없이 동작합니다.

## autoswitchrep_classic과의 차이

TBC 클래식용 `autoswitchrep_classic`을 Forever용으로 새로 작성했습니다.

- Forever에 없는 `GetNumFactions`, `GetFactionInfo`, `SetWatchedFactionIndex` 대신 `C_Reputation` API를 씁니다.
- 평판 창의 줄 번호가 아니라 평판 ID로 전환해서, 분류를 접거나 펴도 엉뚱한 평판으로 바뀌지 않습니다.
- 채팅 잠금 중 오류가 나지 않습니다.
- 쓰지 않던 로케일 파일과 전역 변수를 없앴습니다.
