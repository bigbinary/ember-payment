Payment.CreditcardController = Ember.ObjectController.extend

 isNumber: (val) ->
    value = @.get(val)
    error = false
    console.log(value)
    unless (!isNaN(parseFloat(value)) && isFinite(value))
      error = true
      console.log "#{val} has error"

    @.set("#{val}Error", error)
    error

  getValue: (val) ->
    error = false
    unless result = !!@.get(val)
      error = true
      console.log "#{val} has error"

    # it works as both settings the error and clearing the error
    @.set("#{val}Error", error)

    result

  validateName: ->
    @.getValue('name')

  validateCardnumber: ->
    @.getValue('cardnumber')  && @.isNumber('cardnumber')

  validateCsv: ->
    @.getValue('csv')  && @.isNumber('csv')

