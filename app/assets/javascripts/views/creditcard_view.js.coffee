Payment.CreditcardView = Ember.View.extend
  templateName: 'creditcard'

Payment.CardTextField = Ember.TextField.extend
  focusOut: (event) ->
    controller = @.get('parentView.controller')
    viewName = @.get('viewName')
    validatorName = "#{Em.String.classify(viewName)}"
    controller["validate#{validatorName}"]()

