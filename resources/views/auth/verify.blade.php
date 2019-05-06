@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Подтверждение email-адреса</div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            Верификационная ссылка была отправлена на почту!
                        </div>
                    @endif

                    Для завершения регистрации, пройдите по ссылке, отправленной на почту.
                    Если вы не получили письмо, <a href="{{ route('verification.resend') }}">нажмите сюда, чтобы отослать повторно</a>.
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
