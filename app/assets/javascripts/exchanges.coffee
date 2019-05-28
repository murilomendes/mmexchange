$(document).ready -> 
  $('form').submit ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
        type: 'GET',
        dataType: 'json',
        data: { 
                from_currency: $('#from_currency').val()
                to_currency: $('#to_currency').val()
                amount: $('#amount').val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').attr('value', data.value.toFixed(2))
      return false;

  $('#amount, #to_currency, #from_currency').change ->
    $('form').submit()

  $('#change-currency').click ->
    from_currency = $('#from_currency').val();
    to_currency = $('#to_currency').val();
    $('#from_currency').val(to_currency)
    $('#to_currency').val(from_currency);
    $('form').submit()
    return false;