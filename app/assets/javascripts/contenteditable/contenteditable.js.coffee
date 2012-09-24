$("document").ready ->

  $('[contenteditable]')
    .live 'focus', ->
      $this = $(this)
      $this.data 'before', $this.html()
      return $this
    .live 'blur keyup paste', ->
      $this = $(this)
      if $this.data('before') isnt $this.html()
        $this.data 'before', $this.html()
        $this.trigger('change')
        $(".contenteditable_save_button").fadeIn(1000)

  $('.contenteditable_save_button').click ->
    c = $("[contenteditable]")
    data1 = {}
    c.each -> data1[$(this).attr('data-tag')] = $(this).text()
    $.ajax(
      type: "PUT",
      url: "/contenteditable/update",
      data: {translations: data1},
      success: -> $(".contenteditable_save_button").fadeOut(1500)
    )
