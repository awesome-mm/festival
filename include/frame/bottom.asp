    <footer>
            <div class="footer__wrap ">

                <div class="top_move">
                    <a href="javascript:void(0)">
                    <span><i class="fa-solid fa-arrow-up"></i></span>
                    <span><i class="fa-solid fa-arrow-up"></i></span>
                    </a>
                </div>

                <div class="footer_box">
                    <div class="footer__logo">
                        <img src="/images/footer_logo2.png" alt="이미지">
                    </div>
                    <div class="footer__menu">
                        <ul>
                            <li>
                                <a href="/cms/show.asp?c_show_no=78&c_check_no=67&c_relation=578&c_relation2=564" style="font-weight:300">
                                    개인정보처리방침
                                </a>
                            </li>
                            <li>
                                <a href="/cms/show.asp?c_show_no=79&c_check_no=67&c_relation=286&c_relation2=958" style="font-weight:300">
                                    이용약관
                                </a>
                            </li>
                            <li>
                                <a href="/cms/process/sitemap/list.asp?c_show_no=80&c_check_no=67&c_relation=191&c_relation2=230" style="font-weight:300">
                                    사이트맵
                                </a>
                            </li>
                        </ul>

                        <div class="copyright-txt">
                            서울시 서초구 서초동 서초대로 45길 16(1706-5)번지 VR빌딩 202호
                            <br>
                            <span class="cpt"> © Korea entrepreneurship foundation. All right reserved.</span>
                            <br>
                            <!--  사업자등록번호 : 113-82-07493  -->
                        </div>
                    </div>

                    <div class="orz_img" >
                        <img src="/images/organize3.png" >
                    </div>

                </div>

            </div>
    </footer>
    <script>
    	//alert("잠시 후 3시 15분 부터 10분간 서버 점검이 있습니다.\n홈페이지 이용은 3시 25분 부터 이용해 주세요.") 
    </script>
    <!-- container -->


    <!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->


    <script src="/js/ui.js"></script>
    <script src="/js/newsTicker.js"></script>
    <script src="/js/jquery-ui-mobile.js"></script>
    <script>
        $('.newsticker').newsTicker();
    </script>

    <!--<script src="/js/swiper.js"></script> -->
    <script src="/js/swiper-bundle.min.js"></script>
    <!--<script src="/js/swiper-bundle.min.js.map"></script>-->
    <!--<script>
        var mainVisual = new Swiper('.main__page__visual .swiper-container', {

            lazy: true,
            parallax: true,
            watchSlidesVisibility: true,
            slidesPerView: 1,
            paginationClickable: true,
            loop: true,
            slideToClickedSlide: true,
            autoplay: true,

            pagination: { // 페이징 설정
                el: '.swiper-pagination',
                clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },

            navigation: {
                nextEl: '.swiper-control .next-btn',
                prevEl: '.swiper-control .prev-btn'
            },

            // breakpoints: {     500: {         slidesPerView: 2,         spaceBetween: 10
            // } }
        });
    </script> -->

<script>
          var swiper = new Swiper('.swiper', {
            slidesPerView: 2,
            direction: 'horizontal',
            navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
            },
            on: {
            resize: function () {
                swiper.changeDirection('horizontal');
                swiper.slidesPerView = 3
            },
            },
            breakpoints: {
            // 화면의 넓이가 320px 이상일 때
            0: {
            slidesPerView: 1,
            },
            // 화면의 넓이가 640px 이상일 때
            640: {
            slidesPerView: 2 ,
            }
            }
        });

        function getDirection() {
            var windowWidth = window.innerWidth;
            var direction = window.innerWidth <= 760 ? 'horizontal' : 'horizontal' ;

            return direction;
        }
</script>

    <script src="https://kit.fontawesome.com/e67abfe1c6.js" crossorigin="anonymous"></script>
    <script src="/js/jquery.magnific-popup.js"></script>

    <script>
    // youtube modal iframe pupup
    $(document).ready(function () {
        $('.popup-youtube').magnificPopup({
            disableOn: 320,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: true,
            fixedContentPos: false
        });
        
         function sidereplacePrice() {
            var total_side_invest = $(".total_side_invest");
            var total_side_remaining = $(".total_side_remaining");
            var sideInverstTotalValue = $(".total_side_invest").html();
            var sideRemainingValue = $(".total_side_remaining").html();

            var replacePriceInvest = numberWithCommas(
            Math.floor(sideInverstTotalValue)
            );
            var replacePriceRemaining = numberWithCommas(
            Math.floor(sideRemainingValue)
            );

            total_side_invest.text(replacePriceInvest);
            total_side_remaining.text(replacePriceRemaining);
        }
        
        // 3자리마다 , 찍기
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
        sidereplacePrice();

        $(".side_bar .side_up").on("click", function () {
            $(".side_bar .side_content").slideUp();

            $(".side_up").css("display", "none");
            $(".side_down").css("display", "block");
        });

        $(".side_bar .side_down").on("click", function () {
            $(".side_bar .side_content").slideDown();
            $(".side_down").css("display", "none");
            $(".side_up").css("display", "block");
        });

    });

    // 로컬 스토리지를 이용한 height 저장 후 
    function saveScrollPosition() {
    let go_tab= document.querySelector('#go_tab'); //main tap menu
    let tabHeight = go_tab.offsetTop;
    var scrollPosition = tabHeight;
    localStorage.setItem('scrollPosition', scrollPosition);
    
}
// 로컬 스토리지 저장 값 특정 위치로 이동
window.onload = function() {
    var scrollPosition = localStorage.getItem('scrollPosition');
    if (scrollPosition) {
        setTimeout(() => {
            window.scrollTo(0, scrollPosition);
        }, 0);
      localStorage.removeItem('scrollPosition'); // 사용한 scrollPosition는 삭제 
    }
  }
    </script>

</body>

</html>