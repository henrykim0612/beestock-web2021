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
    <%--?????? ???--%>
    <div class="tile is-vertical is-parent">
        <div class="tile is-child box">
            <div id="headerTabs" class="tabs is-boxed">
                <ul>
                    <li id="benchmarkTab" class="topTabs is-hidden" data-cont-id="benchmarkCont">
                        <a>
                            <span class="icon has-text-primary"><i class="fas fa-gem"></i></span>
                            <span>???????????? ??????</span>
                        </a>
                    </li>
                    <li id="fundamentalTab" class="is-active topTabs" data-cont-id="fundamentalCont">
                        <a>
                            <span class="icon has-text-primary"><i class="fas fa-gem"></i></span>
                            <span>???????????? ??????</span>
                        </a>
                    </li>
                    <sec:authorize access="isAuthenticated()">
                        <li id="ideaTab" class="topTabs" data-cont-id="ideaCont">
                            <a>
                                <span class="icon has-text-warning"><i class="fas fa-lightbulb"></i></span>
                                <span>?????? ????????????</span>
                            </a>
                        </li>
                    </sec:authorize>
                    <li id="linkTab" class="topTabs" data-cont-id="linkCont">
                        <a>
                            <span class="icon has-text-link"><i class="fas fa-link"></i></span>
                            <span>????????????</span>
                        </a>
                    </li>
                    <li id="infoTab" class="topTabs" data-cont-id="infoCont">
                        <a>
                            <span class="icon has-text-info"><i class="fas fa-info-circle"></i></span>
                            <span>??????</span>
                        </a>
                    </li>
                    <li id="notiTab" class="topTabs" data-cont-id="notiCont">
                        <a>
                            <span class="icon has-text-danger"><i class="fas fa-exclamation-triangle"></i></span>
                            <span>????????????</span>
                        </a>
                    </li>
                </ul>
            </div>
            <%--Benchmark ??????--%>
            <div id="benchmarkCont" class="is-hidden">
                <div class="columns">
                    <div class="column is-full">
                        <div class="flex-col justify-content-center">
                            <div id="benchmarkChart" class="is-fullwidth" style="width: 950px; height: 300px;"></div>
                            <p class="subtitle is-7 pl-5 has-text-grey"><span class="has-text-danger mr-1">*</span> ???????????? ????????? ??????????????? ????????? ????????? ?????????"??????, ??????, ??????, ?????? ??????" ????????? ???????????? ?????? ????????????.</p>
                        </div>
                    </div>
                </div>
            </div>
            <%--Fundamental ??????--%>
            <div id="fundamentalCont">
                <div class="columns">
                    <div class="column is-full">
                        <div class="flex-col justify-content-center">
                            <div id="fundamentalChart" class="is-fullwidth" style="width: 950px; height: 300px;"></div>
                            <p class="subtitle is-7 pl-5 has-text-grey"><span class="has-text-danger mr-1">*</span>???????????????, ????????????, ??????, ??????, ???????????? ?????? ???????????? ?????? ???????????????.</p>
                        </div>
                    </div>
                </div>
            </div>
            <sec:authorize access="isAuthenticated()">
                <%--???????????? ???--%>
                <div id="ideaCont" class="is-hidden">
                    <div class="columns">
                        <div class="flex-row justify-content-start width-100per">
                            <div class="flex-row align-items-center pl-4 width-50per">
                                <p id="availableFileSize" class="subtitle is-7 has-text-grey">?????? ????????? ??? ?????????: <span id="usedFileSize">0</span> / <span id="maxFileSize">1000 MB</span></p>
                            </div>
                            <div class="flex-row justify-content-end pr-2 width-50per">
                                <button id="btnMod" onclick="main.showIdeaModal()" class="button is-primary is-small mr-4">
                                    <span class="icon is-small"><i class="fas fa-pencil-alt"></i></span>
                                    <span>???????????? ??????</span>
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
            <%--???????????? ???--%>
            <div id="linkCont" class="is-hidden analysis-tab-content__link">
                <div class="columns">
                    <div class="column is-full">
                        <div id="profileLinkDiv" class="flex-col justify-content-start" style="width: 950px; min-height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
            <%--?????? ???--%>
            <div id="infoCont" class="is-hidden analysis-tab-content">
                <div class="columns">
                    <div class="column is-full">
                        <div id="infoDiv" class="pl-5 pr-5" style="width: 950px; min-height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
            <%--???????????? ???--%>
            <div id="notiCont" class="is-hidden analysis-tab-content">
                <div class="columns" style="width: 950px; min-height: 300px;">
                    <div class="column is-full">
                        <c:if test="${profileVo.profileType eq '1'}">
                            <ul class="pl-5 pr-5">
                                <li>1.????????????, ???.?????? ??????, ?????? ????????? ?????? ?????? ??????????????? ???????????? ????????????.</li>
                                <li>2.??????????????? ????????? ???????????? ????????? ???????????? ??????????????? ????????? ??????????????? ????????????</li>
                                <li>3.??????) ??????????????? ??????????????? 1??? -> 50?????? ??????????????? ??? ???????????? ???????????? ?????? ???????????? 50?????? ????????? ????????? ????????? ?????????, ?????? ???????????? ????????? ??? ??????????????? ????????????.</li>
                                <li>4.???????????? ?????????????????? ????????? ??????????????? ???????????? ??????????????? ????????? ??????????????? ????????????.</li>
                                <li>5.?????????, ?????????, ??????????????? ??????????????? ????????? ???????????? ?????? ????????? ??????????????? ???????????? ????????? ?????????.</li>
                                <li>6.??????) 2018-2Q??? ???????????? ????????? ?????????, ?????????, ??????????????? ??????????????? 2018??? 6??? 30??? ????????? ???????????? ?????? ?????????.</li>
                            </ul>
                        </c:if>
                        <c:if test="${profileVo.profileType eq '2'}">
                            <ul class="pl-5 pr-5">
                                <li>1.??????????????? ?????? ??? ??????????????? ???????????????(??????: ??????????????? ????????? ???????????? 5?????? ???????????? ????????? ???????????? ????????????).</li>
                                <li>2.????????????????????? ???????????????????????? ???????????? ?????????????????????.</li>
                                <li>3.??????, ???????????? ???????????? ???????????? ????????????.</li>
                                <li>4.?????????, ?????????, ??????????????? ??????????????? ????????? ???????????? ?????? ????????? ??????????????? ???????????? ????????? ?????????.</li>
                                <li>5.??????) 2018-2Q??? ???????????? ????????? ?????????, ?????????, ??????????????? ??????????????? 2018??? 6??? 30??? ????????? ???????????? ?????? ?????????.</li>
                                <li>6.???????????? ????????????, ????????? ?????????????????? ?????????????????? ???????????? ??????.????????? ?????? ?????? ?????? ????????????. ???????????? ??????????????? ????????????.</li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="box">
    <%--?????? ????????????--%>
    <div id="quarterSlider" class="swiper-container mt-3">
        <div id="quarterCont" class="swiper-wrapper height180px"></div>
        <!-- Add Arrows -->
        <div id="quarterNext" class="swiper-button-next"></div>
        <div id="quarterPrev" class="swiper-button-prev"></div>
        <!-- Add Pagination -->
        <div id="quarterPagination" class="swiper-pagination"></div>
    </div>

    <%--???????????? ?????????--%>
    <div id="timerDiv" class="flex-row justify-content-start">
        <div>
            <input id="switchRefresh" type="checkbox" name="switchRefresh" class="switch is-small is-thin is-black" checked="checked">
            <label id="switchRefreshLabel" for="switchRefresh"></label>
        </div>
        <span class="icon-text has-text-danger"><span class="icon"><i class="fas fa-clock"></i></span></span>
        <span id="clockSpan"></span>
    </div>

    <%--?????????--%>
    <div id="bottomTabs" class="tabs is-boxed mt-2 flex-row">
        <ul>
            <li id="gridTab" class="is-active bottomTabs" data-view="grid" data-cont-id="gridCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-table"></i></span>
                    <span>??????</span>
                </a>
            </li>
            <li id="newTransferTab" class="bottomTabs" data-view="newTransfer" data-cont-id="newTransferGridCont">
                <a>
                    <span class="icon has-text-success"><i class="fas fa-plus-circle"></i></span>
                    <span>????????????</span>
                </a>
            </li>
            <li id="soldOutTab" class="bottomTabs" data-view="soldOut" data-cont-id="soldOutGridCont">
                <a>
                    <span class="icon has-text-danger"><i class="fas fa-minus-circle"></i></span>
                    <span>????????????</span>
                </a>
            </li>
            <li id="barBTab" class="bottomTabs" data-view="buying" data-cont-id="buyingCont">
                <a>
                    <span class="icon has-text-danger"><i class="fas fa-hand-holding-usd"></i></span>
                    <span>????????????</span>
                </a>
            </li>
            <c:if test="${profileVo.profileType eq '2'}">
                <li id="barSTab" class="bottomTabs" data-view="selling" data-cont-id="sellingCont">
                    <a>
                        <span class="icon has-text-info"><i class="fas fa-hand-holding-usd"></i></span>
                        <span>????????????</span>
                    </a>
                </li>
            </c:if>
            <li id="barTab" class="bottomTabs" data-view="barChart" data-cont-id="barCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-poll-h"></i></span>
                    <span>??????(??????)</span>
                </a>
            </li>
            <li id="pieTab" class="bottomTabs" data-view="pieChart" data-cont-id="pieCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-chart-pie"></i></span>
                    <span>??????(??????)</span>
                </a>
            </li>
            <li id="treeMapTab" class="bottomTabs" data-view="treeMap" data-cont-id="treeMapCont">
                <a>
                    <span class="icon has-text-primary"><i class="fas fa-th-large"></i></span>
                    <span>??????(?????????)</span>
                </a>
            </li>
        </ul>
    </div>

    <%--?????? ????????? ???--%>
    <div id="gridCont">
        <div class="flex-row">
            <%--?????? ??????--%>
            <div class="flex-row width-50-p justify-content-start align-content-center">
                <div class="field has-addons">
                    <p class="control has-icons-left">
                    <span class="select is-small">
                       <select id="schType">
                            <option value="1">?????????</option>
                            <option value="2">????????????</option>
                        </select>
                    </span>
                        <span class="icon is-left"><i class="fas fa-filter" aria-hidden="true"></i></span>
                    </p>
                    <p class="control is-small">
                        <input id="schWord" class="input input-search is-small" type="text" placeholder="????????? ?????? ???????????? ??????" maxlength="300">
                    </p>
                    <p class="control">
                        <button class="button is-small is-dark" onclick="main.searchItemName()">
                            <span class="icon"><i class="fas fa-search-dollar"></i></span>
                            <span>??????</span>
                        </button>
                    </p>
                </div>
            </div>
            <div class="flex-row width-50-p justify-content-end">
                <sec:authorize access="hasAnyRole('ROLE_STANDARD', 'ROLE_PREMIUM', 'ROLE_PREMIUM_PLUS', 'ROLE_ADMIN')">
                    <%--???????????? ?????????--%>
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
                            <%--?????? ????????????--%>
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

    <%--???????????? ???--%>
    <div id="newTransferGridCont" class="is-hidden">
        <div class="flex-row">
            <div class="flex-row width-50-p justify-content-start">
                <%--            <span id="tab2Help" class="icon has-text-warning cursor"><i class="fas fa-lg fa-info-circle"></i></span>--%>
            </div>
            <div class="flex-row width-50-p justify-content-end">
                <sec:authorize access="hasAnyRole('ROLE_STANDARD', 'ROLE_PREMIUM', 'ROLE_PREMIUM_PLUS', 'ROLE_ADMIN')">
                    <%--???????????? ?????????--%>
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
                            <%--?????? ????????????--%>
                        <span id="newTransferExcel" class="icon has-text-success cursor" onclick="main.downloadProfileGrid(2)"><i class="fas fa-lg fa-file-download"></i></span>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <table id="newTransferGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
    </div>

    <%--???????????? ???--%>
    <div id="soldOutGridCont" class="is-hidden">
        <div class="flex-row">
            <div class="flex-row width-50-p justify-content-start">
                <%--            <span id="tab3Help" class="icon has-text-warning cursor"><i class="fas fa-lg fa-info-circle"></i></span>--%>
            </div>
            <div class="flex-row width-50-p justify-content-end">
                <sec:authorize access="hasAnyRole('ROLE_STANDARD', 'ROLE_PREMIUM', 'ROLE_PREMIUM_PLUS', 'ROLE_ADMIN')">
                    <%--???????????? ?????????--%>
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
                            <%--?????? ????????????--%>
                        <span id="soldOutExcel" class="icon has-text-success cursor" onclick="main.downloadProfileGrid(3)"><i class="fas fa-lg fa-file-download"></i></span>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <table id="soldOutGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
    </div>

    <%--????????????--%>
    <div id="buyingCont" class="is-hidden">
        <div class="flex-row">
            <table id="buyingGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
        </div>
    </div>

    <%--????????????--%>
    <div id="sellingCont" class="is-hidden">
        <div class="flex-row">
            <table id="sellingGrid" class="mt-3 table is-bordered is-narrow is-hoverable is-fullwidth"></table>
        </div>
    </div>

    <%--?????? ???--%>
    <div id="barCont" class="is-hidden">
        <div class="flex-row">
            <div class="field">
                <div class="control has-icons-left">
                    <div class="select is-small">
                        <select id="selBarChartRank">
                            <option value="">??????</option>
                            <option value="10">?????? 10</option>
                            <option value="20">?????? 20</option>
                            <option value="30" selected>?????? 30</option>
                            <option value="40">?????? 40</option>
                            <option value="50">?????? 50</option>
                            <option value="60">?????? 60</option>
                            <option value="70">?????? 70</option>
                            <option value="80">?????? 80</option>
                            <option value="90">?????? 90</option>
                            <option value="100">?????? 100</option>
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
                            <option value="marketPrice" selected>???????????????</option>
                            <option value="viewWeight">??????(%)</option>
                            <option value="quantity">????????????</option>
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

    <%--????????????--%>
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
                    <span class="tag is-white">??? ???????????? ?????? ???????????? ???????????????.</span>
                </div>
            </div>
        </div>
        <div class="flex-row justify-content-center">
            <div id="profileTreeMapChart" class="is-fullwidth" style="width: 1400px; height: 800px;"></div>
        </div>
    </div>

    <%--???????????? ?????? ??????--%>
    <div id="newIdeaModal" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card width1300px">
            <header class="modal-card-head">
                <p class="modal-card-title">???????????? ??????</p>
                <button class="delete" aria-label="close" onclick="main.closeNewIdeaModal()"></button>
            </header>
            <section class="modal-card-body">
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="newIdeaTitle">??????</label>
                    </div>
                    <div class="column">
                        <div class="control">
                            <input id="newIdeaTitle" class="input is-info" type="text" maxlength="30" placeholder="?????? 30?????? ??????">
                        </div>
                    </div>
                </div>
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="newIdeaCont">????????????</label>
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
                    <span>??????</span>
                </button>
                <button onclick="main.closeNewIdeaModal()" class="button is-dark is-small">
                <span class="icon is-small">
                  <i class="fas fa-times"></i>
                </span>
                    <span>??????</span>
                </button>
            </footer>
        </div>
    </div>
