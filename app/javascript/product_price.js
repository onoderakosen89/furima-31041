addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const feeValue = Math.floor(inputValue * 0.1);
      const profitValue = Math.floor(inputValue - feeValue);
      
      const resultFee = document.getElementById("add-tax-price");
        resultFee.innerHTML = feeValue;
      const resultProfit = document.getElementById("profit");
        resultProfit.innerHTML = profitValue;
 });
});