@extends('layouts.app') 


@section('content')

<div class="container cabinet-room">
    <div class="row">
        <div class="col-md-12">
            <h1 class="program-name">Мой профиль</h1>
        </div>
    </div>
    <div class="row program-content-wrapper justify-content-center">

        <div class="col-md-4">
            <div class="program-section-header">Меню</div>
            <div class="program-menu">
                @include("cabinet.profile.menu", ["current_profile_area" => "settings"])
            </div>
        </div>

        <div class="col-md-8">
            <h2 class="program-section-header">Настройки</h2>
            <div class="row">

                <div class="col-md-12 cabinet-user-header">
                    <h1>{{Auth::user()->name}}</h1>
                </div>
            </div>

            @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif

            <div class="row">
                <div class="col-md-12">
                    <h3>Аватар</h3>
                    <img class="avatar" src="{{Auth::user()->getFallbackAva()}}" />
                    <form method="POST" enctype="multipart/form-data" action="{{route("cabinet_change_avatar")}}">
                        @csrf

                        <input class="main-input" type="file" name="avatar" />
                        <br />
                        <br />
                        <button type="submit" class="main-button">Обновить аватар</button>
                    </form>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <h3>Редактировать данные</h3>
                    <form method="POST" action="{{route("cabinet_profile_save")}}">
                        @csrf
                        <label for="first_name">Имя</label>
                        <br />
                        <input class="main-input" name="first_name" id="first_name" value="{{Auth::user()->first_name}}" />
                        <br />
                        <label for="last_name">Фамилия</label>
                        <br />
                        <input class="main-input" name="last_name" id="last_name" value="{{Auth::user()->last_name}}" />
                        <br />
                        <br />
                        <button type="submit" class="main-button">Обновить информацию</button>
                    </form>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-12">
                    @if (!Auth::user()->provider_user_id)
                    <h3>Изменить пароль</h3>
                    <form method="POST" action="{{route("cabinet_profile_password_change")}}">
                        @csrf
                        <label for="old_password">Текущий пароль</label>
                        <br />
                        <input class="main-input" name="old_password" type="password" id="old_password" />
                        <br />
                        <label for="password">Новый пароль</label>
                        <br />
                        <input class="main-input" name="password" type="password" id="password" />
                        <br />
                        <label for="password_confirmation">Еще раз новый пароль</label>
                        <br />
                        <input class="main-input" name="password_confirmation" type="password" id="password_confirmation" />
                        <br />
                        <br />
                        <button type="submit" class="main-button">Изменить пароль</button>
                    </form>
                    @endif
                </div>
            </div>

            @if (session()->get('message_modal')) @include("cabinet.modals.infomodal") @endif
        </div>

    </div>
</div>


@endsection