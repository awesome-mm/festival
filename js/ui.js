
history.scrollRestoration = "auto";

$(document).ready(function () {
  // a href='#' 클릭 무시 스크립트
  $('a[href="#"]').click(function (ignore) {
    ignore.preventDefault();
  });
});

// /---------------------------------------------------------------------- 헤더메뉴
// 선택시 활성,비활성 기능
$("header nav .menu-item > a").on("mouseenter", function () {
  $("header nav .menu-item > a").removeClass("on");
  $(this).addClass("on");
});

$("header nav .menu-sub li > a").on("mouseenter", function () {
  $("header nav .menu-sub li > a").removeClass("on");
  $(this).addClass("on");
});

// $('header nav .menu-item > a').on('mouseleave',function (){ 	$('header nav
// .menu-item > a').removeClass('on'); 	$(this).addClass('on'); })
// /---------------------------------------------------------------------- 모바일
// 메뉴 열기
function mobileMenuOpen() {
  // $('.container').addClass('overlay') var h = $(document).height(); alert(h)
  // $('nav.mobile-menu').css({"height":h})

  $("nav.mobile-menu").show("slide", { direction: "right" });

  scrollDisable();
}

$(".depth1 .depth1-txt").on("click", function () {
  if ($(this).hasClass("on")) {
    $(this).removeClass("on");
  } else {
    $(".depth1 .depth1-txt").removeClass("on");
    $(this).addClass("on");
  }
});

// 모바일 메뉴 닫기
function mobileMenuClose() {
  $("nav.mobile-menu").hide("slide", { direction: "right" });
  $(".container").removeClass("overlay");
  scrollAble();
}

function scrollDisable() {
  $("html, body")
    .addClass("scrollHidden")
    .on("scroll touchmove mousewheel", function (e) {
      e.preventDefault();
    });
}
function scrollAble() {
  $("html, body").removeClass("scrollHidden");
}

$(".sort_box .input_wrap").on("focus", function () {
  $(this).parent(".sort_box").addClass("on");
});

$(".sort_box .input_wrap").on("blur", function () {
  $(this).parent(".sort_box").removeClass("on");
});

// 탭 메뉴1 var $tab_list = $(".tab_menu"); $tab_list.find("ul ul").hide();
// $tab_list.find("li.active > ul").show(); function tabMenu(e) {
// e.preventDefault(); 	var $this = $(this);
// $this.next("ul").show().parent("li").addClass("active")
// .siblings("li").removeClass("active").find(">ul") 	.hide(); }
// $tab_list.find("ul>li>a").click(tabMenu).focus(tabMenu); 탭 메뉴2 $(function(){
// $(".tab_menu ul li").click(function(){ 		$(".tab_menu ul
// li").removeClass('on'); 		$(".conBox").removeClass('on');
// $(this).addClass('on'); 		$("#"+$(this).data('id')).addClass('on'); 	}); });
// 탭 메뉴3 ---------------------------------------------------
$(function () {
  $(".tab_menu2 ul li").click(function () {
    $(".tab_menu2 ul li").removeClass("on");
    $(".conBox1").removeClass("on");
    $(this).addClass("on");
    $("#" + $(this).data("id")).addClass("on");

  });
});

//탭 메뉴4 -----------------------------------------------------
$(document).ready(function () {
  var $tabButtonItem = $(".tab_menu li"),
    $tabSelect = $(".tab_select"),
    $tabContents = $(".conBox"),
    activeClass = "on";

  $tabButtonItem.first().addClass(activeClass);
  $tabContents.not(":first").hide();

  // button 탭
  $tabButtonItem.find("a").on("click", function (e) {
    var target = $(this).attr("href");

    $tabButtonItem.removeClass(activeClass);
    $(this).parent().addClass(activeClass);
    $tabSelect.val(target);
    $tabContents.hide();
    $(target).show();
    e.preventDefault(); 
  });

  // select 탭
  $tabSelect.on("change", function () {
    var target = $(this).val(),
      targetSelectNum = $(this).prop("selectedIndex");

    $tabButtonItem.removeClass(activeClass);
    $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
    $tabContents.hide();
    $(target).show();

  });
});
// ---------------------------------------------------------------

