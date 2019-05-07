<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use Illuminate\Support\Facades\Storage;
use function GuzzleHttp\json_encode;
use function GuzzleHttp\json_decode;
use Illuminate\Support\Facades\DB;
use App\Message;
use App\User;
use App\UdemyObject;
use Carbon\Carbon;
use Illuminate\Support\Str;


class FakierController extends Controller
{
    public function form()
    {

        $settings = $this->getSettingsFromFile();

        $parse_users_settings = $this->getUserSettingsFromFile();


        return view("admin.fakier-form", compact('settings', 'parse_users_settings'));
    }

    private function getSettingsFromFile()
    {
        $settings = json_decode(Storage::disk('local')->get('fakier.json'));
        return $settings;
    }

    private function make_error($msg)
    {
        $modal = [
            "header" => "Ошибка!",
            "content" => $msg,
        ];
        return redirect("fakier_form")->with("message_modal", json_encode($modal));
    }

    private function make_success($msg)
    {
        $modal = [
            "header" => "Успех!",
            "content" => $msg,
        ];
        return redirect("fakier_form")->with("message_modal", json_encode($modal));
    }

    private function changeText($text)
    {
        $text = $this->changeCharset($text);
        $text = str_replace("Colt", "Антон", $text);
        $text = str_replace("colt", "антон", $text);
        $text = str_replace("кольт", "антон", $text);
        $text = str_replace("Кольт", "антон", $text);
        $text = str_replace("Udemy", "Varilo", $text);
        $text = str_replace("udemy", "варило", $text);
        return $text;
    }

    private function changeCharset($text)
    {
        $charset = mb_detect_encoding($text);
        $text = iconv($charset, "UTF-8", $text);
        return $text;
    }

    private function translateText($text)
    {

        if (!isset($text) || trim($text) == "") return $text;
        $url = 'https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20190429T015930Z.62bcf768c391d591.defa94f5d9566425c42d89f2a01d10e36ad36e0c&text=' . urlencode($text) . '&lang=en-ru&format=html';
        $response = json_decode(file_get_contents($url, false));


        if (!$response->code == 200) return $this->changeText($text);

        $text = $response->text[0];


        return $this->changeText($text);
    }

    private function fake_user($user_data)
    {
        $user = User::where('udemy_id', $user_data->id)->first();
        if ($user) return $user;
        $user = new User();
        $user->udemy_id = $user_data->id;

        $exploded_name = explode(" ", $user_data->display_name);
        $fname = (isset($exploded_name[0])) ? $exploded_name[0] : "";
        $lname = (isset($exploded_name[1])) ? $exploded_name[1] : "";

        $user->first_name = $fname;
        $user->last_name = $lname;
        $user->avatar = $user_data->image_50x50;
        $user->nickname = $user_data->display_name;
        $user->save();
        return $user;
    }

    private function find_or_use_dummy($user_data)
    {
        $user = User::where('udemy_id', $user_data->id)->first();
        if ($user) return $user;
        $user = User::where('is_used', 0)->first();
        $user->udemy_id = $user_data->id;
        $user->is_used = 1;
        $user->save();
        return $user;
    } 

    private function create_udemy_object($object_data)
    {
        if (!$object_data) return null;
        $uobject = UdemyObject::where('udemy_id', $object_data->id)->first();
        if ($uobject) return $uobject;
        $uobject = new UdemyObject();
        $uobject->udemy_id = $object_data->id;
        $uobject->created_at = new Carbon($object_data->created);
        $uobject->updated_at = new Carbon($object_data->created);
        $uobject->title = $object_data->title;
        $uobject->object_index = $object_data->object_index;


        $uobject->save();
        return $uobject;
    }

