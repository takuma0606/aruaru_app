window.addEventListener('DOMContentLoaded', function(){
  $(document).on('click', '.comment_edit_button', function() {
    $(this).parents("li").find('.comment_text').hide();
    $(this).parents("li").find('.comment_edit').show();
    $(this).hide();
    $(this).parent().find(".edit_cancel").show();
    $(this).parent().find(".comment_destroy").hide();
    const textareaEls = document.querySelectorAll("textarea");

    textareaEls.forEach((textareaEl) => {
      // デフォルト値としてスタイル属性を付与
      textareaEl.setAttribute("style", `height: ${textareaEl.scrollHeight}px;`);
    });
  });
});

window.addEventListener('DOMContentLoaded', function(){
  $(document).on('click', '.edit_cancel', function() {
    $(this).parents("li").find('.comment_edit').hide();
    $(this).parents("li").find('.comment_text').show();
    $(this).hide();
    $(this).parent().find(".comment_edit_button").show();
    $(this).parent().find(".comment_destroy").show();
  });
});
