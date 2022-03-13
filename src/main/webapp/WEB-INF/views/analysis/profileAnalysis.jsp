<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${pageContext.request.contextPath}/${jsDir}/analysis/profile_analysis.js" type="text/javascript"></script>
<input type="hidden" id="profileId" value="${profileVo.profileId}"/>
<input type="hidden" id="profileType" value="${profileVo.profileType}"/>
<input type="hidden" id="paramQuarterDate" value="${paramQuarterDate}"/>
<input type="hidden" id="limitQuarter" value="${limitQuarter}"/>

<div class="flex-row justify-content-end mb-2">
    <div>
        <figure class="image is-32x32">
            <img id="bannerNSec" class="cursor" src="${pageContext.request.contextPath}/resources/images/banner/n-sec.png" onclick="cmmUtils.goToLinkPop('https://finance.naver.com')">
        </figure>
    </div>
    <div class="ml-2">
        <figure class="image is-32x32">
            <img id="bannerDart" class="cursor" src="${pageContext.request.contextPath}/resources/images/banner/dart.png" onclick="cmmUtils.goToLinkPop('http://dart.fss.or.kr/')">
        </figure>
    </div>
    <div class="ml-2">
        <figure class="image is-32x32">
            <img id="bannerConsensus" class="cursor" src="${pageContext.request.contextPath}/resources/images/banner/consensus.png" onclick="cmmUtils.goToLinkPop('http://consensus.hankyung.com/apps.analysis/analysis.list?&skinType=business')">
        </figure>
    </div>
</div>

