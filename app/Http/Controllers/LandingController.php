<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Program;

class LandingController extends Controller
{
    public function index() {
        $program = Program::find(1);


/*         $disk = Storage::disk('gcs');
        $disk->put('1', "YO");
        dd($disk);
        $url = $disk->get('varilo/test.json');
        dd("OK");


        $d = Storage::cloud();
        Storage::cloud()->put('testooo.txt', 'Hello World');
        $test = $d->get('./test.json'); */
    	return view('landing.main', compact('program'));
    }
}
