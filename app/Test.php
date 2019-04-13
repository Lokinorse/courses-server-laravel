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

        $questions = $this->questions()->get();

        $finalJSON = $questions->reduce(function($result, $question) {
            $result[] = [
                "question" => $question->name,
                "question_id" => $question->id,
                "answers" => $question->answers()->get()->toArray()
            ];
            return $result;
        }, []);

        return json_encode($finalJSON);
        
    }

}
