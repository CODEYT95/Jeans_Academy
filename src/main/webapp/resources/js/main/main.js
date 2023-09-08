
       $(document).ready(function() {
               // 각 게시물 항목을 순회하며 제목 정보를 가져와서 표시합니다.
               $('.box-notice ul li').each(function() {
                   var title = $(this).data('title'); // 데이터 속성에서 제목 정보 가져오기
                   if (title) {
                       // 게시물 항목 아래에 제목 정보를 추가합니다.
                       $(this).find('.icon').append('<div class="post-title">' + title + '</div>');
                   }
               });
           });
    document.addEventListener('DOMContentLoaded', function() {
        const slides = document.querySelectorAll('.slide');
        const btns = document.querySelectorAll('.btn');
        let currentSlide = 0;

        function manualNav(manual) {
            slides.forEach((slide) => {
                slide.classList.remove('active');
            });

            btns.forEach((btn) => {
                btn.classList.remove('active');
            });

            slides[manual].classList.add('active');
            btns[manual].classList.add('active');
        }

        btns.forEach((btn, i) => {
            btn.addEventListener("click", () => {
                manualNav(i);
                currentSlide = i;
            });
        });

        function repeat(activeClass) {
            const active = document.getElementsByClassName('active');
            let i = 0;

            function repeater() {
                setTimeout(function() {
                    [...active].forEach((activeSlide) => {
                        activeSlide.classList.remove('active');
                    });

                    slides[i].classList.add('active');
                    btns[i].classList.add('active');
                    i++;

                    if (slides.length == i) {
                        i = 0;
                    }
                    if (i >= slides.length) {
                        return;
                    }
                    repeater();
                }, 3000);
            }
            repeater();
        }

        repeat();
    });

    // Tinkerbell Magic Sparkle
    var colour = "random";
    var sparkles = 50;

    var x=ox=400;
    var y=oy=300;
    var swide=800;
    var shigh=600;
    var sleft=sdown=0;
    var tiny=new Array();
    var star=new Array();
    var starv=new Array();
    var starx=new Array();
    var stary=new Array();
    var tinyx=new Array();
    var tinyy=new Array();
    var tinyv=new Array();

    window.onload=function() { if (document.getElementById) {
        var i, rats, rlef, rdow;
        for (var i=0; i<sparkles; i++) {
            var rats=createDiv(3, 3);
            rats.style.visibility="hidden";
            rats.style.zIndex="999";
            document.body.appendChild(tiny[i]=rats);
            starv[i]=0;
            tinyv[i]=0;
            var rats=createDiv(5, 5);
            rats.style.backgroundColor="transparent";
            rats.style.visibility="hidden";
            rats.style.zIndex="999";
            var rlef=createDiv(1, 5);
            var rdow=createDiv(5, 1);
            rats.appendChild(rlef);
            rats.appendChild(rdow);
            rlef.style.top="2px";
            rlef.style.left="0px";
            rdow.style.top="0px";
            rdow.style.left="2px";
            document.body.appendChild(star[i]=rats);
        }
        set_width();
        sparkle();
    }}

    function sparkle() {
        var c;
        if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
            ox=x;
            oy=y;
            for (c=0; c<sparkles; c++) if (!starv[c]) {
                star[c].style.left=(starx[c]=x)+"px";
                star[c].style.top=(stary[c]=y+1)+"px";
                star[c].style.clip="rect(0px, 5px, 5px, 0px)";
                star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
                star[c].style.visibility="visible";
                starv[c]=50;
                break;
            }
        }
        for (c=0; c<sparkles; c++) {
            if (starv[c]) update_star(c);
            if (tinyv[c]) update_tiny(c);
        }
        setTimeout("sparkle()", 40);
    }

    function update_star(i) {
        if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
        if (starv[i]) {
            stary[i]+=1+Math.random()*3;
            starx[i]+=(i%5-2)/5;
            if (stary[i]<shigh+sdown) {
                star[i].style.top=stary[i]+"px";
                star[i].style.left=starx[i]+"px";
            }
            else {
                star[i].style.visibility="hidden";
                starv[i]=0;
                return;
            }
        }
        else {
            star[i].style.visibility="hidden";
            starv[i]=0;
            return;
        }
    }

    function update_tiny(i) {
        if (--tinyv[i]==25) {
            tiny[i].style.width="1px";
            tiny[i].style.height="1px";
        }
        if (tinyv[i]) {
            tinyy[i]+=1+Math.random()*3;
            tinyx[i]+=(i%5-2)/5;
            if (tinyy[i]<shigh+sdown) {
                tiny[i].style.top=tinyy[i]+"px";
                tiny[i].style.left=tinyx[i]+"px";
            }
            else {
                tiny[i].style.visibility="hidden";
                tinyv[i]=0;
                return;
            }
        }
        else {
            tiny[i].style.visibility="hidden";
            tinyv[i]=0;
            return;
        }
    }

    document.onmousemove=mouse;
    function mouse(e) {
        if (e) {
            y=e.pageY;
            x=e.pageX;
        }
        else {
            set_scroll();
            y=event.y+sdown;
            x=event.x+sleft;
        }
    }

    window.onscroll=set_scroll;
    function set_scroll() {
        if (typeof(self.pageYOffset)=='number') {
            sdown=self.pageYOffset;
            sleft=self.pageXOffset;
        }
        else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
            sdown=document.body.scrollTop;
            sleft=document.body.scrollLeft;
        }
        else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
            sleft=document.documentElement.scrollLeft;
            sdown=document.documentElement.scrollTop;
        }
        else {
            sdown=0;
            sleft=0;
        }
    }

    window.onresize=set_width;
    function set_width() {
        var sw_min=999999;
        var sh_min=999999;
        if (document.documentElement && document.documentElement.clientWidth) {
            if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
            if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
        }
        if (typeof(self.innerWidth)=='number' && self.innerWidth) {
            if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
            if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
        }
        if (document.body.clientWidth) {
            if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
            if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
        }
        if (sw_min==999999 || sh_min==999999) {
            sw_min=800;
            sh_min=600;
        }
        swide=sw_min;
        shigh=sh_min;
    }

    function createDiv(height, width) {
        var div=document.createElement("div");
        div.style.position="absolute";
        div.style.height=height+"px";
        div.style.width=width+"px";
        div.style.overflow="hidden";
        div.style.backgroundColor=colour;
        return (div);
    }

    function newColour() {
        var c=new Array();
        c[0]=255;
        c[1]=Math.floor(Math.random()*256);
        c[2]=Math.floor(Math.random()*(256-c[1]/2));
        c.sort(function(){return (0.5-Math.random());});
        return("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
    }


  //반별로 게시판 권한 주기
    document.addEventListener("DOMContentLoaded", function() {
    var member_class = "${member_class}";
    console.log(member_class);

    // 클릭 이벤트 캔슬 함수
    function cancelClickEvent(links) {
    links.forEach(function(link) {
    link.addEventListener("click", function(event) {
    event.preventDefault(); // 클릭 이벤트를 캔슬합니다.
    });
    });
    }

    var class1Links = document.querySelectorAll(".class-1 a");
    var class2Links = document.querySelectorAll(".class-2 a");
    var class3Links = document.querySelectorAll(".class-3 a");
    var class4Links = document.querySelectorAll(".class-4 a");
    var sideClass1 = document.querySelectorAll(".sideBoard1")
    var sideClass2 = document.querySelectorAll(".sideBoard2")
    var sideClass3 = document.querySelectorAll(".sideBoard3")
    var sideClass4 = document.querySelectorAll(".sideBoard4")


    if (member_class === "1반") {
    cancelClickEvent(class2Links);
    cancelClickEvent(class3Links);
    cancelClickEvent(class4Links);
    cancelClickEvent(sideClass2);
    cancelClickEvent(sideClass3);
    cancelClickEvent(sideClass4);
    } else if (member_class === "2반") {
    cancelClickEvent(class1Links);
    cancelClickEvent(class3Links);
    cancelClickEvent(class4Links);
    cancelClickEvent(sideClass1);
    cancelClickEvent(sideClass3);
    cancelClickEvent(sideClass4);
    } else if (member_class === "3반") {
    cancelClickEvent(class1Links);
    cancelClickEvent(class2Links);
    cancelClickEvent(class4Links);
    cancelClickEvent(sideClass1);
    cancelClickEvent(sideClass2);
    cancelClickEvent(sideClass4);
    } else if (member_class === "4반") {
    cancelClickEvent(class1Links);
    cancelClickEvent(class2Links);
    cancelClickEvent(class3Links);
    cancelClickEvent(sideClass1);
    cancelClickEvent(sideClass2);
    cancelClickEvent(sideClass3);
    }
    });

    // calendar
           document.addEventListener('DOMContentLoaded', function() {
         var calendarEl = document.getElementById('calendar');
         var calendar = new FullCalendar.Calendar(calendarEl, {
             headerToolbar: {
                 left: 'prev,next today',
                 center: 'title',
                 right: 'dayGridMonth,timeGridWeek,timeGridDay'
             },
             initialDate: new Date(),
             navLinks: true,
             selectable: true,
             selectMirror: true,
             select: function(arg) {
                    var title = prompt('입력할 일정:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            backgroundColor: "#FFCDD2",
                            textColor: "black"

                        });

                        // 입력된 데이터를 서버로 전송
                         $.ajax({
                            type: "POST",
                            url: "/insertPlan?method=data",
                            data: JSON.stringify({
                                title: title,
                                start: arg.start,
                                end: arg.end,
                                allDay: arg.allDay
                            }), // 데이터를 JSON 형식으로 보냄
                            contentType: "application/json; charset=UTF-8",
                            dataType: "text",
                            success: function (response) {
                                // 성공적으로 서버에 데이터를 전송한 후 실행할 코드
                            },
                            error: function () {
                                // 오류 처리
                            }
                        });
                    }
                    calendar.unselect();
                },
             eventClick: function(arg) {
                 if (confirm('해당 일정을 정말로 삭제 하시겠습니까?')) {
                     arg.event.remove();
                 }
             },

             editable: true,
             locale: 'ko', // 한국 날짜 형식으로 설정
               eventRender: function(info) {
                var eventTitle = info.event.title;
                // 이벤트를 렌더링할 때 시간 대신 타이틀을 사용하도록 설정합니다.
                info.el.innerHTML = eventTitle;
            },
             events: function(info, successCallback, failureCallback) {

                 $.ajax({
                     type: "GET",
                     url: "/selectPlan?method=data",
                     dataType: "text",
                     success: function(response) {
                     console.log(response);
                         successCallback(JSON.parse(response));
                     },
                     error: function() {
                         failureCallback();
                     }
                 });
             }
         });

         calendar.render();
     });

