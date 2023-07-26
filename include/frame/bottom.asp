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
                        <img src="/images/footer_logo.png" alt="이미지">
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
                        <img src="/images/organize2.png" >
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
    <script>
        $('.newsticker').newsTicker();
    </script>

    <script src="/js/swiper.js"></script>
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
    });

    // 로컬 스토리지를 이용한 height 저장 후 특정 위치로 이동
//     function saveScrollPosition() {
//     let go_tab= document.querySelector('#go_tab');
//     let tabHeight = go_tab.offsetTop;
//     var scrollPosition = tabHeight;
//     localStorage.setItem('scrollPosition', scrollPosition);
    
// }

// window.onload = function() {
//     var scrollPosition = localStorage.getItem('scrollPosition');
//     if (scrollPosition) {
//         setTimeout(() => {
//             window.scrollTo(0, scrollPosition);
//         }, 0);
//       localStorage.removeItem('scrollPosition'); // 사용한 scrollPosition는 삭제 
//     }
//   }
    </script>

</body>

</html>