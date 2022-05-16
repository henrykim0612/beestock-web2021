<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
    <head>
        <tiles:insertAttribute name="header" />
    </head>
    <body>
        <tiles:insertAttribute name="commonScript" />
        <tiles:insertAttribute name="top" />
        <div class="container is-fullhd mt-6 min-screen-height">
            <article class="message is-warning">
                <div class="message-body">
                    <strong>2022년 6월 20일</strong> 이후 서비스가 당분간 중단될 예정입니다. 자세한 내용은 공지사항을 확인해주세요.
                </div>
            </article>
            <tiles:insertAttribute name="adsenseTop"/>
            <tiles:insertAttribute name="content"/>
            <tiles:insertAttribute name="adsenseBottom"/>
        </div>
        <tiles:insertAttribute name="modal" />
        <tiles:insertAttribute name="footer" />
    </body>
</html>