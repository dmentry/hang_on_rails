$(document).ready(() => {
  // скрипт срабатывает, когда загрузились все элементы страницы
  // объявляется метод без аргументов
  const drawHangman = () => {
    // получаем количество сделанных ошибок из элемента с id = errors-made
    const errorsMade = +$('#errors-made').text()

    for (let count = 1; count < 8; count++) {
      // если количество ошибок больше очередедного значения итерации, отрисовываем новые части виселицы
      if (errorsMade >= count ) {
        $(`#errors-${count}`).show()
      }
    }
    // условия, когда нужно убрать поле ввода буквы
    if (($('#lost_text').text()) || ($('#win_text').text())) {
      $(`#play-form`).hide()
    }
  }

  // на кнопку с id play-form вешается событие нажатия (submit) и при его наступлении запускается function(event)
  $('#play-form').on('submit', function(event) {
    // XHR–запрос для передачи данных в виде сообщений между Web-браузером и Web-сервером
    $.ajax({
      // этот метод принимает объект (хэш)
      url: $(this).attr('action'),
      data: $(this).serialize(),
      method: $(this).attr('method'),
      dataType: 'json',
      success: data => {
        // если ответ успешный, промисы отработали, то найти элемент с id current-status и заменить его данные на данные из хэша data, его ключа current
        $('#current-status').html(data.current)
        // найти элемент с id letter и сбросить его значение
        $('#letter').val('')
        drawHangman()
      }
    })
    event.preventDefault()
  })
// этот метод будет вызываться каждый раз при заходе на страницу, чтобы видеть актуальное состояние игры
  drawHangman()
})
