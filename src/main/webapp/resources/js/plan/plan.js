   document.addEventListener("DOMContentLoaded", function() {
    const calendarGrid = document.getElementById("calendar-grid");
    const monthYear = document.getElementById("month-year");
    const prevMonthButton = document.getElementById("prev-month");
    const nextMonthButton = document.getElementById("next-month");
    const modal = document.getElementById("modal");
    const attendanceButton = document.getElementById("attendance-button");
    const modalBackdrop = document.querySelector(".modal-backdrop");
    const currentTimeDisplay = document.getElementById("current-time");
    const currentDate = new Date();

const todoInputElem = document.querySelector('.todo-input');
const todoListElem = document.querySelector('.todo-list');
const completeAllBtnElem = document.querySelector('.complete-all-btn');
const leftItemsElem = document.querySelector('.left-items')
const showAllBtnElem = document.querySelector('.show-all-btn');
const showActiveBtnElem = document.querySelector('.show-active-btn');
const showCompletedBtnElem = document.querySelector('.show-completed-btn');
const clearCompletedBtnElem = document.querySelector('.clear-completed-btn');

    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();
    let markedDates = [];
    let events = {};
    let selectedDate = null;


//--------------캘린더-------------------------
function renderCalendar() {
    const firstDayOfMonth = new Date(currentYear, currentMonth, 1).getDay();
    const lastDayOfMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

    monthYear.textContent = `${currentYear}년 ${currentMonth + 1}월`;

    calendarGrid.innerHTML = "";

    for (let i = 0; i < firstDayOfMonth; i++) {
        const emptyCell = document.createElement("div");
        emptyCell.classList.add("empty-cell");
        calendarGrid.appendChild(emptyCell);
    }

    for (let day = 1; day <= lastDayOfMonth; day++) {
        const dateCell = document.createElement("div");
        dateCell.textContent = day;
        dateCell.classList.add("date-cell");

//------출석체크 기능-------------

dateCell.addEventListener("click", () => {
    const isAlreadyAttended = dateCell.classList.contains("attended");

    if (!isAlreadyAttended) {
        attendanceButton.onclick = () => {
            dateCell.classList.add("attended");
            closeModal();

            alert("출석이 완료되었습니다.");

            attendanceButton.onclick = null; // 이벤트 리스너 해제
        };
             
    } else {
        alert("이미 출석이 완료되었습니다.");
    }
   
});
        calendarGrid.appendChild(dateCell);
    }
}
    function updateEventList() {
        eventListElement.innerHTML = "";  // 기존 목록 삭제

        for (const date in events) {  // 모든 날짜에 대해 반복
            for (const title of events[date]) {  // 해당 날짜의 모든 이벤트에 대해 반복
                const listItem = document.createElement("li");
                listItem.textContent = `${date}: ${title}`;
                eventListElement.appendChild(listItem);
            }
        }
    }
//------출석체크 기능 끝----------

//------이전달/다음달----------
function slideCalendar(direction) {
    const outerGrid = document.querySelector(".calendar-board");

    if (direction === "left") {
        outerGrid.style.transform = `translateX(-10%)`;
    } else if (direction === "right") {
        outerGrid.style.transform = `translateX(10%)`;
    }

    setTimeout(() => {
        outerGrid.style.transition = "transform 0.8s ease";
        outerGrid.style.transform = "translateX(0)";
    }, 0);

    setTimeout(() => {
        outerGrid.style.transition = ""; // 트랜지션을 초기화하여 다음 슬라이드를 위해 준비
    }, 500);
}
prevMonthButton.addEventListener("click", () => {
    if (!prevMonthButton.disabled) {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        slideCalendar("left"); // 슬라이드 방향을 오른쪽으로 설정하여 넘어가도록 함
        renderCalendar();
    }
});

nextMonthButton.addEventListener("click", () => {
    if (!nextMonthButton.disabled) {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        slideCalendar("right"); // 슬라이드 방향을 왼쪽으로 설정하여 넘어가도록 함
        renderCalendar();
    }
});
renderCalendar();
//------이전달/다음달 끝----------

//----------modal창------------------------------------
 function openModal() {
    modal.style.display = "flex";
}

function closeModal() {
    modal.style.display = "none";
}

function closeOnEscKey(event) {
    if (event.key === "Escape") {
        closeModal();
    }
}

function closeOnOutsideClick(event) {
    if (event.target === modal || event.target === modalBackdrop) {
        closeModal();
    }
}

calendarGrid.addEventListener("click", (event) => {
    if (event.target.classList.contains("date-cell")) {
        if (!event.target.classList.contains("attended")) { // 출석이 완료되지 않은 경우에만 모달 창을 엽니다.
            openModal();
            toggleAttendance(event.target);
        }
        
    }
});
modal.addEventListener("click", closeOnOutsideClick);
document.addEventListener("keydown", closeOnEscKey);
//----------modal창 끝---------------------------------
function addTodoWithDate(text) {
    const currentDate = new Date();
    const dateString = `${currentDate.getFullYear()}-${currentDate.getMonth() + 1}-${currentDate.getDate()}`;
    const todoText = `${dateString}: ${text}`;
      const todoItemElem = document.createElement('li');
        todoItemElem.textContent = todoText;

        // Todo 목록에 추가
        todoListElem.appendChild(todoItemElem);
    }

let id = 0;
const setId = (newId) => {id = newId};

let isAllCompleted = false; // 전체 todos 체크 여부
const setIsAllCompleted = (bool) => { isAllCompleted = bool};

let currentShowType = 'all'; // all  | active | complete
const setCurrentShowType = (newShowType) => currentShowType = newShowType

let todos = [];
const setTodos = (newTodos) => {
    todos = newTodos;
}

const getAllTodos = () => {
    return todos;
}
const getCompletedTodos = () => {
    return todos.filter(todo => todo.isCompleted === true );
}
const getActiveTodos = () => {
    return todos.filter(todo => todo.isCompleted === false);
}

const setLeftItems = () => {
    const leftTodos = getActiveTodos()
    leftItemsElem.innerHTML = `${leftTodos.length} items left`
}

const completeAll = () => {
    completeAllBtnElem.classList.add('checked');
    const newTodos = getAllTodos().map(todo => ({...todo, isCompleted: true }) )
    setTodos(newTodos)
}

const incompleteAll = () => {
    completeAllBtnElem.classList.remove('checked');
    const newTodos =  getAllTodos().map(todo => ({...todo, isCompleted: false }) );
    setTodos(newTodos)
}

// 전체 todos의 check 여부 (isCompleted)
const checkIsAllCompleted = () => {
    if(getAllTodos().length === getCompletedTodos().length ){
        setIsAllCompleted(true);
        completeAllBtnElem.classList.add('checked');
    }else {
        setIsAllCompleted(false);
        completeAllBtnElem.classList.remove('checked');
    }
}

const onClickCompleteAll = () => {
    if(!getAllTodos().length) return; // todos배열의 길이가 0이면 return;

    if(isAllCompleted) incompleteAll(); // isAllCompleted가 true이면 todos를 전체 미완료 처리
    else completeAll(); // isAllCompleted가 false이면 todos를 전체 완료 처리
    setIsAllCompleted(!isAllCompleted); // isAllCompleted 토글
    paintTodos(); // 새로운 todos를 렌더링
    setLeftItems()
}

const appendTodos = (text) => {
    const newId = id + 1; // 기존에 i++ 로 작성했던 부분을 setId()를 통해 id값을 갱신하였다.
    setId(newId)
    const newTodos = getAllTodos().concat({id: newId, isCompleted: false, content: text })
    // const newTodos = [...getAllTodos(), {id: newId, isCompleted: false, content: text }]
    setTodos(newTodos)
    setLeftItems()
    checkIsAllCompleted();
    paintTodos();
}

const deleteTodo = (todoId) => {
    const newTodos = getAllTodos().filter(todo => todo.id !== todoId );
    setTodos(newTodos);
    setLeftItems()
    paintTodos()
}

const completeTodo = (todoId) => {
    const newTodos = getAllTodos().map(todo => todo.id === todoId ? {...todo,  isCompleted: !todo.isCompleted} : todo )
    setTodos(newTodos);
    paintTodos();
    setLeftItems()
    checkIsAllCompleted();
}

const updateTodo = (text, todoId) => {
    const currentTodos = getAllTodos();
    const newTodos = currentTodos.map(todo => todo.id === todoId ? ({...todo, content: text}) : todo);
    setTodos(newTodos);
    paintTodos();
}

const onDbclickTodo = (e, todoId) => {
    const todoElem = e.target;
    const inputText = e.target.innerText;
    const todoItemElem = todoElem.parentNode;
    const inputElem = document.createElement('input');
    inputElem.value = inputText;
    inputElem.classList.add('edit-input');
    inputElem.addEventListener('keypress', (e)=>{
        if(e.key === 'Enter') {
            updateTodo(e.target.value, todoId);
            document.body.removeEventListener('click', onClickBody );
        }
    })

    const onClickBody = (e) => {
        if(e.target !== inputElem)  {
            todoItemElem.removeChild(inputElem);
            document.body.removeEventListener('click', onClickBody );
        }
    }

    document.body.addEventListener('click', onClickBody)
    todoItemElem.appendChild(inputElem);
}

const clearCompletedTodos = () => {
    const newTodos = getActiveTodos()
    setTodos(newTodos)
    paintTodos();
}

const paintTodo = (todo) => {
    const todoItemElem = document.createElement('li');
    todoItemElem.classList.add('todo-item');

    todoItemElem.setAttribute('data-id', todo.id );

    const checkboxElem = document.createElement('div');
    checkboxElem.classList.add('checkbox');
    checkboxElem.addEventListener('click', () => completeTodo(todo.id))

    const todoElem = document.createElement('div');
    todoElem.classList.add('todo');
    todoElem.addEventListener('dblclick', (event) => onDbclickTodo(event, todo.id))
    todoElem.innerText = todo.content;

    const delBtnElem = document.createElement('button');
    delBtnElem.classList.add('delBtn');
    delBtnElem.addEventListener('click', () =>  deleteTodo(todo.id))
    delBtnElem.innerHTML = 'X';

    if(todo.isCompleted) {
        todoItemElem.classList.add('checked');
        checkboxElem.innerText = '✔';
    }

    todoItemElem.appendChild(checkboxElem);
    todoItemElem.appendChild(todoElem);
    todoItemElem.appendChild(delBtnElem);

    todoListElem.appendChild(todoItemElem);
}

const paintTodos = () => {
    todoListElem.innerHTML = '';

    switch (currentShowType) {
        case 'all':
            const allTodos = getAllTodos();
            allTodos.forEach(todo => { paintTodo(todo);});
            break;
        case 'active':
            const activeTodos = getActiveTodos();
            activeTodos.forEach(todo => { paintTodo(todo);});
            break;
        case 'completed':
            const completedTodos = getCompletedTodos();
            completedTodos.forEach(todo => { paintTodo(todo);});
            break;
        default:
            break;
    }
}

const onClickShowTodosType = (e) => {
    const currentBtnElem = e.target;
    const newShowType = currentBtnElem.dataset.type;

    if ( currentShowType === newShowType ) return;

    const preBtnElem = document.querySelector(`.show-${currentShowType}-btn`);
    preBtnElem.classList.remove('selected');

    currentBtnElem.classList.add('selected')
    setCurrentShowType(newShowType)
    paintTodos();
}

const init = () => {
    todoInputElem.addEventListener('keypress', (e) =>{
        if( e.key === 'Enter' ){
            appendTodos(e.target.value); todoInputElem.value ='';
        }
    })
    completeAllBtnElem.addEventListener('click',  onClickCompleteAll);
    showAllBtnElem.addEventListener('click', onClickShowTodosType);
    showActiveBtnElem.addEventListener('click',onClickShowTodosType);
    showCompletedBtnElem.addEventListener('click',onClickShowTodosType);
    clearCompletedBtnElem.addEventListener('click', clearCompletedTodos);
    setLeftItems()
}

init()
});