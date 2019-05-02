<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Lesson;

class JsonController extends Controller
{
    public function search($entity_name, Request $request) {
        $search = $request->search;
        $search = trim($search);
        if (strlen($search) <=2 ) return json_encode([]);
        
        switch ($entity_name) {
            case 'lesson':
                    $lessons = Lesson::where('name', 'like', '%'.$search.'%')->get();

                    return json_encode($lessons);
                break;
            
            default:
                # code...
                break;
        }
    }
}
