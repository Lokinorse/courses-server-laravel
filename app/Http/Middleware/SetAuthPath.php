<?php

namespace App\Http\Middleware;

use Closure;

class SetAuthPath
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //dd("TEST");
        if (strpos($request->path(), "cabinet") !== false || strpos($request->path(), "community") !== false || strpos($request->path(), "js-razrabotchik") !== false) {
            //var_dump("DONE" . $request->path());
            $request->session()->put('authentication_init_path', $request->path());
        }
    
        return $next($request);
    }
}