    private function fillDB($results)
    {
        $results->each(function ($message) {
            //dd($message);
            $stored_message = Message::where("udemy_id", $message->id)->first();
            if ($stored_message) {
                $stored_message->udemy_created_at = new Carbon($message->created);
                $stored_message->save();
            }
            if (!$stored_message || trim($stored_message->udemy_text) == "") {


                //$russian_title = $this->translateText($message->title);
                $russian_title = "";
                //$russian_text = $this->translateText($message->body);
                $russian_text = "";

                $user = $this->fake_user($message->user);
                $udemy_object = $this->create_udemy_object($message->related_object);



                $stored_message = new Message();
                $stored_message->user_id = $user->id;
                $stored_message->replies_count = $message->num_replies;
                $stored_message->udemy_id = $message->id;
                $stored_message->udemy_title = $this->changeCharset($message->title);
                $stored_message->udemy_text = $this->changeCharset($message->body);
                $stored_message->text = $russian_text;
                $stored_message->title = $russian_title;
                $stored_message->destination_type = 'program';
                $stored_message->message_type = 'question';
                if ($udemy_object) {
                    $stored_message->related_udemy_object_id = $udemy_object->id;
                }
                $stored_message->created_at = new Carbon($message->created);
                $stored_message->updated_at = new Carbon($message->created);
                $stored_message->target_id = 1;
                $stored_message->save();
            }
        });
        return true;
    }

    public function save_and_run(Request $request)
    {
        $settings = (object)[
            "bearer" => $request->bearer,
            "page" => $request->page,
            "order" => $request->order,
            "page_size" => $request->page_size
        ];
        Storage::disk('local')->put('fakier.json', json_encode($settings));
        return redirect('admin/fakier/form');
    }


    public function get_messages($page = null)
    {


        $settings = $this->getSettingsFromFile();

        $url = 'https://www.udemy.com/api-2.0/courses/625204/discussions/?page_size=' . $settings->page_size . '&fields[course_discussion]=@default,user,related_object,is_following,is_instructor,num_replies,created&fields[user]=@min,image_50x50&fields[lecture]=@min,title,object_index&fields[quiz]=@min,title,object_index&fields[practice]=@min,title,object_index&page=' . $settings->page . '&ordering=' . $settings->order;
        $options = array('http' => array(
            'method'  => 'GET',
            'header' => 'Authorization: Bearer ' . $settings->bearer
        ));
        $context  = stream_context_create($options);
        $response = file_get_contents($url, false, $context);
        if (!$response) return $this->make_error("Хероывй респонс..");
        $response_json = json_decode($response);
        $results = collect($response_json->results);
        if ($results->count() < 1) return $this->make_error("Результат менее 1 поста..");

        DB::transaction(function () use ($results, $settings) {
            $this->fillDB($results);
            $settings->page = $settings->page + 1;
            Storage::disk('local')->put('fakier.json', json_encode($settings));
        });

        return $this->get_messages();
        //return redirect('admin/fakier/get_messages/'.$settings->page);

    }

    private function getUserSettingsFromFile()
    {
        $settings = json_decode(Storage::disk('local')->get('fakier_parse_users.json'));
        return $settings;
    }



    /* USERS================================================ */

    private function getUserListFromFile()
    {
        $settings = json_decode(Storage::disk('local')->get('fakier_users_list.json'));
        return $settings;
    }

    private function addUsersToFile($users)
    {
        $old = collect($this->getUserListFromFile());
        $new = $old->merge($users);
        //dd($new);
        Storage::disk('local')->put('fakier_users_list.json', $new->toJson());

        return true;
    }

    public function save_parse_users(Request $request)
    {
        $settings = (object)[
            "token" => $request->token,
            "vk_group_id" => $request->vk_group_id,
            "fields" => $request->fields,
            "offset" => $request->offset
        ];
        Storage::disk('local')->put('fakier_parse_users.json', json_encode($settings));
        return redirect('admin/fakier/form');
    }



