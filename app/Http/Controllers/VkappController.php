<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VkappController extends Controller
{
    public function getCheatSheet() {
		return view('vkapp.cheatsheet', []);
    }
}
