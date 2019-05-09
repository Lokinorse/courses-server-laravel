

@extends('layouts.app')


@section('content')


<div class="container cabinet-room">
    @include('cabinet.profile.header')
    <div class="row program-content-wrapper justify-content-center">


        <div class="col-md-4">
            <div class="program-menu">
                @include("cabinet.profile.menu", ["current_profile_area" => "transactions"])
            </div>
        </div>
        
        <div class="col-md-8">
            <h2 class="program-section-header">Транзакции</h2>
            @if ($transactions->count() > 0) 
                <table class="table-responsive table-striped">
                    <thead>
                        <tr>
                            <th>Дата</th>
                            <th>Описание</th>
                            <th>Сумма</th>
                            <th>Состояние</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($transactions as $transaction) 
                        <tr>
                            <td>{{$transaction->payed_at ? $transaction->payed_at : $transaction->created_at}}</td>
                            <td>{{$transaction->description}}</td>
                            <td>{{$transaction->value}}р.</td>
                            <td>{{$transaction->status ? "Проведено" : "Ошибка"}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            @else 
                <i>Пока еще нету платежей</i>
            @endif 
        </div>
    </div>
</div>



@endsection