    public function parse_users()
    {
        $parse_users_settings = $this->getUserSettingsFromFile();

        $url = 'https://api.vk.com/method/groups.getMembers?group_id=' . $parse_users_settings->vk_group_id . '&offset=' . $parse_users_settings->offset . '&count=1000&fields=' . $parse_users_settings->fields . '&access_token=' . $parse_users_settings->token . '&v=5.95&lang=ru';

        $response = json_decode(file_get_contents($url, false));
        //dd($response);
        $users = collect($response->response->items);
        $filteredUsers = $users->filter(function ($user) {
            return !isset($user->deactivated);
        })->filter(function ($user) {
            return $user->sex == 2;
        });


        $this->addUsersToFile($filteredUsers);

        $parse_users_settings->offset = $parse_users_settings->offset + 1000;
        Storage::disk('local')->put('fakier_parse_users.json', json_encode($parse_users_settings));

        return redirect('admin/fakier/parse_users');
    }

    public function flipAvatars($filteredJsonUsers) {

        $normal = $filteredJsonUsers;
        $reversed = $filteredJsonUsers->reverse();
        //$reversed = $filteredJsonUsers;

        $counter = 0;
        return $normal->map(function ($json_user, $key) use ($reversed, &$counter) {
            $u = new User();
            $avatar = $reversed->slice($counter, 1)->last()->photo_50;
            $u->first_name = $json_user->first_name;
            $u->last_name = $json_user->last_name;
            $u->bdate = $json_user->bdate;
            $u->avatar = $avatar;
            $u->name = $u->first_name . " " . $u->last_name;
            $u->nickname = '';
            $counter++;
            return $u;
        });

    }


    public function make_dummies()
    {
        $parsed_users = collect($this->getUserListFromFile());

        $over18users = $parsed_users->filter(function ($user) {
            if (!isset($user->bdate)) return false;
            $splittedDate = explode(".", $user->bdate);
            if (isset($splittedDate[2])) {
                if ((int)$splittedDate[2] > 2002) return false;
                if ((int)$splittedDate[2] < 1991) return false;
                return true;
            }
            return false;
        })->unique('id');

        $users = $this->flipAvatars($over18users);
        DB::beginTransaction();
        $users->each(function($u) {
            $u->faked = 1;
            $u->is_used = 0;
            $u->save();
        });
        DB::commit();

        return redirect('admin/fakier/form');
    }  


    public function change_users()
    {
        $parsed_users = collect($this->getUserListFromFile());

        $over18users = $parsed_users->filter(function ($user) {
            if (!isset($user->bdate)) return false;
            $splittedDate = explode(".", $user->bdate);
            if (isset($splittedDate[2])) {
                if ((int)$splittedDate[2] > 2002) return false;
                if ((int)$splittedDate[2] < 1991) return false;
                return true;
            }
            return false;
        })->unique('id')->reverse();
        //dd($over18users);
        $users = User::where('name', '')->where('faked', 1)->get();
        $users->each(function ($u, $key) use ($over18users) {
            //dd($key);

            /* 
  +"id": 48
  +"first_name": "Michael"
  +"last_name": "Mirelli"
  +"is_closed": false
  +"can_access_closed": true
  +"sex": 2
  +"bdate": "26.7"
  +"photo_50": "https://sun1-14.userapi.com/c849324/v849324365/148a63/mBPkvrjEuiI.jpg?ava=1"
            */
            $parsed = $over18users->slice($key, 1)->last();
            //dd($parsed);

            $u->faked = 1;
            //$u->first_name = $parsed->first_name;
            //$u->last_name = $parsed->last_name;
            //$u->bdate = $parsed->bdate;
            $u->avatar = $parsed->photo_50;
            $u->name = $u->first_name . " " . $u->last_name;
            $u->nickname = '';
            $u->save();
            //dd($parsed);
            //$u->first_name = 
        });

        //dd($users);


        return redirect('admin/fakier/form');
    }

