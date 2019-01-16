$(function () {
    $('#email').removeClass('has-error').addClass('has-success')
$('#password').removeClass('has-error').addClass('has-success')
$('#subButton').click(function () {
     var islogin = true

        // 遍历所有的输入框是否正确
        $('.form-group').each(function () {
            if ( !$(this).hasClass('has-success') ){
                islogin = false
            }
        })

        if (islogin){    // 都正确
            $('#login').submit()
        }
    });

});
