    document.addEventListener("DOMContentLoaded", function() {
        // box-list 정렬
        var boxCount = 0;
        var boxes = document.querySelectorAll('.box1');

        if (boxes.length > 0) {
            // 상태 변수를 사용하는 로직 수정 필요
            // 예: if (status.index % 4 === 3 || status.last) {
            // 위의 예시처럼 status.index와 status.last 값을 어떤 변수로 대체해야 합니다.
            if (status.index % 4 === 3 || status.last) {
                boxes[boxCount].parentNode.classList.add('box-row');
                boxCount++;
            }
        }
});
        // 검색 기능
        $(document).ready(function() {
            let originalBoxes = $('.box-list .box').clone(); // 처음 로드된 박스들을 복사하여 저장

            $('.search-button').click(function() {
                performSearch();
            });

            $('.search-input').keyup(function(event) {
                if (event.keyCode === 13) { // Enter 키를 눌렀을 때
                    performSearch();
                }
            });

            // 박스 클릭 이벤트 리스너 추가
            $('.box-list .box').click(function() {
                let boxTitle = $(this).find('h2').text();
                let boxContent = $(this).find('p').text();
                let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
                window.location.href = detailURL;
            });

            function performSearch() {
                let searchKeyword = $('.search-input').val().toLowerCase();
                let matchingBoxes = [];

                originalBoxes.each(function() {
                    let boxTitle = $(this).find('h2').text().toLowerCase();
                    if (boxTitle.includes(searchKeyword)) {
                        matchingBoxes.push($(this));
                    }
                });

                $('.box-list').empty(); // 이전 검색 결과를 제거

                matchingBoxes.forEach(function(box) {
                    $('.box-list').append(box);
                });

                // 필터링된 결과에 대한 박스 클릭 이벤트 리스너 추가
                $('.box-list .box').click(function() {
                    let boxTitle = $(this).find('h2').text();
                    let boxContent = $(this).find('p').text();
                    let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
                    window.location.href = detailURL;
                });

                 document.getElementById("write-button").addEventListener("click", function() {
                        // 글작성 페이지의 URL로 이동
                        window.location.href = "글작성페이지URL";
                    });
            }
        });