    public function offset(Request $req) {
        $day_offset = (int) ($req->offset);
        $messages = Message::where("udemy_id", '!=', null)->get();
        DB::beginTransaction();
        $messages->each(function ($message)  use ($day_offset) {
            $new_date = (new Carbon($message->udemy_created_at));
            if ($day_offset > 0) {
                $new_date = $new_date->addDays($day_offset );
            } else {
                $new_date = $new_date->subDays($day_offset );
            }
            $message->created_at = $new_date;
            $message->save();

        });
        DB::commit();
        return redirect('admin/fakier/form');
    }

    private function parse_answers($parent_message, $page = 1) {

        $udemy_id = $parent_message->udemy_id;
        $settings = $this->getSettingsFromFile();
        $url = 'https://www.udemy.com/api-2.0/courses/625204/discussions/'.$udemy_id.'/replies/?fields[course_discussion_reply]=@all&fields[user]=@min,image_50x50,initials,url&page='.$page;
        $options = array('http' => array(
            'method'  => 'GET',
            'header' => 'Authorization: Bearer ' . $settings->bearer
        ));
        $context  = stream_context_create($options);
        $response = file_get_contents($url, false, $context);
        if (!$response) return $this->make_error("Хероывй респонс..");
        $response = json_decode($response);
        if (isset($response->next)) $this->parse_answers($parent_message, $page+1);
        $results = collect($response->results);
 

        $results->each(function($parsed_msg) use ($parent_message) {
            $stored_message = Message::where("udemy_id", $parsed_msg->id)->first();
            if (!isset($stored_message)) {

                $user = $this->find_or_use_dummy($parsed_msg->user);

                $user_id = ($user->id == 85) ? 1 : $user->id;


                $stored_message = new Message();
                $stored_message->parent_id = $parent_message->id;
                $stored_message->user_id = $user_id;
                $stored_message->approved = 1;
                $stored_message->udemy_id = $parsed_msg->id;
                $stored_message->udemy_text = $this->changeCharset($parsed_msg->body);
                $stored_message->text = "[ПЕРЕВЕДЕНО] " . $this->translateText($stored_message->udemy_text);
                //$stored_message->title = $russian_title;
                $stored_message->destination_type = 'question';
                $stored_message->message_type = 'answer';
                $stored_message->udemy_created_at = new Carbon($parsed_msg->created);

                $days_offset = (new Carbon($parent_message->created_at))->diffInDays($parent_message->udemy_created_at);
                $created_date = (new Carbon($parsed_msg->created))->addDays($days_offset);

                $stored_message->created_at = $created_date;
                $stored_message->updated_at = $created_date;
                $stored_message->target_id = 1;
                $stored_message->save();
            }
        });

    }

    private function autoTranslate($message) {
        $russian_title = $this->translateText($message->udemy_title);
        $russian_text = $this->translateText($message->udemy_text);
        $message->text = $russian_text;
        $message->title = $russian_title;
        return $message;
    }

    public function get_question_data($question_id) {
        $message = Message::find($question_id);
        if (!$message) return abort(404);
    
        DB::beginTransaction();

        $this->parse_answers($message);

        $message = $this->autoTranslate($message);
        $message->save();
        DB::commit();
        
        return redirect()->route("community_question", ["question_id" => $message->id]);

    }

    public function some_test_process() {

        $users = User::all();
/*         $users->each(function($u) {
            if ((float)rand()/(float)getrandmax() < 0.3) {
                $u->avatar = null;
                $u->save();
            }
        }); */

        $users->each(function($u) {
                $u->email_verified_at = new Carbon();
                $u->save();
            
        });

/*         $messages = Message::where("title", "!=", "")->orWhere('udemy_title', '!=', "")->get();
        
        $messages->each(function($m) {
            $title = $m->title; 
            if (!trim($title)) $title = $m->udemy_title;

            $m->slug = Str::slug($title, '-');
            $m->save();
        }); */
        
        return 'done';

    }


}
