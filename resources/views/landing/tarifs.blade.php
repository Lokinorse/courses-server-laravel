<section class="lp-section white padded costs-section" id="costs">
	<div class="lp-content">
		
		<h1 class="lp-h1"><span>ТАРИФЫ</span> ОБУЧЕНИЯ</h1>


		<div class="costs-wrapper">
			@foreach ($program->plans as $plan)
				
				<div class="costs-item-wrapper">
					@if ($plan->discount) 
						<span class="round-corner-badge">-{{$plan->discount}}%</span>
					@endif
					<div class="cost-item-title-wrapper">
							<span class="cost-title">«{{$plan->name}}»</span>
							@if ($plan->recommended) 
								<span class="cost-title-badge">рекомендую</span>
							@endif
					</div>
					{!!$plan->description!!}
					
					<div class="cost-price-wrapper">
						@if ($plan->discount) 
							<strike class="old-price">{{$plan->cost_string}}<i class="fa fa-ruble-sign"></i></strike>
						@endif
						<span class="new-price">{{$plan->discounted_cost_String}}<i class="fa fa-ruble-sign"></i></span>
					</div>

					<button class="cta-btn conversion pay-submit" data-modaltrigger="vk-login" data-conversion="tarif-ya-sam">Начать обучение</button>
				</div>
			@endforeach

		</div>

	</div>
</section>