<?php
namespace App\Utils;

use VK\Client\VKApiClient;


class VkCommunityApi
{
    public function __construct()
    {
        $this->access_token = env('VKONTAKTE_BOT_KEY');
        $this->endpoint = 'https://api.vk.com/method/';
        $this->version = '5.92';
    }
    public function vkApi_messagesSend($peer_id, $message, $attachments = array())
    {
        $vk = new VKApiClient();

        return $vk->messages()->send($this->access_token, [
            'user_id' => $peer_id,
            'random_id' => hexdec( uniqid() ),
            'message' => $message,
            'attachment' => implode(",", $attachments)
        ]);

    }

    public function vkApi_usersGet($user_id)
    {
        return $this->_vkApi_call('users.get', array(
            'user_id' => $user_id,
        ));
    }
    public function vkApi_photosGetMessagesUploadServer($peer_id)
    {
        return $this->_vkApi_call('photos.getMessagesUploadServer', array(
            'peer_id' => $peer_id,
        ));
    }
    public function vkApi_photosSaveMessagesPhoto($photo, $server, $hash)
    {
        return $this->_vkApi_call('photos.saveMessagesPhoto', array(
            'photo' => $photo,
            'server' => $server,
            'hash' => $hash,
        ));
    }
    public function vkApi_docsGetMessagesUploadServer($peer_id, $type)
    {
        return $this->_vkApi_call('docs.getMessagesUploadServer', array(
            'peer_id' => $peer_id,
            'type' => $type,
        ));
    }
    public function vkApi_docsSave($file, $title)
    {
        return $this->_vkApi_call('docs.save', array(
            'file' => $file,
            'title' => $title,
        ));
    }
    public function _vkApi_call($method, $params = array())
    {
        $params['access_token'] = $this->community_access_token;
        $params['v'] = $this->version;
        $query = http_build_query($params);
        $url = $this->endpoint . $method . '?' . $query;
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $json = curl_exec($curl);
        $error = curl_error($curl);
        if ($error) {
            ////log_error($error);
            throw new \Exception("Failed {$method} request");
        }
        curl_close($curl);
        $response = json_decode($json, true);
        dd($response);
        if (!$response || !isset($response['response'])) {
            ////log_error($json);
            throw new \Exception("Invalid response for {$method} request");
        }
        return $response['response'];
    }
    public function vkApi_upload($url, $file_name)
    {
        if (!file_exists($file_name)) {
            throw new \Exception('File not found: ' . $file_name);
        }
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, array('file' => new \CURLfile($file_name)));
        $json = curl_exec($curl);
        $error = curl_error($curl);
        if ($error) {
            //log_error($error);
            throw new \Exception("Failed {$url} request");
        }
        curl_close($curl);
        $response = json_decode($json, true);
        if (!$response) {
            throw new \Exception("Invalid response for {$url} request");
        }
        return $response;
    }
    public function uploadPhoto($user_id, $file_name)
    {
        $upload_server_response = $this->vkApi_photosGetMessagesUploadServer($user_id);
        $upload_response = $this->vkApi_upload($upload_server_response['upload_url'], $file_name);
        $photo = $upload_response['photo'];
        $server = $upload_response['server'];
        $hash = $upload_response['hash'];
        $save_response = $this->vkApi_photosSaveMessagesPhoto($photo, $server, $hash);
        $photo = array_pop($save_response);
        return $photo;
    }
}
