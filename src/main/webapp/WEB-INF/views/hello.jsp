<%--
  Created by IntelliJ IDEA.
  User: netcomo
  Date: 2017-12-06
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>시스템 Test</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/app/css/dashboard.css">
    

    <!-- bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

    <!-- moment -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.3/moment.min.js" integrity="sha256-/As5lS2upX/fOCO/h/5wzruGngVW3xPs3N8LN4FkA5Q=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.3/moment-with-locales.min.js" integrity="sha256-rFEvCvgZWluLPnjiBNa/p3nJLJxTP1XYw4W6FZz2S98=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.3/locale/ko.js" integrity="sha256-52Xn0wi4kPGcROqCAA5EoontBDks09MLjv7fd5WAj3U=" crossorigin="anonymous"></script>

    <!-- bootstrap datetimepicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" integrity="sha256-yMjaV542P+q1RnH6XByCPDfUFhmOafWbeLPmqKh11zo=" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" integrity="sha256-5YmaxAwMjIpMrVlK84Y/+NjCpKnFYa8bWWBbUHSBGfU=" crossorigin="anonymous"></script>



    <script>
        $(function () {

            var date = new Date();


            var temp = [];
            var year = date.getFullYear()-10;
            var num = 0;

        

            for (var i=1; i<20; i++)
            {
                /*alert('num:'+num+(year+i)+'-01-01');
                num++;*/
                //1월 1일 설날
                temp[num++] = (year+i)+'-01-01';
                //3월 1일 3삼일절
                temp[num++] = (year+i)+'-03-01';
                //5월 5일 어린이날
                temp[num++] = (year+i)+'-05-05';
                //6월 6일 현충일
                temp[num++] = (year+i)+'-06-06';
                //8월 15일 광복절
                temp[num++] = (year+i)+'-08-15';
                //10월 3일 개천절
                temp[num++] = (year+i)+'-10-03';
                //10월 9일  한글날
                temp[num++] = (year+i)+'-10-09';
                //12 25일 크리스마스
                temp[num++] = (year+i)+'-12-25';
            }
            // 설날            음력 1월 1일
            // 부처님오신날    음력 4월 8일
            // 추석           음력 8월 15일
            // 참고
            //https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%EC%9D%98_%EA%B3%B5%ED%9C%B4%EC%9D%BC

            //alert(temp);

            $('.datetimepicker2').datetimepicker({
                format: "YYYY-MM-DD",
                daysOfWeekDisabled: [0, 6],
                showTodayButton : true ,
                disabledDates : temp,
                icons : { today: 'glyphicon glyphicon-text-width'},
                tooltips : { today: '오늘' }
            });

            $('.datetimepicker3').datetimepicker({
                format: "YYYY-MM-DD",
                daysOfWeekDisabled: [0, 6],
                showTodayButton : true ,
                disabledDates : temp,
                icons : { today: 'glyphicon glyphicon-retweet'},
                tooltips : { today: "Today" }
            });

            $('.datetimepicker4').datetimepicker({
                format: "YYYY-MM-DD",
                daysOfWeekDisabled: [0, 6],
                showTodayButton : true ,
                disabledDates : temp,
                icons : { today: 'glyphicon glyphicon-screenshot'},
                tooltips : { today: "오늘" }
            });



            $('.datetimepicker6').datetimepicker({
                format: "YYYY-MM-DD hh:mm",
                daysOfWeekDisabled: [0, 6],
                showTodayButton : true ,
                disabledDates : temp,
                tooltips : { today: "오늘" ,  selectTime: '시간설정'}
            });
        })
    </script>


</HEAD>

<BODY>



    <table>
        <tr>
            <td>
                <div class="input-group">
                    <input type="text" name="movein_survey_date" class="form-control input-sm datetimepicker2">
                </div>
            </td>

            <td>
                <div class="input-group">
                    <input type="text" name="movein_survey_date" class="form-control input-sm datetimepicker3">
                </div>
            </td>

            <td>
                <div class="input-group">
                    <input type="text" name="movein_survey_date" class="form-control input-sm datetimepicker4">
                </div>
            </td>



            <td>
                <div class="input-group">
                    <input type="text" name="movein_survey_date" class="form-control input-sm datetimepicker6">
                </div>
            </td>


        </tr>
    </table>




</BODY>
</HTML>