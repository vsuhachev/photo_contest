formatErrors = (errors) ->
  rv = ''
  $.each errors, (attr, messages) ->
    $.each messages, (i, message) ->
      rv += "#{attr} " if attr isnt 'base'
      rv += "#{message}\n"
  rv

document.addEventListener 'turbolinks:load', ->
  $('.c-rating').each (i, o) ->
    currentRating = $(o)

    valueFirst = currentRating.data('rating-value') || 0
    currentRating.data('rating-old', valueFirst)
    valueMax = currentRating.data('rating-max') || 10

    o.ratingObj = rating o, valueFirst, valueMax, (valueNew) ->
      blocker = currentRating.closest('.list-group-item').find('.ratings-blocker')
      blocker.fadeIn(400)

      valueOld = currentRating.data('rating-old')

      ratingId = currentRating.data('rating-id')

      options =
        url: currentRating.data('url')
        contentType: 'application/json; charset=utf-8'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          errorMessage = "Error: #{textStatus}; #{errorThrown}"
          errorMessage += '\n\n' + formatErrors(jqXHR.responseJSON) if jqXHR.responseJSON?
          alert errorMessage
          # WTF: valueOld.toString() - is a workaround for set rating to zerro
          o.ratingObj.setRating valueOld.toString(), false
          blocker.fadeOut(400)

        success: (data, textStatus, jqXHR) ->
          currentRating.data('rating-old', valueNew)
          currentRating.data('url', data.url)
          currentRating.data('rating-id', data.id)
          blocker.fadeOut(400)


      $.extend options, (
        if ratingId?
          method: 'PATCH'
          data: JSON.stringify rating: value: valueNew
        else
          method: 'POST'
          data: JSON.stringify
            rating:
              value: valueNew
              photo_id: currentRating.data('photo-id')
              criterion_id: currentRating.data('criterion-id')
      )

      $.ajax(options)

