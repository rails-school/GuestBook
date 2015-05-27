# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# TODO: submit the form
# TODO: debounce this shit
# TODO: update the results when it's valid
@post_guestbook_code = ()=>
  code = @editor.getValue();
  form_input = $("#event_guestbook_js")
  form = form_input.parent()

  form_input.val(code)
  form.submit()

@post_guestbook_code = _.debounce(@post_guestbook_code, 1000)

$(document).on "ready page:load", =>
  @executor = _.debounce
  @editor = ace.edit 'editor'
  @editor.setValue($("#event_guestbook_js").val());
  # @editor.setTheme "ace/theme/monokai"  #dark
  @editor.setTheme "ace/theme/tomorrow" #light
  @editor.getSession().setMode "ace/mode/javascript"
  @editor.getSession().on 'change', (e)=>
    @post_guestbook_code() if $(".ace_error").length == 0

  # cause the initial code to be executed
  setTimeout(
    ()=>
      @post_guestbook_code()
    250)