<div class="tile is-ancestor flex flex-row">
    <div class="tile is-3 is-vertical is-parent">
        <div class="tile is-child flex-col justify-content-center">
            <div class="card">
                <div class="card-image">
                    <figure class="image is-1by1">
                        <img id="profileImg" src="" alt="Placeholder image">
                    </figure>
                </div>
                <div class="card-content">
                    <div class="media flex-row align-items-center">
                        <sec:authorize access="isAuthenticated()">
                            <div class="media-left">
                                <span id="spanStar" class="icon has-text-warning cursor"></span>
                            </div>
                        </sec:authorize>
                        <div class="media-content">
                            <p id="profileTitle" class="title is-6"></p>
                        </div>
                    </div>
                    <div id="profileSubtitle" class="content">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--상단 탭--%>
    <div class="tile is-vertical is-parent">
        <div class="tile is-child box">
            <div id="headerTabs" class="tabs is-boxed">
                <ul>
                    <li id="benchmarkTab" class="topTabs is-hidden" data-cont-id="benchmarkCont">
                        <a>
                            <span class="icon has-text-primary"><i class="fas fa-gem"></i></span>
                            <span>벤치마크 지수</span>
                        </a>
                    </li>
                    <li id="fundamentalTab" class="is-active topTabs" data-cont-id="fundamentalCont">
                        <a>
                            <span class="icon has-text-primary"><i class="fas fa-gem"></i></span>
                            <span>운용자산 규모</span>
                        </a>
                    </li>
                    <sec:authorize access="isAuthenticated()">
                        <li id="ideaTab" class="topTabs" data-cont-id="ideaCont">
                            <a>
                                <span class="icon has-text-warning"><i class="fas fa-lightbulb"></i></span>
                                <span>투자 아이디어</span>
                            </a>
                        </li>
                    </sec:authorize>
                    <li id="linkTab" class="topTabs" data-cont-id="linkCont">
                        <a>
                            <span class="icon has-text-link"><i class="fas fa-link"></i></span>
                            <span>참고자료</span>
                        </a>
                    </li>
                    <li id="infoTab" class="topTabs" data-cont-id="infoCont">
                        <a>
                            <span class="icon has-text-info"><i class="fas fa-info-circle"></i></span>
                            <span>소개</span>
                        </a>
                    </li>
                    <li id="notiTab" class="topTabs" data-cont-id="notiCont">
                        <a>
                            <span class="icon has-text-danger"><i class="fas fa-exclamation-triangle"></i></span>
                            <span>유의사항</span>
                        </a>
                    </li>
                </ul>
            </div>
            <%--Benchmark 내용--%>
            <div id="benchmarkCont" class="is-hidden">
                <div class="columns">
                    <div class="column is-full">
                        <div class="flex-col justify-content-center">
                            <div id="benchmarkChart" class="is-fullwidth" style="width: 950px; height: 300px;"></div>
                            <p class="subtitle is-7 pl-5 has-text-grey"><span class="has-text-danger mr-1">*</span> 벤치마크 지수는 추정치이며 수치를 따지기 보다는"못함, 보통, 잘함, 아주 잘함" 정도로 인식하는 것이 좋습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
            <%--Fundamental 내용--%>
            <div id="fundamentalCont">
                <div class="columns">
                    <div class="column is-full">
                        <div class="flex-col justify-content-center">
                            <div id="fundamentalChart" class="is-fullwidth" style="width: 950px; height: 300px;"></div>
                            <p class="subtitle is-7 pl-5 has-text-grey"><span class="has-text-danger mr-1">*</span>비상장회사, 해외자산, 현금, 채권, 파생상품 등은 포함되지 않은 수치입니다.</p>
                        </div>
                    </div>
                </div>
            </div>
            <sec:authorize access="isAuthenticated()">
                <%--아이디어 탭--%>
                <div id="ideaCont" class="is-hidden">
                    <div class="columns">
                        <div class="flex-row justify-content-start width-100per">
                            <div class="flex-row align-items-center pl-4 width-50per">
                                <p id="availableFileSize" class="subtitle is-7 has-text-grey">첨부 이미지 총 사용량: <span id="usedFileSize">0</span> / <span id="maxFileSize">1000 MB</span></p>
                            </div>
                            <div class="flex-row justify-content-end pr-2 width-50per">
                                <button id="btnMod" onclick="main.showIdeaModal()" class="button is-primary is-small mr-4">
                                    <span class="icon is-small"><i class="fas fa-pencil-alt"></i></span>
                                    <span>아이디어 추가</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="columns">
                        <div class="column is-full" style="min-height: 300px;">
                            <div class="table-container mt-3">
                                <table id="ideaGrid" class="table is-narrow is-hoverable is-fullwidth"></table>
                            </div>
                            <nav id="ideaPagination" class="pagination is-small ml-3 mr-3" role="navigation" aria-label="pagination"></nav>
                        </div>
                    </div>
                </div>
            </sec:authorize>
            <%--참고링크 탭--%>
            <div id="linkCont" class="is-hidden analysis-tab-content__link">
                <div class="columns">
                    <div class="column is-full">
                        <div id="profileLinkDiv" class="flex-col justify-content-start" style="width: 950px; min-height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
            <%--소개 탭--%>
            <div id="infoCont" class="is-hidden analysis-tab-content">
                <div class="columns">
                    <div class="column is-full">
                        <div id="infoDiv" class="pl-5 pr-5" style="width: 950px; min-height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
            <%--유의사항 탭--%>
            <div id="notiCont" class="is-hidden analysis-tab-content">
                <div class="columns" style="width: 950px; min-height: 300px;">
                    <div class="column is-full">
                        <c:if test="${profileVo.profileType eq '1'}">
                            <ul class="pl-5 pr-5">
                                <li>1.액면분할, 유.무상 증자, 감자 이슈에 대한 수정 보유수량을 제공하지 않습니다.</li>
                                <li>2.전분기대비 급격한 보유수량 증가가 생긴다면 해당이슈에 대해서 검토하시기 바랍니다</li>
                                <li>3.예시) 삼성전자가 액면분할을 1주 -> 50주로 단행하였을 때 운용사의 삼성전자 주식 보유량은 50배씩 늘어난 것으로 보이게 되지만, 실은 액면분할 효과일 뿐 주식취득은 없습니다.</li>
                                <li>4.매수가가 비정상적으로 높다면 마찬가지로 액면분할 관련이슈에 대하여 검토하시기 바랍니다.</li>
                                <li>5.현재가, 수익률, 포트폴리오 시가총액은 발표된 보고서의 최근 분기만 최신주가를 반영하여 만들어 집니다.</li>
                                <li>6.예시) 2018-2Q의 보고서를 본다면 현재가, 수익률, 포트폴리오 시가총액은 2018년 6월 30일 주가를 기반으로 보여 집니다.</li>
                            </ul>
                        </c:if>
                        <c:if test="${profileVo.profileType eq '2'}">
                            <ul class="pl-5 pr-5">
                                <li>1.보유종목은 미국 내 상장기업만 표시됩니다(예시: 워렌버핏은 일본의 상사기업 5곳을 보유하고 있지만 표시되지 않습니다).</li>
                                <li>2.벤치마크지수는 시간가중수익률을 기반으로 만들어졌습니다.</li>
                                <li>3.채권, 파생상품 포지션은 표시되지 않습니다.</li>
                                <li>4.현재가, 수익률, 포트폴리오 시가총액은 발표된 보고서의 최근 분기만 최신주가를 반영하여 만들어 집니다.</li>
                                <li>5.예시) 2018-2Q의 보고서를 본다면 현재가, 수익률, 포트폴리오 시가총액은 2018년 6월 30일 주가를 기반으로 보여 집니다.</li>
                                <li>6.운용자산 규모축소, 확대로 밸류에이션과 주가움직임과 무관하게 매수.매도가 일어 났을 수도 있습니다. 이부분에 유념하시기 바랍니다.</li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="box">
    <%--분기 슬라이더--%>
    <div id="quarterSlider" class="swiper-container mt-3">
        <div id="quarterCont" class="swiper-wrapper height180px"></div>
        <!-- Add Arrows -->
        <div id="quarterNext" class="swiper-button-next"></div>
        <div id="quarterPrev" class="swiper-button-prev"></div>
        <!-- Add Pagination -->
        <div id="quarterPagination" class="swiper-pagination"></div>
    </div>

    <%--새로고침 타이머--%>
    <div id="timerDiv" class="flex-row justify-content-start">
        <div>
            <input id="switchRefresh" type="checkbox" name="switchRefresh" class="switch is-small is-thin is-black" checked="checked">
            <label id="switchRefreshLabel" for="switchRefresh"></label>
        </div>
        <span class="icon-text has-text-danger"><span class="icon"><i class="fas fa-clock"></i></span></span>
        <span id="clockSpan"></span>
    </div>

    <%--분석탭--%>
    <div id="bottomTabs" class="tabs is-boxed mt-2 flex-row">
        <ul>
            <li id="gridTab" class="is-active bottomTabs" data-view="grid" data-cont-id="gridCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-table"></i></span>
                    <span>전체</span>
                </a>
            </li>
            <li id="newTransferTab" class="bottomTabs" data-view="newTransfer" data-cont-id="newTransferGridCont">
                <a>
                    <span class="icon has-text-success"><i class="fas fa-plus-circle"></i></span>
                    <span>신규편입</span>
                </a>
            </li>
            <li id="soldOutTab" class="bottomTabs" data-view="soldOut" data-cont-id="soldOutGridCont">
                <a>
                    <span class="icon has-text-danger"><i class="fas fa-minus-circle"></i></span>
                    <span>전량매도</span>
                </a>
            </li>
            <li id="barBTab" class="bottomTabs" data-view="buying" data-cont-id="buyingCont">
                <a>
                    <span class="icon has-text-danger"><i class="fas fa-hand-holding-usd"></i></span>
                    <span>매수금액</span>
                </a>
            </li>
            <c:if test="${profileVo.profileType eq '2'}">
                <li id="barSTab" class="bottomTabs" data-view="selling" data-cont-id="sellingCont">
                    <a>
                        <span class="icon has-text-info"><i class="fas fa-hand-holding-usd"></i></span>
                        <span>매도금액</span>
                    </a>
                </li>
            </c:if>
            <li id="barTab" class="bottomTabs" data-view="barChart" data-cont-id="barCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-poll-h"></i></span>
                    <span>비중(막대)</span>
                </a>
            </li>
            <li id="pieTab" class="bottomTabs" data-view="pieChart" data-cont-id="pieCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-chart-pie"></i></span>
                    <span>비중(원형)</span>
                </a>
            </li>
            <li id="treeMapTab" class="bottomTabs" data-view="treeMap" data-cont-id="treeMapCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-th-large"></i></span>
                    <span>비중(트리맵)</span>
                </a>
            </li>
        </ul>
    </div>

    <%--전체 그리드 탭--%>
    <div id="gridCont">
        <div class="flex-row">
            <%--종목 검색--%>
            <div class="flex-row width-50-p justify-content-start align-content-center">
                <div class="field has-addons">
                    <p class="control has-icons-left">
                    <span class="select is-small">
                       <select id="schType">
                            <option value="1">종목명</option>
                            <option value="2">종목코드</option>
                        </select>
                    </span>
                        <span class="icon is-left"><i class="fas fa-filter" aria-hidden="true"></i></span>
                    </p>
                    <p class="control is-small">
                        <input id="schWord" class="input input-search is-small" type="text" placeholder="종목명 또는 종목코드 검색" maxlength="300">
                    </p>
                    <p class="control">
                        <button class="button is-small is-dark" onclick="main.searchItemName()">
                            <span class="icon"><i class="fas fa-search-dollar"></i></span>
                            <span>검색</span>
                        </button>
                    </p>
                </div>
            </div>
            <div class="flex-row width-50-p justify-content-end">
                <sec:authorize access="hasAnyRole('ROLE_STANDARD', 'ROLE_PREMIUM', 'ROLE_PREMIUM_PLUS', 'ROLE_ADMIN')">
                    <%--분기조정 스피너--%>
                    <div class="spinnerDiv flex-row justify-content-center mr-3">
                        <div>
                            <button class="button is-small spinner-minus">
                                <span class="icon is-small"><i class="fas fa-minus"></i></span>
                            </button>
                        </div>
                        <div class="control">
                            <input class="spinner input is-small spinner-count" type="text" value="1" maxLength="3" data-idx="0"/>
                        </div>
                        <div>
                            <button class="button is-small spinner-plus">
                                <span class="icon is-small"><i class="fas fa-plus"></i></span>
                            </button>
                        </div>
                    </div>
                    <div class="flex-col justify-content-center mr-1">
                        <p name="spinnerTitle" class="title is-6 mr-5"></p>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="flex-col justify-content-center">
                            <%--엑셀 다운로드--%>
                        <span id="gridExcel" class="icon has-text-success cursor" onclick="main.downloadProfileGrid(1)"><i class="fas fa-lg fa-file-download"></i></span>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <div class="table-container">
            <table id="profileGrid" class="mt-3 table table is-bordered is-narrow is-hoverable is-fullwidth"></table>
        </div>
        <nav id="profileGridPagination" class="pagination is-small ml-3 mr-3" role="navigation" aria-label="pagination"></nav>
    </div>

    <%--신규편입 탭--%>
    <div id="newTransferGridCont" class="is-hidden">
        <div class="flex-row">
            <div class="flex-row width-50-p justify-content-start">
                <%--            <span id="tab2Help" class="icon has-text-warning cursor"><i class="fas fa-lg fa-info-circle"></i></span>--%>
            </div>
            <div class="flex-row width-50-p justify-content-end">
                <sec:authorize access="hasAnyRole('ROLE_STANDARD', 'ROLE_PREMIUM', 'ROLE_PREMIUM_PLUS', 'ROLE_ADMIN')">
                    <%--분기조정 스피너--%>
                    <div class="spinnerDiv flex-row justify-content-center mr-3">
                        <div>
                            <button class="button is-small spinner-minus">
                                <span class="icon is-small"><i class="fas fa-minus"></i></span>
                            </button>
                        </div>
                        <div class="control">
                            <input class="spinner input is-small spinner-count" type="text" value="1" maxLength="3" data-idx="0"/>
                        </div>
                        <div>
                            <button class="button is-small spinner-plus">
                                <span class="icon is-small"><i class="fas fa-plus"></i></span>
                            </button>
                        </div>
                    </div>
                    <div class="flex-col justify-content-center mr-2">
                        <p name="spinnerTitle" class="title is-6 mr-5"></p>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="flex-col justify-content-center">
                            <%--엑셀 다운로드--%>
                        <span id="newTransferExcel" class="icon has-text-success cursor" onclick="main.downloadProfileGrid(2)"><i class="fas fa-lg fa-file-download"></i></span>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <table id="newTransferGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
    </div>

    <%--전량매도 탭--%>
    <div id="soldOutGridCont" class="is-hidden">
        <div class="flex-row">
            <div class="flex-row width-50-p justify-content-start">
                <%--            <span id="tab3Help" class="icon has-text-warning cursor"><i class="fas fa-lg fa-info-circle"></i></span>--%>
            </div>
            <div class="flex-row width-50-p justify-content-end">
                <sec:authorize access="hasAnyRole('ROLE_STANDARD', 'ROLE_PREMIUM', 'ROLE_PREMIUM_PLUS', 'ROLE_ADMIN')">
                    <%--분기조정 스피너--%>
                    <div class="spinnerDiv flex-row justify-content-center mr-3">
                        <div>
                            <button class="button is-small spinner-minus">
                                <span class="icon is-small"><i class="fas fa-minus"></i></span>
                            </button>
                        </div>
                        <div class="control">
                            <input class="spinner input is-small spinner-count" type="text" value="1" maxLength="3" data-idx="0"/>
                        </div>
                        <div>
                            <button class="button is-small spinner-plus">
                                <span class="icon is-small"><i class="fas fa-plus"></i></span>
                            </button>
                        </div>
                    </div>
                    <div class="flex-col justify-content-center mr-2">
                        <p name="spinnerTitle" class="title is-6 mr-5"></p>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="flex-col justify-content-center">
                            <%--엑셀 다운로드--%>
                        <span id="soldOutExcel" class="icon has-text-success cursor" onclick="main.downloadProfileGrid(3)"><i class="fas fa-lg fa-file-download"></i></span>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <table id="soldOutGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
    </div>

    <%--매수금액--%>
    <div id="buyingCont" class="is-hidden">
        <div class="flex-row">
            <table id="buyingGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
        </div>
    </div>

    <%--매도금액--%>
    <div id="sellingCont" class="is-hidden">
        <div class="flex-row">
            <table id="sellingGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
        </div>
    </div>

    <%--차트 탭--%>
    <div id="barCont" class="is-hidden">
        <div class="flex-row">
            <div class="field">
                <div class="control has-icons-left">
                    <div class="select is-small">
                        <select id="selBarChartRank">
                            <option value="">전체</option>
                            <option value="10">상위 10</option>
                            <option value="20">상위 20</option>
                            <option value="30" selected>상위 30</option>
                            <option value="40">상위 40</option>
                            <option value="50">상위 50</option>
                            <option value="60">상위 60</option>
                            <option value="70">상위 70</option>
                            <option value="80">상위 80</option>
                            <option value="90">상위 90</option>
                            <option value="100">상위 100</option>
                        </select>
                    </div>
                    <div class="icon is-small is-left">
                        <i class="fas fa-flag-checkered"></i>
                    </div>
                </div>
            </div>
            <div class="field ml-3 is-hidden">
                <div class="control has-icons-left">
                    <div class="select is-small">
                        <select id="selBarChartFilter">
                            <option value="marketPrice" selected>시가평가액</option>
                            <option value="viewWeight">비중(%)</option>
                            <option value="quantity">보유수량</option>
                        </select>
                    </div>
                    <div class="icon is-small is-left">
                        <i class="fas fa-filter"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex-row justify-content-start">
            <div id="profileBarChart" class="is-fullwidth" style="width: 1400px;"></div>
        </div>
    </div>

    <%--파이차트--%>
    <div id="pieCont" class="is-hidden">
        <div class="flex-row">
            <div class="field ml-3">
                <div class="control has-icons-left">
                    <div class="select is-small">
                        <select id="selPieChartFilter">
                            <option value="">Normal</option>
                            <option value="radious">Nightingale(Radious)</option>
                            <option value="area">Nightingale(Area)</option>
                        </select>
                    </div>
                    <div class="icon is-small is-left">
                        <i class="fas fa-eye"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex-row justify-content-center">
            <div id="profilePieChart" class="is-fullwidth" style="width: 1400px; height: 800px;"></div>
        </div>
    </div>

    <%--TreeMap--%>
    <div id="treeMapCont" class="is-hidden">
        <div id="treeMapColorInfo" class="flex-row">
            <div class="control">
                <div class="tags has-addons">
                    <span class="tag" style="background: #F01C2B; color: white;">-3%</span>
                    <span class="tag" style="background: #B02B35; color: white;">-2%</span>
                    <span class="tag" style="background: #76323D; color: white;">-1%</span>
                    <span class="tag" style="background: #323543; color: white;">0</span>
                    <span class="tag" style="background: #2A643D; color: white;">1%</span>
                    <span class="tag" style="background: #28913D; color: white;">2%</span>
                    <span class="tag" style="background: #2EC548; color: white;">3%</span>
                    <span class="tag is-white">※ 등락률은 최신 분기에만 표시됩니다.</span>
                </div>
            </div>
        </div>
        <div class="flex-row justify-content-center">
            <div id="profileTreeMapChart" class="is-fullwidth" style="width: 1400px; height: 800px;"></div>
        </div>
    </div>

    <%--아이디어 등록 모달--%>
    <div id="newIdeaModal" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card width1300px">
            <header class="modal-card-head">
                <p class="modal-card-title">아이디어 등록</p>
                <button class="delete" aria-label="close" onclick="main.closeNewIdeaModal()"></button>
            </header>
            <section class="modal-card-body">
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="newIdeaTitle">제목</label>
                    </div>
                    <div class="column">
                        <div class="control">
                            <input id="newIdeaTitle" class="input is-info" type="text" maxlength="30" placeholder="최대 30자리 입력">
                        </div>
                    </div>
                </div>
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="newIdeaCont">아이디어</label>
                    </div>
                    <div class="column">
                        <div class="control has-icons-left">
                            <div id="newIdeaCont"></div>
                        </div>
                    </div>
                </div>
            </section>
            <footer class="modal-card-foot justify-content-center">
                <button id="btnNewIdea" onclick="main.saveIdea()" class="button is-success is-small">
                <span class="icon is-small">
                  <i class="fas fa-check"></i>
                </span>
                    <span>등록</span>
                </button>
                <button onclick="main.closeNewIdeaModal()" class="button is-dark is-small">
                <span class="icon is-small">
                  <i class="fas fa-times"></i>
                </span>
                    <span>취소</span>
                </button>
            </footer>
        </div>
    </div>
