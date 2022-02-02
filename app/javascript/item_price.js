function calculation(){
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {

    const addTaxDom = document.getElementById("add-tax-price");
    tax = inputValue*0.1
    addTaxDom.innerHTML = (Math.floor(tax))

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue - tax))
  })
}
window.addEventListener('load', calculation)