<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script src="${pageContext.request.contextPath}/${jsDir}/login/signup.js" type="text/javascript"></script>

<nav class="level">
    <div class="level-item">
        <img style="width: 300px;" src="${pageContext.request.contextPath}/resources/images/logo/horizontal/logo.png">
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">아이디</label>
            <div class="control has-icons-left has-icons-right">
                <input id="ipLoginId" class="input" type="text" placeholder="아이디 입력" onblur="main.isExistedLoginId()" maxlength="50">
                <span class="icon is-small is-left">
                    <i class="fas fa-id-card"></i>
                </span>
                <span class="icon is-small is-right">
                    <i id="icoEmailCheck" class="fas fa-check is-hidden"></i>
                    <i id="icoEmailTriangle" class="fas fa-exclamation-triangle is-hidden"></i>
                </span>
            </div>
            <p id="helpEmail" class="help is-hidden"></p>
        </div>
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">비밀번호</label>
            <div class="control has-icons-left has-icons-right">
                <input id="ipPwd" class="input" type="password" placeholder="8 ~ 16자 영문, 숫자, 특수문자 조합" onblur="main.isPwdPattern(this)" maxlength="20">
                <span class="icon is-small is-left">
                     <i class="fas fa-lock"></i>
                </span>
                <span class="icon is-small is-right">
                    <i id="icoPwdCheck" class="fas fa-check is-hidden"></i>
                    <i id="icoPwdTriangle" class="fas fa-exclamation-triangle is-hidden"></i>
                </span>
            </div>
            <p id="helpPwd" class="help is-hidden">비밀번호 형식을 다시 확인해주세요(8 ~ 16자 영문, 숫자, 특수문자 조합).</p>
        </div>
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">비밀번호 확인</label>
            <div class="control has-icons-left has-icons-right">
                <input id="ipCfPwd" class="input" type="password" placeholder="비밀번호 확인" onblur="main.isSamePassword()" maxlength="20">
                <span class="icon is-small is-left">
                     <i class="fas fa-lock"></i>
                </span>
                <span class="icon is-small is-right">
                    <i id="icoCfPwdCheck" class="fas fa-check is-hidden"></i>
                    <i id="icoCfPwdTriangle" class="fas fa-exclamation-triangle is-hidden"></i>
                </span>
            </div>
            <p id="helpCfPwd" class="help is-hidden">비밀번호가 일치하지 않습니다.</p>
        </div>
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">이름</label>
            <div class="control has-icons-left has-icons-right">
                <input id="ipUserName" class="input" type="text" placeholder="사용자 이름" maxlength="50">
                <span class="icon is-small is-left">
                    <i class="fas fa-user"></i>
                </span>
            </div>
        </div>
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">핸드폰 번호</label>
            <div class="control has-icons-left has-icons-right">
                <input id="ipUserPhone" class="input" type="text" placeholder="'-' 없이 입력" onblur="main.isUserPhonePattern()" maxlength="11">
                <span class="icon is-small is-left">
                     <i class="fas fa-mobile-alt"></i>
                </span>
                <span class="icon is-small is-right">
                    <i id="icoUserPhoneCheck" class="fas fa-check is-hidden"></i>
                    <i id="icoUserPhoneTriangle" class="fas fa-exclamation-triangle is-hidden"></i>
                </span>
            </div>
            <p id="helpUserPhone" class="help is-hidden">핸드폰 번호 형식을 다시 확인해주세요.</p>
        </div>
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">비밀번호 힌트 질문</label>
            <div class="control has-icons-left ">
                <div class="select">
                    <select id="selHintCode">
                    </select>
                </div>
                <div class="icon is-small is-left">
                    <i class="fas fa-question-circle"></i>
                </div>
            </div>
        </div>
    </div>
</nav>
<nav class="level">
    <div class="level-item has-text-left">
        <div class="field loginField">
            <label class="label">비밀번호 힌트 답변</label>
            <div class="control has-icons-left has-icons-right">
                <input id="ipHintAnswer" class="input" type="text" placeholder="비밀번호 힌트 질문 답변" maxlength="150">
                <span class="icon is-small is-left">
                    <i class="fas fa-pencil-alt"></i>
                </span>
            </div>
        </div>
    </div>
</nav>
<nav class="level mt-6">
    <div class="level-item has-text-centered">
        <div class="field loginField is-grouped is-grouped-centered">
            <div class="buttons">
                <button class="button is-warning" onclick="main.showAgreeModal()">
                    <span class="icon"><i class="fas fa-check"></i></span>
                    <span>이용약관 확인</span>
                </button>
                <button disabled id="btnSubmit" class="button is-primary" onclick="main.signup()">
                    <span class="icon"><i class="fas fa-user-plus"></i></span>
                    <span>회원가입</span>
                </button>
            </div>
        </div>
    </div>
</nav>


<%--완료 모달--%>
<div id="sucModal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">회원가입 완료</p>
            <button class="delete" aria-label="close" onclick="main.closeModal('sucModal')"></button>
        </header>
        <section class="modal-card-body">
            <h2>회원가입 감사합니다.</h2>
            <p><strong>BEESTOCK</strong>에서 다양한 정보를 확인하십시오.</p>
        </section>
        <footer class="modal-card-foot justify-content-center">
            <div class="buttons">
                <a class="button is-warning is-small" href="${pageContext.request.contextPath}/login/login-home.do">
                    <span class="icon"><i class="fas fa-sign-in-alt"></i></span>
                    <strong>로그인 창으로 이동</strong>
                </a>
            </div>
        </footer>
    </div>
</div>

<%--이메일 중복--%>
<div id="dangerModal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Email 중복</p>
            <button class="delete" aria-label="close" onclick="main.closeModal('dangerModal', 'ipEmail')"></button>
        </header>
        <section class="modal-card-body">
            <h2>현재 사용중인 이메일 입니다. 다른 이메일을 입력해주세요.</h2>
        </section>
    </div>
