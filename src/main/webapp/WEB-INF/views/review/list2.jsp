<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Agency - Start Bootstrap Theme</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel='dns-prefetch' href='//fonts.googleapis.com' />
    <link
    href="https://fonts.googleapis.com/css?family=Kaushan+Script"
    rel="stylesheet"
    type="text/css"
  />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <!-- ... -->


  <link
      href="https://fonts.googleapis.com/css?family=Finger+Paint|Open+Sans&display=swap"
      rel="stylesheet"
    />
    <style>
      @media only screen and (max-width: 700px) {
        #logo-center {
          display: none;
        }
        #search {
          width: 100%;
        }
        #selectCity {
          width: 30%;
        }
      }
      @media only screen and (min-width: 700px) {
        #logo {
          display: none;
        }
      }

      #switch_sex_type {
        width: 100%;
        background: #fff;
        border-bottom: 1px #ddd solid;
      }

      #switch_sex_type nav ul {
        letter-spacing: -0.4em;
        text-align: center;
        line-height: 1.2;
        vertical-align: middle;
      }
      #category {
        display: block;
        list-style-type: disc;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
      }
      #switch_sex_type nav ul li {
        width: 100px;
        display: inline-block;
        letter-spacing: normal;
        text-align: center;
        line-height: 1.2;
        vertical-align: middle;
        font-family: "Helvetica Neue", "Helvetica", "Arial", "Verdana",
          sans-serif;
        position: relative;
        color: #888;
        margin: 0;
      }
      .underline {
        line-height: 1.2;
        background-image: linear-gradient(
          transparent calc(100% - 3px),
          #000 3px
        );
        background-repeat: no-repeat;
        background-size: 0% 100%;
        transition: background-size 0.8s;
        color: #000;
        cursor: pointer;
      }
      .yellow {
        background-image: linear-gradient(transparent 60%, #f8cd07 40%);
      }
      .yellow:hover {
        background-size: 100% 100%;
      }

      a:hover {
        text-decoration: none;
      }
    @media only screen and (max-width: 570px) {
        #page-top, #curtain {
          display: none;
        }
      }

#user .img img{border-radius:50%;border:1px #ddd solid}

#sidebar section ul{
    list-style: none;
}

.rank1, .rank2, .rank3 {
    width: 20px;
    height: 20px;
    border: 1px #666 solid;
    border-width: 1.5px;
    background: rgba(0, 0, 0, 0.8);
    text-align: center;
    color: #fff;
    border-radius: 50%;
    line-height: 1;
    vertical-align: middle;
}
.rank1 {
    border-color: #e6d439;   
}
.rank2 {
    border-color: #adadad;
}
.rank3 {
    border-color: #9a5b00;
}

#mainNav {
  background-color: #212529;
}
#mainNav .navbar-toggler {
  font-size: 12px;
  right: 0;
  padding: 13px;
  text-transform: uppercase;
  color: #fff;
  border: 0;
  background-color: #fed136;
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
    "Segoe UI Symbol", "Noto Color Emoji";
}
#mainNav .navbar-brand {
  color: #fed136;
  font-family: "Kaushan Script", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}
#mainNav .navbar-brand.active,
#mainNav .navbar-brand:active,
#mainNav .navbar-brand:focus,
#mainNav .navbar-brand:hover {
  color: #fec503;
}
#mainNav .navbar-nav .nav-item .nav-link {
  font-size: 90%;
  font-weight: 400;
  padding: 0.75em 0;
  letter-spacing: 1px;
  color: #fff;
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
    "Segoe UI Symbol", "Noto Color Emoji";
}

@media (min-width: 992px) {
  #mainNav {
    padding-top: 25px;
    padding-bottom: 25px;
    transition: padding-top 0.3s, padding-bottom 0.3s;
    border: none;
    background-color: transparent;
  }
  #mainNav .navbar-brand {
    font-size: 1.75em;
    transition: all 0.3s;
  }
  #mainNav .navbar-nav .nav-item .nav-link {
    padding: 1.1em 1em !important;
  }
  #mainNav.navbar-shrink {
    padding-top: 0;
    padding-bottom: 0;
    background-color: #212529;
  }
  #mainNav.navbar-shrink .navbar-brand {
    font-size: 1.25em;
    padding: 12px 0;
  }
}
header.masthead {
  text-align: center;
  color: #fff;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center center;
  background-size: cover;
  height: 300px;
}

