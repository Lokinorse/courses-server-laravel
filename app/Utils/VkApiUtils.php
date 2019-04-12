<?php
namespace App\Utils;

use Auth;
use Illuminate\Database\Eloquent\Collection;
use VK\Client\VKApiClient;
use VK\OAuth\Scopes\VKOAuthGroupScope;
use VK\OAuth\VKOAuth;
use VK\OAuth\VKOAuthDisplay;
use VK\OAuth\VKOAuthResponseType;

class VkApiUtils
{
    public function __construct()
    {
        $this->vk = new VKApiClient();
        $this->oauth = new VKOAuth();
        $this->app_id = getenv("VKONTAKTE_KEY");
        $this->app_redirect_uri = getenv("VKONTAKTE_REDIRECT_URI");
        $this->app_secret = getenv("VKONTAKTE_SECRET");
    }
    public function reportError($message, $init = null)
    {
        if ($init) {
            dd($init);
        }

        dd($message);
        abort(403);
    }
    public function communityTokenAccessRedirect($group_id)
    {
        $display = VKOAuthDisplay::PAGE;
        $scope = array(
            VKOAuthGroupScope::MESSAGES,
            VKOAuthGroupScope::MANAGE,
            VKOAuthGroupScope::PHOTOS,
            VKOAuthGroupScope::DOCS,
        );
        $jsonAction = [
            "action" => "connect_group",
            "group_id" => $group_id,
        ];
        $state = json_encode($jsonAction);
        $groups_ids = array($group_id);
        $browser_url = $this->oauth->getAuthorizeUrl(
            VKOAuthResponseType::CODE,
            $this->app_id,
            $this->app_redirect_uri,
            $display,
            $scope,
            $state,
            $groups_ids
        );
        if (!isset($browser_url)) {
            return "Что-то пошло не так на этапе получения редиректа";
        }
        return redirect($browser_url);
    }
    public function getCommunityAccessToken($access_code, $group_id)
    {
        $request_params["client_id"] = getenv("VKONTAKTE_KEY");
        $request_params["client_secret"] = getenv("VKONTAKTE_SECRET");
        $request_params["redirect_uri"] = getenv("VKONTAKTE_REDIRECT_URI");
        $request_params["code"] = $access_code;
        $get_params = http_build_query($request_params);
        $resp = file_get_contents('https://oauth.vk.com/access_token?' . $get_params);
        $resp = json_decode($resp);
        if (isset($resp->expires_in)) {
            $tokenString = "access_token_" . $group_id;
            $community_access_token = $resp->$tokenString;
            return $community_access_token;
        }
        return $this->reportError('Не удается получить community access token.');
    }
    public function getGroupInfo($group_id)
    {
        $user = Auth::user();
        $access_token = $user->provider_user_token;
        $groups = $this->vk->groups()->getById($access_token, array(
            "group_id" => $group_id,
            "extended" => true,
        ));
        if (!isset($groups[0])) {
            return $this->reportError('Не удается получить расширенную информацию о группе.');
        }
        return $groups[0];
    }
    public function getUserAdminGroups()
    {
        $user = Auth::user();
        $access_token = $user->provider_user_token;
        $groups = $this->vk->groups()->get($access_token, array(
            "extended" => true,
            "count" => 1000,
            "filter" => ["admin"],
        ));
        if (!isset($groups["items"])) {
            return $this->reportError('Не удается получить группы пользователя.');
        }
        return $groups;
    }
    public function addOrEditCommunityCallbackServer($community_access_token, $group_id, $community_callback_secret, $project_id, $server_id)
    {
        $request_params["group_id"] = $group_id;
        $request_params["url"] = getenv("APP_URL") . "/api/projects/{$project_id}/bot";
        $request_params["title"] = "Botilo serverr";
        $request_params["secret_key"] = $community_callback_secret;
        $request_params["access_token"] = $community_access_token;
        $request_params["v"] = '5.69';
        $method = "groups.addCallbackServer";
        if ($server_id) {
            $request_params["server_id"] = $server_id;
            $method = "groups.editCallbackServer";
        }
        $resp = file_get_contents('https://api.vk.com/method/' . $method . '?' . http_build_query($request_params));
        $resp = json_decode($resp);
        if (!isset($resp) || isset($resp->error)) {
            return $this->reportError('Не удается добавить callback api server.');
        }

        if ($server_id) {
            return $server_id;
        }

        if (isset($resp->response->server_id)) {
            return $resp->response->server_id;
        }

        return $this->reportError('Не удается добавить callback api server.');
    }
    public function getCommunityCallbackServerId($community_access_token, $group_id)
    {
        $request_params["group_id"] = $group_id;
        $request_params["server_ids"] = array();
        $request_params["access_token"] = $community_access_token;
        $request_params["v"] = '5.92';
        $get_params = http_build_query($request_params);
        $resp = file_get_contents('https://api.vk.com/method/groups.getCallbackServers?' . $get_params);
        $resp = json_decode($resp);
        if (isset($resp) && isset($resp->response->items)) {
            $server = (new Collection($resp->response->items))->first(function ($server) {
                return $server->title == "Botilo serverr";
            });
            if (isset($server)) {
                return $server->id;
            }

        }
        return false;
    }
    public function configureCommunityCallbackServer($community_access_token, $group_id, $community_callback_secret, $project_id, $server_id)
    {
        $request_params["group_id"] = $group_id;
        $request_params["server_id"] = $server_id;
        $request_params["message_new"] = 1;
        $request_params["message_reply"] = 1;
        $request_params["message_allow"] = 1;
        $request_params["api_version"] = "5.92";
        $request_params["lead_forms_new"] = 1;
        $request_params["audio_new"] = 0;
        $request_params["access_token"] = $community_access_token;
        $request_params["v"] = '5.92';
        $get_params = http_build_query($request_params);
        $resp = file_get_contents('https://api.vk.com/method/groups.setCallbackSettings?' . $get_params);
        $resp = json_decode($resp);
        if (isset($resp) && isset($resp->response)) {
            return true;
        }
        return $this->reportError('Не удается отконфигурировать сервер.');
    }
    public function deleteCommunityCallbackServer($community_access_token, $group_id, $server_id)
    {
        $request_params["group_id"] = $group_id;
        if (!$server_id) {
            $this->reportError('Не задан $server_id.');
        }

        $request_params["server_id"] = $server_id;
        $request_params["access_token"] = $community_access_token;
        $request_params["v"] = '5.92';
        $get_params = http_build_query($request_params);
        $resp = file_get_contents('https://api.vk.com/method/groups.deleteCallbackServer?' . $get_params);
        $resp = json_decode($resp);
        if (isset($resp) && isset($resp->response)) {
            return true;
        }
        if (isset($resp) && isset($resp->error)) {
            if ($resp->error->error_code == 104) {
                return true;
            }

        }
        return $this->reportError('Не удается удалить сервер.', $resp);
    }
    public function setCommunityCallbackServer($community_access_token, $group_id, $community_callback_secret, $project_id)
    {
        $server_id = $this->getCommunityCallbackServerId(
            $community_access_token,
            $group_id
        );
        $server_id = $this->addOrEditCommunityCallbackServer(
            $community_access_token,
            $group_id,
            $community_callback_secret,
            $project_id,
            $server_id
        );
        $this->configureCommunityCallbackServer($community_access_token, $group_id, $community_callback_secret, $project_id, $server_id);
        return $server_id;
    }
    public function getCallbackConfirmationCode($community_access_token, $group_id)
    {

        $request_params["group_id"] = $group_id;
        $request_params["access_token"] = $community_access_token;
        $request_params["v"] = '5.92';
        $get_params = http_build_query($request_params);
        $resp = file_get_contents('https://api.vk.com/method/groups.getCallbackConfirmationCode?' . $get_params);
        $resp = json_decode($resp);
        if (isset($resp) && isset($resp->response->code)) {
            return $resp->response->code;
        }
        return $this->reportError('Не удается получить код подтверждения.');
    }
    public function isTokenValid($community_access_token)
    {

        $request_params["access_token"] = $community_access_token;
        $request_params["v"] = '5.69';
        $get_params = http_build_query($request_params);
        $resp = file_get_contents('https://api.vk.com/method/groups.getTokenPermissions?' . $get_params);
        $resp = json_decode($resp);
        if (isset($resp) && !isset($resp->error)) {
            return true;
        }

        return false;
    }
}
