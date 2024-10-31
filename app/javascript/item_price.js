const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = inputValue - addTaxDom.innerHTML;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
