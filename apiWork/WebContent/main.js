
    var i = 1;
    const txt1 = "오늘도 수고했어요.";
    const txt2 = "모든게 잘 될거에요.";
    const txt3 = "힘든 일이 있나요?";
    let innertxt = txt1.charAt(0);
    const speed = 180;
    
(function time() {
    const today = new Date();
    const h = today.getHours();
    let m = today.getMinutes();
    m = checkTime(m);
    $('#p1').html(h + ":" + m);
    setTimeout(time, 500);
})();

function checkTime(time) {
    if (time < 10) {time = "0" + time};
    return time;
}
    
    
(function typeWriter() {
    if (i < txt1.length) {
    innertxt += txt1.charAt(i);
        $('#headtxt').html(innertxt);
//        $('#headtxt').html(function(){
//            setInterval(function(){
//                var bar = "|"
//            }, 100)
//            return innertxt + bar;
//        });
    i++;
    $('#links a').hide();
    setTimeout(typeWriter, speed);
  }
    if(i == txt1.length){
        $('nav').slideDown(1300);
        $('footer').slideDown(1200);
        $('#links a').fadeIn(1300);
    }
    
})();
    
(function() {

            const city = "seoul";
            const apiURI = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + "64fd2d0f67249676d028f0e6ab5bb8ed";
            $.ajax({
                url: apiURI,
                dataType: "json",
                type: "GET",
                async: "false",
                success: function(resp) {


                    const location = resp.name + ",";
                    const country = "" + resp.sys.country;
                    const temper = (resp.main.temp - 273.15).toFixed(1) + "℃";
                    const weather = "" + resp.weather[0].main;
                    $('#city').html(location);
                    $('#country').html(country);
                    $('#temper').html(temper);
                    $('#weather').html(weather);
                    console.log(resp);
                    console.log("현재온도 : " + (resp.main.temp - 273.15).toFixed(1));
                    console.log("현재습도 : " + resp.main.humidity);
                    console.log("날씨 : " + resp.weather[0].main);
                    console.log("상세날씨설명 : " + resp.weather[0].description);
                    console.log("날씨 이미지 : " + resp.weather[0].icon);
                    console.log("바람   : " + resp.wind.speed);
                    console.log("나라   : " + resp.sys.country);
                    console.log("도시이름  : " + resp.name);
                    console.log("구름  : " + (resp.clouds.all) + "%");
                }
            })

        })

(function () {

  var bv = new Bideo();
  bv.init({
    // Video element
    videoEl: document.querySelector('#background_video'),

    // Container element
    container: document.querySelector('body'),

    // Resize
    resize: true,

    // autoplay: false,

    isMobile: window.matchMedia('(max-width: 768px)').matches,

    playButton: document.querySelector('#play'),
    pauseButton: document.querySelector('#pause'),

    // Array of objects containing the src and type
    // of different video formats to add
    src: [
      {
        src: 'night.mp4',
        type: 'video/mp4'
      },
      {
        src: 'night.webm',
        type: 'video/webm;codecs="vp8, vorbis"'
      }
    ],

    // What to do once video loads (initial frame)
    onLoad: function () {
      document.querySelector('#video_cover').style.display = 'none';
    }
  });
}());
