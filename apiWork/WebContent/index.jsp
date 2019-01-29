<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

    <title>취준생 프로젝트</title>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        nav {
            z-index: 2;
            width: 100%;
            height: 30px;
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            padding: 17px;
            background: linear-gradient(to left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
            display: none;
        }

        nav a {
            color: rgba(255, 255, 255, 0.5);
            text-decoration: none;
            font-size: 20px;
            margin: 0px 30px;
        }
        
        nav a:hover{
            color: rgba(255, 255, 255, 0.8)
        }

        footer {
            z-index: 2;
            width: 100%;
            height: 60px;
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(to left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0));
            display: none;
        }

        footer div {
            color: rgba(255, 255, 255, 0.5);
            font-size: 20px;
            letter-spacing: 1px;
        }
        
        footer #p1{
            width: 49.5%;
            float: left;
            text-align: right;
            font-size: 40px;
            display: inline-block;
        }
        
        footer #p2{
            width: 49.5%;
            float: right;
            text-align: left
        }
        
        #container {
            overflow: hidden;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        #background_video {
            position: absolute;

            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            object-fit: cover;
            height: 100%;
            width: 100%;
        }

        #video_cover {
            position: absolute;

            width: 100%;
            height: 100%;

            background: url('video_cover.jpeg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        #video_controls {
            position: absolute;
            left: 50%;
            transform: translate(-50%, 0);
        }

        body {
            text-align: center;
            font-family: 'Malgun Gothic', 'Helvetica';
        }

        #container {
            height: 100%;
        }

        #overlay {
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
        }

        #main_content {
            z-index: 2;
            position: relative;
            display: inline-block;

            /* Vertical center */
            top: 50%;
            transform: translateY(-50%);
        }

        #main_content h1 {
            text-transform: uppercase;
            font-weight: 600;
            font-family: 'Malgun Gothic', 'Helvetica';
            color: #fff;
            font-size: 35px;
        }

        #main_content .sub_head {
            color: rgba(255, 255, 255, 0.5);
            font-size: 18px;
        }

        #main_content .info {
            color: rgba(255, 255, 255, 0.5);
            font-size: 12px;
            margin-top: 10px;
        }

        #links {
            margin-top: 50px;
        }

        #links a {
            border: 2px solid rgba(255, 255, 255, 0.20);
            border-radius: 61px;
            font-size: 12px;
            color: #FFFFFF;
            letter-spacing: 1px;
            text-decoration: none;
            text-transform: uppercase;
            padding: 10px 25px;
            display: inline-block;
            margin-right: 15px;
/*            visibility: hidden;*/
        }
        
        #links a:hover{
            background-color: rgba(0, 0, 0, 0.25);
            border: 2px solid rgba(255, 255, 255, 0.15);
        }

    </style>

    <script src="https://use.typekit.net/nlq1kdt.js"></script>
    <script>
        try {
            Typekit.load({
                async: true
            });
        } catch (e) {}
    </script>
</head>

