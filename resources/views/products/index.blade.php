@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-12">
                {!! $dataTable->table(['style'=>'width:100%;','class'=>'table table-striped table-bordered'], true)!!}
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    {{$dataTable->scripts()}}
    <script>
        $data = [1, -1, 3, -4, 5, -2, 7, 4, 2];
        let $newArray = []
        $(document).ready(function () {
            sorting()
        })

        function sorting() {
            $data.forEach(function (element) {
                $negative = -element
                $test = $data.find(function (el) {

                });

                if (jQuery.inArray($negative, $data) !== -1) {
                    if (element > 0) {
                        $newArray.push(element)
                    }
                }
            })
            console.log($newArray.sort())
        }

    </script>
@endpush