</div>



<%--아이디어 수정모달--%>
<div id="modIdeaModal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-card width1300px">
        <header class="modal-card-head">
            <p class="modal-card-title" id="modCardTitle">투자 아이디어</p>
            <button class="delete" aria-label="close" onclick="main.closeModIdeaModal()"></button>
        </header>
        <section class="modal-card-body">
            <form id="modIdeaForm">
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="modIdeaTitle">제목</label>
                    </div>
                    <div class="column">
                        <div class="control">
                            <input id="modIdeaTitle" class="input is-info" type="text" maxlength="30" placeholder="최대 30자리 입력" data-bind="true" data-id="ideaTitle">
                        </div>
                    </div>
                </div>
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="modIdeaCont">아이디어</label>
                    </div>
                    <div class="column">
                        <div class="control has-icons-left">
                            <div id="modIdeaCont"></div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <footer class="modal-card-foot justify-content-center">
            <button id="btnModIdea" onclick="main.modifyIdea()" class="button is-success is-small">
                <span class="icon is-small">
                  <i class="fas fa-check"></i>
                </span>
                <span>수정</span>
            </button>
            <button id="btnRmIdea" onclick="main.removeIdea()" class="button is-danger is-small">
                <span class="icon is-small">
                  <i class="fas fa-trash"></i>
                </span>
                <span>삭제</span>
            </button>
            <button onclick="main.closeModIdeaModal()" class="button is-dark is-small">
                <span class="icon is-small">
                  <i class="fas fa-times"></i>
                </span>
                <span>취소</span>
            </button>
        </footer>
    </div>