//like 버튼-------------------------------------------------------
$(document).ready(function () {
  $("#heart").click(function () {
    if ($("#heart").hasClass("liked")) {
      $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
      $("#heart").removeClass("liked");
    } else {
      $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
      $("#heart").addClass("liked");
    }
  });
});

//share 버튼
$(document).ready(function () {
  $("#share").click(function () {
    if ($("#share").hasClass("liked")) {
      $("#share").html('<i class="fa fa-share-alt" aria-hidden="true"></i>');
      $("#share").removeClass("liked");
    } else {
      $("#share").html('<i class="fa fa-share" aria-hidden="true"></i>');
      $("#share").addClass("liked");
    }
  });
});
// ----------------------------------------------------------------

// 버튼 사이즈 조절------------------------------------------------------
// $(window).resize(function(){     var winWidth = $(window).width();     var
// boxWidth = $('.btn_box').width();     max-width값인 500px아래서만 작동 if(winWidth <=
// 500){
//      1.681:1         $('.btn_box').height(boxWidth*0.121);     } });
// -------------------------------------------------------------------

//좋아요1 클릭증가
$(document).on("click", ".heart", function () {
  var count = $(this).next("span");

  $(this).toggleClass("notliked liked");

  if ($(this).hasClass("liked")) {
    count.text(Number(count.text()) + 1);
  } else {
    count.text(Number(count.text()) - 1);
  }
});

//댓글수 클릭증가
$(document).on("click", ".fa-commenting-o", function () {
  var count = $(this).next("span");

  $(this).toggleClass("comment nocomment ");

  if ($(this).hasClass("nocomment")) {
    count.text(Number(count.text()) + 1);
  } else {
    count.text(Number(count.text()) - 1);
  }
});

//up down
$(document).on("click", ".fa-caret-square-o", function () {
  var count = $(this).next("span");

  $(this).toggleClass("notliked liked");

  if ($(this).hasClass("liked")) {
    count.text(Number(count.text()) + 1);
  } else {
    count.text(Number(count.text()) - 1);
  }
});

$('.top_move').hide();

 $(window).on('scroll',function(e){ 
    e.preventDefault();    
      let pcscroll = $(window).scrollTop(); 
      if (pcscroll > 100) {
        $(".top_move").fadeIn("slow");
      } else {
        $(".top_move").fadeOut("fast"); 
      }
 });

$('.top_move').click(function(e){
     e.preventDefault();
     $("html,body").stop().animate({"scrollTop":0},1000); 
  });


// iframe 높이 자동지정  최초 로드 시 iframe 높이값 비율에 맞게 세팅 var $videoIframe =
// document.getElementById('video3'); var responsiveHeight =
// $videoIframe.offsetWidth * 0.5625; $videoIframe.setAttribute('height',
// responsiveHeight); 브라우저 리사이즈 시 iframe 높이값 비율에 맞게 세팅
// window.addEventListener('resize', function(){     responsiveHeight =
// $videoIframe.offsetWidth * 0.5625;     $videoIframe.setAttribute('height',
// responsiveHeight); }); ---------더 보기 더보기
// ---------------------------------------------------
$(function () {
  $(".guest_book3 li").slice(0, 0).show(); // select the first ten

  var sum = 0;
  var hp = $(".guest_book3").height();

  $("#load").click(function (e) {
    // click event for load more
    e.preventDefault();

    sum += hp;

    $(".guest_book3 li:hidden").slice(0, 5).show(); // select next 10 hidden divs and show them

    $(".guest_book3").css("height", sum);
    $(".guest_book3 .dot3").css("height", sum);

    if ($(".guest_book3 li:hidden").length == 0) {
      // check if any hidden divs still exist
      $(".btn_box3").css("pointer-events", "none");
      $(".triangle").css("display", "none");
      $(".btn_box3 a").css("color", "#999999");
      $(".btn_box3").css("border", "#999999");

      // $(".btn_box3 a").css();
    }
  });
});
// -------------------------------------------------------------------