header.masthead .intro-lead-in {
  font-size: 80px;
        font-weight: 700;
        font-family: "Finger Paint", cursive;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
         text-align: center; 
}

@media (min-width: 768px) {
 
  header.masthead .intro-lead-in {
    font-size: 80px;
    
    font-weight: 700;
        font-family: "Finger Paint", cursive;
        position: absolute;
        top: 20%;
        transform: translate(-50%, -50%);
        color: white;
         text-align: center; 
         font-family: "Finger Paint", cursive;
  }
 
}

.tag-badge{
  position: absolute; bottom: 80px; left: 5px;
}

    </style>
  </head>

  <body id="page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark js-scroll-trigger fixed-top" id="mainNav">
     
        <a id="logo" class="navbar-brand" href="#page-top"
          >Start Bootstrap</a
        >
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#collapsibleNavbar"
        >
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div
          class="collapse navbar-collapse "
          id="collapsibleNavbar"
        >
        <div>
          <form class="form-inline input-group" action="/action_page.php">
            <div class="input-group-prepend">
              <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                검색조건
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">장소</a>
                <a class="dropdown-item" href="#">유저명</a>
                <a class="dropdown-item" href="#">태그</a>
              </div>
            </div>

            <input
              id="search"
              class="form-control"
              type="text"
              placeholder="Search"
            />
            <div class="input-group-append">
              <button class="btn btn-warning" type="submit"><i class="fas fa-search"></i></button>
            </div></div>
         </form>
          <div id="logo-center" class="navbar-brand ml-auto" href="#page-top">
            Start Bootstrap</div>
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
                href="#"
                >지역선택</a>
              <div class="dropdown-menu " id="selectCity">
                <a class="dropdown-item" href="#">Link 1</a>
                <a class="dropdown-item" href="#">Link 2</a>
                <a class="dropdown-item" href="#">Link 3</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">로그인</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#">회원가입</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header
      class="masthead"
      style="background-image: url(https://t1.daumcdn.net/brunch/service/user/3fy/image/io3TsRxvhNY4StFYDU8UEky6_H0.jpg);"
    ><div class="intro-lead-in">SEOUL</div></header>

    
    <div id="switch_sex_type">
      <nav>
        <ul id="category" class="mx-auto">
          <li class="yellow underline"><a href="?c=SwitchTabType">ALL</a></li>
          <li class="yellow underline">
            <a href="?c=SwitchTabType&amp;sex_id=1">CAFE</a>
          </li>
          <li class="yellow underline">
            <a href="?c=SwitchTabType&amp;sex_id=2">LUNCH</a>
          </li>
          <li class="yellow underline">
            <a href="?c=SwitchTabType&amp;sex_id=3">DINING</a>
          </li>
          <li class="yellow underline">
            <a href="?c=SwitchTabType&amp;sex_id=4">WORLD</a>
          </li>
        </ul>
      </nav>
    </div>
    <br>

    <div class="container bg-light">
     <div class="row">
    <div class="btn-group btn-group-toggle mx-auto" data-toggle="buttons">
        <button type="button" class="btn btn-outline-dark active" style="width: 130px;">추천</button>
        <button type="button" class="btn btn-outline-dark" style="width: 130px;">타임라인</button>
      </div>
    </div>
