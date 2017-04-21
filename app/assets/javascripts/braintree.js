// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  var form = document.querySelector('#cardForm');
  var submit = document.querySelector("#submit-payment-btn");
  var authorization = $('input[name="token"]').attr('value');

  //first off, the brain tree new controller generates a client token
  //the token is then embedded (hidden field tag) into the braintree form so that you can
  //pass it to the javascript to get braintree running. After braintree is running, send
  //the customers payment details to Braintree in exchange for a payment method nonce
  //a onetime value that represents that payment method (tokenize method). After submitting the form(at the end)
  //of javascript, it goes to controller and and uses the nonce together with Braintree SDK
  //to basically charge the card
  braintree.client.create({
    // Replace this with your own authorization.
    authorization: authorization
  }, function (clientErr, clientInstance) {
    if (clientErr) {
      // Handle error in client creation
      return;
    }

    braintree.hostedFields.create({
      client: clientInstance,
      styles: {
        'input': {
          'font-size': '14pt'
        },
        'input.invalid': {
          'color': 'red'
        },
        'input.valid': {
          'color': 'green'
        }
      },
      fields: {
        number: {
          selector: '#card-number',
          placeholder: '4111 1111 1111 1111'
        },
        cvv: {
          selector: '#cvv',
          placeholder: '123'
        },
        expirationDate: {
          selector: '#expiration-date',
          placeholder: '10/2019'
        }
      }
    }, function (hostedFieldsErr, hostedFieldsInstance) {
      if (hostedFieldsErr) {
        // Handle error in Hosted Fields creation
        return;
      }

      submit.removeAttribute('disabled');

      form.addEventListener('submit', function (event) {
        event.preventDefault();

        hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
          if (tokenizeErr) {
            // Handle error in Hosted Fields tokenization
            return;
          }

          // Put `payload.nonce` into the `payment_method_nonce` input, and then
          // submit the form. Alternatively, you could send the nonce to your server
          // with AJAX.
          document.querySelector('input[name="checkout_form[payment_method_nonce]"]').value = payload.nonce;
          form.submit();
        });
      }, false);
    });
  });
});





