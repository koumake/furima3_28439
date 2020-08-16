function price() {
    var tagInput = document.getElementById('item-price');
    
    
    tagInput.addEventListener("keyup", function(){
        var str = this.value;
      
        var tax = str * 0.1; 
        var tax_price = document.getElementById('add-tax-price');
        tax_price.innerHTML = Math.round(tax);
        var profit_calc = str - tax;
        var profit_price = document.getElementById('profit');
        profit_price.innerHTML = profit_calc;
        
        
        
        
      
      
      
    });
}
window.addEventListener("load", price);