<body>
	<jsp:include page="nav.jsp"/>
    <div id="container">
        <video id="background_video" loop muted></video>
        <div id="video_cover"></div>
        <div id="overlay"></div>

        <section id="main_content">
            <div id="head">
                <h1 id="headtxt">오늘도 수고했어요.</h1>
                <p class="sub_head">당신의, 당신에 의한, 당신을 위한</p>
                <p class="info"></p>
            </div>

            <div id="links">
                <a href="#" id="luck">운세 보구가~</a>
                <a href="mind.jsp">오늘 어땠어?</a>
            </div>
        </section>
    </div>

    <footer>
        <div>
            <p id="p1">19:00</p>
            <p id="p2">
            <span id="city"></span>
            <span id="country"></span><br>
            <span id="temper"></span>
            <span id="weather"></span>
            </p>
        </div>
    </footer>

    <script src="bideo.js"></script>
    <script src="main.js"></script>

    <script>

        if (window.location.host.indexOf('github.io') !== -1 && window.location.protocol !== "https:") {
            window.location.protocol = "https";
        }
		
        $('#luck').click(function(){
        	const results = ["명예와 재운이 당신을 줄곧 따라다닌다. 아주 먼 곳에서부터 기다리던 반가운 소식이 전해져 온다. 훈풍에 영화로울 수 있다. 실직자는 취직이 된다. 이성적 고민거리가 있다면 오늘은 당신의 속마음을 상대방에게 한번 속 시원히 얘기하라."
        		,"오늘 하루는 오랜만에 상쾌한 아침을 맞을 수 있는 날이다. 그동안 하기 싫어서 미뤘던 일들을 처리하기에는 최상의 날인듯하다. 주변 사람들과 친목을 도모할 수 있는 자리를 만든다면, 여러모로 인복을 거둘 수 있을 것이다."
        		,"순간의 기분으로 과욕을 부린다면 다음이 힘들게 된다. 능력 한도 내에서 움직인다면 적지 않은 이익을 얻을 수 있다. 자신이 가지고 있는 모습만 보여줘도 충분하다. 마음이 겸손하면 그 공으로 복록이 내려지니 곧 내 뜻대로 펼칠 날이 있을 것이다. 집안 사람들과 한데 뭉치면 좋겠다."
        		,"어둠 속에서 길을 걷다 우연히 촛불을 얻게 되니 금전운이 좋다. 그 빛이 훈훈하니 액이 서서히 녹아 복록이 무성하겠다. 출행하여 만나는 사람이 있으니 귀인 이로다. 재판에 관련된 사람은 가능하면 재판 날짜를 연기하는 것이 좋다."
        		,"평소와 다르게 당신의 주변에 사람들이 몰려 든다. 하지만, 당신을 존경하기 보다는 당신을 통해 무언가를 얻으려는 목적으로 접근하는 사람들이 대부분이니, 좋은 인연을 만들기가 쉽지는 않을 듯싶다. 긴장감을 잃지 않도록. 복이 들어오면 두루 나누는 베풂이 이로울 수 있다."
        		,"속타는 심정을 아는 이가 눈에 띄지 않아 속상할 수 있으나 섣부른 생각이다. 되도록이면 먼 곳에 나가지 말고, 일은 다음으로 미루고 집과 가까운 곳이나 집안에서 휴식을 취하는 것이 좋다. 뜻밖에 이름이 유명해졌다는 소식을 방안에서 들을 수 있기 때문이다."
        		,"일의 진행이 빨라지는 시기이니, 자신이 가지고 있는 능력을 십분 발휘하면 원하는 걸 얻을 수 있다. 직장인은 상사와 충돌하기 보다 화해의 길을 모색하는 게 유리한 국면이다. 새롭게 시작한 일을 하기 전 기존의 일 마무리를 잘하도록."
        		,"지나친 욕심은 오히려 화를 불러 일으킬 수 있으니 현실에 맞추어 일을 진행하는 게 좋다. 이상과 현실에서 갈등이 마음이 혼란스러울 수 있으나, 웃어른이나 친구에게 조언을 구한다면 이러한 혼란을 정리할 수 있을 것이다."
        		,"문서의 기쁨이 있고 관록이 따르는 하루다. 공명한 일로 사방에서 찬사가 들린다. 사회 초년생일 경우 새롭게 열린 세상을 향해 어깨 펴고 나아가라. 실수에 대해서 자책하지 말고 꿋꿋하게 다시 한번 시도하면 결과를 얻을 수 있다."
        		,"장기적인 안목을 가지고 차분하게 준비해야만 미래의 재난이나 피해를 줄일 수 있다. 코 앞의 것만 보고 행동한다면 앞으로 다가오게 되는 화를 막을 방법을 찾기 힘들다. 일거리가 생기는 만큼 육체적 피로가 쌓여가니 건강 관리에 유념하자."
        		,"지금까지 열심히 노력한 당신에게는 특별한 하루가 될 것이다. 그동안의 수고에 대하여 조그만 보상을 받을 것이다. 그러나 작은 보상에 그치지 않고 더 큰 보상이 이어질 것이다. 양보다 질을 높일 수 있는 하루이다. 예술을 하기에도 괜찮은 날이다."
        		,"현재 추진하는 일에 대하여 동업자나 협력자의 도움으로 어려움을 넘길 수 있으니 이는 다 그동안의 자신이 노력한 결과이다. 뜻하지 않게 재물이 들어올 수 있으니 계획된 소비가 있어야 할 것이다. 천권의 책을 읽기에 좋은 하루 이기도 하다."
        		];
        	
        	var r = Math.floor(Math.random()*12);
        	alert(results[r]);
        });
        
        setInterval(function time() {
            const today = new Date();
            const h = today.getHours();
            let m = today.getMinutes();
            m = checkTime(m);
            $('#p1').html(h + ":" + m);
            setTimeout(time, 500);
        }, 1000*60);

        function checkTime(time) {
            if (time < 10) {time = "0" + time};
            return time;
        }
    </script>
</body>
</html>
