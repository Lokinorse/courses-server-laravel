const { initModal } = require('../components/modal');

var currentStep = 0;
var results = {};



/* var testModal = initModal({
    name: "lessontest"
}) */

testModal = {
    dom: $("#test-wrapper")[0]
}



function totalSteps() {
    return window.test_questions.length
}


function getCurrentStep() {
    return window.test_questions[currentStep];
}
function getNextStep() {
    return window.test_questions[currentStep+1];
}

function getPrevStep() {
    return window.test_questions[currentStep-1];
}

function renderIntoModal(content) {
    $(testModal.dom).find(".modal-content").html("")
    if (typeof content === "string") {
        return $(testModal.dom).find(".modal-content").html(content)
    }
    $(testModal.dom).find(".modal-content").append(content)
}

function renderAnswers(question_id) {
    var answers = getCurrentStep().answers;
    var selectedValue = (results[question_id]) ? results[question_id] : null;
    if (!answers) return "";
    return answers.reduce(function(acc, answer) {
        var isChecked = "";

        if (selectedValue == answer.id) {
            isChecked = "checked";
             $(".test-next, .test-done").prop("disabled", false);
        }

        return acc + `
            <p>
                <input type="radio" id="ans${answer.id}" class="answer-radio" ${isChecked} name="answer" value="${answer.id}"/>
                <label for="ans${answer.id}">${answer.name}</label>
            </p>
        `
    }, "")
}

function renderTestStep() {
    
    var currentQuestion = getCurrentStep();
    var questionTitle = currentQuestion.question; 
    

    renderButtons(["prev", "next", "done"])

    var content = `
        <div class="test-wrapper">
            <span class="step-label">Шаг ${currentStep+1} из ${totalSteps()}</span>
            <h6>Вопрос: ${questionTitle}</h6>
            <div class="test-radio-group">
                ${renderAnswers(currentQuestion.question_id)}
            </div>
        </div>
    `;

    renderIntoModal(content);
    

}




function nextStep() {
    currentStep++;
    renderTestStep()
}

function prevStep() {
    currentStep--;
    renderTestStep()
}

function setCircularProgress(current, total) {
    var element = $('.circularProgress');
    var textElement = $('.circularProgress__overlay');
    
    window.setPercentage = function setPercentage(p){
      element[0].className = 'circularProgress --' + p;
      
    }
    textElement.text(`${current} из ${total}`);
    var percent = 0;
    if (current>0 && total>0) percent = current / total*100;

    var animationPercent = 0;

    var int = setInterval(() => {
        animationPercent++;
        window.setPercentage(animationPercent);
        if (animationPercent==percent) clearInterval(int);
    }, 10)
}

function renderFailure(res) {
    var content = `
        <div class="test-result-wrapper">
            <div class="circularProgress">
                <div class="circularProgress__overlay"></div>
            </div>
            <h3>Это провал!</h3>
            <span>Чтобы открыть следующий урок, ты должен пройти этот тест еще раз</span>
        </div>
    `;
    renderIntoModal(content);
    var current = res.total_questions - res.mistakes 
    setCircularProgress(current, res.total_questions);
    renderButtons(["refresh"])
}

function renderSuccess(res) {
    var content = `
        <div class="test-result-wrapper">
            <div class="circularProgress">
                <div class="circularProgress__overlay"></div>
            </div>
            <h3>Это успех!</h3>
            <span>Ты открыл новый урок! Можешь перейти к разблокированному уроку.</span>
        </div>
    `;
    renderIntoModal(content);
    var current = res.total_questions - res.mistakes 
    setCircularProgress(current, res.total_questions);
    renderButtons(["refresh", "goto_lesson"])
}

function done() {
    if (!window.currentProgram || !window.currentLesson) return;
    $.ajax({
        url: `/processTest/${window.currentProgram.id}/${window.currentLesson.id}`,
        data: {testresult: results},
    }).done(function(res) {
        if (!res) return;
        return (res.is_passed) ? renderSuccess(res) : renderFailure(res);        
    })
}

function generateButton(directionClass, text) {
    return $(`<button class="modal-actions main-button ${directionClass}">${text}</button>`)
}



function renderButtons(buttons) {

    $(testModal.dom).find(".modal-footer .actions-group").html("")
    $.each(buttons, (key, button) => {
        console.log(button)
        switch (button) {
            case "prev":
                if (getPrevStep()) $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-prev", "Назад"))
                break;
            case "done":
                if (!getNextStep()) $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-done", "Завершить"))
                break;
            case "next":
                if (getNextStep()) $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-next", "Далее"))
                break;
            case "refresh":
                $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-refresh", "Перепройти"))
                break;
            case "goto_lesson":
                $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-goto", "Перейти к уроку"))
                break;
        }
    })


    $(".test-next, .test-done").prop("disabled", true);
}

function testTesting() {
    /* TEST */
    results = {4: "9", 15: "11", 16: "22", 17: "18", 18: "24"}
    /* TEST */
    //testModal.open();
    done()
}
//testTesting();

function initTest() {
    results = {};
    currentStep = 0;
    //testModal.close();
    //testModal.open();
    renderTestStep()
}

$(document).on("click", "#test-wrapper .test-next", nextStep)
$(document).on("click", "#test-wrapper .test-prev", prevStep)
$(document).on("click", "#test-wrapper .test-done", done)
$(document).on("click", "#test-wrapper .test-refresh", initTest)
$(document).on("click", "#test-wrapper .test-goto", function() {
    window.location = nextLessonUrl
})


$(document).on("change", ".answer-radio", function(e) {
    var currentQuestion = getCurrentStep();
    results[currentQuestion.question_id] = e.target.value;
    $(".test-next, .test-done").prop("disabled", false);
})

$(document).on("click", ".test-radio-group p", function() {
    $(this).find("input").prop('checked', true).trigger('change');
})


if (currentLesson && currentLesson.lesson_type == 'test' && (typeof test_questions != 'undefined')) initTest();