<br>
<div class="row">
<div id="sidebar" class="col-md-3">
    <section id="user">
        <h2 class="title mt-5">유저랭킹</h2>
        <ul>
            <li class="clearfix " >
                <p class="rank1 mr-2">1</p>
                <div class="d-flex align-items-center">
                <div class="sub mr-2">
                    <p id="user" class="img float-left"><a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a></p>
                </div>
                <div class="main ">
                    <p class="name clearfix float-right mb-0">WEAR Official</p><br>
                    <p class="txt icon_font"><i class="fas fa-user"></i> 281,767</p>
                </div></div>
            </li>
    
            <li class="clearfix " >
                <p class="rank2 mr-2">2</p>
                <div class="d-flex align-items-center">
                <div class="sub mr-2">
                    <p class="img float-left"><a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a></p>
                </div>
                <div class="main ">
                    <p class="name clearfix float-right mb-0">WEAR Official</p><br>
                    <p class="txt icon_font  ">281,767</p>
                </div></div>
            </li>
            <li class="clearfix " >
                <p class="rank3 mr-2">3</p>
                <div class="d-flex align-items-center">
                <div class="sub mr-2">
                    <p class="img float-left"><a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a></p>
                </div>
                <div class="main ">
                    <p class="name clearfix float-right mb-0">WEAR Official</p><br>
                    <p class="txt icon_font  ">281,767</p>
                </div></div>
            </li>
            <li class="clearfix " >
                <p class="rank mr-2">4</p>
                <div class="d-flex align-items-center">
                <div class="sub mr-2">
                    <p class="img float-left"><a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a></p>
                </div>
                <div class="main ">
                    <p class="name clearfix float-right mb-0">WEAR Official</p><br>
                    <p class="txt icon_font  ">281,767</p>
                </div></div>
            </li>
            <li class="clearfix " >
                <p class="rank mr-2">5</p>
                <div class="d-flex align-items-center">
                <div class="sub mr-2">
                    <p class="img float-left"><a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a></p>
                </div>
                <div class="main ">
                    <p class="name clearfix float-right mb-0">WEAR Official</p><br>
                    <p class="txt icon_font  ">281,767</p>
                </div></div>
            </li>
        </ul>
    </section>
</div>
<div class="col-md-9">
    

      <!--카드-->
      <div class="row">
        <h1>Ranking</h1>
        </div>
      <div class="row">
        <div class="col-md-4 my-3">
          <div class="card bg-light">
            <img
              src="img/food1.jpg"
              class="card-img-top"
            />
            <div class="card-img-overlay ">
              <div class="tag-badge"><span class="badge badge-light" >광안리</span>  <span class="badge badge-dark">카페</span></div>
                <p class="rank1 mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">1</p>
               
              
            </div>

            <div id="user"  class="card-body text-dark " style="height: 70px;">            
              <div class="d-flex align-items-center">
               <p class="card-text ">
                <p class="img float-left mr-2"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" width="36" height="36"></p>
                <p class="name clearfix " style="font-size: 11px;">WEAR Official</p>
                <p class="btn btn-sm btn-info ml-auto">팔로우</p>
            </div>
              </p>
             
            </div>
           
          </div>
        </div>
          <!--카드끝-->
          <div class="col-md-4 my-3">
            <div class="card bg-light">
              <img
                src="img/food2.jpg"
                class="card-img-top"
              />
              <div class="card-img-overlay ">
                <div class="tag-badge"><span class="badge badge-light" >광안리</span>  <span class="badge badge-dark">카페</span></div>
                  <p class="rank2 mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">2</p>
                 
                
              </div>
  
              <div id="user"  class="card-body text-dark " style="height: 70px;">            
                <div class="d-flex align-items-center">
                 <p class="card-text ">
                  <p class="img float-left mr-2"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" width="36" height="36"></p>
                  <p class="name clearfix " style="font-size: 11px;">WEAR Official</p>
                  <p class="btn btn-sm btn-info ml-auto">팔로우</p>
              </div>
                </p>
               
              </div>
             
            </div>
          </div>
          <!--카드끝-->
          <div class="col-md-4 my-3">
            <div class="card bg-light">
              <img
                src="img/food3.jpg"
                class="card-img-top"
              />
              <div class="card-img-overlay ">
                <div class="tag-badge"><span class="badge badge-light" >광안리</span>  <span class="badge badge-dark">카페</span></div>
                  <p class="rank3 mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">3</p>
                 
                
              </div>
  
              <div id="user"  class="card-body text-dark " style="height: 70px;">            
                <div class="d-flex align-items-center">
                 <p class="card-text ">
                  <p class="img float-left mr-2"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" width="36" height="36"></p>
                  <p class="name clearfix " style="font-size: 11px;">WEAR Official</p>
                  <p class="btn btn-sm btn-info ml-auto">팔로우</p>
              </div>
                </p>
               
              </div>
             
            </div>
          </div>

         
