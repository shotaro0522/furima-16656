function calculation(){
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    inputValue = priceInput.value

    const addTaxDom = document.getElementById("add-tax-price");
    tax = inputValue*0.1
    addTaxDom.innerHTML = (Math.floor(tax))

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue - Math.floor(tax)))
  })
}
window.addEventListener('load', calculation)