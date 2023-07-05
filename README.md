# Web_project
게시판 프로젝트
CRUD
oracle 사용
게시판 글 쓰기, 읽기, 댓글 달기, 좋아요, 조회수 완성

-SQL문

--------------------------------------------------------
--------------------------------------------------------
DDL for Table BBS
--------------------------------------------------------

CREATE TABLE "SCOTT"."BBS" 
   (	"BBSID" NUMBER(*,0), 
	"BBSTITLE" VARCHAR2(100 BYTE), 
	"USERID" VARCHAR2(20 BYTE), 
	"BBSDATE" DATE DEFAULT sysdate, 
	"BBSCONTENT" VARCHAR2(2048 BYTE), 
	"BBSAVAILABLE" NUMBER(*,0), 
	"COUNT" NUMBER(30,0) DEFAULT 1, 
	"LIKE_COUNT" NUMBER(30,0) DEFAULT 1, 
	"CATEGORY" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_INFO
--------------------------------------------------------

  CREATE TABLE "SCOTT"."USER_INFO" 
   (	"USERID" VARCHAR2(20 BYTE), 
	"USERPASSWORD" VARCHAR2(20 BYTE), 
	"USERNAME" VARCHAR2(20 BYTE), 
	"USERGENDER" VARCHAR2(20 BYTE), 
	"USEREMAIL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMMENT1
--------------------------------------------------------

  CREATE TABLE "SCOTT"."COMMENT1" 
   (	"COMMENTTEXT" VARCHAR2(300 BYTE), 
	"COMMENTID" NUMBER(*,0), 
	"USERID" VARCHAR2(20 BYTE), 
	"COMMENTAVAILABLE" NUMBER(*,0), 
	"COMMENTDATE" DATE DEFAULT SYSDATE, 
	"BBSID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.BBS
SET DEFINE OFF;
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (9,'기숙사 도난 사건 좀 아니지 않음?','20215132',to_date('23/06/03','RR/MM/DD'),'저번에 운동화 훔쳐간 사건을 대비해야한다고 생각합니다. 기숙사 현관문이 고장난 경우도 많은데 이런게 바로바로 고쳐지지 않으니 도난 사건이 자꾸 생깁니다. 이제는 더 이상 물러날 곳이 없습니다. 생활지원팀에서 보안 관리를 더 강화해주세요.',1,36,35,1);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (19,'자취방 구할때는? 순룸','20185113',to_date('23/04/01','RR/MM/DD'),'안녕하세요 순룸입니다.
2023년 6월 1일부터 신창 자취방을 한 눈에 볼 수 있는 서비스 <순룸>을 다시 운영합니다.
다가오는 여름방학과 2학기에 몸을 눕힐 원룸을 찾는 학생분들 이 수고로움을 덜 수 있도록 방 위치와 정보들을 모아두었어요!
하단 순룸 링크에 접속해 시간을 아끼고, 편리하게 살펴보고, 좋 은 방을 구해보세요
*유의사항
아쉽게도 기존에 배포되었던 모바일 순룸 어플은 현재 이용하실
수 없습니다.
순천향대 인근 자취방 정보를 순룸에서 편하게 살펴보세요!
#: http://www.soonroom.kr/
문의: http:/of.kakao.com,_xewxbrs/chat',1,67,62,3);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (20,' 데이터 분석도 * 코딩스터디 *과','20185351',to_date('23/03/12','RR/MM/DD'),'코딩으로 쉽고 편하게
엑셀도 어려운데 데이터 분석은 할 수 있을까? ※ 코딩스터디 *과 함께라면 걱정 마세요!
코딩을 경험해본 사람도, 초보인 사람도, 개발자를 꿈꾸는 사람 돗, 마케터를 꿈꾸는 사람도 모두 코딩스터디과 함께
※ 성장할 수 있습니다.
이미 2 1등 기업 % 으로 인증된 코딩스터디 에서 혼자
준비할 땐 막막했던 포트폴리오에, NCS 수료증까지!
대학생 3,4학년도 국민내일배움카드 신청이 가능합니다.
코딩스터디 의 강의를 19 국비지원 :s 으로 들으며 개발 역량을 쌓아 졸업하자마자 개발자 취업까지 함께 도전해 보세 요!
선착순으로 모집이 마감될 수 있으니 서둘러 주세요
',1,63,35,3);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (26,'우리학교에도 영화제가 있다고!?','20205114',to_date('23/06/07','RR/MM/DD'),'* 2023 KINOCULA FLIM SHOWCASE ready~ action!
공연영상학과 키노큘라 영화제에 여러분을 초대합니다!
2023 키노큘라 필름 쇼케이스는 6월 7일 단 하루! 여러분과 함께합니다. 이번 키노큘라에서는 뮤지컬 영화 섹션이 새롭게 추가 되었습니다. 학부생들의 상영작부터 GV에 축하공연까지 다채로운 행사들이 기다리고 있습니다.+ 2 일시 : 2023.06.07 오후 6시 ~ 오후 9시 반 장소 : 학예관 4층 중극장
예매 링크 : https://naver.me/GEUOR8Sg
m 3분 영화 색션
이에서 감독 < 동기 : MOTIVE>
천예원 감독 < 다정하지만 >
홍우빈 감독 < 징크스 >
서지완 감독 < 설악산 흔들바위>
김병수 감독 < 달빛아래 그대와>
0 10분 영화 섹션
윤주은 감독 < Who Am I>
장혜원 감독 < ILLUSION >
고지성 감독 < 잠식>
0 15분 영화 섹션
김가람 감독 < 미남씨는 짝사랑 중>
양승철 감독 < 가치>
1 뮤지컬 영화 섹션
김가람 감독 < 나는 나라는 사람>
양승철 감독 < 행복한 하루 >
장혜수 감독 < 여전히 우린 >',1,48,6,3);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (1,'08학번 정O수 식품의약품안전처 근무','20085128',to_date('23/06/04','RR/MM/DD'),'  학부 과정에서 본인이 선택한 전공 과목들은 최대한 많이 배울수 있도록 노력할 것.
  전공 과목 학점을 잘 받기위해 노력하라는 것이 아닙니다. 학점은 사실 졸업하고 나면, 입사 서류전형이나 면접 때 말고는 남에게 보여줄 일이 없습니다. 그마저도 크게 중요하지 않습니다. 그건 그저 일부라고 생각합니다. 전공 과목을 통해 한 학기 동안 본인이 무엇을 배웠고, 어떤 노력과 경험을 하였는지가 더 중요하다고 생각합니다. 그러니 본인이 이수한 전공에 대해 치열하게 공부해보세요. 왜 이렇게 되는것일까? 이유를 알 때까지 계속 탐구하세요. 교수님, 선배님, 동기, 후배들과의 소통을 두려워하지 마세요. 그들은 본인에게 답을 구해줄 수 있는 혹은 같이 고민해 줄 수 있는 선생님들입니다. 그 경험과 지식이 나중에 언제 어떻게 쓰일지 벌써부터 의심할 필요는 없습니다. 사회에서는 지금 배우고 있는 지식과 기술은 기본기라고 여겨집니다. 사회에 나가 그 기본에 여러분들의 응용과 역량이 더해져 성과로 인정받는 ''그 과정''에서 이전에 배운것들에 대해 되새겨보고 고민하는 것입니다. 저도 졸업한지 10년이 되어가지만 그 때 배운 기본기를 가지고 더 성장시켜서 업무에 임하고 있습니다. 학부 4년의 시간은 소중합니다. 부디 후회남지 않도록 만족할 때까지 배우도록 하세요.',1,7,3,5);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (3,'10학번 김O현 고려대학교의료원 근무','20105094',to_date('23/08/25','RR/MM/DD'),'저는 현재 고려대학교의료원 정보개발팀 소속으로 의료원 산하 3개병원(안암, 구로, 안산병원)의 병원정보시스템 중 처방 프로그램을 통합으로 개발하고 운영하고 있습니다.
병원정보시스템 개발 및 운영하는 쪽으로 진로를 잡으시면 느끼겠지만 순천향대 의료IT공학과 선배들은 전국 여러 의료기관, 병원정보시스템 솔루션 개발업체에 포진하여 각자의 자리에서 일당백으로 훌륭하게 자리잡고 있습니다. 많은 후배들을 해당 분야에서 만나고 싶네요.
길다면 길고 짧다면 짧은 대학시절에 많은 것을 경험하고 뜻깊게 보내고 훌륭한 모습으로 사회에서 만나길 바랍니다. 행복한 대학생활 되세요~ ^^',1,14,5,5);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (6,'기숙사 건조기 늘려주세요','20195313',to_date('23/04/17','RR/MM/DD'),'향설 2관 기숙사에 거주하고 있는 학생입니다. 
건조기가 층별로 설치되어 있지 않아 많은 학생들이 빨래를 할 때 어려움을 느끼고 있습니다.
기숙사 구조자체가 환기가 잘 되지 않아 빨래를 방에 널어두면 잘 마르지 않는 문제점이 있습니다.
빨래를 할 때마다 다른 층으로 가서 건조기를 돌려야하는 불편함이 있습니다.
한 층에 건조기를 하나씩 설치해주시면 감사하겠습니다.',1,70,66,1);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (12,'경희학성 아파트 사시는 분들','20225001',to_date('23/04/17','RR/MM/DD'),'살기 좋은가요??? 불편한 점 있나요?',0,48,32,2);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (4,'08학번 정O영 (주)웰트 근무','20085028',to_date('22/05/13','RR/MM/DD'),'석사과정까지 지나오면서도 결국 맞이하는 질문은
"과연 내가 사회에서 필요로하는 사람이 될 수 있을까?"였습니다.
물론 먼저 고민하고 갈 길을 정하신 분들에게는 해당되지 않겠지만
대학도 전공도 명확한 방향없이 지나온 분들에게는 꼭 맞이하는 순간이 있을거에요.
이 과정을 조금 더 먼저 걸어온 선배로써 몇 가지 조심스럽게 말씀드립니다.

1. 나는 최선을 다했다!
     여러분은 최선을 다했습니다!

2. 남을 돕는게 나에게 이익이더라.
     ''어떻게 도움을 줄 수 있을까''를 고민할 때 진짜 고객이 누구이고 무엇을 해야하는지 명확해지는 것 같아요.
     이게 나를 위한 가장 이기적이고 효율적으로 성과를 내는 방법이었습니다.

3. 사람이 자산이다 == 태도가 자산이다
  이직이 나쁜 것은 아니지만 1, 2년 내에 500 만원, 1000 만원 올리려는 목적만으로 살아가면
   남는 것도 없을 뿐더러 오히려 더 힘든 길이 될 수 있습니다.
  (제 케이스는 따로 연락주시면 말씀드릴게요ㅋㅋ)

조금이나마 도움되셨길 바랍니다. 언제든 연락주세요. 후배님들 화이팅!!',1,41,20,5);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (15,'질병 휴학','20235321',to_date('23/03/03','RR/MM/DD'),'직접 학교 가서 신청해야 되는건가요? 아니면 순천향 포털에서 신청해도 되는 건가요?',1,83,63,2);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (25,'팀프로젝트에 디자이너로 참여하실분을 구합니다','20185155',to_date('23/06/01','RR/MM/DD'),'분야 프로그래밍
지역 서울
. 인원 1명
실용성 있고 특별한 서비스를 함께 만들어갈 디자이너님을 구합니다
안녕하세요!
현재 일정관리 및 그룹 커뮤니티 구축을 위한 팀 프로젝트를 진행 중
입니다
개발 중 디자이너 쪽에 인원이 추가되면 좋을 것 같아 이렇게 모집 글 을 올리게 되었습니다!
아래의 내용을 참고해주시고,
만약 관심이 있으시다면, 부담 없이 연락 주세요!
[프로젝트명] 공동의 스케줄 관리의 시작, Selody
다양한 음이 합쳐져 멜로디를 만드는 것과 같이 모두의 스케줄에 맞춰 일정을 조정할 수 있도록 돕는 서비스입니다.',1,68,56,4);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (10,'셔틀이 제 시간에 안와요','20215081',to_date('23/03/17','RR/MM/DD'),'셔틀이 제 시간에 안오는 상황이 하루에 꼭 5번씩은 있습니다. 신창역에 가야하는 상황에서 모두가 기다리고 있는데 결국 많은 사람들이 택시를 타거나 전철을 놓치고 말았습니다. 학내순환 셔틀도 매번 늦게 오거나 일찍 출발해서 시간을 놓칠때가 많으니 이 점 꼭 개선해주시면 좋겠습니다.',1,132,101,1);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (5,'07학번 김O호 고려대학교의료원(고대구로병원 관리팀) 근무','20075114',to_date('21/03/04','RR/MM/DD'),'제목: 자랑스러운 의료IT공학과 네트워크를 만들어주세요!

안녕하세요! 저는 순천향대학교 의료IT공학과 07학번(1기) 졸업생입니다. 현재 상급종합병원에서 주임의공기사로서 의료기기를 관리하고 있습니다.

의공기사는 의료기기에 대한 기술적인 지식과 문제해결 능력을 갖춘 전문가로서, 전기, 전자, 기계, 해부학 등의 기초적인 공학적·의학적 지식을 바탕으로 의료기기의 구매, 유지보수, 안전관리, 각종 계약 등 이에 수반하는 행정업무까지 수행하는 사람을 말합니다.

저는 현재 주로 유지보수 및 예방점검, 용역계약, ISO14155 국제 임상시험용 의료기기 관리 업무를 담당하고 있습니다. 쉽게 말해, 의료기기 고장 시 문제를 진단하고 수리하는 업무, 고장 발생 사전에 의료기기를 예방적 차원에서 점검하는 업무, 제조사와 용역계약을 통해 일정 유지보수료를 지불하는 대신 부품비 및 인건비를 보장받는 조건의 계약을 체결하는 업무, 임상시험용 의료기기를 적절한 장소에서 보관하고 입출고하는 업무 등을 수행하고 있습니다.

저는 성공한 기업가도 아니며 아직 꿈을 향해 달려가고 있는 한 졸업생일 뿐입니다만, 이렇게 ‘선배의 한마디’라는 채널을 통해 또다시 여러분을 뵐 기회를 주신 우리 모교 교수님께 감사의 말씀을 드립니다. 여러분보다 먼저 이 길을 달려가 본 선배로서 작게나마 후배님들에게 도움이 되고자 몇 가지 소주제로 이야기를 풀어 나가보려 합니다. 부족하지만 ‘아, 이런 사람도 있구나’ 하는 정도로 다양한 사람들의 경험을 간접 경험해 보는 기회로 삼으시기를 부탁드립니다. 부디 이 글이 여러분께 좋은 양분이 되어 자랑스러운 의료IT공학과의 네트워크 자산으로 성장해주시길 기원합니다.',1,125,78,5);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (17,'※ 아직도 근로 못정했어요? 그럼 이거 보지 마세요 ','20205128',to_date('23/05/31','RR/MM/DD'),'제목어그로 끌어서 죄송합니다 :)

교외근로기업 kg 우아한녀석들 g 에서
이번 여름방학 근로장학생을 모집합니다 ~
간단하게 기업 소개 하겠습니다:)
안녕하세요!
저희는 온라인 전자상거래로 쑥쑥 성장 중인 교외근로기업인
우아한녀석들 이라고 합니다 :)
해외구매대행을 메인으로 3년째 창업 및 성장 중에 있으며, 저번 3월에는 월 매출 3,000만원 이상 달성하면서 전년도 대비 약 150% 매출 성장을 이뤄냈습니다!
이런 분들에게 저희 근로가 잘 맞을거예요
1. 대학 생활 중에 성장과 발전에 목이 말라있다.
2. 교외근로도 하면서, 자기계발도 하고 싶다.
3. 온라인 이커머스(해외구매대행, 위탁판매)에 대해 배우고 싶 다.
@ 이런 분들은 정중하게 다른 기업 추천드립니다 ?
1. 대학 생활하면서 대충 살고 대충 지낼래.
2. 내가 무슨 성장과 발전? 그냥 이대로가 좋아 ㅋㅋ
3. 너가 책을 읽어? 말도 안돼 크크뭐하러 책을 읽어 ㅋ 
4. 귀찮게 자기계발을 왜 해~ 잠이나 잘래.
저희 g 우아한녀석들 ''g 은
다음과 같은 혜택을 드리겠다고 손가락 걸고 약속하겠습니다
다른 근로기업에서는 절대로 장학생에게 드릴 수 없는 혜택이라고 장담합니다.',1,39,22,3);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (23,'6/11 시험 토익 스터디/7 (송파)','20175109',to_date('23/03/31','RR/MM/DD'),'분야 어학
_ 지역 서울
인원 1~3명
첫토익 9300 만료돼서 다시 900 중반대로 만드려고 합니다.
시험이 일주일밖에 안남았다보니 매일
2시간 기출 풀이(시간재고 omr 작성 포함 실전 연습) + 1시간 채점, 오 답과 풀이 공유로 하루당 3시간 진행하려고 합니다.
똑같은 방식으로 토익 스터디 운영해본 경험이 있고 그렇게 첫 토익
930 땄었어요.
잠실이나 송파쪽 스터디룸에서 진행합니다.
한명이라도 모이면 시작할 예정이니 댓글 달아주세요!',1,98,87,4);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (18,' 2023 보건의료 빅데이터 활용 창업경진대회','20205137',to_date('23/05/31','RR/MM/DD'),'함께 나갈 팀원 모집 중~
* 경진대회 명 : 2023년 보건의료빅데이터 활용 창업경진대회
* 경진대회 공고 : https://www.hira.or.krl.
bbsDummy.do? pgmid=HIRAA020002000100&brdScnBItNo=4&brd
BItNo=10186&pageIndex=1&pageIndex2=1#none
- 복지부장관상 (우수상 이상)
- 1등 상금 500만원~800만원
* 주요 내용은 다음과 같습니다.
- 01. 아이디어 기획 분야로 신청
- 02. 팀빌딩 > 아이디어 기획(디자인씽킹) > 아이템 선정 >
업무 분장~ 자료 작성(사업계획서 등) 제출
* 모집 인원 : 1팀당 4명 / 총 2팀(8명)
- 목표 : 순위권을 목표로 달리실분
- 필요 역량 : 열정, 의지, 배려, 시간
* 신청 방법 : 아래 URL 온라인 신청해주세요.
https://forms.gle/5DeYetoFhq8giDnt5
* 신청 기간 : ~ 5월 8일(월)까지
* 기타
- 본 프로젝트 팀은 학생 주도형으로 진행되며, 담당 직원 및 분 야별 전문가 컨설팅 예정입니다.
- 팀원이 3명 이상 모이지 않을 경우 해산합니다.
- 신청 시에 자기소개서 내용을 바탕으로 8분을 선정합니다.
-프로젝트 진행 도중에 특정 사유로 팀이 해산되거나 변동 될 수 있습니다.
- 프로젝트 진행 시에 온오프라인 미팅과 자료 작성이 필요합니 다. 이와 관련하여 진행 시에 프로젝트 팀 운영 규칙을 정하고 진행합니다.',1,97,60,3);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (7,'테니스장 사용하게 해주세요','20195127',to_date('23/05/26','RR/MM/DD'),'교직원 전용으로 체육관 뒤에 있는 테니스장을 사용하게 해주세요
체육관 뒤에 있는 테니스장을 테니스부와 교직원들만 사용할 수 있는 걸로 알고 있습니다.
학생들의 복지를 위해 일정 시간을 일반 학생들에게도 사용할 수 있는 시간을 주면 좋을 거 같습니다. ',1,59,48,1);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (14,'기숙사','20225081',to_date('23/03/28','RR/MM/DD'),'퇴실은 6월 11일 일요일에 해도 되나?',1,66,58,2);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (24,'영어 회화 스터디 구합니다!','20175142',to_date('23/06/02','RR/MM/DD'),'분야 어학
지역 광주
인원 3~5명
리딩이랑 독해는 많이 했는데 스피킹은 잘 못해서
이번 기회에 한번 공부해보고 영어로 간단한 대화 정도 할 만큼 실력 만들어보고 싶어서요!
영드나 노래같은걸로 쉐도잉하고
하루에 두세개씩 문장으로 표현연습해보려고 합니다~
기본적으로는 교재로 공부하려고 해요
시간이나 장소는 스터디원끼리 정해보려 합니다
신천지나 여자있는지 물어보려눈 분들은 그냥 가주시고
진짜 회화 생각 있으신 분만 댓글 부탁드립니다!',1,77,45,4);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (8,'도서관 쓰레기 문제','20195092',to_date('23/04/13','RR/MM/DD'),'시험기간마다 도서관 쓰레기통 주변에 온갖 쓰레기로 가득차있는 환경을 많은 학생들이 보셨을거라고 생각합니다 ㅠ 
시험기간만이라도 도서관에 쓰레기통이나 봉지를 여러개 두면 청소해주시는 여사님들께서도 매일 아침 많은 쓰레기와 사투하시는 시간이 줄어들 수 있을 것입니다.
도서관 쓰레기통, 쓰레기봉지 늘려주세요 !',1,89,68,1);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (11,'경희학성 아파트 사시는 분들','20225001',to_date('23/04/02','RR/MM/DD'),'살기 좋은가요??? 불편한 점 있나요?',1,55,49,2);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (2,'07학번 권O한 강남 세브란스병원 근무','20075126',to_date('21/03/30','RR/MM/DD'),'살면서 단 한 번도 인생이 쉽다 생각한 적이 없습니다. 남들처럼 사는 건 정말 힘든 일이며 평생을 좌충우돌하며 열심히 살아왔습니다. 여러분들의 선배가 척추정형외과의 정형외과 의사로서 살고 있다는 것에 의아함이 많겠으나, 저는 순천향대학교 의료IT공학과를 졸업하고 충남대학교 의학전문대학원을 졸업하여 의사가 되어 현재까지 열심히 살고 있습니다.
 저희를 늘 자애롭게 감싸 안아주시는 의료IT공학과 교수님들 품 안에서든, 어느 곳 에서든 좌충우돌 열심히 사셔야 합니다. 제가 열심히 살지 않으면 제 환자는 결과가 안 좋아지고 환자가 잘못되면 제 삶도 힘들어집니다. 힘내서 열심히 사세요. 파이팅.
',1,53,13,5);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (13,'향1 그라찌에 기말고사 기간 오픈!','20225522',to_date('23/05/23','RR/MM/DD'),'향1 그라찌에 기말고사 기간 추가 오픈합니다!
날짜: 6월4일 일요일, 6월6일 화요일
시간: 오전 10시~오후 18시
많은 이용 부탁드립니다 !!',1,89,45,2);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (21,'NCS 스터디원 증원합니다.','20175115',to_date('23/04/08','RR/MM/DD'),'분야 취업
지역부산
인원 1~2명
#>부산대 NCS스터디 매주 수, 일요일 13시
# 부산대 새벽벌 도서관 스터디룸
12 1(2)명 충원
시험치는 공기업 (PSAT, 피듈형 등) 봉모 위주로 함께 시간 측정하며 응시후 오답풀이합니다!
6개월이상 혹은 필기응시경험 있으신분으로 모집합니다!
현재 한두분 증원하고 있으며
총 인원은 8명 안으로 맞출 생각입니다.
자율 참가이긴 하지만 출석률이 많이 낮지않고, 일주일에 한번 정도는 참석해주실 수 있었으면 좋겠습니다 ! 문의 사항은 카톡 ee770077000으로 연락주세요 !',1,127,88,4);
Insert into SCOTT.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE,COUNT,LIKE_COUNT,CATEGORY) values (22,'국가직7급 psat 스터디 구해요','20175003',to_date('23/06/04','RR/MM/DD'),'분야 고시/공무원
_ 지역 서울
인원 3~10명
안녕하세요! 국가직7급 피셋 스터디 모집합니다.
스터디가 필수는 아니지만 주 1회이상 모여 강제적으로 시험을 보고, 서로 풀이를 확인하는 시간을 가지면 좋을 것 같아 모집하게 되었습니 . 다
요일은 주말이었으면 하고 세부적인 시간 등은 함께 정했으면 좋겠습
_니다.
민경채는 제외하고 5급,7급 피셋을 풀 예정입니다.
우선 7급 2개년 먼저 풀 계획이고, 5급의 경우 미리 20문제를 풀어온 뒤 남은 20문제를 현장에서 풀려고 합니다.
주 1~2회정도 생각중이고 장소는 혜화, 돈암, 종로 정도이면 좋겠습니 다!
_ 세 분정도 모집되면 바로 사전모임갖고 시작했으면 합니다',1,119,101,4);
REM INSERTING into SCOTT.USER_INFO
SET DEFINE OFF;
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20085128','5128','정병수','남자','jbs@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20075126','5126','권동한','남자','keh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20105094','5094','김수현','여자','ksh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20085028','5028','정하영','여자','jhy@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20205137','5137','이가현','여자','lgh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20215081','5081','전지현','여자','jjh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20185113','5113','박준혁','남자','pjh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20175109','5109','김동호','남자','kdh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20205128','5128','김근영','여자','kky@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20185351','5351','심희수','남자','shs@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20195092','5092','안요셉','남자','ays@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20175003','5003','김현욱','남자','khw@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20175142','5142','윤장원','남자','yjw@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20225522','5522','류민희','여자','rmh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20235011','5011','전수민','여자','jsm@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20195313','5313','김현민','남자','khm@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20215132','5132','박수연','남자','psy@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20185155','5155','문경록','남자','mkr@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20225081','5081','안성진','남자','asj@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20075114','5114','김권호','남자','kkh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20205114','5114','이서영','여자','lsy@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20195127','5127','최진성','남자','chs@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20175115','5115','지상일','남자','jsi@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20225001','5001','장혁','남자','jh@sch.ac.kr');
Insert into SCOTT.USER_INFO (USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) values ('20235321','5321','진채린','여자','jcr@sch.ac.kr');
REM INSERTING into SCOTT.COMMENT1
SET DEFINE OFF;
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('ㅇ',3,'L',0,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('야야',21,'20205114',0,to_date('23/06/04','RR/MM/DD'),26);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('ㄴㄴ',5,'L',1,to_date('23/06/03','RR/MM/DD'),4);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('xfhx',8,'L',1,to_date('23/06/03','RR/MM/DD'),2);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('fgzg',10,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('sdf',11,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('2',19,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('하잉zfzsfzdxf',1,'L',1,to_date('23/06/03','RR/MM/DD'),2);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('안녕',7,'L',1,to_date('23/06/03','RR/MM/DD'),5);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('zfszfs',12,'L',1,to_date('23/06/03','RR/MM/DD'),2);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('dd',14,'L',1,to_date('23/06/03','RR/MM/DD'),2);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('s',15,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('ㅇㅇㅇ',2,'L',1,to_date('23/06/03','RR/MM/DD'),7);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('ㄴㅇㄹ',4,'L',1,to_date('23/06/03','RR/MM/DD'),3);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('ㅌㅎㅌㅇㅎ',6,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('d',9,'L',0,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('1',18,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('안녕',20,'L',1,to_date('23/06/03','RR/MM/DD'),13);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('zxf',13,'L',0,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('ㄴㅇㄹ',16,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('0',17,'L',1,to_date('23/06/03','RR/MM/DD'),6);
Insert into SCOTT.COMMENT1 (COMMENTTEXT,COMMENTID,USERID,COMMENTAVAILABLE,COMMENTDATE,BBSID) values ('우와 처음 안 사실이에요 ! 아닌가요?',22,'20205128',0,to_date('23/06/07','RR/MM/DD'),26);
--------------------------------------------------------
--  DDL for Index SYS_C007042
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007042" ON "SCOTT"."BBS" ("BBSID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007041
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007041" ON "SCOTT"."USER_INFO" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007095
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007095" ON "SCOTT"."COMMENT1" ("COMMENTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BBS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BBS" ADD PRIMARY KEY ("BBSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_INFO
--------------------------------------------------------

  ALTER TABLE "SCOTT"."USER_INFO" ADD PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMENT1
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COMMENT1" ADD PRIMARY KEY ("COMMENTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
