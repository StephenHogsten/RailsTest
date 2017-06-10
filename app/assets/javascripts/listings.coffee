jQuery ->
  console.log('1')
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  listing.setupForm()

listing =
  setupForm: ->
    console.log('2)')
    $('#new_listing').submit ->
      console.log('25')
      $('input[type=submit]').attr('disabled', true)
      Stripe.Account.createToken($('#new_listing'), listing.handleStripeResponse)
      false

  handleStripeResponse: (status, response) ->
    console.log('3')
    if status == 200
      console.log('4')
      $('#new_listing').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_listing')[0].submit()
    else
      console.log('5')
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)