@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->display_name_singular)

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->display_name_singular }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                    $display_options = $row->details->display ?? NULL;
                                    if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                    }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif
                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                    {{ $row->slugify }}
                                    <label class="control-label" for="name">{{ $row->display_name }}</label>
                                    @include('voyager::multilingual.input-hidden-bread-edit-add')
                                    @if (isset($row->details->view))
                                        @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add')])
                                    @elseif ($row->type == 'relationship')
                                        @include('voyager::formfields.relationship', ['options' => $row->details])
                                    @else
                                        {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                    @endif

                                    @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                        {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                    @endforeach
                                    @if ($errors->has($row->field))
                                        @foreach ($errors->get($row->field) as $error)
                                            <span class="help-block">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            @endforeach


                        </div><!-- panel-body -->

                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                        </div>
                    </form>



                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                                 onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
                
            </div>
        </div>
    </div>

    @if (!$add && $dataTypeContent->lesson_type == "test")
        <h1 class="page-title">
            <i class="voyager-list"></i> Редактор теста
            <div class="btn btn-success add_question_item" data-rootid="{{$dataTypeContent->id}}">Добавить вопрос</div>
            <div class="btn btn-warning add_answer_item" data-rootid="{{$dataTypeContent->id}}">Добавить ответ</div>

        </h1>
        <div class="page-content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-bordered">
                        <div class="panel-heading">
                            <p class="panel-title" style="color:#777">Перетаскивайте элементы, расположив их в нужном порядке</p>   
                        </div>
                        
                        <div class="panel-body" style="padding:30px;">
                            <div class="dd" id="unit_contents"></div>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-primary save-order">{{ __('voyager::generic.save') }}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        var selectedQuestionId = null;

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.type != 'date' || elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();




            $('#unit_contents').nestable({
                expandBtnHTML: '',
                collapseBtnHTML: ''
            });

            function changeSavedState(state) {
                if (state == "dirty") {
                    $("#unit_contents").parent().addClass("bg-warning")
                    return
                }
                $("#unit_contents").parent().removeClass("bg-warning")
            }

            $('#unit_contents').on('change', function (e) {
                changeSavedState("dirty")
            });

            function refreshContents() {
                $.get("{{ url('admin/lessons/get_test_items/'.$dataTypeContent->id) }}", function(data) {
                    $("#unit_contents").html(data)

                    if (selectedQuestionId) $("[data-questionid='"+selectedQuestionId+"']").addClass("selectedQuestion")
                    
                })
            }



            $(document).on("click", ".add_question_item", function(e) {
                console.log("test")
                var routePart = "{{ url('admin/lessons/create_question/'.$dataTypeContent->id) }}"
                $.get(routePart, function() {
                    refreshContents()
                    changeSavedState("dirty")
                })
            })

            $(document).on("click", ".add_answer_item", function(e) {
                if (!selectedQuestionId) return;
                var routePart = "{{ url('admin/lessons/create_answer/') }}"
                $.get(routePart+"/"+selectedQuestionId, function() {
                    refreshContents()
                    changeSavedState("dirty")
                })
            })

            $(document).on("mousedown", ".question_handle", function(e) {

                $(".question_handle").removeClass("selectedQuestion");
                $(this).addClass("selectedQuestion")
                selectedQuestionId = $(this).data('questionid');
            })
            
            $(document).on("click", ".answer_item_delete", function(e) {
                var res = confirm("действительно удалить?");
                if (!res) return;
                var id = $(this).data("id");
                $.ajax({
                    url: "{{ url('admin/test-answers/') }}/"+id,
                    type: 'DELETE',
                    dataType: "JSON",
                    success: function () {
                        refreshContents()
                        changeSavedState("dirty")
                    },
                    error: function() {
                        refreshContents()
                        changeSavedState("dirty")
                    }
                });
            })

            function formArrayToObject(formArray) {
                return formArray.reduce(function (acc, input) {
                    value = (input["value"] == "on") ? 1 :input["value"]; 
                    acc[input["name"]] = value;
                    
                    return acc
                }, {})
            }


            $(document).on("submit", ".test-item-change", function(event) {
                event.preventDefault();

                var datatype = $(this).data("type") 
                var id = $(this).data("id") 
                var data = formArrayToObject($(this).serializeArray());
                var prefixUrl = "{{url('/')}}"
                $.ajax({
                    url: prefixUrl + "/admin/lessons/edit_"+datatype+"/"+id,
                    type: 'POST',
                    dataType: "JSON",
                    data: data,
                    success: function () {
                        refreshContents()
                    },
                    error: function() {
                        refreshContents()
                    }
                });

            })

            $(document).on("mousedown click mouseup drag", ".test-item-change > input", function(e) {
                e.stopImmediatePropagation();
                e.stopPropagation();
                //e.preventDefault();
                console.log("TEST")
            })
            

            $(document).on("click", ".question_item_delete", function(e) {
                var res = confirm("действительно удалить?");
                if (!res) return;
                var id = $(this).data("id");
                $.ajax({
                    url: "{{ url('admin/test-questions/') }}/"+id,
                    type: 'DELETE',
                    dataType: "JSON",
                    success: function () {
                        refreshContents()
                        changeSavedState("dirty")
                    },
                    error: function() {
                        refreshContents()
                        changeSavedState("dirty")
                    }
                });
            })

            $(document).on("click", ".save-order", function(e) {
                e.preventDefault()
                var ordering = JSON.stringify($('#unit_contents').nestable('serialize'))
                console.log(ordering)
                console.log("{{ url('admin/lessons/reorderTest/'.$dataTypeContent->id) }}")
                $.ajax({
                    url: "{{ url('admin/lessons/reorderTest/'.$dataTypeContent->id) }}",
                    type: 'POST',
                    dataType: "JSON",
                    data: {order: $('#unit_contents').nestable('serialize')},
                    success: function () {
                        refreshContents()
                        changeSavedState("saved")
                    },
                    error: function() {
                        refreshContents()
                        changeSavedState("saved")
                    }
                });
            })

            refreshContents()

        });
    </script>


    <style>
        .selectedQuestion {
            border:2px solid red;
        }    
        .question-item .question_handle {
            border-left: 2px solid red;
        }
        .answer-item .dd-handle {
            border-left: 2px solid #37aff1;
        }

        .form-input {
            position: relative;
            top: 13px;
            left: 10px;
        }

        .form-input input[type="text"] {
            border: none;
            background: #eaeaea;
            width: 350px;
            border-radius: 3px;
            padding: 2px 10px;
        }

        .form-input button {
            border: none;
            background: #eaeaea;
            border-radius: 3px;
            padding: 2px 10px;
        }

    </style>
@stop