</div>


<%--동의 모달--%>
<div class="modal" id="agreeModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">약관동의</p>
        </header>
        <section class="modal-card-body" style="height: 880px;">
            <div class="content">
                <span><strong>서비스 이용약관 </strong>(필수)</span>
                <div class="overflowY-auto pl-2 pr-2 pt-2" style="height: 160px; border: 1px solid grey;">
                    <span class="has-text-link">제1조 (목적)</span><br/>
                    이 약관은 ㈜허니비소프트(이하 ’회사’)이 제공하는 서비스(이하 ‘서비스’)를 이용함에 있어 서비스 이용자(이하 ’회원’)와 회사 간의 권리, 의무 및 기타 제반 사항을 정함을 목적으로 합니다.<br/>
                    <br/>
                    <span class="has-text-link">제2조 (용어의 정의)</span><br/>
                    ① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br/>
                    <ol>
                        <li>“서비스”라 함은 회사가 개발하여 인터넷을 통하여 서비스하고 있는 서비스 및 기타 서비스 일체를 의미합니다.</li>
                        <li>“회원”이라 함은 회사가 운영하는 사이트에 접속하여 이 약관에 동의하고 회원 가입을 한 자로서, 회사와 서비스 이용 계약을 체결하고 서비스 이용 아이디와 비밀번호를 부여 받아 서비스를 이용하는 고객을 말합니다.</li>
                        <li>“회원ID”라 함은 회원의 식별과 서비스 이용을 위하여 회원이 선정하고 회사가 사용을 승인하여 부여한 문자 또는 숫자의 조합을 말합니다.</li>
                        <li>“비밀번호”라 함은 회원이 부여 받은 회원ID와 일치된 회원임을 확인하고, 회원의 개인정보를 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.</li>
                        <li>“이용고객”이라 함은 회사가 제공하는 서비스를 이용하는 자(회원, 비회원 포함)를 의미합니다.</li>
                        <li>“이용계약”이라 함은 회사가 제공하는 서비스를 이용하기 위하여 회사 홈페이지에서 회원가입을 통해 회사와 이용고객 간에 체결하는 계약을 말합니다.</li>
                        <li>“이용해지”라 함은 회사 또는 회원이 이용계약을 해지하는 것을 말합니다.</li>
                        <li>“운영자”라 함은 회사가 제공하는 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 자를 말합니다.</li>
                        <li>“별명”이라 함은 회원ID 이외에 서비스를 이용하기 위해 별도로 설정 가능한 닉네임을 말합니다.</li>
                        <li>“본인인증”이라 함은 부정한 개인정보의 사용이나 이용고객의 개인정보를 보호하기 위하여 회원가입 시 휴대폰, 공인인증서, 신용카드 등을 통하여 본인을 확인하는 것을 말합니다.</li>
                        <li>“게시물”이라 함은 회사의 서비스 내에 회원이 등록한 글, 사진, 동영상, 그림을 비롯한 각종 파일과 링크, 댓글 등의 정보를 말합니다.</li>
                        <li>"포인트"라 함은 사이버 자산의 일종으로 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 서비스 상의 가상 데이터를 말합니다.</li>
                        <li>"적립금"이라 함은 사이버 자산의 일종으로 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 원화 단위의 가상의 데이터를 말합니다. 적립금은 서비스를 구매하기 위한 금액의 일부로 사용될 수 있으나 환금 가능한 재산적 가치를 갖지는 않습니다.</li>
                    </ol>
                    ② 이 약관에서 사용하는 용어의 정의에 대하여 본 조 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스별 정책에서 정하는 바에 의하며, 관계법령과 서비스별 정책에서 정하지 아니한 것은 일반적인 상관례에 의합니다.<br/>
                    <br/>
                    <span class="has-text-link">제3조 (이용약관의 효력 및 변경)</span><br/>
                    ① 본 약관은 회사에서 운영하는 홈페이지(http://rank.newsystock.com 이하 ‘홈페이지’)를 통하여 공지함으로써 효력이 발생합니다.
                    ② 회원 가입 시 본 약관에 동의한 회원은 동의한 때로부터 본 약관의 적용을 받게 되며, 약관이 개정된 경우에는 개정된 약관의 효력이 발생하는 시점부터 개정된 약관의 적용을 받습니다.<br/>
                    ③ 회사는 「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령에 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/>
                    ④ 회사가 본 약관을 개정하는 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 서비스의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지하며, 이용자에게 불리한 내용 또는 중요한 내용의 개정의 경 우에는 30일 이상 전부터 사전 공지하거나 전자우편으로 통지합니다.<br/>
                    ⑤ 회원은 개정되는 약관의 전체 또는 일부 내용에 동의하지 않을 권리가 있습니다. 본 약관의 변경에 대하여 이의가 있는 회원은 회원탈퇴를 통해 이용계약을 해지할 수 있습니다. 다만, 이용계약이 해지되면 로그인 후 제공되는 서비스를 이용할 수 없게 됩니다.<br/>
                    ⑥ 회원이 개정된 약관의 효력 발생일 이전에 회원 탈퇴를 하지 않거나 서비스를 계속 이용함으로써 개정된 약관에 동의한 것으로 간주합니다.<br/>
                    <br/>
                    <span class="has-text-link">제4조 (약관 외 준칙)</span><br/>
                    본 약관에서 명시되지 않은 사항에 대해서는 회사가 제공하는 서비스 약관의 취지, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 청소년 보호법 기타 대한민국의 관련 법령 규정에 따릅니다. 유료 서비스 이용자의 경우에는 유료화 정책 등 기타 회사에서 정하는 정책에 의거해 권리 및 의무를 보장 또는 제한 받을 수 있습니다.<br/>
                    <br/>
                    <span class="has-text-link">제5조 (서비스 이용계약의 성립)</span><br/>
                    ① 서비스를 이용하고자 하는 고객이 회원가입 절차에 약관에 대해 동의하고, 회사가 제시하는 절차에 따라 이용신청을 하고, 회사가 신청한 내용을 승인하여 회원 가입절차가 완료 됨으로써 회사와 이용고객 사이의 이용계약이 성립됩니다.<br/>
                    ② 회원가입 시 본 이용약관에 대한 동의는 본 약관에 대해 동의함 박스에 체크하거나 버튼을 클릭함으로써 동의의 의사표시가 완료됩니다.<br/>
                    ③ 이용계약이 성립되면 회사는 회원에게 본 약관규정에 따라 회원ID를 부여합니다.<br/>
                    <br/>
                    <span class="has-text-link">제6조 (서비스 이용신청)</span><br/>
                    ① 본 서비스를 이용하고자 하는 이용고객은 회원으로 가입한 후 회사에서 요청하는 개인정보를 제공해야 합니다. 회원의 개인정보는 개인정보 보호정책에 따라 관리 보호됩니다.<br/>
                    ② 회사는 본인 확인을 위해 필요 시 본인인증을 요구할 수 있습니다. 이 경우 회사는 수집된 정보를 미리 고지한 용도 이외에는 사용하지 않습니다.<br/>
                    ③ 이용신청 시에는 반드시 이용고객의 실명 및 최신의 정보를 기입하여야 하며 변경사항 발생 시 정보를 변경하여야 합니다. 이를 준수하지 않은 회원은 일체의 권리를 주장하거나 법적인 보호를 받을 수 없습니다.<br/>
                    ④ 타인의 명의를 도용하여 이용신청을 한 회원의 모든 ID는 삭제됨과 동시에 관련 법령에 의해 처벌 받을 수 있습니다.<br/>
                    <br/>
                    <span class="has-text-link">제7조 (이용신청의 승인과 제한)</span><br/>
                    ① 회사는 이용고객이 적법한 절차에 정확한 정보를 이용하여 이용신청을 하고 회사가 업무와 기술상에 문제가 없을 경우 이용신청을 승낙함을 원칙으로 합니다. 단, 회사는 다음의 각 호에 해당하는 이용신청에 대해서는 승낙하지 않거나, 추후 확인을 통해 승낙을 취소 또는 계약을 해지할 수 있습니다.<br/>
                    <ol>
                        <li>실명이 아니거나 타인의 명의를 사용하여 신청할 경우</li>
                        <li>이용신청서의 내용을 허위로 기재하여 신청하거나 회사가 제시하는 양식에 필요한 정보를 기재하지 않은 경우</li>
                        <li>사회질서와 미풍양속을 저해하거나, 저해할 목적으로 신청한 경우</li>
                        <li>회사에 피해를 입히거나 부정한 영리 목적 등 기타 부정한 목적으로 서비스를 이용하고자 하는 경우</li>
                        <li>영리를 추구할 목적으로 서비스를 이용하고자 하는 경우</li>
                        <li>본 약관에 규정한 사항을 위반하여 신청하거나 기타 회사가 정한 이용신청 요건이 미비 된 경우</li>
                        <li>기타 회원으로서 부적절한 행위를 할 우려가 있다고 인정되는 경우</li>
                    </ol>
                    ② 회사는 다음의 각 호에 해당하는 경우 이용신청에 대해서 승인을 제한할 수 있고 그 사유가 해소될 때까지 승인을 유보할 수 있습니다.<br/>
                    <ol>
                        <li>서비스 설비 부족으로 단기간 내에 설비의 증설이 불가능하다고 회사가 판단할 경우</li>
                        <li>서비스 상에 장애가 발생한 경우</li>
                        <li>기타 부득이한 이유로 이용 승인이 곤란한 경우</li>
                        <li>최근 7일 이내에 해지 기록이 있는 회원이 재가입 신청을 하려는 경우</li>
                    </ol>
                    <br/>
                    <span class="has-text-link">제8조 (회원정보의 변경 및 회원ID 관리)</span><br/>
                    ① 회사는 서비스 내의 내 정보보기 또는 해당 페이지로 링크된 메뉴를 통하여 자신의 개인정보를 관리할 수 있는 페이지를 열람할 수 있으며, 해당 페이지에서 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위하여 반드시 필요한 실명, 생년월일, 성별 등은 수정할 수 없습니다. 또한 회사가 요청하는 경우, 이용자는 본인인증을 하거나 회사가 요구하는 본인 확인 서류를 제출하여야 합니다.<br/>
                    ② 회원ID는 원칙적으로 변경이 불가능하며 불가피한 사유로 이를 변경하고자 하는 경우에는 해당 ID를 해지하고 다시 가입 절차를 밟아 새로운 ID로 가입하셔야 합니다.<br/>
                    ③ 회원은 서비스 이용을 위해 자신의 정보를 성실히 관리해야 하며 변동사항이 있을 경우 이를 변경하여야 합니다. 회원의 정보변경이 지연되거나 누락되어 발생하는 손해에 대하여 회사는 책임지지 않습니다.<br/>
                    ④ 회원ID와 비밀번호에 관한 모든 관리 책임은 회원에게 있습니다.<br/>
                    ⑤ 회사는 회원ID에 의하여 제반 이용자 관리 업무를 수행하므로 회원이 회원 ID를 변경하고자 하는 경우 회사가 인정할 만한 사유가 있어야만 회원ID를 변경 할 수 있습니다.<br/>
                    ⑥ 이용 고객이 등록한 회원ID 및 비밀번호에 의하여 발생되는 사용상의 과실 또는 제 3자에 의한 부정사용 등에 대한 모든 책임은 해당 이용 고객에게 있습니다.<br/>
                    <br/>
                    <span class="has-text-link">제9조 (개인정보 보호정책)</span><br/>
                    ① 회사는 관계법령이 정하는 바에 따라 회원의 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다. 회원의 개인정보보호 및 사용에 대해서는 관계법령 및 회사가 정하는 개인정보보호 정책에 따릅니다. 단, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보보호 정책이 적용되지 않습니다.<br/>
                    ② 회사는 회원의 귀책사유로 인해 노출된 정보에 대해서는 일체의 책임을 지지 않습니다.<br/>
                    ③ 회사는 본인 확인을 위해 필요 시 회원 또는 회원가입 신청자에게 그 사유를 고지하고 회원의 신분증 또는 이에 갈음하는 증서를 요구할 수 있습니다. 이 경우 회사는 이를 미리 고지한 용도 이외에는 사용하지 않습니다<br/>
                    <br/>
                    <span class="has-text-link">제10조 (회사의 의무)</span><br/>
                    ① 회사는 본 약관이 정하는 바에 따라 최선을 다하여 회원에게 지속적, 안정적으로 서비스를 제공해야 합니다.<br/>
                    ② 회사는 안정적인 서비스를 위하여 회사의 귀책사유 없이 설비에 장애가 발생하거나 멸실된 경우에도 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구합니다.<br/>
                    ③ 회사는 회원이 안전하게 서비스를 이용할 수 있도록 회원의 개인정보보호를 위한 보안 시스템을 구축하여, 개인정보보호 정책을 준수합니다.<br/>
                    ④ 회사는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 이용자에게 그 사유와 처리 일정을 통보하여야 합니다.<br/>
                    ⑤ 회사는 이용계약의 체결, 계약사항의 변경 및 해지 등 회원과의 계약관계 절차 및 내용 등에 있어 회원에게 편의를 제공하도록 노력합니다.<br/>
                    <br/>
                    <span class="has-text-link">제11조 (회원의 의무)</span><br/>
                    ① 회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 회사가 공지하는 사항을 준수하여야 합니다. 또한 회원은 회사의 업무에 방해가 되는 행위, 회사의 명예를 손상 시키는 행위를 해서는 안됩니다.<br/>
                    ② 회원의 주소, 연락처, 전자우편 주소 등 이용계약 사항이 변경된 경우에 홈페이지 상에서 이를 수정해야 합니다. 수정을 하지 않거나 수정 지연으로 발생되는 책임은 회원에게 있습니다.<br/>
                    ③ 회원이 ID, 별명, 기타 서비스 내에서 사용되는 명칭 등의 선정 시에는 다음 각 호에 해당하는 내용을 사용하여서는 안됩니다.<br/>
                    <ol>
                        <li>회사가 제공하는 서비스의 공식 운영자(GM)를 사칭하거나 유사한 명칭을 사용하여 다른 이용자에게 혼란을 초래하는 행위</li>
                        <li>선정적이고 음란하거나 폭력적인 내용이 포함되어 있는 명칭의 사용</li>
                        <li>기타 제 3자의 상표권, 저작권에 위배될 가능성이 있는 명칭의 사용</li>
                        <li>비어, 속어라고 판단되거나 반사회적이고 관계 법령에 저촉되는 내용이 포함된 명칭의 사용</li>
                    </ol>
                    ④ 회원은 회사의 명시적 동의가 없는 한 서비스 이용 권한, 기타 이용 계약상의 지위를 타인에게 매도, 증여할 수 없으며 서비스 상의 무형자산을 담보로 제공할 수 없습니다.<br/>
                    ⑤ 회원은 회사에서 제공하는 서비스를 본래의 이용목적 이외의 용도로 사용해서는 안됩니다. 회원은 아래 각 호의 행위를 하여서는 안되며, 이에 해당되는 행위를 할 경우에는 본 약관 및 공지하는 운영정책에 따라 회원의 서비스 이용을 제한하거나 ID의 삭제, 수사기관의 고발 조치 등 적법한 조치를 포함한 제재를 가할 수 있습니다.<br/>
                    <ol>
                        <li>회원 가입 또는 정보 변경 시 개인 정보를 허위로 기재하는 행위</li>
                        <li>타인의 개인정보를 도용하거나 부정하게 사용하는 행위</li>
                        <li>회원ID, 별명, 사이버 자산, 관심종목 등을 타인과 매매하거나 매매를 유도하는 행위</li>
                        <li>회사의 운영진 또는 직원을 사칭하는 행위</li>
                        <li>회사로부터 특별한 권리를 받지 않고 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹 하거나 웹 사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하거나, 회사의 서비스를 비정상적인 방법으로 사용하는 행위</li>
                        <li>회사의 프로그램 상의 버그를 악용하는 행위</li>
                        <li>회사의 사전 승낙 없이 서비스 내 또는 웹 사이트를 이용하여 판촉활동을 하는 행위</li>
                        <li>다른 회원을 희롱 또는 위협하거나 아이템을 편취하는 등 다른 회원에게 고통, 피해 또는 불편을 주는 행위</li>
                        <li>다른 회원의 개인정보를 수집 또는 저장하는 행위</li>
                        <li>본 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위</li>
                        <li>타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</li>
                        <li>청소년보호법 또는 형법에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</li>
                        <li>심히 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</li>
                        <li>회사가 제공하는 서비스 프로그램의 이용방식, 기획의도를 변경하거나 서비스에 비정상적으로 위해를 가하거나 고의로 방해하는 일체의 행위</li>
                        <li>본 약관을 포함하여 기타 회사가 정하는 제반 규정 또는 이용 조건을 위반하는 행위 및 기타 관계 법령에 위배되는 행위</li>
                    </ol>
                    <br/>
                    <span class="has-text-link">제12조 (서비스 제공)</span><br/>
                    ① 회사는 다음과 같은 서비스를 제공합니다.<br/>
                    <ol>
                        <li>국내외 상장기업 및 주식시장정보 분석을 통한 주식 투자정보 제공 서비스</li>
                        <li>모델포트폴리오를 통한 주식 종목 추천 서비스</li>
                        <li>주식 데이터 기반의 전략생성 및 자동매매 서비스</li>
                        <li>국내외 ETF 기반의 자산배분 서비스</li>
                        <li>회원간 전략공유 및 커뮤니티 서비스</li>
                        <li>기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스</li>
                    </ol>
                    ② 회사는 이용고객의 이용신청을 승인할 때부터 서스를 제공합니다. 단, 일부 서비스의 경우 회사의 필요에 따라 지정된 일자부터 서비스를 개시할 수 있습니다.<br/>
                    ③ 회사는 본 서비스를 이용하는 회원에 대하여 등급을 구분하여 이용시간, 이용회수, 제공 서비스의 범위 등을 세분화하여 이용에 차등을 둘 수 있습니다.<br/>
                    ④ 회사가 제공하는 서비스에는 무료 서비스와 유료 서비스가 있습니다. 유료로 제공되는 서비스를 이용하고자 하는 회원은 각 서비스에서 제공되는 요금제를 선택하여 이용할 수 있습니다.<br/>
                    ⑤ 유료 서비스의 이용과 결제에 관한 사항은 다음 각 호에 따릅니다.<br/>
                    <ol>
                        <li>서비스의 이용은 회원가입 후 14일 간 무료입니다. 회원가입 후 14일 경과 시 일부 무료 서비스는 사용이 중단되며 유로 서비스로 전환해야 계속 이용가능 합니다.</li>
                        <li>회사가 지급하는 무료 쿠폰의 경우에는 서비스 제공 기간을 보증하지 않습니다.</li>
                        <li>
                            회원은 회사가 제공하는 다음 각호 또는 이와 유사한 절차에 의하여 유료 서비스 이용을 신청을 합니다. 회사는 계약 체결 전, 다음 각호의 사항에 관하여 회원이 정확하게 이해하고 실수 또는 착오 없이 거래할 수 있도록 정보를 제공합니다.<br/>
                            가. 신청 서비스 명칭<br/>
                            나. 서비스 이용 기간<br/>
                            다. 주문상품 및 결제금액 확인(환불규정 안내)<br/>
                            라. 결제
                        </li>
                        <li>회원의 서비스에 대한 사용 유효기간은 서비스 구매 기간 경과 후에는 사용권한을 상실합니다. 단, 서비스 이용 중 저장한 포트폴리오, 관심종목 등의 정보는 서비스 규정에 따라 일정기간 삭제되지 않습니다.<br/></li>
                    </ol>
                    <br/>
                    <span class="has-text-link">제13조 (테스트 목적의 서비스)</span><br/>
                    ① 회사는 회원들을 대상으로 새로운 서비스를 정식으로 사용화하기 전, 일정 기간 테스트 목적의 서비스를 제공할 수 있습니다. 테스트 대상과 기간 및 이에 관련된 내용은 서비스 공지 사항을 통해 별도로 공지합니다.<br/>
                    ② 테스트 목적 서비스의 경우는 서비스 안정성 등을 위해 서비스 데이터의 변경, 추가, 삭제 등이 실시될 수 있으며, 테스트 기간 동안 회원이 저장한 정보 등 해당 테스트 목적 서비스와 관련된 모든 데이터는 초기화될 수 있습니다.<br/>
                    ③ 회사는 테스트 목적의 서비스 시 오류의 발견과 서비스의 안정화를 위해 이용자들이 사용하는 PC의 사양 정보를 수집 할 수 있습니다. 그러나, 이 경우에도 개인을 식별할 수 있는 정보와 함께 관련 정보를 수집하지는 않습니다.<br/>
                    <br/>
                    <span class="has-text-link">제14조 (서비스의 변경)</span><br/>
                    ① 회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.<br/>
                    ② 서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.<br/>
                    ③ 회사는 무료로 제공하는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관계법령에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.<br/>
                    <br/>
                    <span class="has-text-link">제15조 (정보의 제공)</span><br/>
                    ① 회사는 회원에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 서비스 화면이나 전자우편, 문자메시지 또는 서신우편 등의 방법으로 회원에게 제공할 수 있습니다.<br/>
                    ② 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 추가적인 개인정보를 요구 할 수 있습니다.<br/>
                    <br/>
                    <span class="has-text-link">제16조 (서비스 이용 시간)</span><br/>
                    ① 회사는 서비스를 업무상 또는 기술상 특별한 지장이 없는 한 연중 무휴, 1일 24시간 제공하는 것으로 원칙으로 합니다. 단, 시스템 정기점검, 서버의 증설 및 교체 등의 운영상 필요하다고 판단되는 경우에는 일정기간 동안 서비스를 일시 중지할 수 있으며 이 경우 회사는 사전에 이를 홈페이지에 공지합니다.<br/>
                    ② 본 조 1항에도 불구하고 회사는 긴급하고 부득이한 사유로 인해 예고 없이 일시적으로 서비스를 제한하거나 중단 할 수 있으며, 이 경우 회사는 사후에 이를 공지할 수 있습니다. 이 경우 서비스 교체 등 중단 사유가 필요하다고 할 경우에는 사전에 홈페이지를 통해 공지한 후 제공되던 서비스를 일정시간 동안 중단할 수 있습니다.<br/>
                    ③ 회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만, 이 경우 그 사유 및 기간 등을 회원에게 사전 또는 사후 공지합니다.<br/>
                    ④ 회사는 서비스를 특정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이 경우 그 내용을 공지합니다.<br/>
                    ⑤ 회사는 서비스의 안정적인 제공을 위하여 필요할 경우 정기점검을 실시할 수 있으며, 정기점검의 일정과 시간은 홈페이지에 공지합니다.<br/>
                    <br/>
                    <span class="has-text-link">제17조 (게시물의 관리)</span><br/>
                    ① 회사는 회원의 게시물을 소중하게 생각하며 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다. 다만, 각 호에 해당하는 경우 사전통지 없이 해당 게시물을 삭제할 수 있고, 해당 회원의 자격을 제한, 정지 또는 상실 시킬 수 있습니다.<br/>
                    <ol>
                        <li>다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우</li>
                        <li>공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우</li>
                        <li>불법복제 또는 해킹을 조장하는 내용인 경우</li>
                        <li>영리를 목적으로 하는 광고일 경우</li>
                        <li>범죄와 결부된다고 객관적으로 인정되는 내용일 경우</li>
                        <li>다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
                        <li>회사에서 규정한 게시물 우너칙에 어긋나거나 게시판 성격에 부합하지 않는 경우</li>
                        <li>기타 관계 법령에 위배된다고 판단되는 경우</li>
                    </ol>
                    <br/>
                    <span class="has-text-link">제18조 (게시물에 대한 저작권)</span><br/>
                    ① 회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 다만, 회원은 자신이 창작, 게시한 게시물에 대하여 회사가 서비스를 운영, 전시, 전송, 배포 또는 홍보하기 위한 목적으로 비독점적 사용권을 회사에게 부여합니다. 사용권은 다음과 같고, 사용권 부여는 회사가 서비스를 운영하는 동안 유효하며, 회원의 탈퇴 후에도 유효합니다.<br/>
                    <ol>
                        <li>서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포, 출판 및 2차 저작물과 편집 저작물 작성</li>
                        <li>회사에서 제공하는 관련 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 배포, 출판 및 2차 저작물과 편집 저작물 작성</li>
                        <li>미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 사용하게 하는 것. 단, 이 경우 회사는 회원의 별명 외에 회원의 별도 동의 없이 개인정보를 제공하지 않습니다.</li>
                    </ol>
                    ② 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br/>
                    ③ 회사는 회원이 게시하거나 등록하는 서비스 내의 내용물, 게시 내용에 대해 제 17조 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제할 수 있습니다.<br/>
                    <br/>
                    <span class="has-text-link">제19조 (광고 게재 및 광고주와의 거래)</span><br/>
                    ① 회사가 이용고객에게 서비스를 제공할 수 있는 서비스 투자 기반의 일부는 광고 게재를 통한 수익으로부터 나올 수 있습니다. 서비스를 이용하고자 하는 이용고객은 서비스 이용 시 노출되는 광고 게재에 대해 동의하는 것으로 간주됩니다.<br/>
                    ② 회사는 본 서비스에 게재되어 있거나 본 서비스를 통한 광고주의 판촉 활동에 이용고객이 참여하거나 교신 또는 거래함으로써 그 결과 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.<br/>
                    <br/>
                    <span class="has-text-link">제20조 (사이버 자산에 대한 권리)</span><br/>
                    ① 사이버 자산(포인트, 적립금 등)은 서비스 이용을 위한 무형의 도구로써 화폐나 현실의 재산이 아닙니다. 회사는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 사이버 자산의 제공 및 사용 기준의 일부 또는 전부를 조정할 수 있으며, 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.<br/>
                    ② 사이버 자산에 대한 소유권은 회사에게 있으며, 사이버 자산의 온라인상 사용권은 해당 사이버 자산을 회사가 정한 방식으로 획득한 회원에게 있습니다.<br/>
                    ③ 회원은 회사가 제공하는 사이버 자산을 일정 기간 동안 회사가 운영하는 웹사이트에서 사용할 권한을 가지며, 이를 회사가 정한 목적과 방법 이외의 방법으로 매매, 양도, 증여할 수 없습니다.<br/>
                    ④ 회사는 서비스 운영상 무료로 제공되는 포인트, 적립금, 서비스 이용권 등 사이버 자산의 전부 또는 일부를 회사가 운영하는 서비스의 정책에 따라 수시로 변경 또는 조절할 수 있습니다. 단, 회원에게 현저히 불리한 변경의 경우에는 변경 이전 혹은 이후에 회원에게 고지합니다.<br/>
                    ⑤ 회사는 회원의 부정한 이용을 방지하기 위하여 타인으로부터 양도받은 서비스 이용권 등 사이버 자산 또는 무료로 제공받은 사이버 자산을 다시 회사의 다른 가상의 자산이나 실물 화폐로 환불하지 않습니다.<br/>
                    ⑥ 회원이 회사로부터 유료로 획득하는 사이버 자산의 이용에 관한 사항은 “유료화 정책”에 정하는 바에 따릅니다.<br/>
                    <br/>
                    <span class="has-text-link">제21조 (서비스 이용 제한 및 계약 해지)</span><br/>
                    ① 회원이 이용 계약을 해지하고자 할 때에는 언제든지 홈페이지 상의 회원탈퇴 신청을 통해 이용계약을 해지하거나 이용중지를 요청할 수 있습니다.<br/>
                    ② 회사는 회원이 서비스 이용 내용에 있어서 본 약관 제 12조 내용을 위반하거나 다음 각 호에 해당하는 경우 회사는 이용제한 규정에 따라 이용제한 및 이용 계약을 해지할 수 있습니다.<br/>
                    <ol>
                        <li>정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우</li>
                        <li>기타 관계 법령에 위배되는 행위를 한 경우 및 회사가 정한 이용제한 규정에 해당하는 경우</li>
                    </ol>
                    ③ 회원은 기본 서비스 홈페이지에서 서비스 운영정책 및 이용자 의무사항, 위반 시 제재 조치에 대하여 확인하실 수 있습니다. 회사 홈페이지를 통하여 해당 회원에게 사유를 확인 할 수 있도록 하며, 해당 회원은 고객센터의 절차에 따라 이의 신청을 할 수 있습니다.<br/>
                    ④ 미성년인 이용자의 법정대리인으로부터 요청이 있을 경우, 회사는 회원의 서비스 이용에 제한을 가할 수 있습니다.<br/>
                    ⑤ 회원탈퇴 후 재가입은 회원탈퇴 7일 후에 가능하나, 이용약관 및 정책에 의거하여 이용제한을 받은 회원의 경우 회사가 임의로 재가입을 거부할 수 있습니다.<br/>
                    <br/>
                    <span class="has-text-link">제22조 (환불규정)</span><br/>
                    ① 유료로 결제한 서비스에 대해 환불을 요청한 경우, 회사는 아래의 환급기준에 따라 이용 대급을 환급합니다.<br/>
                    <ol>
                        <li>이용 결제 후 7일 이내에는 유료 서비스에 대한 이용계약의 청약을 철회 할 경우 이용대금 전액을 환급합니다.</li>
                        <li>유료 서비스 이용 계약일로부터 7일이 경과한 이후에는 “총 계약금액”에서 이용일 수만큼 금액과 위약금을 공제하고 환급합니다.</li>
                    </ol>
                    ② 환급을 위한 금액은 아래와 같이 산정합니다.<br/>
                    <ol>
                        <li>
                            환급 금액 = 총 계약 금액 – (1일 이용대금 × 결제 일로부터의 경과한 일 수) – 위약금<br/>
                            * 총 계약 금액 : 서비스 결제 시 기간 할인 및 프로모션 쿠폰이 적용 되지 않은 실제 계약 된 금액<br/>
                            * 1일 이용대금 = 총 계약 금액 ÷ 총 서비스 이용 일 수<br/>
                            * 위약금 = 총 계약 금액 × 10%
                        </li>
                    </ol>
                    ③ 환급방법은 아래 두 가지 중에서 진행 되며 진행은 사전에 회원과 논의 된 방식으로 진행 됩니다.<br/>
                    <ol>
                        <li>회원이 대금을 결제한 동일한 수단으로 환급합니다.</li>
                        <li>동일한 수단으로 환급이 불가능 할 경우에는 다른 환급수단을 회원과 논의 후 진행 합니다.</li>
                    </ol>
                    <br/>
                    <span class="has-text-link">제23조 (손해 배상)</span><br/>
                    ① 회사는 회원의 서비스 이용과 관련하여서는 회사의 고의 또는 과실에 의해 발생한 회원의 손해에 대하여 배상할 책임이 있습니다. 그러나, 회사가 제공하는 무료 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다.<br/>
                    ② 회사는 공정거래위원회의 “소비자분쟁해결기준”에 따라 유료서비스의 중지•장애로 인한 회원의 피해를 보상합니다.<br/>
                    ③ 회사가 개별 서비스 제공자와 제휴 협정을 맺고 개별서비스를 제공함에 있어 회원이 개별 서비스 이용약관에 동의를 한 뒤 개별서비스 제공자의 귀책 사유로 인해 손해가 발생할 경우 관련 손해에 대해서는 개별 서비스 제공자가 책임을 집니다.<br/>
                    <br/>
                    <span class="has-text-link">제24조 (면책 조항)</span><br/>
                    ① 회사는 전시, 사변, 천재지변, 국가비상사태, 해결이 곤란한 기술적 결함 기타 불가항력 사유로 서비스를 제공할 수 없는 경우에는 책임이 면제됩니다.<br/>
                    ② 회사는 회원의 귀책사유로 인한 서비스의 중지/이용장애에 대하여 책임을 지지 않습니다.<br/>
                    ③ 회사는 기간 통신 사업자가 전기통신서비스를 중지하거나 정상적으로 제공하지 아니하여 회원에게 손해가 발생한 경우에는 책임이 면제됩니다.<br/>
                    ④ 회사는 사전에 공지된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 서비스가 중지되거나 장애가 발생한 경우에 대해서는 책임이 면제됩니다.<br/>
                    ⑤ 회원은 당사 제공 서비스 관련하여 자신이 회사에 등록한 항목(전자우편주소, 이동전화번호 등) 및 비밀번호 보안에 대한 책임을 지며 회사는 회사의 고의 또는 과실 없이 ID, 비밀번호 등의 회원정보가 유출되어 발생하는 손해에 대해 책임을 지지 않습니다.<br/>
                    ⑥ 회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못한 것에 대하여 책임을 지지 않으며, 서비스에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br/>
                    ⑦ 회사는 회원의 컴퓨터 환경으로 인하여 발생하는 제반 문제 또는 회사의 귀책사유가 없는 네트워크 환경으로 인하여 발생하는 문제에 대해서는 책임을 지지 않습니다.<br/>
                    ⑧ 회사는 회원이 서비스 내 또는 웹 사이트에 게시 또는 전송한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대해서는 책임을 지지 않습니다.<br/>
                    ⑨ 회사는 회원 상호간 또는 회원과 제 3자간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.<br/>
                    ⑩ 회사가 제공하는 클라이언트 자동매매의 경우 서비스가 제공되기 위해서는 거래 증권사 HTS가 반드시 정상적으로 실행 중이어야 합니다. 회사는 회원의 거래 증권사 HTS의 불완전한 실행으로 인하여 발생하는 손해에 대해서는 책임을 지지 않습니다.<br/>
                    <br/>
                    <span class="has-text-link">제25조 (재판권 및 준거법)</span><br/>
                    ① 이 약관에 명시되지 않은 사항이 관계 법령에 규정되어 있을 경우에는 해당 규정에 따릅니다.<br/>
                    ② 회사의 기타 유료 서비스 이용 회원의 경우 회사가 별도로 정한 약관 및 정책에 따릅니다.<br/>
                    ③ 서비스 이용과 관련하여 회사와 이용자간에 발생한 분쟁에 관한 소송은 민사소송법 등 관련 법률상의 관할법원에 제기합니다.<br/>
                    ④ 회사와 회원간에 제기된 소송은 대한민국 법을 적용합니다.<br/>
                    <br/>
                    시행일: 2021년 3월 24일
                </div>
                <div class="mb-5">
                    <label class="checkbox">
                        <input id="chk1p" type="checkbox">
                        서비스 이용약관에 동의합니다.
                    </label>
                </div>

                <span><strong>개인정보 수집 및 이용에 대한 안내 </strong>(필수)</span>
                <div class="overflowY-auto pl-2 pr-2 pt-2" style="height: 160px; border: 1px solid grey;">
                    <span class="has-text-link">제 1조 개인정보의 처리 목적</span><br/>
                    ㈜허니비소프트(이하 "회사")은 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.<br/>
                    <ul>
                        <li>고객 가입의사 확인</li>
                        <li>고객에 대한 서비스 제공에 따른 본인 식별ㆍ인증</li>
                        <li>회원자격 유지ㆍ관리</li>
                        <li>서비스 공급에 따른 금액 결제</li>
                        <li>교육 콘텐츠 제공</li>
                        <li>서비스 및 이벤트와 관련된 공급ㆍ배송 등</li>
                    </ul>
                    <span class="has-text-link">제 2조 개인정보의 처리 및 보유 기간</span><br/>
                    ① 회사는 정보주체로부터 개인정보를 수집할 때 동의받은 개인정보 보유ㆍ이용기간 또는 법령에 따른 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.<br/>
                    ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br/><br/>
                    <table class="table is-striped is-narrow">
                        <thead>
                        <tr>
                            <th style="width: 50px;">순번</th>
                            <th>개인정보파일의 명칭</th>
                            <th>운영근거</th>
                            <th>보유기간</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>고객 가입 및 관리</td>
                                <td>-</td>
                                <td>서비스 이용계약 또는 회원가입 해지 시까지</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>고객 가입 및 관리 1년간 온ㆍ오프라인 미거래 고객</td>
                                <td>정보통신망 이용촉진 및 정보보호 등에 관한 법률</td>
                                <td>1년</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>전자상거래에서의 계약ㆍ청약철회</td>
                                <td>상법, 전자상거래 등에서의 소비자보호에 관한 법률</td>
                                <td>5년</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>대금결제, 서비스 등 공급 기록</td>
                                <td>상법, 전자상거래 등에서의 소비자보호에 관한 법률</td>
                                <td>5년</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>서비스 접속기록</td>
                                <td>통신비밀보호법</td>
                                <td>3개월</td>
                            </tr>
                        </tbody>
                    </table>
                    <br/>
                    <span class="has-text-link">제 3조 처리하는 개인정보의 항목</span><br/>
                    회사는 다음의 개인정보 항목을 처리하고 있습니다.<br/>
                    <ul>
                        <li>필수항목 : 로그인ID, 비밀번호, 휴대전화번호, 이메일ID, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록</li>
                        <li>선택항목 : 회원가입경로</li>
                    </ul>
                    <br/>
                    <span class="has-text-link">제 4조 개인정보 파기 절차 및 방법</span><br/>
                    ① 회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 다만, 다른 법률에 따라 보존하여야 하는 경우에는 그러하지 않습니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br/>
                    ② 불필요한 개인정보 및 개인정보파일은 개인정보보호책임자의 책임하에 내부방침 절차에 따라 다음과 같이 처리하고 있습니다.<br/>
                    <ul>
                        <li>
                            개인정보의 파기<br/>
                            보유기간이 경과한 개인정보는 종료일로부터 지체없이 파기합니다.
                        </li>
                        <li>
                            개인정보파일의 파기<br/>
                            개인정보파일의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보파일이 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 지체 없이 그 개인정보파일을 파기합니다.
                        </li>
                    </ul>
                </div>
                <div class="mb-5">
                    <label class="checkbox">
                        <input id="chk2p" type="checkbox">
                        개인정보의 수집 및 이용 목적에 동의합니다.
                    </label>
                </div>

                <span><strong>개인정보 마케팅 활용 동의 </strong>(선택)</span>
                <div class="overflowY-auto pl-2 pr-2 pt-2" style="height: 160px; border: 1px solid grey;">
                    <span class="has-text-link">제 1조 수집, 이용 항목</span><br/>
                    성명, 이메일주소, 휴대전화번호, 구매 및 예약 내역, 아이디<br/>
                    <br/>
                    <span class="has-text-link">제 2조 수집·이용 목적</span><br/>
                    ㈜허니비소프트 상품 및 서비스 소개, 자사 서비스 판촉 안내 및 경품 발송(주소), 만족도 조사, 시장 조사<br/>
                    <br/>
                    <span class="has-text-link">제 3조 보유·이용 기간</span><br/>
                    수집·이용 동의일로부터 회원 탈퇴 시 까지<br/>
                    ※ 위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 개인형 맞춤 상품 안내 등 유용한 상품안내를 받아보실 수 없습니다.<br/>
                </div>
                <div class="mb-5">
                    <label class="checkbox">
                        <input id="chk3p" type="checkbox">
                        동의함
                    </label>
                </div>
                <div>
                    <p style="color: grey">
                        위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 개인형 맞춤 상 품 안내 등 유용한 상품안내를 받아보실 수 없습니다.
                    </p>
                </div>
                <div class="mt-3">
                    <label class="checkbox">
                        <input id="chk4p" type="checkbox">
                        허니비소프트 가입약관 전체동의
                    </label>
                </div>
                <div>
                    <p style="color: grey">
                        전체동의는 선택사항(동의 내용을 확인 후 개별동의 가능)이며 전체동의 버튼을 체크 하면 선택적 수집동의도 동시 진행됩니다.
                    </p>
                </div>
            </div>

        </section>
        <footer class="modal-card-foot flex-row justify-content-end">
            <div class="field">
                <button id="btnAgreement" class="button is-warning is-small" onclick="main.checkAgreement()">
                    <span class="icon"><i class="fas fa-check"></i></span>
                    <span>확인</span>
                </button>
            </div>
        </footer>
    </div>
</div>