Payment.Router = Ember.Router.extend

  location: "hash"

  enableLogging: true

  root: Ember.Route.extend

    index: Ember.Route.extend
      route: "/"
      redirectsTo: 'products.index'

    products: Ember.Route.extend
      route: '/products'

      index: Ember.Route.extend
        route: '/'
        editProduct: Ember.Route.transitionTo('edit')
        newProduct: Ember.Route.transitionTo('new')
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('products', Payment.Product.find())

      edit: Ember.Route.extend
        route: '/:product_id/edit'

        save: (router, product) ->
          transaction = router.get('productController').get('transaction')
          transaction.commit()
          router.transitionTo('index')

        cancel: (router, product) ->
          transaction = router.get('productController').get('transaction')
          transaction.rollback()
          router.transitionTo('index')

        connectOutlets: (router, product) ->
          transaction = router.get('store').transaction()
          transaction.add(product)
          router.get('applicationController').connectOutlet('product', product)
          router.get('productController').set('transaction', transaction)

      new: Ember.Route.extend
        route: '/new'

        save: (router, product) ->
          transaction = router.get('productController').get('transaction')
          transaction.commit()
          router.transitionTo('index')

        cancel: (router, product) ->
          transaction = router.get('productController').get('transaction')
          transaction.rollback()
          router.transitionTo('index')

        connectOutlets: (router) ->
          transaction = router.get('store').transaction()
          product = transaction.createRecord(Payment.Product)
          router.get('applicationController').connectOutlet('product', product)
          router.get('productController').set('transaction', transaction)

