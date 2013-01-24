Payment.Product = DS.Model.extend
  name: DS.attr('string', defaultValue: 'Product Name')
  price: DS.attr('number', defaultValue: '10.00')
