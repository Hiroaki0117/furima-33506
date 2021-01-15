function price () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", (e) => {
    const inputValue = priceInput.value;
    const profit = Math.floor(inputValue * 0.9);
    const fee = Math.floor(inputValue - profit);
    const addFeeDom = document.getElementById("add-tax-price");
    addFeeDom.innerHTML = fee 
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = profit
  })
}

window.addEventListener("load", price);