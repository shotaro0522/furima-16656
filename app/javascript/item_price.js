function calculation(){
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    tax = inputValue*0.1
    addTaxDom.innerHTML = (Math.floor(tax))

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue - tax))

  })













}




window.addEventListener('load', calculation)