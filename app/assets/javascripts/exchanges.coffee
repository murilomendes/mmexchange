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
          $('#result').val("$ " + data.value.toFixed(2))
      return false;