<section class="lp-section matrix-section" id="matrix">

	<canvas id="canvas">ОСВОЙ ПРОФЕССИЮ <br/> «JAVASCRIPT-РАЗРАБОТЧИК»</canvas>


	<div class="lp-utp-action-wrapper">
		<img class="js-icon" src="{{ asset('img/jslp/js.png') }}" alt="Профессия: JAVASCRIPT-РАЗРАБОТЧИК" />
		<h1>ОСВОЙ ПРОФЕССИЮ <br/> «JAVASCRIPT-РАЗРАБОТЧИК»</h1>

		<div class="stats-animation">
			<div class="stat-item">
				<div class='stat-item-icon-wrapper'>
					@include('landing.icons.video')
				</div>
				<div class="stat-info">
					<b class="count" data-inc-value="{{$stats->passed}}" data-inc-duration="1000" data-inc-delay="0">{{$stats->passed}}</b>
					<span>{{Lang::choice('Урок пройден|Урока пройдено|Уроков пройдено', $stats->passed, [], 'ru')}}</span> 
				</div>
			</div>
			<div class="stat-item">
				<div class='stat-item-icon-wrapper'>
					@include('landing.icons.users')
				</div>
				<div class="stat-info">
					<b class="count" data-inc-value="{{$stats->users}}" data-inc-duration="1500" data-inc-delay="0">{{$stats->users}}</b>
					<span>{{Lang::choice('Ученик обучается|Ученика обучается|Учеников обучается', $stats->users, [], 'ru')}}</span> 
				</div>
			</div>
			<div class="stat-item">
				<div class='stat-item-icon-wrapper'>
					@include('landing.icons.comments')
				</div>
				<div class="stat-info">
					<b class="count" data-inc-value="{{$stats->questions}}" data-inc-duration="2000" data-inc-delay="0">{{$stats->questions}}</b>
					<span>{{Lang::choice('Вопрос и ответ|Вопроса и ответа|Вопросов и ответов', $stats->questions, [], 'ru')}}</span> 
				</div>
			</div>


		</div>



	</div>

		<script type="text/javascript">


		!function(a,b,c){"use strict";function m(a){if(k(m),h.length&&n.running)for(var b=h.splice(0),c=0,d=null,e=b.length;e>c;c++)d=b[c],d.cancel||d.fn(a),delete i[d.guid]}for(var d=0,e={raf:"requestAnimationFrame",caf:"cancelAnimationFrame",af:"AnimationFrame"},f=["ms","moz","webkit","o"],g=0;g<f.length&&!a[e.raf];++g)a[e.raf]=a[f[g]+"Request"+e.af],a[e.caf]=a[f[g]+"Cancel"+e.af]||a[f[g]+"CancelRequest"+e.af];a[e.raf]||(a[e.raf]=function(b){var c=(new Date).getTime(),e=Math.max(0,16-(c-d)),f=a.setTimeout(function(){b(c+e)},e);return d=c+e,f}),a[e.caf]||(a[e.caf]=function(b){a.clearTimeout(b)});var h=[],i={},j=0,k=a[e.raf];a[e.caf],m();var n=function(a){return j++,i[j]=a,h.push({guid:j,cancel:!1,fn:a}),j};n.running=!0,n.cancel=function(a){return i[a]?(i[a].cancel=!0,!0):!1},n.fps=function(a,b){function e(b){var f=b-(c||0);n(e),c&&d>f||(c=b,a(b))}var c=0,d=1e3/b;e()},c&&(a[c]=n.cancel),b||(b="raf"),a[b]=n}(window,"requestAnimationFrame","cancelAnimationFrame");
		



		function randomInteger(min, max) {
			var rand = min - 0.5 + Math.random() * (max - min + 1)
			rand = Math.round(rand);
			return rand;
		}

	

		var symbols = "かきてとふへりるぜぞどぶべぷ".toUpperCase().split("");

		//some chinese symbols
		for (var i = 1; i <= 14; i++) {
			symbols.push(String.fromCharCode(3e9+i))
		}


		var utp_text = ["ОСВОЙ ПРОФЕССИЮ WEB-РАЗРАБОТЧИК!"];

		var charsActivated = [];

		var s = window;
		var width = s.innerWidth;
		var height = s.innerHeight;


		var columns = 65;
		if (width < 1025) {
			columns = 45;
		}
		if (width < 769) {
			columns = 35;
		}
		if (width < 425) {
			columns = 20;
		}



		var font_size = Math.round(width/columns);


		var clone_text = Object.assign([], utp_text);


		var sentence = clone_text.sort(function (a, b) { return b.length - a.length; })[0];



	
		function start(q) {
			//var s = window.screen;

			var canvas = document.getElementById("canvas");

			canvas.width = width;
			canvas.height = height;

			var context = canvas.getContext('2d')

			var letters = Array(Math.round(width/(font_size))+3).join(1).split('');

			for (var i = 0; i <= 800; i++) {
				letters.map(function(y_pos, index){
				  letters[index] = (y_pos > height + Math.random() * 1e4) ? 0 : y_pos + font_size;
				});
			}


			var draw = function () {

				context.shadowColor = '#6473cd';
				context.shadowOffsetX = 0;
				context.shadowOffsetY = 0;
				//context.shadowBlur = 5;
				context.fillStyle='rgba(27, 36, 97,.17)';
				context.fillRect(0,0,width,height);
				context.fillStyle='#4946e6';
				context.font        = "normal "+font_size+"px Lucida Console";

				letters.map(function(y_pos, index){
				  text = symbols[randomInteger(0, symbols.length-1)];
				  x_pos = index * font_size;
				  context.fillText(text, x_pos, y_pos);
				  letters[index] = (y_pos > height + Math.random() * 1e4) ? 0 : y_pos + font_size;
				});

			};
			//setInterval(draw, 60);
			setTimeout(function() {
				requestAnimationFrame.fps(draw, 20)
			}, 1000)
		}

		if (width > 550) {
			start();
		}
		
	
	</script>  

</section>