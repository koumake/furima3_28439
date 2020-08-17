function price() {
    const tagInput = document.getElementById('item-price');
    
    
    tagInput.addEventListener("keyup", function(){
        const str = this.value;
      
        const tax = str * 0.1; 
        const tax_price = document.getElementById('add-tax-price');
        tax_price.innerHTML = Math.round(tax);
        const profit_calc = str - tax;
        const profit_price = document.getElementById('profit');
        profit_price.innerHTML = profit_calc;
        
        
        
        
      
      
      
    });
}
window.addEventListener("load", price);
