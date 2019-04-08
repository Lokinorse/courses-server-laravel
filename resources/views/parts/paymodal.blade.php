<div class="lesson-payout-modal-wrapper">
  <div class="lesson-payout-modal">
    <div class="lesson-payout-modal-header">
      <span>Регистрация ученика</span>
      <button class="pay-modal-close"><span class="fa fa-times"></span></button>
    </div>
    <div class="lesson-payout-modal-body">
      <div data-modalstep="0" class="pay-step active">
        <div class="pay-info">
          <div class="payment-info-content">
            <h5><font class="pinky">Я рад</font>, что ты решил пройти обучение!</h5>
            <span class="payment-text">Для того, чтобы продолжить, подпишись на рассылку для учеников.</span>
            <span class="payment-text">В рассылке ты получишь необходимую информацию для прохождения курса и многие ответы на твои вопросы.</span>

            <div class="payment-action-button-wrapper">

              <a target="_blank" data-conversion="rassilka" href="https://vk.com/app5898182_-175501230#s=180656&force=1">Подписаться</a>

            </div>

          </div>
          <div class="payment-footer">
            <button class="next-step">Продолжить</button>
          </div>

        </div>
      </div>
      <div data-modalstep="1" class="pay-step active">
        <form id="payment-form" class="pay-info">
           @csrf
          <div class="payment-info-content">
            <h5>Номер карты для оплаты:</h5>
            <span class="payment-text price-wrapper">Тариф: «<font id="current-plan">Я сам</font>»</span>
            <span class="payment-text price-wrapper">Стоимость: <font id="price-number">850</font> рублей</span>
            <input type="number" required id="cardnumber" name="cardnumber" placeholder="4276 4200 0000 0000">
          </div>
          <div class="payment-footer">
            <button type="submit" class="pay-form-button">Оплатить</button>
          </div>

        </form>
      </div>
      <div class="pay-step processing" data-modalstep="2">
        <span class="fa fa-sync"></span>
        <span>Обработка</span>
      </div>
      <div class="pay-step processing" data-modalstep="3">
        <span class="fa fa-sad-cry"></span>
        <span>Извините, у нас вышел лимит по количеству учеников в потоке, мы не можем записать вас в текущий момент</span>
      </div>
    </div>
  </div>
</div>