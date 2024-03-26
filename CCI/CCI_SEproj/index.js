$(document).ready(function() {
    // Define your product categories
    var products = {
      'fertilisers': [],
      'seeds': ['pumpkin seeds', 'sunflower seeds', 'corn seeds']
    };
  
    // Event handler for fertilisers button
    $('#fertilisers').click(function() {
      displayProducts('fertilisers');
    });
  
    // Event handler for seeds button
    $('#seeds').click(function() {
      displayProducts('seeds');
    });
  
    // Function to display products based on category
    function displayProducts(category) {
      var productList = products[category];
      // Clear the product display area
      $('#productDisplayArea').empty();
      // Add each product in the category to the display area
      productList.forEach(function(product) {
        $('#productDisplayArea').append('<p>' + product + '</p>');
      });
    }
  });
  