<!--tag-->
<div class="container mt-5">
<div class="row mb-2">
    <h1>#Trend HashTag</h1>
    </div>
<div class="row text-center ml-auto justify-content-center mb-2 mr-5" >
   
   
    <div class="card mr-2 col-md-3" >
        <div class="card-body">#Basic card</div>
      </div>
      <div class="card mr-2 col-md-3">
        <div class="card-body">#Basic card</div>
      </div>
      <div class="card mr-2 col-md-3">
        <div class="card-body">#Basic card</div>
      </div>
      
    
    </div>
    <div class="row text-center ml-auto justify-content-center" >
   
   
      <div class="card mr-2 col-md-3" >
          <div class="card-body">#Basic card</div>
        </div>
        <div class="card mr-2 col-md-3">
          <div class="card-body">#Basic card</div>
        </div>
        <div class="card mr-2 col-md-3">
          <div class="card-body">#Basic card</div>
        </div>
        
      
      </div>
      </div>
        <!--editor-->
        <div class="container">
        <div class="row mt-5">
        <h1>Editor's Pick</h1></div>
        <div class="row justify-content-center ">
        <div id="demo" class="carousel slide" data-ride="carousel">
        
            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
          
            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://www.agoda.com/wp-content/uploads/2019/03/Best-restaurants-in-Seoul-Fine-dining-Jungsik-Seoul-Mingles-restaurant.jpg"
                 alt="Los Angeles"
                 style="width: 600px; height: 400px;">
                <div class="carousel-caption">
                    <h3>Los Angeles</h3>
                    <p>We had such a great time in LA!</p>
                  </div>
              </div>
              <div class="carousel-item">
                <img src="https://www.hanbit.co.kr/data/editor/20190819134502_voahpmrs.jpg" alt="Chicago" style="width: 600px; height: 400px;">
              </div>
              <div class="carousel-item">
                <img src="https://www.travel141.co.kr/wp-content/uploads/2017/02/dscf5729.jpg" alt="New York" style="width: 600px; height: 400px;">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          
          </div>
        </div>
      </div>
</div>

</div>

          <!--카드 끝-->
     

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-4">
          <span class="copyright">Copyright &copy; Your Website 2019</span>
        </div>
        <div class="col-md-4">
          <ul class="list-inline social-buttons">
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fas fa-blog"></i>
              </a>
            </li>
            
          </ul>
        </div>
        <div class="col-md-4">
          <ul class="list-inline quicklinks">
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
    </div>



    <script>
      
!(function(e) {
  "use strict";
  e('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
    if (
      location.pathname.replace(/^\//, "") ==
        this.pathname.replace(/^\//, "") &&
      location.hostname == this.hostname
    ) {
      var a = e(this.hash);
      if ((a = a.length ? a : e("[name=" + this.hash.slice(1) + "]")).length)
        return (
          e("html, body").animate(
            { scrollTop: a.offset().top - 54 },
            1e3,
            "easeInOutExpo"
          ),
          !1
        );
    }
  }),
    e(".js-scroll-trigger").click(function() {
      e(".navbar-collapse").collapse("hide");
    }),
    e("body").scrollspy({ target: "#mainNav", offset: 56 });
  function a() {
    100 < e("#mainNav").offset().top
      ? e("#mainNav").addClass("navbar-shrink")
      : e("#mainNav").removeClass("navbar-shrink");
  }
  a(), e(window).scroll(a);
})(jQuery);

    </script>
  </body>
</html>
