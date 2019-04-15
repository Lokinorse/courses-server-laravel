<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\TestQuestion;
use App\TestAnswer;
use Illuminate\Support\Facades\DB;


class Test extends Model
{
    public function questions() {
        return $this->hasMany('App\TestQuestion');
    }

    public function renderChildren() {
        
        $questions = $this->questions()->get();
    
        return new \Illuminate\Support\HtmlString(
            \Illuminate\Support\Facades\View::make("vendor.voyager.tests.questions", ['questions' => $questions])->render()
        );
    }


    public function reorder($new_order) {

        DB::beginTransaction();
        foreach ($new_order as $question_index => $question) {
            $question = (object) $question;
            $question_id = $question->id;
            if (isset($question->children)) {   
                foreach ($question->children as $answer_index => $answer) {
                    $answer = (object) $answer;
                    $answer_id = $answer->id;
                    $answer = TestAnswer::where('id', $answer->id)->first();
                    $answer->test_question_id = $question_id;
                    $answer->order = $answer_index;
                    $answer->save();
                }
            }
            $question = TestQuestion::where('id', $question->id)->first();
            $question->order = $question_index;
            $question->save();

        }
        DB::commit();
    }

    public function getJSON() {

        $questions = $this->questions()->orderBy('order')->get();

        $finalJSON = $questions->reduce(function($result, $question) {
            $result[] = [
                "question" => $question->name,
                "question_id" => $question->id,
                "answers" => $question->answers()->orderBy('order')->get()->toArray()
            ];
            return $result;
        }, []);

        return json_encode($finalJSON);
        
    }

    public function checkTestResults($testResults) {

        $max_mistakes = $this->max_mistakes;
        $questions = $this->questions()->get();

        $questionsCount = $questions->count();



        $assesment = $questions->reduce(function($result, $question) use ($testResults) {
            $userAnswerId = $testResults[$question->id];
            $userAnswer = $question->answers()->where('id', $userAnswerId)->first(); 

            $right = ($userAnswer->is_right) ? $userAnswer : $question->answers()->where('is_right', 1)->first();

            $result->push((object) [
                "question" => $question->name,
                "is_right" => $userAnswer->id == $right->id,
                "user_answer" => $userAnswer->name,
                "true_answer" => $right->name
            ]);
            return $result;
        }, collect([]));


        $rightsCount = $assesment->sum(function($result) {
            return $result->is_right;
        });


        $mistakes = $questionsCount - $rightsCount;

        return (object) [
            "is_passed" => $mistakes <= $max_mistakes,
            "answers" => $assesment,
            "mistakes" => $mistakes,
            "total_questions" => $questionsCount
        ];

    }

}
