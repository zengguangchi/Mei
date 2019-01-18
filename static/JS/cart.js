$(function () {

    $('.number_increase').click(function () {

      })

    })
    $('.number_reduce').click(function () {
        this
        value--
        if (value <= 1){
            value=1
        }
        $('.productNum').val(value);
    })
})