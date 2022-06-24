window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    const profitInput = document.getElementById("profit");
    profitInput.innerHTML = (Math.floor(inputValue - addTaxDom.innerHTML));
  })
  });
  