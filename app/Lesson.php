<?php

namespace App;

use App\Message;
use App\UserLessonsProgress;
use Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\CourseLesson;

use App\Course;
use App\ProgramCourse;
use App\Program;

class Lesson extends Model
{
    public function messages()
    {
        $destination_type = "lesson";
        return Message::getMessages()->where('destination_type', $destination_type)
            ->where('target_id', $this->id)
            ->where("parent_id", 0);
    }

/*     public function rootMessages()
    {
        $destination_type = "unit";
        $target_id = $this->id;
        return Message::where('destination_type', $destination_type)
            ->where('message_type', 'comment')
            ->where('target_id', $target_id)
            ->where("parent_id", 0);
    } */

/*     public function test()
    {
        return $this->belongsTo('App\Test');
    } */

    public function getStatus($progress)
    {
        $lesson = $this;

        $status = -1; //По умолчанию открытый
        

        $currentProgress = $progress->first(function ($value, $key) use ($lesson) {

            return $value->lesson_id == $lesson->id;
        });


        //Закрытый - -3
        if (!$lesson->unlocked) {
            $status = -3;
        }

        //Если у пользователя есть прогресс по этому уроку - ставим этот прогресс в качестве статуса
        if ($currentProgress) {
            $status = $currentProgress->status;
        }

        //Если у пользователя есть прогресс (например урок открыт) но урок недоделан - ставим недоделанность
        if ($currentProgress && !$lesson->completed) {
            $status = -2;
        }

        return $status;

    }

    public function unlock()
    {

        $user = Auth::user();
        if (!$user) {
            throw new Exception("Пользователь не залогинен");
        }

        $lessonProgress = UserLessonsProgress::where('user_id', $user->id)
        ->where('lesson_id', $this->id)
        ->first();

        if ($lessonProgress) {
            return;
        }

        $progress = new UserLessonsProgress();
        $progress->user_id = $user->id;
        $progress->lesson_id = $this->id;
        $progress->status = 0;
        $progress->save();

    }
    public function complete()
    {
        $user = Auth::user();
        if (!$user) {
            throw new Exception("Пользователь не залогинен");
        }

        $progress = UserLessonsProgress::where('user_id', $user->id)
        ->where('lesson_id', $this->id)
        ->first();

        if (!$progress) $progress = new UserLessonsProgress();
        $progress->user_id = $user->id;
        $progress->lesson_id = $this->id;
        $progress->status = 1;
        $progress->save();

    }

    /* TESTS FUNCTIONALITY */
    public function questions() {
        return $this->hasMany('App\TestQuestion');
    }

    public function renderQuestions() {
        $questions = $this->questions()->get();

        return new \Illuminate\Support\HtmlString(
            \Illuminate\Support\Facades\View::make("vendor.voyager.lessons.questions", ['questions' => $questions])->render()
        );
    }

    public function getUrl() {
        $courselesson = CourseLesson::where('lesson_id', $this->id)->first();
        if (!$courselesson) return "";
        $course = Course::find($courselesson->course_id);
        if (!$course) return "";
        $programcourse = ProgramCourse::where('course_id', $course->id)->first();
        if (!$programcourse) return "";
        $program = Program::find($programcourse->program_id);
        //dd($program);

        return url($program->slug . "/" . $course->slug . '/' . $this->slug);
    }


    public function reorderTest($new_order) {

        DB::beginTransaction();
        foreach ($new_order as $question_index => $question) {
            $question = (object) $question;
            $question_id = $question->id;
            if (isset($question->children)) {   
                foreach ($question->children as $answer_index => $answer) {
                    $answer = (object) $answer;
                    $answer = TestAnswer::where('id', $answer->id)->first();
                    $answer->question_id = $question_id;
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

    public function getJSONTest() {

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
