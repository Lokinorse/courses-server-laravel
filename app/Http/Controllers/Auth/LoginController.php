<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Socialite;
use TCG\Voyager\Models\Role;
use Carbon\Carbon;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
     */
    use AuthenticatesUsers;
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/cabinet';
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->except('logout');
    }
    public function redirectToProvider(Request $req, $provider)
    {
        return Socialite::driver($provider)->scopes(['groups'])->redirect();
    }
    public function loginProviderCallback(Request $req, $provider)
    {
        if ($req->input("state")) {
            $actionPayload = json_decode($req->input("state"));
            switch (isset($actionPayload) && $actionPayload->action) {
                case "connect_group":
                    $pjc = new ProjectController();
                    return $pjc->finishConnect($req, $actionPayload);
            }
        }
        $data = Socialite::driver($provider)->user();
        $authUser = $this->findOrCreateUser($data, $provider);
        $authUser->provider_user_id = $data->id;
        $authUser->provider_user_token = $data->token;
        $authUser->save();
        Auth::login($authUser, true);

        $autenticationPath = $req->session()->get("authentication_init_path");
        //dd($autenticationPath);
        if ($autenticationPath) {
            $req->session()->put('authentication_init_path', null);
            return redirect("/".$autenticationPath);
        }

        return redirect($this->redirectTo);
    }
    public function findOrCreateUser($data, $provider)
    {
        $authUser = User::where('provider_user_id', $data->id)->where("provider", $provider)->first();
        $user = $data->user;

        if ($authUser) {
            $authUser->provider = $provider;
            $authUser->provider_user_id = $data->id;
            $authUser->provider_user_token = $data->token;
            //$authUser->nickname = $data->nickname;
            $authUser->name = $data->name;
            $authUser->avatar = $data->avatar;
            $authUser->email = $data->email;
            $authUser->first_name = $user["first_name"];
            $authUser->last_name = $user["last_name"];
            $authUser->email_verified_at = Carbon::now();
            $authUser->save();
            return $authUser;
        }
        $role = Role::where('name', 'admin')->firstOrFail();

        return User::create([
            'provider' => $provider,
            'provider_user_id' => $data->id,
            'provider_user_token' => $data->token,
            //'nickname' => $data->nickname,
            'email_verified_at' => Carbon::now(),
            'name' => $user["first_name"] . " " . $user["last_name"],
            'avatar' => $data->avatar,
            'email' => $data->email,
            'first_name' => $user["first_name"],
            'last_name' => $user["last_name"],
            'role_id' => $role->id,
        ]);
    }
}
