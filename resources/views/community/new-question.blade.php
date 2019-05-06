@extends('layouts.app')

@section('content')





<div class="container cabinet-room">

    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">Задать свой вопрос</h1>
        </div>
    </div>

    @include('community.parts.new-message-wrapper', [
        "message" => [
            "destination_type" => "program",
            "target_id" => "1",
            "message_type" => "question",
            "message_id" => "new",
            "parent_id" => 0,
        ]
    ])

</div>



@endsection



@section('custom-admin-script')

@include('community.parts.admin-scripts')

<script>
    createEditor("new");
</script>


@endsection 