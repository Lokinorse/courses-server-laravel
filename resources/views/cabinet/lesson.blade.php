<h1>{{$lesson->name}}</h1>

@if ($lesson->id == 1) 
	<video id="my-video" class="video-js" controls preload="auto"
	poster="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/16-9-Logo.svg/2000px-16-9-Logo.svg.png">
	  <source src="/storage/courses/console.mp4" type='video/mp4'>
	</video>

@else 

	<div class="payout-form-wrapper">
		<img src="{{ asset('img/pay-form-bg.jpg') }}">
		<div class="form-content">
			<h3>Это платная часть курса!</h3>
			<label>Вы можете приобрести полный курс с проверкой домашних заданий и личными вопросами преподавателю по цене от <span class="price">850</span> рублей!</label>	
			<button class="pay-submit">Оплатить курс</button>
		</div>
	</div>

@endif

<div class="lesson-content-markdown-wrapper">
	@markdown($lesson->content)
</div>


