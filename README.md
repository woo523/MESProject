# MES주식회사 (주사기 제조 공장 생산 관리 시스템)

---


![MES주식회사](BESimages/MES_main.PNG) 


## 호스팅 사이트 : http://itwillbs19.cafe24.com/login/login

프로젝트 기간 : 3월 8일 ~ 4월 14일

### 개발환경

* 개발도구 : STS 3, Workbench
* 언어 : JAVA(SE-11), JSP, HTML, CSS, JAVASCRIPT
* 프레임 워크 : Spring(4.3.8)
* 라이브러리 : JQUERY(3.6.3), JSTL(1.2), Mybatis(3.4.1)
* DB : MySQL v8.0.17
* 주제 : Spring 기반 MES시스템 설계

 담당 기능 : 생산실적 등록, 수정, 삭제 / 생산자화면(POP화면) / 메뉴 권한 관리



## <개발 코드>

### ◆ 생산실적 등록, 수정, 삭제 / 생산자 화면(POP 화면)

* Model
  * 생산실적 DTO [PerformDTO.java](src/main/java/com/itwillbs/work/domain/PerformDTO.java)
  * 상품 DTO [ItemDTO.java](src/main/java/com/itwillbs/work/domain/ItemDTO.java)
  * 페이징 DTO [PageDTO.java](src/main/java/com/itwillbs/work/domain/PageDTO.java)
  * 생산실적 DAO [PerformDAO.java](src/main/java/com/itwillbs/work/dao/PerformDAO.java)
  * 생산실적 DAOImpl [PerformDAOImpl.java](src/main/java/com/itwillbs/work/dao/PerformDAOImpl.java)
  * 생산실적 Service [PerformService.java](src/main/java/com/itwillbs/work/service/PerformService.java)
  * 생산실적 ServieImpl [PerformServiceImpl.java](src/main/java/com/itwillbs/work/service/PerformServiceImpl.java)
  * 생산실적 Mapper [performMapper.xml](src/main/resources/mappers/performMapper.xml)
 
* View
  
  * 생산실적 등록 메인 [performRegist.jsp](src/main/webapp/WEB-INF/views/work/performRegist.jsp)
  * 생산실적 등록 [pfInsert.jsp](src/main/webapp/WEB-INF/views/work/pfInsert.jsp)
  * 생산실적 수정 [pfmodi.jsp](src/main/webapp/WEB-INF/views/work/pfmodi.jsp)
  * 품목 리스트 [itemList.jsp](src/main/webapp/WEB-INF/views/work/itemList.jsp)
  * POP 로그인 [poplogin.jsp](src/main/webapp/WEB-INF/views/work/poplogin.jsp)
  * POP 메인 [pop_prfmRe.jsp](src/main/webapp/WEB-INF/views/work/pop_prfmRe.jsp)
  * POP 작업지시 확인 [pop_confirm.jsp](src/main/webapp/WEB-INF/views/work/pop_confirm.jsp)
  * POP 생산실적 등록 [pop_insert.jsp](src/main/webapp/WEB-INF/views/work/pop_insert.jsp)
  * POP 생산실적 수정 [pop_modi.jsp](src/main/webapp/WEB-INF/views/work/pop_modi.jsp)
    
* Controller

  * 생산실적 Contriller [PerformController.java](src/main/java/com/itwillbs/work/controller/PerformController.java)
  * 생산실적 ajax Controller [PerformAjaxController.java](src/main/java/com/itwillbs/work/controller/PerformAjaxController.java)

### ◆ 권한 관리

* Model
  * 권한 DTO [AuthDTO.java](src/main/java/com/itwillbs/auth/domain/AuthDTO.java)
  * 메뉴 DTO [MenuDTO.java](src/main/java/com/itwillbs/auth/domain/MenuDTO.java)
  * 권한 DAO [AuthDAO.java](src/main/java/com/itwillbs/auth/dao/AuthDAO.java)
  * 권한 DAOImpl [AuthDAOImpl.java](src/main/java/com/itwillbs/auth/dao/AuthDAOImpl.java)
  * 권한 Service [AuthService.java](src/main/java/com/itwillbs/auth/service/AuthService.java)
  * 권한 ServiceImpl [AuthServiceImpl.java](src/main/java/com/itwillbs/auth/service/AuthServiceImpl.java)
  * 권한 Mapper [authMapper.xml](src/main/resources/mappers/authMapper.xml)

* View
  *  직원 리스트 [user.jsp](src/main/webapp/WEB-INF/views/auth/user.jsp)
  *  권한 설정 [auth.jsp](src/main/webapp/WEB-INF/views/auth/auth.jsp)
  
* Controller
  * 권한 Controller [AuthController.java](src/main/java/com/itwillbs/auth/controller/AuthController.java)
  * 로그인할 때 권한 세션값에 저장 [LoginController.java](src/main/java/com/itwillbs/login/controller/LoginController.java)


---
