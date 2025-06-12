// 페이지가 모두 로드된 후 실행
window.addEventListener('load', e => {
	// 슬라이더 <ul> 요소 선택
	const sliderWrapEl = document.querySelector('ul.slider-wrap'); // ul
	// 모든 슬라이드 <li> 요소 선택
	const sliderListsEl = document.querySelectorAll('.slider-content > ul > li');
	// 슬라이드가 1개 이하일 경우 슬라이더 기능 종료
	if(sliderListsEl.length <= 1) {
		return false;
	}
	// 좌우 이동 버튼 요소 선택
	const btnLeftEl = document.querySelector('.slider-left .btn-move-left');
	const btnRightEl = document.querySelector('.slider-right .btn-move-right');
	
	/*
	  - 무한루프를 작성하기 위해 가장처음슬라이더를 복사하여 마지막에 추가하고, 
	    가장마지막슬라이더를 복사하여 처음슬라이더에추가
	*/
	const cloneFirst = sliderListsEl[0].cloneNode(true);
    const cloneLast = sliderListsEl[sliderListsEl.length - 1].cloneNode(true);
    sliderWrapEl.insertBefore(cloneLast, sliderListsEl[0]); // 맨 앞에 복사한 마지막 삽입
    sliderWrapEl.appendChild(cloneFirst); // 맨 뒤에 복사한 첫 번째 삽입
    // console.log(sliderWrapEl);
    
    // 변수 초기화  
	// 초기 설정
    const speedTime = 500; // 전환 속도(ms)
    let currentIndex = 0;  // 현재 인덱스
    let translate = 0;     // 슬라이드 이동 거리

    // setup
	// 슬라이드 전체 리스트 다시 선택 (복제본 포함됨)
    const sliderCloneListsEl = document.querySelectorAll('.slider-content > ul > li');
	// 각 슬라이드의 너비를 구함
    const itemWidth = sliderCloneListsEl[0].clientWidth;
	// 초기 위치 설정: 복제된 첫 번째 슬라이드를 고려하여 두 번째로 이동
    currentIndex = 1;
    translate = -itemWidth;
    sliderWrapEl.style.transform = `translateX(${translate}px)`
    
    // 슬라이더 실행
	// 슬라이드 이동 함수 (왼쪽/오른쪽)
    const sliderMove = index => {
		// 인덱스 및 위치 조정
		currentIndex += (-1 * index);
		translate += itemWidth * index;
		// 실제로 슬라이드 이동 (transform 이용)
		sliderWrapEl.style.transform = `translateX(${translate}px)`;
		sliderWrapEl.style.transition = `all ${speedTime}ms ease`;
			// transition : 엘리먼트를 transform(변형) 시키는데 걸리는 시간 설정
    };

    // 이전
	// 왼쪽 이동 버튼 클릭 시 실행
	const sliderPrevious = () => {
		sliderMove(1); // 오른쪽으로 한 칸 이동

		// 처음슬라이더에서 복사한마지막슬라이더로 넘어가는 순간, 
		//   애니메이션 적용을 제거하고 마지막슬라이더위치로 옮겨서 출력
		if (currentIndex === 0) {
			setTimeout(() => {
				sliderWrapEl.style.transition = 'none'; // 애니메이션 제거
				currentIndex = sliderCloneListsEl.length - 2; // 실제 마지막 인덱스
				translate = -(itemWidth * currentIndex);
				sliderWrapEl.style.transform = `translateX(${translate}px)`; // 위치 재설정
			}, speedTime);
		}
	};

	// 다음
	// 오른쪽 이동 버튼 클릭 시 실행
	const sliderNext = () => {
		sliderMove(-1); // 왼쪽으로 한 칸 이동

		// 마지막슬라이더에서 복사한처음슬라이더로 넘어가는 순간, 
		//   애니메이션 적용을 제거하고 처음슬라이더위치로 옮겨서 출력
		if (currentIndex === sliderCloneListsEl.length -1)
			setTimeout(() => {
				sliderWrapEl.style.transition = 'none'; // 애니메이션 제거
				currentIndex = 1; // 두 번째(실제 첫 번째)로 이동
				translate = -itemWidth;
				sliderWrapEl.style.transform = `translateX(${translate}px)`;
          }, speedTime);		
	};
	// 좌우 버튼 이벤트 등록
	btnLeftEl.addEventListener('click', e => {
		sliderPrevious();
	});

	btnRightEl.addEventListener('click', e => {
		sliderNext();
	});
	// 자동 슬라이드 (3초마다)
	setInterval(function(){
		sliderNext();
	}, 3000);
});
