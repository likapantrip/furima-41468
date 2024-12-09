const paycard = () => {  
  if (typeof gon == 'undefined'){ return false;}

  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {

        const flashMessage = document.getElementById("flash-message");
        flashMessage.style.display = 'block';

      } else {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      }
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", paycard);
window.addEventListener("turbo:render", paycard);