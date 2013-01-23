
Payment.Router.map ->
  @resource 'products', ->
    @route('new')
    return

  @resource 'product', { path: '/product/:product_id' }, ->
    @route('edit')
    return
  return

Payment.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('products.index')

Payment.ProductsIndexRoute = Ember.Route.extend
  model: -> Payment.Product.find()

Payment.ProductEditRoute = Ember.Route.extend
  events:
    save: (context) ->
      @controllerFor('product').get('content.transaction').commit()
      @transitionTo('products.index')
    cancel: (context) ->
      @transitionTo('products.index')

Payment.ProductsNewRoute = Ember.Route.extend
  model: -> Payment.Product.createRecord()

  events:
    save: (context) ->
      @currentModel.get('transaction').commit()
      @transitionTo('products.index')
    cancel: (context) ->
      @transitionTo('products.index')