</div>

<%--라인차트 모달--%>
<div id="stackChartModal" class="modal">
    <div class="modal-background" onclick="main.closeStackChartModal()"></div>
    <div class="modal-content width1200px">
        <header class="modal-card-head">
            <p class="modal-card-title" id="stackChartModalTitle"></p>
            <button class="delete" aria-label="close" onclick="main.closeStackChartModal()"></button>
        </header>
        <section class="modal-card-body">
            <div class="flex-col justify-content-start">
                <div class="flex-row justify-content-start">
                    <div class="field">
                        <div class="control has-icons-left">
                            <div class="select is-small">
                                <select id="selStackChartFilter">
                                    <option value="0" selected></option>
                                    <option value="1">즐겨찾기한 포트폴리오</option>
                                </select>
                            </div>
                            <div class="icon is-small is-left">
                                <i class="fas fa-filter"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex-row justify-content-center">
                    <div id="leftItemCodeChart" class="is-fullwidth" style="width: 1200px; height: 500px;"></div>
                </div>
                <div id="gridLoadingDiv" class="flex-row justify-content-center">
                </div>
                <div id="stackGridDiv" class="flex-row justify-content-center" style="max-height: 500px;">
                    <div class="table-container overflowY-auto">
                        <table id="stackChartGrid" class="table table is-bordered is-narrow is-hoverable is-fullwidth"></table>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<%--증감률 열의 차트 모달--%>