</div>



<%--???????????? ????????????--%>
<div id="modIdeaModal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-card width1300px">
        <header class="modal-card-head">
            <p class="modal-card-title" id="modCardTitle">?????? ????????????</p>
            <button class="delete" aria-label="close" onclick="main.closeModIdeaModal()"></button>
        </header>
        <section class="modal-card-body">
            <form id="modIdeaForm">
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="modIdeaTitle">??????</label>
                    </div>
                    <div class="column">
                        <div class="control">
                            <input id="modIdeaTitle" class="input is-info" type="text" maxlength="30" placeholder="?????? 30?????? ??????" data-bind="true" data-id="ideaTitle">
                        </div>
                    </div>
                </div>
                <div class="columns">
                    <div class="column is-1 is-vertical-center">
                        <label class="label" for="modIdeaCont">????????????</label>
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
                <span>??????</span>
            </button>
            <button id="btnRmIdea" onclick="main.removeIdea()" class="button is-danger is-small">
                <span class="icon is-small">
                  <i class="fas fa-trash"></i>
                </span>
                <span>??????</span>
            </button>
            <button onclick="main.closeModIdeaModal()" class="button is-dark is-small">
                <span class="icon is-small">
                  <i class="fas fa-times"></i>
                </span>
                <span>??????</span>
            </button>
        </footer>
    </div>
</div>

<%--???????????? ??????--%>
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
                                    <option value="1">??????????????? ???????????????</option>
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

<%--????????? ?????? ?????? ??????--%>
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
                                    <option value="0" selected>????????????</option>
                                    <option value="1">???????????????</option>
                                    <c:if test="${profileVo.profileType eq '1'}">
                                        <option value="2">????????????</option>
                                    </c:if>
                                    <c:if test="${profileVo.profileType eq '2'}">
                                        <option value="2">????????????????????</option>
                                    </c:if>
                                    <option value="3">???????????????</option>
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
                            <p><span class="icon has-text-warning mr-2"><i class="fas fa-exclamation-triangle"></i></span><strong>?????????</strong>??? ????????? ?????? ????????? ?????????????????? <strong>?????????</strong>??? ????????????. ??? ?????? ????????? <strong>????????????</strong>??? ?????? ??? ?????????, <strong>????????????</strong>?????? ?????? ?????? ????????????.</p>
                        </div>
                    </article>
                </div>
        </section>
    </div>
</div>

<figure class="image is-128x128 is-hidden" id="miniProfileImg">
    <img src="https://bulma.io/images/placeholders/128x128.png">
</figure>




