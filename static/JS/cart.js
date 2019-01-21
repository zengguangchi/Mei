$(function () {
    total()
    $(".number_reduce").click(function(){
        var goodsid = $(this).attr('goodsid')
        console.log(goodsid)
        console.log($(this).next().html())
        var $that=$(this)
        data={
            'goodsid':goodsid
        }

        $.get('/mlh/cartsugoods/',data,function (response) {
                console.log(response)
            if (response.status==1){
                    if(response.number > 0){
                        $that.next().html(response.number)
                    }else {
                        $that.parents($('list_content_ul clearfix')).remove()
                        location.reload()
                    }
                    total()
                    location.reload()

            }



        })
                console.log('减操作')
               });
// $(".number_increase").unbind("click");
    $(".number_increase").click(function(){
        var goodsid = $(this).attr('goodsid')
        console.log(goodsid)
        console.log($(this).prev().html())
                console.log('加操作')
        var $that=$(this)
        data ={
            'goodsid':goodsid
        }
        $.get('/mlh/cartaddgoods/',data,function (response) {
            console.log(response)
            if (response.status==1){
                $that.prev().html(response.number)
                console.log(response.number)
            }
             total()
            location.reload()

        })
            });

        $('.check').click(function () {
                var cartid=$(this).attr('cartid')
            console.log(cartid)
            var $this=$(this)
            data={
                    'cartid':cartid
            }
            $.get('/mlh/chakanstuats',data,function (response) {
                console.log(response)
                if (response.status){
                    if (response.isselect){
                        $this.prop('checked',true).removeClass('no').addClass('ok')
                    }else {
                        $this.prop('checked',false).removeClass('ok').addClass('no')
                    }
                total()
                    location.reload()
                }
            })
        });
    $('#checkAll').click(function () {
        var isall=$(this).attr('isall')
        isall=(isall=='true')?true:false
        isall=!isall
        $(this).attr('isall',isall)
        if (isall){
            $(this).prop('checked',true)
        }else {
             $(this).prop('checked',false)
        }
        data={
            'isall':isall
        }

        $.get('/mlh/chakanall',data,function (response) {
            if (response.status ==1){
                if (isall){
                    $('.check').prop('checked',true).removeClass('no').addClass('ok')

                }else {
                    $('.check').prop('checked',false).removeClass('ok').addClass('no')
                }
            total()
            }
        })
    });

      function total() {
          var sum=0
          $('.list_content_ul ').each(function () {
           var $cso=$(this).find('#checkboxli')
          var $csa=$(this).find('.number_choose')

          if($cso.find('.ok').length){
            var num=$csa.find('.quantity_number').attr('num')
              console.log(num)
            var price=$(this).find('.priceSum').attr('price')
              console.log(price)
            sum+= num * price
              console.log(sum)
          }
        $('#pricetotal').html(parseInt(sum))
      })
      }

    $('.button4').click(function () {
        window.open('/mlh/men/')
    })
    $('.button3').click(function () {
        $.get('/mlh/genratorder/',function (response) {
            console.log(response)
            if ( response.status == 1){
                window.open('/mlh/orderdetail/'+response.identifier+'/',target='_self')
            }
        })
    })

});