<div id="colLineChartModal" class="modal">
    <div class="modal-background" onclick="main.closeColLineChartModal()"></div>
    <div class="modal-content width1200px">
        <header class="modal-card-head">
            <p class="modal-card-title" id="lineChartModalTitle"></p>
            <button class="delete" aria-label="close" onclick="main.closeColLineChartModal()"></button>
        </header>
        <section class="modal-card-body">
                <div class="flex-row justify-content-start">
                    <div class="field">
                        <div class="control has-icons-left">
                            <div class="select is-small">
                                <select id="selLineChartFilter">
                                    <option value="0" selected>보유수량</option>
                                    <option value="1">시가평가액</option>
                                    <c:if test="${profileVo.profileType eq '1'}">
                                        <option value="2">매수금액</option>
                                    </c:if>
                                    <c:if test="${profileVo.profileType eq '2'}">
                                        <option value="2">매수·매도금액</option>
                                    </c:if>
                                    <option value="3">평균매수가</option>
                                </select>
                            </div>
                            <div class="icon is-small is-left">
                                <i class="fas fa-filter"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex-row justify-content-center">
                    <div id="rightItemCodeChart" class="width1500px height600px"></div>
                </div>
                <div class="flex-row justify-content-center">
                    <article class="message is-warning">
                        <div id="rightChartMsgBody" class="message-body">
                            <p><span class="icon has-text-warning mr-2"><i class="fas fa-exclamation-triangle"></i></span><strong>미공시</strong>로 표기된 것은 제출된 운용보고서가 <strong>비공개</strong>된 것입니다. 위 차트 상에는 <strong>전량매도</strong>로 보일 수 있으나, <strong>알수없음</strong>으로 보는 것이 맞습니다.</p>
                        </div>
                    </article>
                </div>
        </section>
    </div>
</div>

<figure class="image is-128x128 is-hidden" id="miniProfileImg">
    <img src="https://bulma.io/images/placeholders/128x128.png">
</figure>




