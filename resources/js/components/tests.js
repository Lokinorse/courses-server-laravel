const { initModal } = require('../components/modal');

var testModal = initModal({
    name: "lessontest"
})
var currentStep = 0;

function totalSteps() {
    return window.test_questions.length
}

var results = {};

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
    
    renderButtons();

    var content = `
        <div class="test-wrapper">
            <span class="step-label">Шаг ${currentStep+1} из ${totalSteps()}</span>
            <h6>${questionTitle}</h6>
            <div class="test-radio-group">
                ${renderAnswers(currentQuestion.question_id)}
            </div>
        </div>
    `;

    renderIntoModal(content);
    

}


$(document).on("click", ".open_test", function() {
    results = {};
    currentStep = 0;
    testModal.open();
    renderTestStep()
})

function nextStep() {
    currentStep++;
    renderTestStep()
}

function prevStep() {
    currentStep--;
    renderTestStep()
}

function done() {
    console.log("ГОТОВО", results)
}

function generateButton(directionClass, text) {
    return $(`<button class="modal-actions main-button ${directionClass}">${text}</button>`)
}

function renderButtons() {

    $(testModal.dom).find(".modal-footer .actions-group").html("")

    
    console.log(getPrevStep(), getNextStep())
    if (getPrevStep()) {
        $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-prev", "Назад"))
    }
    
    if (!getNextStep()) {
        $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-done", "Завершить"))
    }
    
    if (getNextStep()) {
        $(testModal.dom).find(".modal-footer .actions-group").append(generateButton("test-next", "Далее"))
    }
    
    $(".test-next, .test-done").prop("disabled", true);

}


$(document).on("click", ".modal-lessontest .test-next", nextStep)
$(document).on("click", ".modal-lessontest .test-prev", prevStep)
$(document).on("click", ".modal-lessontest .test-done", done)

$(document).on("change", ".answer-radio", function(e) {
    var currentQuestion = getCurrentStep();
    results[currentQuestion.question_id] = e.target.value;
    $(".test-next, .test-done").prop("disabled", false);
})