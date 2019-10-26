<section class="lp-section white padded costs-section" id="costs">
	<div class="lp-content">
		
		<h1 class="lp-h1"><span>ВЫБЕРИ ТАРИФ</span> ОБУЧЕНИЯ</h1>


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
					<form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml" target="_blank">    

						<input type="hidden" name="receiver" value="410015198324774">    
						<input type="hidden" name="formcomment" value="Добровольное пожертвование на развитие проекта">    
						<input type="hidden" name="short-dest" value="Добровольное пожертвование на развитие проекта">    
						<input type="hidden" name="label" value="{{Auth::user()->id}}/{{$current_transaction->id}}/{{$plan->id}}">    
						<input type="hidden" name="quickpay-form" value="donate">    
						<input type="hidden" name="targets" value="Транзакция {{Auth::user()->id}}/{{$current_transaction->id}}/{{$plan->id}}"> 
						<input type="hidden" name="sum" value="{{$plan->discounted_cost}}"> 
						<input type="hidden" name="comment" value="«{{$plan->name}}». Добровольное пожертвование на развитие проекта">    
						<input type="hidden" name="need-fio" value="true">    
						<input type="hidden" name="need-email" value="true">    
						<input type="hidden" name="need-phone" value="true">    
						<input type="hidden" name="need-address" value="false">
						<button class="cta-btn conversion pay-submit" type="submit" name="paymentType" value="AC">Оплатить</button>
					</form>

				</div>
			@endforeach

		</div>

	</div>
</section>